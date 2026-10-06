#!/usr/bin/env python3
"""Portable tools for this map's standard unencrypted, zlib-sector MPQ v0.

Python 3 standard library plus bundled MIT mpyq for directory table parsing.
Existing entries only: preserve unnamed resources and original Warcraft header.
Not a universal unprotector, GUI trigger recovery tool, or KK runtime verifier.
"""
from pathlib import Path, PurePosixPath
import argparse,hashlib,io,json,struct,sys,zlib
sys.path.insert(0,str(Path(__file__).resolve().parent/'vendor'))
from mpyq import MPQArchive,MPQBlockTableEntry
MASK=0xffffffff
class Map:
 def __init__(self,path):
  self.path=Path(path);self.data=self.path.read_bytes()
  candidates=[i for i in range(0,min(len(self.data),0x100000),512) if self.data[i:i+4]==b'MPQ\x1a']
  if not candidates:raise ValueError('No standard aligned MPQ header found')
  self.offset=candidates[0];self.mpq=MPQArchive(io.BytesIO(self.data[self.offset:]),listfile=False)
  h=self.mpq.header
  if h['format_version']!=0 or h['header_size']!=32:raise ValueError('Only MPQ v0 is supported by this handoff tool')
  if h['archive_size']+self.offset!=len(self.data):raise ValueError('Unexpected archive trailer/size; use StormLib for this input')
 def index(self,name):
  e=self.mpq.get_hash_table_entry(name.replace('/','\\'))
  if e is None or e.block_table_index>=len(self.mpq.block_table):raise KeyError(name)
  return e.block_table_index
 def block(self,i):
  e=self.mpq.block_table[i]
  if e.flags!=0x80000200:raise ValueError(f'Block {i}: unsupported flags {e.flags:#x}; use StormLib')
  if e.size==0:return b''
  data=self.data[self.offset+e.offset:self.offset+e.offset+e.archived_size]
  size=512<<self.mpq.header['sector_size_shift'];count=(e.size+size-1)//size
  offsets=struct.unpack('<'+str(count+1)+'I',data[:4*(count+1)])
  if offsets[0]<4*(count+1) or offsets[-1]>len(data):raise ValueError('Invalid sector table')
  result=[]
  for n in range(count):
   expected=min(size,e.size-n*size);part=data[offsets[n]:offsets[n+1]]
   if len(part)<expected:
    if not part or part[0]!=2:raise ValueError(f'Block {i}: unsupported compression; use StormLib')
    part=zlib.decompress(part[1:])
   if len(part)!=expected:raise ValueError('Decoded sector length mismatch')
   result.append(part)
  return b''.join(result)
 def read(self,name):return self.block(self.index(name))
 def names(self,extra=None):
  result={}
  p=Path(__file__).with_name('known-filenames.txt')
  candidates=p.read_text(encoding='utf-8').splitlines() if p.exists() else []
  if extra:candidates+=Path(extra).read_text(encoding='utf-8').splitlines()
  try:candidates+=self.read('(listfile)').decode('utf-8').splitlines()
  except KeyError:pass
  for name in candidates:
   if not name.strip():continue
   try:result.setdefault(self.index(name),name.replace('\\','/'))
   except KeyError:pass
  return result

def safe_path(root,name):
 p=PurePosixPath(name.replace('\\','/'))
 if p.is_absolute() or '..' in p.parts or ':' in name:raise ValueError('Unsafe archive path: '+name)
 out=root.joinpath(*p.parts)
 if not out.resolve().is_relative_to(root.resolve()):raise ValueError('Path escapes destination')
 return out

def sha(data):return hashlib.sha256(data).hexdigest()
def extract(args):
 m=Map(args.map);root=Path(args.out)
 if root.exists() and any(root.iterdir()):raise ValueError('Destination must be empty')
 root.mkdir(parents=True,exist_ok=True);names=m.names(args.names);entries=[]
 for i,e in enumerate(m.mpq.block_table):
  if not e.flags&0x80000000:continue
  name=names.get(i);relative=name or f'_unnamed/block-{i:03}.bin';p=safe_path(root,relative)
  data=m.block(i);p.parent.mkdir(parents=True,exist_ok=True);p.write_bytes(data)
  entries.append({'block':i,'archive_name':name,'extracted_path':relative,'bytes':len(data),'sha256':sha(data),'flags':hex(e.flags)})
 report={'map':m.path.name,'map_sha256':sha(m.data),'all_live_blocks_extracted':True,'named_entries':len(names),'entries':entries}
 (root/'extraction-manifest.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
 print(f'Extracted {len(entries)} blocks ({len(names)} named); see extraction-manifest.json')

def encrypt_table(mpq,data,key):
 # Inverse of mpyq's MIT-licensed MPQ table decoder; seed updates use plaintext.
 seed=0xeeeeeeee;out=bytearray()
 for (plain,) in struct.iter_unpack('<I',data):
  seed=(seed+mpq.encryption_table[0x400+(key&0xff)])&MASK
  out+=struct.pack('<I',plain^((key+seed)&MASK))
  key=(((~key<<21)+0x11111111)|(key>>11))&MASK
  seed=(plain+seed+(seed<<5)+3)&MASK
 return bytes(out)

def encode_sectors(data,size):
 pieces=[];offsets=[4*((len(data)+size-1)//size+1)]
 for i in range(0,len(data),size):
  raw=data[i:i+size];compressed=b'\x02'+zlib.compress(raw,9)
  piece=compressed if len(compressed)<len(raw) else raw
  pieces.append(piece);offsets.append(offsets[-1]+len(piece))
 return struct.pack('<'+str(len(offsets))+'I',*offsets)+b''.join(pieces)

def patch(args):
 m=Map(args.base);dest=Path(args.out)
 if dest.exists():raise ValueError('Output already exists; choose a new filename')
 for internal in ['(signature)','(attributes)']:
  try:m.index(internal)
  except KeyError:continue
  raise ValueError(f'{internal} present; use StormLib to update this archive')
 changes={}
 if args.overlay:
  root=Path(args.overlay)
  if not root.is_dir():raise ValueError('Overlay is not a directory')
  for p in sorted(root.rglob('*')):
   if p.is_file() and not p.name.endswith('-manifest.json') and '_unnamed' not in p.relative_to(root).parts:
    changes[p.relative_to(root).as_posix()]=p.read_bytes()
 for pair in args.file:
  name,sep,path=pair.partition('=')
  if not sep:raise ValueError('--file expects archive/name=local/path')
  changes[name]=Path(path).read_bytes()
 selected={}
 for name,data in changes.items():
  i=m.index(name)
  if i in selected:raise ValueError('Two replacements target the same block')
  if m.block(i)!=data:selected[i]=(name,data)
 if not selected:raise ValueError('No changed contents supplied')
 result=bytearray(m.data);blocks=list(m.mpq.block_table);sector=512<<m.mpq.header['sector_size_shift']
 for i,(name,data) in selected.items():
  encoded=encode_sectors(data,sector);offset=len(result)-m.offset
  blocks[i]=MPQBlockTableEntry(offset,len(encoded),len(data),0x80000200);result.extend(encoded)
 offset=len(result)-m.offset
 plain=b''.join(struct.pack('<4I',*e) for e in blocks)
 table=encrypt_table(m.mpq,plain,m.mpq._hash('(block table)','TABLE'))
 if m.mpq._decrypt(table,m.mpq._hash('(block table)','TABLE'))!=plain:raise AssertionError('Table encryption round trip failed')
 result.extend(table)
 struct.pack_into('<I',result,m.offset+8,len(result)-m.offset)
 struct.pack_into('<I',result,m.offset+20,offset)
 dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes(result)
 rebuilt=Map(dest)
 assert m.data[:m.offset]==rebuilt.data[:rebuilt.offset]
 assert m.mpq.hash_table==rebuilt.mpq.hash_table
 for i,e in enumerate(m.mpq.block_table):
  if i in selected:assert rebuilt.block(i)==selected[i][1]
  else:
   ne=rebuilt.mpq.block_table[i];assert e==ne
   assert m.data[m.offset+e.offset:m.offset+e.offset+e.archived_size]==rebuilt.data[rebuilt.offset+ne.offset:rebuilt.offset+ne.offset+ne.archived_size]
 report={'base_sha256':sha(m.data),'output_sha256':sha(bytes(result)),'output_bytes':len(result),'changed_entries':[n for n,d in selected.values()],'unchanged_blocks':len(blocks)-len(selected),'kk_runtime_tested':False}
 dest.with_suffix(dest.suffix+'.manifest.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
 print(json.dumps(report,ensure_ascii=False,indent=2))

def main():
 p=argparse.ArgumentParser(description=__doc__);sub=p.add_subparsers(dest='command',required=True)
 x=sub.add_parser('extract');x.add_argument('map');x.add_argument('out');x.add_argument('--names');x.set_defaults(run=extract)
 x=sub.add_parser('read');x.add_argument('map');x.add_argument('name');x.add_argument('out');x.set_defaults(run=lambda a:Path(a.out).write_bytes(Map(a.map).read(a.name)))
 x=sub.add_parser('patch');x.add_argument('base');x.add_argument('out');x.add_argument('--overlay');x.add_argument('--file',action='append',default=[]);x.set_defaults(run=patch)
 args=p.parse_args();args.run(args)
if __name__=='__main__':main()

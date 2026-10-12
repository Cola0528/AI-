"""Append Lua/UI to the original MPQ without rehashing unnamed resources.

The existing 128 slots and all 109 old blocks keep their identities. New names
are inserted using standard MPQ linear probing; StormLib independently verifies
every known old name and every new member after construction.
"""
from pathlib import Path
import sys,struct,json,hashlib
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'handoff_extract/AI-Tower-Handoff/tools'))
from w3x_tools import Map,encode_sectors,encrypt_table
from mpyq import MPQBlockTableEntry,MPQHashTableEntry
from native_archive_check import verify_archive
BASE=ROOT/'AI-v19-UI2.w3x'
OUT=ROOT/'AI-Tower-1.0.16-Lua.w3x'
EXPECTED='c587006a08d63670a170e8965496b7e1e31559bed26a995e44a1df4f3b93f0db'
sha=lambda b:hashlib.sha256(b).hexdigest()
assert sha(BASE.read_bytes())==EXPECTED,'Stable UI2 changed externally'
assert (ROOT/'audit/lua-behavior-results.txt').exists()
assert json.loads((ROOT/'audit/lua-module-check.json').read_text(encoding='utf-8'))['allSyntaxPassed']
assert 'Parse successful' in (ROOT/'audit/lua-pjass.txt').read_text(encoding='utf-8-sig')
base=Map(BASE)
def zstring(blob,offset):
 end=blob.index(b'\0',offset);return blob[offset:end],end+1
def metadata(blob):
 assert struct.unpack_from('<I',blob)[0]==25
 offset=12;fields=[]
 for _ in range(4):s,offset=zstring(blob,offset);fields.append(s)
 fixed=blob[offset:offset+65];offset+=65 # camera32+borders16+size8+flags4+tileset1+loadIndex4
 loading=[]
 for _ in range(4):s,offset=zstring(blob,offset);loading.append(s)
 assert loading[0]==b'LoadingScreen.mdx',loading[0]
 fields[0]='AI爬塔'.encode();fields[2]='AI爬塔 1.0.16 Lua：回合制合作爬塔，规划路线、选择奖励，搭配技能与装备。'.encode()
 loading[1]='1.0.16 Lua · 远征与战斗\n原生属性与技能完整保留 / 左上角行动与专注。\n技能与背包使用原生底栏；奖励可收起再展开。\n选择路线的玩家自动准备，其他队友完成整理后确认。\nF2 助手 · F3 聚焦 · F4 属性 · F6 奖励 · F7 成长档案'.encode()
 loading[2]='AI爬塔'.encode();loading[3]='1.0.16 Lua'.encode()
 return blob[:12]+b''.join(s+b'\0' for s in fields)+fixed+b''.join(s+b'\0' for s in loading)+blob[offset:]
changes={'war3map.j':(ROOT/'lua_build/war3map.j').read_bytes(),'war3map.w3i':metadata(base.read('war3map.w3i'))}
new={'aitower.lua':(ROOT/'lua_build/aitower.lua').read_bytes()}
for path in sorted((ROOT/'lua_build/AITower').iterdir()):
 if path.is_file() and path.suffix.lower() in ('.tga','.fdf','.toc'):new['AITower\\'+path.name]=path.read_bytes()
hashes=list(base.mpq.hash_table);blocks=list(base.mpq.block_table)
free=sum(e.block_table_index in (0xffffffff,0xfffffffe)for e in hashes)
assert free>len(new),(free,len(new))
payload=bytearray(base.data);sector=512<<base.mpq.header['sector_size_shift']
expected_old={i:base.block(i)for i in range(len(blocks))}
for name,data in changes.items():
 i=base.index(name);encoded=encode_sectors(data,sector)
 blocks[i]=MPQBlockTableEntry(len(payload)-base.offset,len(encoded),len(data),0x80000200)
 payload.extend(encoded);expected_old[i]=data
for name,data in new.items():
 assert base.mpq.get_hash_table_entry(name)is None,name
 start=base.mpq._hash(name,'TABLE_OFFSET')%len(hashes)
 slot=next((start+n)%len(hashes)for n in range(len(hashes))if hashes[(start+n)%len(hashes)].block_table_index in (0xffffffff,0xfffffffe))
 hashes[slot]=MPQHashTableEntry(base.mpq._hash(name,'HASH_A'),base.mpq._hash(name,'HASH_B'),0,0,len(blocks))
 encoded=encode_sectors(data,sector);blocks.append(MPQBlockTableEntry(len(payload)-base.offset,len(encoded),len(data),0x80000200));payload.extend(encoded)
hash_offset=len(payload)-base.offset
payload.extend(encrypt_table(base.mpq,b''.join(struct.pack('<2I2HI',*e)for e in hashes),base.mpq._hash('(hash table)','TABLE')))
block_offset=len(payload)-base.offset
payload.extend(encrypt_table(base.mpq,b''.join(struct.pack('<4I',*e)for e in blocks),base.mpq._hash('(block table)','TABLE')))
struct.pack_into('<I',payload,base.offset+8,len(payload)-base.offset)
struct.pack_into('<4I',payload,base.offset+16,hash_offset,block_offset,len(hashes),len(blocks))
candidate=ROOT/'lua_build/AI-Tower-candidate.w3x';candidate.write_bytes(payload)
result=Map(candidate)
for i,data in expected_old.items():assert result.block(i)==data,('old block changed',i)
for i,entry in enumerate(base.mpq.hash_table):
 if entry.block_table_index not in (0xffffffff,0xfffffffe):assert result.mpq.hash_table[i]==entry
entries=json.loads((ROOT/'v18_extract/extraction-manifest.json').read_text(encoding='utf-8-sig'))['entries']
named={e['archive_name'].replace('/','\\'):expected_old[e['block']]for e in entries if e['archive_name']}
named.update(new)
native=verify_archive(candidate,named)
assert native['ok']
if OUT.exists():
 previous=OUT.with_suffix('.w3x.manifest.json')
 assert previous.exists()and json.loads(previous.read_text(encoding='utf-8'))['sha256']==sha(OUT.read_bytes()),'Existing Lua map externally changed'
OUT.write_bytes(candidate.read_bytes())
report=dict(map=str(OUT),version='1.0.16 Lua',bytes=OUT.stat().st_size,sha256=sha(OUT.read_bytes()),source_sha256=EXPECTED,
 oldBlocksVerified=len(expected_old),originalHashSlotsPreserved=True,hashTableSize=len(hashes),newMembers=list(new),replacedMembers=list(changes),
 nativeReadbackCount=len(named),nativeReadback=native,engineTested=False,cloudCommitTested=False)
OUT.with_suffix('.w3x.manifest.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
(ROOT/'audit/lua-archive-validation.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
assert sha(BASE.read_bytes())==EXPECTED
print(json.dumps({k:v for k,v in report.items()if k!='nativeReadback'},ensure_ascii=False,indent=2))

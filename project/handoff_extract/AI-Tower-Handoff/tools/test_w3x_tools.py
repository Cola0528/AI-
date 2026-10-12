"""Portable archive round-trip tests. No game runtime is simulated."""
from pathlib import Path
from types import SimpleNamespace
import contextlib,io,json,sys,tempfile,unittest
from w3x_tools import Map,patch,safe_path
ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'base/AI-Tower-Team-Events-Monk-v12.w3x'
class ArchiveChecks(unittest.TestCase):
 def test_all_extracted_blocks(self):
  m=Map(BASE);manifest=json.loads((ROOT/'editable_v12/extraction-manifest.json').read_text())
  self.assertEqual(len(manifest['entries']),109)
  for e in manifest['entries']:
   self.assertEqual(m.block(e['block']),(ROOT/'editable_v12'/e['extracted_path']).read_bytes())
 def test_path_traversal(self):
  for name in ['../../escape','/absolute','C:/absolute']:
   with self.assertRaises(ValueError):safe_path(ROOT,name)
 def test_patch_sector_boundaries_and_preserve_original(self):
  old=Map(BASE);original=BASE.read_bytes();size=512<<old.mpq.header['sector_size_shift']
  with tempfile.TemporaryDirectory() as td:
   root=Path(td);source=root/'content';script_index=old.index('war3map.j')
   for n in [0,1,size-1,size,size+1,2*size]:
    data=(b'0123456789abcdef'*((n+15)//16))[:n];source.write_bytes(data);out=root/f'map-{n}.w3x'
    with contextlib.redirect_stdout(io.StringIO()):patch(SimpleNamespace(base=str(BASE),out=str(out),overlay=None,file=['war3map.j='+str(source)]))
    new=Map(out);self.assertEqual(new.read('war3map.j'),data)
    for i in range(len(old.mpq.block_table)):
     if i!=script_index:self.assertEqual(old.block(i),new.block(i))
   self.assertEqual(BASE.read_bytes(),original)
 def test_incompressible_sector(self):
  import random
  old=Map(BASE);size=512<<old.mpq.header['sector_size_shift'];data=random.Random(18).randbytes(size+31)
  with tempfile.TemporaryDirectory() as td:
   root=Path(td);source=root/'content';source.write_bytes(data);out=root/'map.w3x'
   with contextlib.redirect_stdout(io.StringIO()):patch(SimpleNamespace(base=str(BASE),out=str(out),overlay=None,file=['war3map.j='+str(source)]))
   self.assertEqual(Map(out).read('war3map.j'),data)
 def test_existing_output_is_not_overwritten(self):
  with tempfile.TemporaryDirectory() as td:
   dest=Path(td)/'existing';dest.write_bytes(b'keep')
   with self.assertRaises(ValueError):patch(SimpleNamespace(base=str(BASE),out=str(dest),overlay=None,file=[]))
   self.assertEqual(dest.read_bytes(),b'keep')
 def test_unknown_entry_rejected_before_write(self):
  with tempfile.TemporaryDirectory() as td:
   root=Path(td);source=root/'content';source.write_bytes(b'x');dest=root/'output.w3x'
   with self.assertRaises(KeyError):patch(SimpleNamespace(base=str(BASE),out=str(dest),overlay=None,file=['missing.txt='+str(source)]))
   self.assertFalse(dest.exists())
if __name__=='__main__':unittest.main(verbosity=2)

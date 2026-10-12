"""Bundle the delivered map, its source, checks and previous stable base."""
from pathlib import Path
import zipfile,hashlib,json
ROOT=Path(__file__).resolve().parents[1]
dest=ROOT/'AI-Tower-1.0.16-Lua-源码与审查.zip'
files=[]
for name in ['AI-Tower-1.0.16-Lua.w3x','AI-Tower-1.0.16-Lua.w3x.manifest.json','AI-v19-UI2.w3x','Lua版本-交付说明.md','1.0.16-联机修复审查.md','KK存档配置-v19.md','KK存档键-v19.csv','v18_extract/war3map.j','v18_extract/extraction-manifest.json','tools/build_lua.py','tools/package_lua.py','tools/native_archive_check.py','tools/bundle_lua_delivery.py']:
 files.append(ROOT/name)
for name in ['assets/art','lua_src','lua_build','tools/lua_migration','tools/vendor/jass2lua','handoff_extract/AI-Tower-Handoff/tools']:
 for p in (ROOT/name).rglob('*'):
  if p.is_file()and p.suffix not in ('.w3x','.pyc')and '__pycache__'not in p.parts:files.append(p)
files.extend((ROOT/'tests').glob('lua_*.lua'))
files.extend(p for p in (ROOT/'audit').glob('lua-*')if p.is_file()and p.name!='lua-delivery-bundle.json')
files=list(dict.fromkeys(files))
with zipfile.ZipFile(dest,'w',zipfile.ZIP_DEFLATED,compresslevel=6)as z:
 for p in files:z.write(p,p.relative_to(ROOT).as_posix())
with zipfile.ZipFile(dest)as z:
 assert z.testzip()is None
 for p in files:assert hashlib.sha256(z.read(p.relative_to(ROOT).as_posix())).digest()==hashlib.sha256(p.read_bytes()).digest()
report={'zip':str(dest),'files':len(files),'bytes':dest.stat().st_size,'sha256':hashlib.sha256(dest.read_bytes()).hexdigest(),'roundtripVerified':True}
(ROOT/'audit/lua-delivery-bundle.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
print(json.dumps(report,ensure_ascii=False,indent=2))

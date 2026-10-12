"""Check actual game archives for every displayed native icon; extract previews.

No native Warcraft artwork is embedded in the new map. These extracts are only
used by the coordinate-model renderer and remain under audit/.
"""
from pathlib import Path
import ctypes as C,json,hashlib,re
from PIL import Image
from io import BytesIO
ROOT=Path(__file__).resolve().parents[2]
lib=C.WinDLL('C:/Project/爬塔/tools/vendor/stormlib/x64/StormLib.dll',use_last_error=True)
H=C.c_void_p;D=C.c_uint32
lib.SFileOpenArchive.argtypes=[C.c_void_p,D,D,C.POINTER(H)];lib.SFileOpenArchive.restype=C.c_bool
lib.SFileOpenFileEx.argtypes=[H,C.c_char_p,D,C.POINTER(H)];lib.SFileOpenFileEx.restype=C.c_bool
lib.SFileGetFileSize.argtypes=[H,C.POINTER(D)];lib.SFileGetFileSize.restype=D
lib.SFileReadFile.argtypes=[H,C.c_void_p,D,C.POINTER(D),C.c_void_p];lib.SFileReadFile.restype=C.c_bool
lib.SFileCloseFile.argtypes=[H];lib.SFileCloseArchive.argtypes=[H]
game=Path('C:/Program Files (x86)/Warcraft3')
archives=[]
for path in [ROOT/'AI-v19-UI2.w3x',game/'War3Patch.mpq',game/'War3xlocal.mpq',game/'War3x.mpq',game/'war3.mpq']:
 handle=H()
 for name in [C.c_wchar_p(str(path)),C.c_char_p(str(path).encode('mbcs'))]:
  if lib.SFileOpenArchive(C.cast(name,C.c_void_p),0,0x100,C.byref(handle)):break
 else:raise RuntimeError(f'Cannot open {path}')
 archives.append((path,handle))
def read(name):
 for path,archive in archives:
  member=H()
  if not lib.SFileOpenFileEx(archive,name.encode('utf-8'),0,C.byref(member)):continue
  try:
   size=lib.SFileGetFileSize(member,None);buf=C.create_string_buffer(size);got=D()
   assert lib.SFileReadFile(member,buf,size,C.byref(got),None)and got.value==size
   return buf.raw,str(path)
  finally:lib.SFileCloseFile(member)
 raise FileNotFoundError(name)
model=json.loads((ROOT/'audit/lua-ui-model.json').read_text(encoding='utf-8'))
names={f['texture']for frames in model['snapshots'].values()for f in frames.values()if f.get('texture')}
for source in (ROOT/'lua_src').rglob('*.lua'):
 for texture in re.findall(r"'(ReplaceableTextures\\\\[^']+\.blp)'",source.read_text(encoding='utf-8')):
  names.add(texture.replace('\\\\','\\'))
 for model in re.findall(r"AddSpecialEffect\('([^']+)'",source.read_text(encoding='utf-8')):
  names.add(model.replace('\\\\','\\'))
target=ROOT/'audit/lua-native-icons';target.mkdir(exist_ok=True)
report=[];missing=[]
try:
 for name in sorted(names):
  if name.lower().startswith('aitower\\'):
   data=(ROOT/'lua_build'/name.replace('\\','/')).read_bytes();source='local Lua asset'
  else:
   try:data,source=read(name)
   except FileNotFoundError:missing.append(name);continue
  preview=target/(hashlib.sha256(name.encode()).hexdigest()[:16]+'.png')
  try:Image.open(BytesIO(data)).convert('RGBA').save(preview)
  except Exception:preview=None
  report.append(dict(name=name,source=source,bytes=len(data),preview=str(preview)if preview else None))
finally:
 for _,handle in archives:lib.SFileCloseArchive(handle)
(ROOT/'audit/lua-ui-resources.json').write_text(json.dumps(dict(assets=report,missing=missing),ensure_ascii=False,indent=2),encoding='utf-8')
print(f'Native/custom texture verification: {len(report)} found, {len(missing)} missing')
for name in missing:print('MISSING',name)
assert not missing

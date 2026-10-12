"""Preserve published artifacts before writing a differently named release."""
from pathlib import Path
import hashlib,json
root=Path(__file__).resolve().parents[2]
expected={
 'AI-Tower-1.0.15-Lua.w3x':'a60e2e0f0cdda3ad5a45bc56bfb0d1ad15d692d88cf3fb1f8f0fb808660ed394',
 'AI-Tower-1.0.15-Lua-源码与审查.zip':'8017c8faa65d9cb6a032b178cbc3666f9dd05b11f7fa7ee4cc1c00a85b1eb12c',
}
for name,sha in expected.items():
 assert hashlib.sha256((root/name).read_bytes()).hexdigest()==sha,name
(root/'audit/lua-1.0.15-preserved.json').write_text(json.dumps(expected,ensure_ascii=False,indent=2),encoding='utf-8')
notes=root/'recovery/1.0.15-交付说明.md'
if not notes.exists():
 notes.parent.mkdir(exist_ok=True)
 notes.write_bytes((root/'Lua版本-交付说明.md').read_bytes())
for name in ['tools/build_lua.py','tools/package_lua.py','tools/bundle_lua_delivery.py','tools/lua_migration/bundle.py','lua_src/aitower/ui/app.lua','tests/lua_packed.lua']:
 p=root/name
 p.write_text(p.read_text(encoding='utf-8').replace('1.0.15','1.0.16'),encoding='utf-8')
print('1.0.15 map/source ZIP verified and preserved; build targets now 1.0.16.')

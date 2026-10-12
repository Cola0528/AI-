"""Generate typed API declarations for the Lua engine model (not game code)."""
from pathlib import Path
import re
ROOT=Path(__file__).resolve().parents[2]
paths=[Path('C:/Project/爬塔/analysis/audit/engine-defaults/War3Patch.mpq_Scripts_common.j'),ROOT/'v18_extract/war3map.j']
records={}
for path in paths:
    for name,ret in re.findall(r'^(?:constant\s+)?native\s+(\w+)\s+takes\s+.*?\s+returns\s+(\w+)',path.read_text(encoding='utf-8-sig'),re.M):records[name]=ret
(ROOT/'tests/lua_api.lua').write_text('return {\n'+''.join(f' [{name!r}]={ret!r},\n' for name,ret in sorted(records.items()))+'}\n',encoding='utf-8')
print(f'{len(records)} typed native declarations for tests')

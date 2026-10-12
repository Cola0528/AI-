"""Migrate the complete validated map into isolated Lua system modules.

The JASS launcher contains only lobby configuration and a Lua entry point.
The translated rules remain readable and retain source function/line indexes.
"""
from pathlib import Path
import collections,hashlib,json,re,subprocess

ROOT=Path(__file__).resolve().parents[1]
BUILD=ROOT/'lua_build'
BUILD.mkdir(exist_ok=True)
common=Path('C:/Project/爬塔/analysis/audit/engine-defaults/War3Patch.mpq_Scripts_common.j')
blizzard=common.with_name('War3Patch.mpq_Scripts_Blizzard.j')
subprocess.run([str(ROOT/'tools/vendor/jass2lua/bin/lua.exe'),'tools/lua_migration/convert.lua',str(common),str(blizzard),'v18_extract/war3map.j','lua_build/common.lua','lua_build/blizzard.lua','lua_build/map.lua'],cwd=ROOT,check=True)

source=(ROOT/'v18_extract/war3map.j').read_text(encoding='utf-8-sig').replace('\r\n','\n')
translated=(BUILD/'map.lua').read_text(encoding='utf-8').splitlines()
functions=list(re.finditer(r'^function (\w+) takes .*?^endfunction\n?',source,re.M|re.S))
assert len(functions)==len(re.findall(r'^function \w+\(', '\n'.join(translated),re.M))

def subsystem(name):
    for prefixes,group in [
        (('HopeMeta_','HopeRewards_'),'progression'),
        (('HopeArchive_','HopeCloud_','HopePoints_','DzAPI_'),'storage'),
        (('HopeGift_','HopeDraw_','HopeMarket_','HopeExchange_','HopeWood_'),'economy'),
        (('HopeRoute_','HopeCoop_','HopeChallenge_','HopeDifficulty_'),'route'),
        (('HopeSkill_','HopeStatus_','HopeThird_','HopeHidden_','HopeMeditation_','HopeMonk_','HopeReclass_','HopeTurn_'),'combat'),
        (('HopeRelic_','HopeChoice_','HopeReward_','HopeGrowth_','HopeJob_'),'rewards'),
        (('HopeQoL_','HopeLayout_','HopeModern_','HopeIntent_','HopeDamage_','HopeName_','HopeTeam_','HopeV8_','HopeEvent_'),'presentation'),
        (('YDWE','YDWETimer','s__','sa__','jasshelper__','InitializeYD','YDWESet'),'compatibility'),
    ]:
        if name.startswith(prefixes):return group
    if name.startswith(('Create','InitCustom','InitAlly','InitGlobals','RunInitialization')) or name in ('main','config'):
        return 'world'
    if name.startswith(('Trig_JN','InitTrig_JN')):return 'skill_events'
    if name.startswith(('Trig_S','InitTrig_S','Trig_WP','InitTrig_WP')):return 'item_events'
    if name.startswith(('Trig_','InitTrig_')):return 'world_events'
    return 'compatibility'

groups=collections.OrderedDict();index=[]
occupied=set()
for match in functions:
    name=match[1];start=source.count('\n',0,match.start());end=start+len(match.group().splitlines())
    lines=translated[start:end];assert lines[0].startswith('function '+name+'('),name
    group=subsystem(name);groups.setdefault(group,[]).extend(lines+[''])
    occupied.update(range(start,end))
    index.append(dict(name=name,module=group,sourceLine=start+1,lines=len(lines),sha256=hashlib.sha256(match.group().encode()).hexdigest()))

generated=BUILD/'aitower/generated';generated.mkdir(parents=True,exist_ok=True)
def module(path,text):
    path.write_text('-- Generated from the complete validated source; see migration index.\nreturn function(S)\nlocal _ENV=S\n'+text+'\nend\n',encoding='utf-8')

globals_text='\n'.join(line for n,line in enumerate(translated)if n not in occupied)
module(generated/'globals.lua',globals_text)
for group,lines in groups.items():module(generated/(group+'.lua'),'\n'.join(lines))
for kind in ('common','blizzard'):
    module(generated/(kind+'.lua'),(BUILD/(kind+'.lua')).read_text(encoding='utf-8'))

# Original lobby configuration runs in JASS before the game/Lua runtime exists.
# It has no gameplay triggers, UI, save writes, combat functions or inventories.
lobby_names=['InitCustomPlayerSlots','InitCustomTeams','InitAllyPriorities','config']
lobby=[]
for name in lobby_names:
    match=next(m for m in functions if m[1]==name)
    lobby.append(match.group())
launcher='// AI爬塔: lobby-only JASS bootstrap. All gameplay is in aitower Lua modules.\n'+ '\n'.join(re.findall(r'^native .+$',source,re.M))+'\n'+'''
function main takes nothing returns nothing
local string status=EXExecuteScript("require('aitower.bootstrap').boot()")
if status!="AI_LUA_READY" then
call DisplayTimedTextToPlayer(GetLocalPlayer(),0.,0.,60.,"AI爬塔 Lua 启动失败："+status)
endif
endfunction
'''+ '\n'.join(lobby)
launcher=launcher.replace('AI爬塔 1.0.4：','AI爬塔 1.0.16 Lua：')
(BUILD/'war3map.j').write_text(launcher,encoding='utf-8')
modules=['aitower.generated.common','aitower.generated.blizzard','aitower.generated.globals']+['aitower.generated.'+g for g in groups]
(BUILD/'aitower/modules.lua').write_text('return {\n'+''.join('    '+json.dumps(m)+',\n' for m in modules)+'}\n',encoding='utf-8')
report=dict(source='AI-v19-UI2.w3x',sourceSha256=hashlib.sha256((ROOT/'AI-v19-UI2.w3x').read_bytes()).hexdigest(),allFunctions=len(functions),subsystems={g:sum(1 for f in index if f['module']==g)for g in groups},jassLauncherLines=len(launcher.splitlines()),functions=index,conversion='Pinned jass2lua AST parser; truncating integer division and typed defaults corrected',engineTested=False)
(ROOT/'audit/lua-migration-index.json').write_text(json.dumps(report,ensure_ascii=False,indent=2),encoding='utf-8')
print(f'Migrated {len(functions)} map functions into {len(groups)} systems. Lobby launcher {len(launcher.splitlines())} lines.')

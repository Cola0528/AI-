"""One MPQ Lua member, maintainable modules on disk.

Keeps the 128-entry MPQ hash table unchanged, preserving unknown filenames.
"""
from pathlib import Path
import hashlib,json,subprocess

ROOT=Path(__file__).resolve().parents[2]
paths={}
for directory in (ROOT/'lua_build/aitower',ROOT/'lua_src/aitower'):
    for file in sorted(directory.rglob('*.lua')):
        name='aitower.'+'.'.join(file.relative_to(directory).with_suffix('').parts)
        assert name not in paths,(name,'duplicate module')
        paths[name]=file
text=['-- AI爬塔 full Lua package. Module sources are preserved in the delivery zip.']
for name,path in paths.items():
    source=path.read_text(encoding='utf-8').replace('1.0.4 UI2','1.0.16 Lua').replace('AI爬塔 1.0.4','AI爬塔 1.0.16 Lua')
    source=source.replace('速览位于左上头像下，显示生命、魔法、行动点、专注与背包占用。','战斗速览与技能、装备集中在底部操作区；兼容模式位于左侧。显示生命、魔法、行动点、专注与背包占用。')
    source=source.replace('小地图上方可直接查看属性、存档、遗物和抽奖；这些入口不受 F5 影响。','小地图上方可查看属性、本局遗物及成长档案；F7 统一打开永久成长、基石和礼包抽奖。入口不受 F5 影响。')
    marker='===='
    while ']'+marker+']' in source:marker+='='
    text.append('package.preload['+json.dumps(name)+']=function(...)\nreturn assert(load(['+marker+'[\n'+source+'\n]'+marker+'],"@'+name.replace('.','/')+'.lua","t",_ENV))(... )\nend')
text.append("return require('aitower.bootstrap')")
out=ROOT/'lua_build/aitower.lua'
out.write_text('\n'.join(text)+'\n',encoding='utf-8')
launcher=ROOT/'lua_build/war3map.j'
launcher.write_text(launcher.read_text(encoding='utf-8').replace("require('aitower.bootstrap').boot()","require('aitower').boot()"),encoding='utf-8')
for path in [out,*paths.values()]:
    subprocess.run(['C:/AI/Lua54/luac.exe','-p',str(path)],check=True,cwd=ROOT,capture_output=True)
(ROOT/'audit/lua-module-check.json').write_text(json.dumps(dict(modules=len(paths),allSyntaxPassed=True,engineTested=False,modulesIndex=[dict(name=name,path=str(path.relative_to(ROOT)),sha256=hashlib.sha256(path.read_bytes()).hexdigest())for name,path in paths.items()]),ensure_ascii=False,indent=2),encoding='utf-8')
print(f'Lua syntax verified: {len(paths)} modules and packed entry; {out.stat().st_size} bytes.')

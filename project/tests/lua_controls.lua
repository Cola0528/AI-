-- Integration checks of real Lua callbacks using an engine model, not a render test.
package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local model=require 'tests.lua_engine'
local function id(s)return string.unpack('>I4',s)end
local function key(n)return n>=0x80000000 and n-0x100000000 or n end
local function eq(a,b)assert(a==b,tostring(a)..' ~= '..tostring(b))end
local results={}
local function check(name,fn)fn();results[#results+1]=name;print('PASS '..name)end
local function state()
 local b=model.new();local S=require('aitower.core.runtime').create(b)
 for _,module in ipairs(require 'aitower.modules')do require(module)(S)end
 S.YDHT=S.InitHashtable();S.YDLOC=S.InitHashtable();S.HopeModern_Data=S.InitHashtable()
 S.HopeThird_Init();S.HopeJob_Count=43
 b.eventTrigger=S.CreateTrigger()
 for i=1,6 do
  S.udg_hero[i]=S.CreateUnit(S.Player(i-1),id('H000'),0,0,0)
  S.udg_Yiwu_danwei[i]=S.CreateUnit(S.Player(i-1),id('hfoo'),0,0,0)
  S.udg_xingdong_dian[i]=3;S.udg_xingdong_dianSx[i]=3
  S.udg_Fashang_Dm[i]=1;S.udg_Skill_Dm[i]=1;S.udg_Zuizhong_Dm[i]=1
  S.udg_Wj_sj_xz[i]=S.DialogCreate();S.udg_Rskill_shifoutihuan[i]=S.DialogCreate()
 end
 S.HopeModern_Tick=100
 return S,b
end
local function button(S,d,label,kind,amount)
 S.HopeModern_Add(d,label);local h=S.GetHandleId(S.bj_lastCreatedButton)
 S.SaveInteger(S.YDHT,h,key(0x0340FE72),kind)
 S.SaveReal(S.YDHT,h,key(0x80E7EB49),amount or 0)
end
check('All six potion abilities consume exactly one, heal, refresh zero count, and cannot heal empty',function()
 for i,ability in ipairs({'A00Y','A00Z','A010','A011','A012','A013'})do
  local S,b=state();local u=S.udg_hero[i];b.eventUnit=u;b.eventAbility=id(ability)
  u.abilities[id(ability)]=1;u.states[0]=100;u.states[2]=0;S.udg_Yaoshui_shenyu_cs[i]=1
  assert(S.Trig_Y_____________001Conditions());S.Trig_Y_____________001Actions()
  eq(u.states[0],400);eq(u.states[2],25);eq(S.udg_Yaoshui_shenyu_cs[i],0);eq(S.udg_xingdong_dian[i],3)
  assert(S.HopeSkill_PotionDescription(u):find('0瓶'))
  S.Trig_Y_____________001Actions();eq(u.states[0],400);eq(u.states[2],25);eq(S.udg_Yaoshui_shenyu_cs[i],0)
 end
end)
check('Upgrade card click applies original stat effect to owner and rejects wrong owner / replay',function()
 local S,b=state();local ui=require('aitower.ui.components').new(S)
 require('aitower.ui.choices').install(S,ui);S.HopeModern_Create()
 local d=S.udg_Wj_sj_xz[1]
 button(S,d,'[D] 生命上限 +10',5,10);button(S,d,'[A] 力量 +2',1,2);button(S,d,'[S] 最终伤害 +1%',16,.01)
 S.HopeChoice_DialogDisplay(S.Player(0),d,true)
 local index=S.HopeChoice_FindDialog(d);local click=b.frames[S.HopeModern_Row[index*8+1]].scripts[1]
 assert(click.sync);b.eventPlayer=S.Player(1);click.fn();eq(S.udg_hero[1].states[1],1000)
 b.eventPlayer=S.Player(0);click.fn();eq(S.udg_hero[1].states[1],1010);eq(S.udg_hero[2].states[1],1000)
 assert(not S.HopeChoice_DialogPending[index]);S.HopeModern_Tick=200;click.fn();eq(S.udg_hero[1].states[1],1010)
end)
check('R replacement callback removes old ability, grants new one and updates passive modifiers once',function()
 local S,b=state();local ui=require('aitower.ui.components').new(S)
 require('aitower.ui.choices').install(S,ui);S.HopeModern_Create()
 local u=S.udg_hero[1];local old=id('A020');local next_=id('A01D');local d=S.udg_Rskill_shifoutihuan[1]
 u.abilities[old]=1;S.udg_R_Skill[1]=old;S.udg_Baoji_Lv[1]=20;S.udg_Baoji_Damage[1]=2
 S.SaveInteger(S.YDHT,S.GetHandleId(d),key(0xD59B01E6),next_)
 button(S,d,'替换',1);button(S,d,'保留',2);S.HopeChoice_DialogDisplay(S.Player(0),d,true)
 local index=S.HopeChoice_FindDialog(d);b.eventPlayer=S.Player(0)
 b.frames[S.HopeModern_Row[index*8+1]].scripts[1].fn()
 eq(S.GetUnitAbilityLevel(u,old),0);eq(S.GetUnitAbilityLevel(u,next_),1);eq(S.udg_R_Skill[1],next_)
 eq(S.udg_Baoji_Lv[1],5);eq(S.udg_Baoji_Damage[1],1.5);eq(S.udg_Fashang_Dm[1],1.3);eq(S.udg_Skill_Dm[1],1.2)
end)
check('Hero learned-skill event applies defense, spell, focus, potion and action-cap benefits',function()
 local S,b=state();local u=S.udg_hero[1];b.eventUnit=u
 local function learn(s,level) b.eventAbility=id(s);u.abilities[id(s)]=level or 1;S.Trig_JN_____________012Actions()end
 learn('A00P');eq(S.udg_xingdong_dianSx[1],4);learn('A00P',2);eq(S.udg_xingdong_dianSx[1],4)
 learn('A03E');eq(S.udg_Defend_HUIHE[1],5);eq(S.udg_Defend_fangyu[1],5)
 learn('A03G');eq(S.udg_Fashang_Dm[1],1.1)
 learn('A055');eq(S.udg_DEX[1],3);eq(S.udg_jingque_Daji_jiacheng[1],.2)
 learn('A00N');eq(S.udg_Yaoshui_shenyu_cs[1],1);learn('A00N');eq(S.udg_Yaoshui_shenyu_cs[1],1)
 learn('A00N',2);eq(S.udg_Yaoshui_shenyu_cs[1],2)
end)
check('Third profession study consumes points, caps at three and refuses outside the spring room',function()
 local S,b=state();local u=S.udg_hero[1];local option=26
 S.HopeJob_Awakened[1]=true;S.HopeJob_AwakenOption[1]=option;u.abilities[S.HopeThird_Ability[option]]=1;u.skillPoints=3
 S.HopeThird_Study(option,S.Player(0));eq(u.skillPoints,3);eq(S.HopeThird_Level(u),1)
 u.x=-2200;u.y=2200;S.HopeThird_Study(option,S.Player(0));eq(u.skillPoints,2);eq(S.HopeThird_Level(u),2)
 S.HopeThird_Study(option,S.Player(0));eq(u.skillPoints,1);eq(S.HopeThird_Level(u),3)
 S.HopeThird_Study(option,S.Player(0));eq(u.skillPoints,1);eq(S.HopeThird_Level(u),3)
end)
check('Pending upgrade reopen preserves its four candidates and does not spend another point',function()
 local S,b=state();local ui=require('aitower.ui.components').new(S)
 require('aitower.ui.choices').install(S,ui);S.HopeModern_Create()
 local hero=S.udg_hero[1];b.eventUnit=hero;b.eventSeller=hero;b.eventSold=S.CreateUnit(S.Player(0),id('h00F'),0,0,0)
 S.udg_shengji_dian[1]=3;S.Trig____________________040Actions()
 eq(S.udg_shengji_dian[1],2)
 local d=S.udg_Wj_sj_xz[1];local index=S.HopeChoice_FindDialog(d);assert(S.HopeChoice_DialogPending[index])
 local choices={};for n=1,4 do choices[n]=S.LoadButtonHandle(S.HopeModern_Data,S.GetHandleId(d),200+n);assert(choices[n])end
 S.HopeChoice_Hidden=true;b.eventSold=S.CreateUnit(S.Player(0),id('h00F'),0,0,0)
 S.Trig____________________040Actions();eq(S.udg_shengji_dian[1],2);assert(b.eventSold.removed);assert(not S.HopeChoice_Hidden)
 for n=1,4 do eq(S.LoadButtonHandle(S.HopeModern_Data,S.GetHandleId(d),200+n),choices[n])end
end)
check('Full hero inventory sends loot to helper; two full bags keep loot on the ground',function()
 local S=state();local hero=S.udg_hero[1];hero.x=123;hero.y=456
 local helper=S.CreateUnit(S.Player(0),id('hfoo'),0,0,0);S.udg_Bei_bao_danwei[1]=helper
 for n=1,6 do S.UnitAddItem(hero,S.CreateItem(id('I001'),0,0))end
 local item=S.HopeInventory_Give(id('I002'),hero);eq(helper.items[0],item);eq(S.UnitInventoryCount(hero),6)
 for n=1,5 do S.UnitAddItem(helper,S.CreateItem(id('I001'),0,0))end
 local overflow=S.HopeInventory_Give(id('I003'),hero)
 assert(not S.IsItemOwned(overflow));eq(overflow.x,123);eq(overflow.y,456);eq(S.GetItemTypeId(overflow),id('I003'))
 eq(S.UnitInventoryCount(hero),6);eq(S.UnitInventoryCount(helper),6)
end)
check('Hidden profession replacement preserves six items, learned training, R and potion abilities',function()
 local S=state();local old=S.udg_hero[1];old.type=id('HZ01');old.skillPoints=2
 old.abilities[id('AZHP')]=2
 for n=1,6 do S.UnitAddItem(old,S.CreateItem(id('I001'),0,0))end
 local items={};for n=0,5 do items[n]=old.items[n]end
 S.udg_R_Skill[1]=id('A01D')
 for key_,ability in pairs({[0x412D8AC6]='A014',[0x3FB1F9E0]='A00Y',[0x590EE9FB]='A00S'})do S.SaveInteger(S.YDHT,1,key(key_),id(ability))end
 S.HopeJob_ReplaceHidden(S.Player(0),id('HZ02'));local hero=S.udg_hero[1]
 assert(hero~=old and old.removed);eq(hero.skillPoints,2);eq(S.GetUnitAbilityLevel(hero,id('AZHP')),2)
 for _,ability in ipairs({'A014','A00Y','A00S','A01D'})do eq(S.GetUnitAbilityLevel(hero,id(ability)),1)end
 for n=0,5 do eq(hero.items[n],items[n])end
end)
local f=assert(io.open('audit/lua-controls-results.txt','wb'));f:write('Engine model only; native rendering and clicks not verified in Warcraft.\n',#results,' suites passed\n',table.concat(results,'\n'));f:close()
print(#results..' Lua controls integration suites passed')

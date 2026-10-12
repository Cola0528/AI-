package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local model=require 'tests.lua_engine'
local runtime=require 'aitower.core.runtime'
local tests={}
local function eq(a,b,message)assert(a==b,(message or 'mismatch')..': '..tostring(a)..' ~= '..tostring(b))end
local function test(name,fn)fn();tests[#tests+1]=name;print('PASS '..name)end
local function state()
 local b=model.new();local S=runtime.create(b)
 for _,name in ipairs(require 'aitower.modules')do require(name)(S)end
 S.YDHT=S.InitHashtable();S.HopeDraw_History=S.InitHashtable();S.HopeModern_Data=S.InitHashtable()
 S.HopeStatus_Init();S.HopeMeta_Config();S.HopeMeta_ConfigBrief()
 for i=0,5 do
  local p=S.Player(i);S.HopeCloud_CheckLoad(p)
  S.HopeMeta_Loaded[i]=true;S.HopeMeta_Started[i]=true
  S.udg_hero[i+1]=S.CreateUnit(p,1093677105,0,0,0)
  S.udg_Wj_jf[i+1]=5000;S.udg_Skill_Dm[i+1]=1;S.udg_Fashang_Dm[i+1]=1;S.udg_Zuizhong_Dm[i+1]=1
  S.udg_Baoji_Lv[i+1]=5;S.udg_Baoji_Damage[i+1]=1.5;S.HopeMeta_LastTurn[i]=-1
  S.udg_xingdong_dian[i+1]=3;S.udg_xingdong_dianSx[i+1]=3;S.udg_DEX[i+1]=3
 end
 S.gg_unit_n00Q_0028=S.CreateUnit(S.Player(15),1848651857,0,0,0)
 S.udg_Yx_Nd_Dj=1;S.udg_huihe_s=1;S.udg_boci=1;S.udg_quanshu=1
 return S,b
end
test('Lua typed arrays, signed keys, integer division and dispatch',function()
 local S=state();eq(S._idiv_(-7,3),-2);eq(S._idiv_(7,-3),-2);eq(S._array_(false)[100],false)
 eq(S.HopeStatus_PoisonKey(0),-374736685)
 local called=0;S.Example=function()called=called+1 end;S.ExecuteFunc('Example');eq(called,1)
 eq(S.__backend.runtime.handle_level,1);eq(S.__backend.runtime.sleep,true)
end)
test('All 1024 talent bitfields round trip without cross-node corruption',function()
 local S=state();for mask=0,1023 do for n=0,4 do eq(S.HopeMeta_Level(mask,n),math.floor(mask/4^n)%4)end end
end)
test('Prerequisite, three purchases, price escalation, max level and player isolation',function()
 local S=state();local p=S.Player(0)
 S.HopeMeta_BuyTalent(p,1);eq(S.udg_Wj_jf[1],5000)
 for n=1,4 do S.HopeMeta_BuyTalent(p,0)end
 eq(S.udg_Wj_jf[1],4820);eq(S.HopeMeta_Level(S.HopeMeta_Talent[0],0),3)
 eq(S.HopeMeta_Talent[3],0);eq(S.HopeMeta_RunTalent[0],0)
end)
test('Keystone mutual exclusion, actual-spend refund and no repeated refund',function()
 local S=state();local p=S.Player(0);S.HopeMeta_BuyTalent(p,0);S.HopeMeta_Key(p,1)
 local points=S.udg_Wj_jf[1];S.HopeMeta_Key(p,2);eq(S.udg_Wj_jf[1],points)
 S.HopeMeta_Reset(p);eq(S.udg_Wj_jf[1],4990);eq(S.HopeMeta_Keystone[0],0)
 S.HopeMeta_Reset(p);eq(S.udg_Wj_jf[1],4990)
end)
test('Abyss insufficient funds, idempotence and next-run snapshot',function()
 local S=state();local p=S.Player(0);S.HopeMeta_Soul[0]=29;S.HopeMeta_BuyAbyss(p,0);eq(S.HopeMeta_Abyss[0],0)
 S.HopeMeta_Soul[0]=30;S.HopeMeta_BuyAbyss(p,0);S.HopeMeta_BuyAbyss(p,0)
 eq(S.HopeMeta_Soul[0],0);eq(S.HopeMeta_Abyss[0],1);eq(S.HopeMeta_RunAbyss[0],0)
end)
test('Failed cloud read prohibits permanent writes and deductions',function()
 local S,b=state();local p=S.Player(1);S.HopeCloud_Ready[1]=false
 local count=#b.writes;S.DzAPI_Map_StoreInteger(p,'boss_jf',999);S.HopeMeta_BuyTalent(p,0)
 eq(#b.writes,count);eq(S.udg_Wj_jf[2],5000)
end)
test('Cloud values preserve I prefix and six-player ownership',function()
 local S,b=state();for i=0,5 do S.DzAPI_Map_StoreInteger(S.Player(i),'boss_jf',100+i)end
 for i=0,5 do eq(b.cloud[i..'/Iboss_jf'],tostring(100+i))end
end)
test('43 mastery values serialize losslessly and within exact integer range',function()
 local S,b=state();for n=0,42 do S.HopeMeta_Mastery[5*43+n]=n%64 end
 for g=0,10 do
  S.HopeMeta_SaveMastery(5,g*4);local v=tonumber(b.cloud['5/Imast_v1_'..g]);assert(v<2^24)
  for n=g*4,math.min(42,g*4+3)do eq(v%64,n%64);v=math.floor(v/64)end
 end
end)
test('Shop actions require actual synchronized room entry',function()
 local S=state();local p=S.Player(0);local gold=S.GetPlayerState(p,S.PLAYER_STATE_RESOURCE_GOLD)
 S.HopeMarket_InRoom=false;S.HopeMarket_Trade(p,2);eq(S.GetPlayerState(p,S.PLAYER_STATE_RESOURCE_GOLD),gold)
 S.HopeMarket_InRoom=true;S.HopeMarket_Trade(p,2);eq(S.GetPlayerState(p,S.PLAYER_STATE_RESOURCE_GOLD),gold-77)
 S.udg_ZhandouZhong=true;S.HopeMarket_Trade(p,2);eq(S.GetPlayerState(p,S.PLAYER_STATE_RESOURCE_GOLD),gold-77)
end)
test('Six difficulties by six party sizes scale units only once',function()
 local S=state()
 for d=1,6 do for n=1,6 do
  S.udg_Yx_Nd_Dj=d;S.udg_quanshu=3;S.HopeCoop_RoomPlayers=n
  local u=S.CreateUnit(S.Player(11),123,0,0,0)
  S.HopeChallenge_ScaleEnemy(u);S.HopeCoop_ScaleEnemy(u)
  local hp=u.states[1];local atk=u.states[18]
  S.HopeChallenge_ScaleEnemy(u);S.HopeCoop_ScaleEnemy(u)
  eq(u.states[1],hp);eq(u.states[18],atk);assert(hp>0 and hp<=10000000 and atk>0 and atk<=1000000)
 end end
 eq(S.HopeCoop_LifeFactor(1,true),1);eq(S.HopeCoop_AttackFactor(6),1.25)
end)
test('Real Lua turn token renews shield once on all high-difficulty turns',function()
 local S=state();S.HopeMeta_RunKey[3]=1;S.udg_ZhandouZhong=true
 for _,d in ipairs({1,4,5,6})do
  S.udg_Yx_Nd_Dj=d;S.udg_huihe_s=1;S.HopeChallenge_TurnSerial=123;S.HopeMeta_LastTurn[3]=-1
  S.HopeMeta_CheckTurn(3);eq(S.HopeMeta_Shield[3],40)
  S.HopeMeta_Shield[3]=7;S.HopeMeta_CheckTurn(3);eq(S.HopeMeta_Shield[3],7)
  S.udg_huihe_s=2;S.HopeChallenge_TurnSerial=124;S.HopeMeta_CheckTurn(3);eq(S.HopeMeta_Shield[3],0)
 end
end)
test('Ten thousand actual Lua upgrade draws contain no duplicated choices',function()
 local S=state();local counts={};for n=1,17 do counts[n]=0 end
 for _=1,10000 do local seen={};for slot=1,3 do local n=S.HopeChoice_PickUnique(1,slot);assert(not seen[n]);seen[n]=true;counts[n]=counts[n]+1 end end
 for _,count in ipairs(counts)do assert(math.abs(count/(30000/17)-1)<.2)end
end)
test('Poison stacks sum six owners and estimate the actual poison source formula',function()
 local S=state();local enemy=S.CreateUnit(S.Player(11),123,0,0,0)
 for i=0,5 do
  S.SaveInteger(S.YDHT,S.GetHandleId(enemy),S.HopeStatus_PoisonKey(i),i+1)
  S.udg_hero[i+1].abilities[1093677653]=2
 end
 eq(S.HopeStatus_PoisonTotal(enemy),21);eq(S.HopeStatus_PoisonBase(enemy),1260)
 assert(S.HopeStatus_PoisonDetails(enemy,S.Player(0)):find('21'))
 assert(S.HopeStatus_PoisonPreviewLine(enemy):find('1260'))
 eq(S.HopeStatus_Number(20),'20')
end)
test('Synced actions use event owner and immutable payload regardless of local tabs',function()
 local S,b=state();local ui=require('aitower.ui.components').new(S);local bus=require('aitower.game.commands').new(S)
 local button=ui.button(nil,.1,.3,.1,.03,'buy');bus.bind(button.id,'talent',0)
 for player=0,5 do b.eventPlayer=S.Player(player);S.HopeMeta_Tab=(player+1)%3;b.frames[button.id].scripts[1].fn()end
 for i=0,5 do eq(S.HopeMeta_Level(S.HopeMeta_Talent[i*3],0),1);eq(S.udg_Wj_jf[i+1],4970)end
 assert(b.frames[button.id].scripts[1].sync)
end)
test('Complete native 12-command and six-item set retains engine positions; partial capability leaves native UI',function()
 local S,b=state();local ui=require('aitower.ui.components').new(S)
 local module=require 'aitower.ui.native_controls';local dock=module.install(S,ui)
 eq(#dock.commands,12);eq(#dock.items,6)
 dock.activate()
 for _,id in ipairs(dock.commands)do eq(b.frames[id].parent,1);eq(b.frames[id].alpha,255);assert(b.frames[id].enabled==nil)end
 local S2,b2=state();b2.japi.DzFrameGetItemBarButton=function(n)return n==3 and 0 or b.japi.DzFrameGetItemBarButton(n)end
 local moved=0;b2.japi.DzFrameSetParent=function()moved=moved+1 end
 assert(not module.install(S2,require('aitower.ui.components').new(S2)).available);eq(moved,0)
end)
test('All game functions load and startup is idempotent including delayed UI callbacks',function()
 package.loaded['aitower.bootstrap']=nil
 local b=model.new();local boot=require 'aitower.bootstrap'
 eq(boot.boot(b),'AI_LUA_READY');b.step(1);assert(boot.state.__app.mounted)
 local count=b.calls.CreateUnit;eq(boot.boot(b),'AI_LUA_READY');eq(b.calls.CreateUnit,count)
 assert(#b.errors==0)
end)
test('Failed startup is latched rather than building another partial world',function()
 package.loaded['aitower.bootstrap']=nil;local b=model.new();b.japi.DzCreateFrame=nil
 local boot=require 'aitower.bootstrap';local first=boot.boot(b);assert(first:find('required KK API missing'))
 b.japi.DzCreateFrame=function()error('must not retry')end;eq(boot.boot(b),first)
end)
local f=assert(io.open('audit/lua-behavior-results.txt','wb'))
f:write('Engine model only; KK runtime / cloud persistence not verified.\n',#tests,' suites passed\n',table.concat(tests,'\n'));f:close()
print(#tests..' Lua behavioral suites passed')

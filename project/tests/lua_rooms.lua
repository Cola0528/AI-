-- Executes the migrated entry/countdown/cleanup functions, not a UI mockup.
package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local function id(s)return string.unpack('>I4',s)end
local results={}
local function check(name,fn)fn();results[#results+1]=name;print('PASS '..name)end
local function setup(install)
 local b=require('tests.lua_engine').new()
 local S=require('aitower.core.runtime').create(b)
 for _,name in ipairs(require 'aitower.modules')do require(name)(S)end
 S.YDHT=S.InitHashtable();S.YDLOC=S.InitHashtable();b.eventTrigger=S.CreateTrigger()
 S.udg_Youxi_xzgq=S.CreateUnit(S.Player(15),id('n00O'),0,0,0);S.udg_boci=1;S.udg_quanshu=1
 S.udg_Youxi1_jishiqi=S.CreateTimer();S.udg_WJZ={};b.members=4
 S.ForForce=function(_,fn)
  local old=b.enumPlayer
  for i=0,b.members-1 do b.enumPlayer=S.Player(i);fn()end
  b.enumPlayer=old
 end
 S.GetEnumPlayer=function()return b.enumPlayer end
 S.AddHeroXP=function(u,n)u.xp=(u.xp or 0)+n end
 S.HopeCamera_FocusUnit=function(p,u)b.focus={p,u}end
 S.CreateTimerDialog=function()b.dialogs=(b.dialogs or 0)+1;return {id=90000+b.dialogs}end
 S.DisplayTextToForce=function(_,text)b.messages=(b.messages or 0)+1 end
 local randomCalls=0
 S.GetRandomInt=function(a,z)
  if a==1 and z==2 then randomCalls=randomCalls+1;return randomCalls%2==1 and 2 or 1 end
  return a
 end
 -- Physics/coin spawning are outside this lifecycle check. These are still
 -- started by the real room function so duplicate timers can be counted.
 S.Trig_X________________030Func002Func002Func017T=function()b.coinTicks=(b.coinTicks or 0)+1 end
 S.Trig_X________________030Func002Func002Func018T=function()end
 S.ConditionalTriggerExecute=function()b.returns=(b.returns or 0)+1 end
 for i=1,6 do
  S.udg_hero[i]=S.CreateUnit(S.Player(i-1),id('H000'),0,0,0)
  S.udg_Bei_bao_danwei[i]=S.CreateUnit(S.Player(i-1),id('hfoo'),0,0,0)
 end
 if install then require('aitower.game.minigames').install(S)end
 return S,b
end
local function actors(b)
 local n=0;for _,u in ipairs(b.units)do if not u.removed and u.type==id('h00A')then n=n+1 end end;return n
end
check('Unfixed original coin-room entry reproduces two actors per player when entered twice',function()
 local S,b=setup(false)
 b.run(S.Trig_X________________030Actions);b.run(S.Trig_X________________030Actions)
 assert(actors(b)==8,'baseline no longer reproduces duplicated actors')
end)
check('Countdown, active play and finishing reject repeated entry without extra XP or timers',function()
 local S,b=setup(true)
 b.run(S.Trig_X________________030Actions);b.run(S.Trig_X________________030Actions)
 assert(actors(b)==4 and S.HopeMini_IsRunning())
 for i=1,4 do assert(S.udg_hero[i].xp==300)end
 b.step(1);b.run(S.Trig_X________________030Actions);assert(actors(b)==4)
 b.step(5);assert(b.dialogs==1);b.run(S.Trig_X________________030Actions)
 local workers=0;for _,t in ipairs(b.timers)do if t.active and (t.d==1 or t.d==3)then workers=workers+1 end end
 assert(workers==2,'coin/hazard workers duplicated')
 assert(S.HopeRoute_Select(S.Player(0),S.udg_Youxi_xzgq)==false)
 assert(S.HopeRoute_Depart(S.Player(0))==false)
 S.HopeRoute_PickerOpen=false;S.HopeRoute_TogglePicker();assert(not S.HopeRoute_PickerOpen)
 b.run(S.Trig____________________034Actions);b.run(S.Trig____________________034Actions)
 b.run(S.Trig_X________________030Actions);assert(actors(b)==4)
 b.step(8);assert(actors(b)==0 and not S.HopeMini_IsRunning() and b.returns==1)
 -- Stale room callbacks cannot replay even after cleanup has finished.
 b.run(S.Trig_X________________030Actions);assert(actors(b)==0)
 S.udg_boci=2;b.run(S.Trig_X________________030Actions);assert(actors(b)==4)
end)
check('Cleanup removes every temporary actor including disconnected players, preserving heroes and bags',function()
 local S,b=setup(true);b.run(S.Trig_X________________030Actions);b.step(5)
 for i=0,5 do for _,kind in ipairs({'h009','h00A','h00C','h00G'})do S.CreateUnit(S.Player(i),id(kind),0,0,0)end end
 b.members=1 -- leave players are no longer enumerated by the original ForForce
 b.run(S.Trig____________________034Actions);b.step(8)
 for _,u in ipairs(b.units)do
  if u.owner.id<6 then assert(u.removed or u==S.udg_hero[u.owner.id+1]or u==S.udg_Bei_bao_danwei[u.owner.id+1])end
 end
 for i=1,6 do assert(S.HopeMini_Actor[i]==nil and not S.udg_hero[i].removed and not S.udg_Bei_bao_danwei[i].removed)end
end)
check('Event records reset on departure, aggregate teammates and start fresh on the second event',function()
 local S,b=setup(false)
 require('aitower.game.rooms').install(S)
 S.HopeEvent_Button=S.DzCreateFrame('AIButton',1,900)
 S.HopeEvent_Panel=S.DzCreateFrame('AIButton',1,901)
 S.HopeEvent_Body=S.DzCreateFrameByTagName('TEXT','EventBody',S.HopeEvent_Panel,'',0)
 S.HopeEvent_Status=S.DzCreateFrameByTagName('TEXT','EventStatus',S.HopeEvent_Panel,'',0)
 S.HopeEvent_Begin();S.HopeEvent_Add('第一关玩家甲');S.HopeEvent_Begin();S.HopeEvent_Add('第一关玩家乙')
 assert(S.HopeEvent_Sequence==1 and S.HopeEvent_Count==3)
 S.HopeEvent_Refresh();S.HopeEvent_Move(-999);S.HopeEvent_Refresh()
 assert(b.frames[S.HopeEvent_Body].text:find('第一关玩家甲'))
 S.udg_boci=2;S.udg_Youxi_xzgq=S.CreateUnit(S.Player(15),123,0,0,0)
 S.HopeCoop_BeginRoom=function()b.roomDispatch=(b.roomDispatch or 0)+1 end
 b.run(S.Trig______________011Actions);b.run(S.Trig______________011Actions)
 assert(S.HopeEvent_Count==0 and not S.HopeEvent_Open)
 assert(not b.frames[S.HopeEvent_Button].shown and not b.frames[S.HopeEvent_Panel].shown)
 S.HopeEvent_Add('旧事件迟到消息');assert(S.HopeEvent_Count==0)
 S.HopeEvent_Show();assert(not S.HopeEvent_Open)
 b.step(.5);assert(b.roomDispatch==1)
 S.HopeEvent_Begin();S.HopeEvent_Add('第二关新结果');S.HopeEvent_Refresh()
 assert(S.HopeEvent_Count==2 and S.HopeEvent_Sequence==2 and S.HopeEvent_Start==0 and S.HopeEvent_Offset==0)
 S.HopeEvent_Move(-999);S.HopeEvent_Refresh()
 local body=b.frames[S.HopeEvent_Body].text
 assert(body:find('第二关新结果')and not body:find('第一关')and not body:find('迟到'))
 for i=2,511 do assert(S.HopeEvent_Line[i]=='')end
end)
local f=assert(io.open('audit/lua-room-lifecycle.txt','wb'))
f:write(table.concat(results,'\n'),'\nEngine model only; no Warcraft/KK runtime validation.\n');f:close()
print(#results..' room lifecycle suites passed')

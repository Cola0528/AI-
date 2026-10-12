-- Real migrated random-room dispatch with deterministic outcomes. This model
-- does not manufacture region-entry events when a unit is teleported.
package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local function id(s)return string.unpack('>I4',s)end
local function setup(outcome,install)
 local b=require('tests.lua_engine').new()
 local S=require('aitower.core.runtime').create(b)
 for _,name in ipairs(require 'aitower.modules')do require(name)(S)end
 S.YDHT=S.InitHashtable();S.YDLOC=S.InitHashtable()
 S.HopeModern_Data=S.InitHashtable()
 b.eventTrigger=S.CreateTrigger()
 S.udg_Youxi_xzgq=S.CreateUnit(S.Player(15),id('n00L'),0,0,0)
 S.udg_boci=2;S.udg_quanshu=1;S.udg_WJZ={};S.udg_Guaiwu_dwz=S.CreateGroup()
 S.udg_zouguo_luxian=S.CreateGroup();S.udg_Youxi1_jishiqi=S.CreateTimer()
 local adjacent=S.CreateGroup()
 b.nextNode=S.CreateUnit(S.Player(15),id('n00I'),100,0,0)
 b.otherNode=S.CreateUnit(S.Player(15),id('n00I'),300,0,0)
 S.GroupAddUnit(adjacent,b.nextNode)
 S.SaveGroupHandle(S.YDHT,S.GetHandleId(S.udg_Youxi_xzgq),-1242853960,adjacent)
 for _,u in ipairs({b.nextNode,b.otherNode})do S.SaveInteger(S.YDHT,S.GetHandleId(u),0x66256FC7,2)end
 S.gg_unit_n00P_0024=S.CreateUnit(S.Player(15),id('n00P'),0,0,0)
 S.gg_unit_n00Q_0028=S.CreateUnit(S.Player(15),id('n00Q'),0,0,0)
 for i=1,6 do
  S.udg_hero[i]=S.CreateUnit(S.Player(i-1),id('H000'),0,0,0)
  S.udg_Bei_bao_danwei[i]=S.CreateUnit(S.Player(i-1),id('hfoo'),0,0,0)
  S.udg_Hero_dian[i]=S.Location(100*i,500)
  S.udg_Guaiwu_dian[i]=S.Location(100*i,900)
  S.udg_xingdong_dianSx[i]=4;S.udg_DEX[i]=3
 end
 for i=1,3 do S.udg_Shangdian_dian[i]=S.Location(-3000,i*1000);S.udg_dtzhongxindian[i]=S.Location(0,600)end
 S.udg_boci_gw_lx[0]=id('nshe');S.udg_boci_gw_lx[1]=id('nvil')
 S.ForForce=function(_,fn)for i=0,1 do b.enumPlayer=S.Player(i);fn()end end
 S.GetEnumPlayer=function()return b.enumPlayer end
 S.SetUnitPosition=function(u,x,y)u.x=x;u.y=y end
 S.SetUnitPositionLoc=function(u,loc)assert(u and loc,'missing hero/destination');u.x=loc.x;u.y=loc.y end
 S.SetUnitMoveSpeed=function(u,v)u.speed=v end
 S.PauseUnit=function(u,v)u.paused=v end
 S.AddHeroXP=function(u,n)u.xp=(u.xp or 0)+n end
 S.GetRandomInt=function(a,z)if a==1 and z==6 then return outcome end;return a end
 S.IsPlayerInForce=function(p)return p.id<2 end
 S.HopeRoute_Assigning=false;S.HopeRoute_ChosenLeader=0
 S.PanCameraToTimed=function(x,y)b.camera={x=x,y=y}end
 -- Nested battle/mini workers are counted in the branch checks below; the
 -- complete trigger chain is exercised separately after them.
 S.gg_trg________________________________028=S.CreateTrigger()
 S.gg_trg_________________011=S.CreateTrigger()
 S.gg_trg_X________________030=S.CreateTrigger()
 S.gg_trg_L____________0012=S.CreateTrigger();S.DisableTrigger(S.gg_trg_L____________0012)
 S.ConditionalTriggerExecute=function(t)
  if t==S.gg_trg________________________________028 then S.udg_ZhandouZhong=true
  elseif t==S.gg_trg_X________________030 then b.miniStarts=(b.miniStarts or 0)+1
  elseif t==S.gg_trg_________________011 then b.routeReturns=(b.routeReturns or 0)+1
  end
 end
 if install~=false then require('aitower.game.rooms').install(S)end
 return S,b
end
local function reachable(S,b)return S.LoadBoolean(S.YDHT,S.GetHandleId(b.nextNode),-1021606187)end
local results={}
local function pass(text)results[#results+1]=text;print('PASS '..text)end
for outcome=1,4 do
 local S,b=setup(outcome,false)
 b.run(S.Trig______________011Actions);b.step(.5)
 assert(not reachable(S,b)and not S.udg_ZhandouZhong)
 S.HopeRoute_Select(S.Player(0),b.nextNode);assert(not S.HopeRoute_Valid())
end
pass('Baseline: all four non-combat random outcomes leave next nodes locked until the distant exit region is entered')
for outcome=1,6 do
 local S,b=setup(outcome)
 b.run(S.Trig______________011Actions)
 assert(not reachable(S,b),'transition exposed routes before resolving')
 b.run(S.Trig______________011Actions);b.step(.5)
 if outcome<=4 then
  assert(reachable(S,b),'service room remained locked')
  assert(not S.LoadBoolean(S.YDHT,S.GetHandleId(b.otherNode),-1021606187),'non-adjacent route unlocked')
  assert(S.HopeRoom_Hint(S.Player(0)):find('规划路线'))
  local position=outcome==4 and 2 or outcome
  assert(S.udg_hero[1].x==-3000 and S.udg_hero[1].y==position*1000)
  assert(S.HopeMarket_InRoom==(outcome==1),'shop permission escaped actual room')
  S.HopeRoute_Select(S.Player(0),b.nextNode)
  assert(S.HopeRoute_Valid()and S.HopeRoute_Ready[0]and not S.HopeRoute_AllReady())
  assert(not S.HopeRoute_Depart(S.Player(0)),'team readiness bypassed')
  S.HopeRoute_SetReady(S.Player(1),true);assert(S.HopeRoute_AllReady())
  local xp=S.udg_hero[1].xp;b.run(S.Trig______________011Actions)
  assert(S.udg_hero[1].xp==xp,'duplicate entry grants XP')
  S.udg_boci=3;assert(S.HopeRoom_Hint(S.Player(0))=='','old room hint leaked')
 else
  assert(not reachable(S,b),'unresolved combat/minigame can be skipped')
  assert(S.HopeRoom_Hint(S.Player(0))=='')
  if outcome==5 then assert(b.miniStarts==1)else assert(S.udg_ZhandouZhong and #S.udg_Guaiwu_dwz.units==3)end
 end
 pass('Random outcome '..outcome..': entry, route access, room hint and duplicate protection')
end
for outcome=1,6 do
 local S,b=setup(outcome)
 local contexts=setmetatable({},{__mode='k'})
 S.GetTriggeringTrigger=function()return contexts[coroutine.running()]or b.eventTrigger end
 S.TriggerExecute=function(t)
  for _,action in ipairs(t.actions)do b.run(function()contexts[coroutine.running()]=t;action()end)end
 end
 S.ConditionalTriggerExecute=function(t)if S.IsTriggerEnabled(t)and S.TriggerEvaluate(t)then S.TriggerExecute(t)end end
 S.IsTriggerEnabled=function(t)return t.enabled end
 require('aitower.game.minigames').install(S)
 S.InitTrig______________011();S.InitTrig_X________________030();S.InitTrig________________________________028()
 S.gg_rct______________000=S.Rect(-1000,-1000,1000,1000)
 -- Force the coin mini-game and count workers; its real hazards are exercised
 -- in Warcraft, not by this test engine.
 S.Trig_X________________030Func002Func002Func017T=function()end
 S.Trig_X________________030Func002Func002Func018T=function()end
 local draws=0;local random=S.GetRandomInt
 S.GetRandomInt=function(a,z)if a==1 and z==2 then draws=draws+1;return draws%2==1 and 2 or 1 end;return random(a,z)end
 S.SaveInteger(S.YDHT,S.GetHandleId(S.udg_Youxi_xzgq),0x66256FC7,1)
 S.SaveBoolean(S.YDHT,S.GetHandleId(S.udg_Youxi_xzgq),-1021606187,true)
 local target=S.udg_Youxi_xzgq
 S.udg_boci=1;S.udg_Youxi_xzgq=S.CreateUnit(S.Player(15),id('n00I'),0,0,0)
 S.HopeRoute_Select(S.Player(0),target);S.HopeRoute_SetReady(S.Player(1),true)
 assert(S.HopeRoute_Depart(S.Player(0)))
 b.step(1)
 assert(S.__roomLifecycle.completed,'room entry never completed')
 assert(S.udg_Youxi_xzgq==target and S.udg_boci==2)
 local actor=outcome==5 and S.HopeMini_Actor[1]or S.udg_hero[1]
 assert(actor and b.camera and b.camera.x==actor.x and b.camera.y==actor.y,'entry focus failed')
 b.camera={x=99999,y=99999};S.HopeQoL_SelectHero()
 assert(b.camera.x==actor.x and b.camera.y==actor.y,'F3 did not find current actor')
 pass('Full departure to random outcome '..outcome..': real dispatch, player scaling, transport and F3 focus')
end
do
 local S,b=setup(1,false)
 local t=S.CreateTimer();S.TimerStart(t,2,false,S.Trig__________________________0002Func019Func008Func009T)
 S.udg_boci=3;b.step(2)
 assert(b.routeReturns==1,'baseline late victory callback no longer reproduced')
 local fixed,c=setup(1)
 local old=fixed.CreateTimer();fixed.TimerStart(old,2,false,fixed.Trig__________________________0002Func019Func008Func009T)
 fixed.udg_boci=3;c.step(2);assert(c.routeReturns==nil,'old victory stole new room camera')
 local current=fixed.CreateTimer();fixed.TimerStart(current,2,false,fixed.Trig__________________________0002Func019Func008Func009T)
 c.step(4);assert(c.routeReturns==1 and not current.active)
 pass('Previous battle delayed return is discarded after departure; current battle return still fires once')
end
do
 local S,b=setup(1,false)
 local calls=0
 S.Trig______________011Actions=function()calls=calls+1;error('simulated transport failure')end
 require('aitower.game.rooms').install(S)
 b.run(S.Trig______________011Actions);b.run(S.Trig______________011Actions)
 assert(calls==1 and #b.errors==1 and S.__roomLifecycle.failure:find('simulated transport failure'))
 assert(not reachable(S,b)and S.HopeRoom_Hint(S.Player(0)):find('异常'))
 local output
 S.DisplayTimedTextToPlayer=function(_,_,_,_,text)output=text end
 b.run(S.__roomLifecycle.diagnostic.actions[1])
 assert(output and output:find('simulated transport failure')and output:find('英雄'))
 pass('Interrupted room reports its failure, keeps the encounter locked and does not replay partial rewards')
end
do
 local S,b=setup(1)
 require('aitower.game.minigames').install(S)
 local stale=S.CreateUnit(S.Player(0),id('h00A'),0,0,0);S.RemoveUnit(stale)
 S.HopeMini_Actor[1]=stale;S.udg_hero[1].x=123;S.udg_hero[1].y=456
 S.HopeQoL_SelectHero()
 assert(b.camera.x==123 and b.camera.y==456 and S.HopeMini_Actor[1]==stale)
 pass('F3 ignores a removed mini actor and focuses the hero without local mutation of shared state')
end
local f=assert(io.open('audit/lua-random-rooms.txt','wb'))
f:write(table.concat(results,'\n'),'\nEngine model only; no Warcraft/KK runtime validation.\n');f:close()

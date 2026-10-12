-- Execute all four real spawn/hazard callbacks through their complete game
-- clocks. Native waits are forbidden: timers must drive start AND return.
package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local function id(s)return string.unpack('>I4',s)end
local games={
 {name='archery',roll={1,1},kind='h009',prepare=5,duration=45},
 {name='mowing',roll={1,2},kind='h00G',prepare=4,duration=90},
 {name='coins',roll={2,1},kind='h00A',prepare=5,duration=45},
 {name='skating',roll={2,2},kind='h00C',prepare=5,duration=60},
}
local function setup(game,install)
 local b=require('tests.lua_engine').new();local S=require('aitower.core.runtime').create(b)
 for _,name in ipairs(require 'aitower.modules')do require(name)(S)end
 S.YDHT=S.InitHashtable();S.YDLOC=S.InitHashtable();b.eventTrigger=S.CreateTrigger()
 S.jasshelper__initstructs885894093()
 S.CreateRegions();S.Trig____________________031Actions()
 S.YDWETimerPattern__Init();S.YDWETimerSystem__Init()
 S.udg_Youxi_xzgq=S.CreateUnit(S.Player(15),id('n00O'),0,0,0);S.udg_boci=1;S.udg_quanshu=1
 S.udg_Youxi1_jishiqi=S.CreateTimer();S.udg_WJZ={};b.members=4;b.items={};b.dialogs={};b.pan={}
 S.ForForce=function(_,fn)local old=b.enumPlayer;for i=0,b.members-1 do b.enumPlayer=S.Player(i);fn()end;b.enumPlayer=old end
 S.GetEnumPlayer=function()return b.enumPlayer end
 S.AddHeroXP=function(u,n)u.xp=(u.xp or 0)+n end
 S.SetUnitPosition=function(u,x,y)u.x=x;u.y=y end
 S.SetUnitPositionLoc=function(u,l)assert(l);u.x=l.x;u.y=l.y end
 S.GetUnitLoc=function(u)return S.Location(u.x,u.y)end
 S.GetTerrainType=function()return id('Nice')end
 S.KillUnit=function(u)u.states[0]=0;u.dead=true end
 S.RemoveItem=function(it)if it then it.removed=true end end
 local createItem=S.CreateItem
 S.CreateItem=function(...)local it=createItem(...);b.items[#b.items+1]=it;return it end
 S.PanCameraToTimed=function(x,y)b.pan={x=x,y=y}end
 S.CreateTimerDialog=function(timer)local d={id=90000+#b.dialogs,timer=timer};b.dialogs[#b.dialogs+1]=d;return d end
 S.TimerDialogDisplay=function(d,show)d.shown=show end
 S.DestroyTimerDialog=function(d)assert(not d.destroyed,'timer dialog destroyed twice');d.destroyed=true;d.shown=false end
 S.DisplayTextToForce=function(_,text)b.message=text end
 S.GroupEnumUnitsInRange=function(g,x,y,r,filter)
  g.units={};for _,u in ipairs(b.units)do if not u.removed and (u.x-x)^2+(u.y-y)^2<=r*r then
   b.filterUnit=u;if not filter or filter()then g.units[#g.units+1]=u end
  end end
 end
 local draws=0
 S.GetRandomInt=function(a,z)
  if draws<2 and a==1 and z==2 then draws=draws+1;return game.roll[draws]end
  return a
 end
 S.gg_trg_________________011=S.CreateTrigger();S.gg_trg____________________037=S.CreateTrigger()
 S.ConditionalTriggerExecute=function(t)
  if t==S.gg_trg____________________037 then S.Trig____________________037Actions()
  elseif t==S.gg_trg_________________011 then b.returns=(b.returns or 0)+1 end
 end
 for i=1,6 do
  S.udg_hero[i]=S.CreateUnit(S.Player(i-1),id('H000'),-1400,740,0)
  S.udg_Bei_bao_danwei[i]=S.CreateUnit(S.Player(i-1),id('hfoo'),0,0,0)
 end
 if install~=false then require('aitower.game.minigames').install(S)end
 return S,b
end
local results={}
local function pass(text)results[#results+1]=text;print('PASS '..text)end
local function advance(b,until_)while b.now<until_ do b.step(math.min(until_,b.now+1))end end
do
 -- Reproduce the screenshot's partial start when the native wait never
 -- resumes. This is a fault model, not a claim about the engine internals.
 local S,b=setup(games[1],false)
 S.TriggerSleepAction=function()coroutine.yield(1000000)end
 b.run(S.Trig_X________________030Actions);advance(b,10)
 assert(S.HopeMini_Actor[1]and #b.dialogs==0 and not S.udg_Youxi1_jishiqi.active)
 pass('Suspended legacy entry reproduces actor present with no game timer')
end
for _,game in ipairs(games)do
 local S,b=setup(game)
 S.TriggerSleepAction=function()error('mini lifecycle still depends on native sleep')end
 assert(S.Trig_X________________030Actions())
 assert(not S.Trig_X________________030Actions(),'repeat entry')
 for i=1,4 do assert(S.GetUnitTypeId(S.HopeMini_Actor[i])==id(game.kind)and S.udg_hero[i].xp==300)end
 assert(S.HopeMini_Status():find(game.prepare..'秒后开始'))
 advance(b,game.prepare-1);assert(#b.dialogs==0 and S.__miniLifecycle.phase=='preparing')
 advance(b,game.prepare);assert(S.__miniLifecycle.phase=='active'and #b.dialogs==1 and b.dialogs[1].shown)
 local expectedWorkers,stoppedWorkers={},{}
 local finish=S.Trig____________________034Actions
 S.Trig____________________034Actions=function()
  if not S.__miniLifecycle.finishing then
   for _,t in ipairs(S.__miniLifecycle.workerOrder)do
    if S.__miniLifecycle.workers[t]then expectedWorkers[#expectedWorkers+1]=t end
   end
  end
  return finish()
 end
 local destroy=S.DestroyTimer
 S.DestroyTimer=function(t)
  if S.__miniLifecycle.finishing and S.__miniLifecycle.workers[t]then stoppedWorkers[#stoppedWorkers+1]=t end
  destroy(t)
 end
 assert(S.TimerGetRemaining(S.udg_Youxi1_jishiqi)==game.duration)
 local created=#b.units
 advance(b,game.prepare+4)
 assert(S.TimerGetRemaining(S.udg_Youxi1_jishiqi)==game.duration-4)
 if game.name=='archery'then assert(#b.units>created,'no archery targets')
 elseif game.name=='mowing'then assert(#b.units>created,'no mowing enemies')
 elseif game.name=='coins'then assert(#b.items>0 and #b.units>created,'no coins/hazards')
 else
  local obstacles=0;for _,u in ipairs(b.units)do if u.type==id('n01B')then obstacles=obstacles+1 end end
  assert(obstacles==20,'skating course missing')
 end
 assert(#b.errors==0,table.concat(b.errors,'\n'))
 advance(b,game.prepare+game.duration)
 assert(S.__miniLifecycle.phase=='finishing'and b.dialogs[1].destroyed,'deadline failed')
 assert(#stoppedWorkers==#expectedWorkers,'worker cleanup count')
 for n,t in ipairs(expectedWorkers)do assert(stoppedWorkers[n]==t,'pointer hash order changed native timer destruction order')end
 assert(S.HopeMini_IsRunning(),'released route before cleanup')
 S.Trig____________________034Actions() -- a second native expiry event is harmless
 advance(b,game.prepare+game.duration+3)
 assert(not S.HopeMini_IsRunning()and b.returns==1 and next(S.__miniLifecycle.workers)==nil)
 for i=1,6 do assert(S.HopeMini_Actor[i]==nil and not S.udg_hero[i].removed and not S.udg_Bei_bao_danwei[i].removed)end
 assert(#b.errors==0,table.concat(b.errors,'\n'))
 assert(not S.Trig_X________________030Actions(),'stale room replay')
 pass(game.name..': countdown, actual spawns, duration, native double expiry, all actors cleanup and one route return')
end
do
 local S,b=setup(games[1])
 local spawn=S.Trig_X________________030Func002Func001Func016T
 S.Trig_X________________030Func002Func001Func016T=function()error('injected archery spawn error')end
 assert(S.Trig_X________________030Actions());advance(b,6)
 assert(S.__miniLifecycle.phase=='finishing'and S.__miniLifecycle.failure:find('injected archery spawn error'))
 assert(S.HopeMini_Diagnostic():find('injected archery spawn error'))
 advance(b,9);assert(not S.HopeMini_IsRunning()and b.returns==1)
 S.Trig_X________________030Func002Func001Func016T=spawn
 S.udg_boci=2
 assert(S.Trig_X________________030Actions());advance(b,15)
 assert(S.__miniLifecycle.phase=='active'and S.__miniLifecycle.failure==nil and #b.dialogs==2)
 for i=1,4 do assert(S.udg_hero[i].xp==600)end
 pass('Spawn failure reports phase, cleans up once and permits a fresh later room without stale failure or duplicate XP')
end
local f=assert(io.open('audit/lua-minigames.txt','wb'));f:write(table.concat(results,'\n'),'\nEngine model only; not Warcraft/KK runtime validation.\n');f:close()

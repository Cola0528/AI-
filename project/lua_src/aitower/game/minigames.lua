-- One synchronized lifecycle for all four legacy mini-games. The original
-- random selection, rewards, countdowns and hazard callbacks still run once.
local M={}
function M.install(S)
 if S.__miniLifecycle then return end
 local state={running=false,finishing=false,phase='idle',serial=0,workers={},workerOrder={}}
 S.__miniLifecycle=state
 local destroyTimer=S.DestroyTimer
 S.DestroyTimer=function(t)
  if t then state.workers[t]=nil end
  destroyTimer(t)
 end
 local kinds={}
 for _,code in ipairs({'h009','h00A','h00C','h00G'})do kinds[string.unpack('>I4',code)]=true end
 local detach=S.HopeMini_Detach
 local function clean(p,focus)
  local i=S.GetPlayerId(p)+1
  local actor=S.HopeMini_Actor[i]
  local group=S.CreateGroup()
  S.GroupEnumUnitsOfPlayer(group,p,nil)
  while true do
   local u=S.FirstOfGroup(group);if not u then break end
   S.GroupRemoveUnit(group,u)
   if kinds[S.GetUnitTypeId(u)] and u~=S.udg_hero[i] and u~=S.udg_Bei_bao_danwei[i]then S.RemoveUnit(u)end
  end
  S.DestroyGroup(group)
  if focus and actor then detach(p)else S.HopeMini_Actor[i]=nil end
 end
 S.HopeMini_IsRunning=function()return state.running end
 -- A removed mini actor must not swallow F3 and leave the camera unmoved.
 -- Only focus/selection is local here; never clear synchronized unit handles
 -- from a local key callback.
 S.HopeQoL_SelectHero=function()
  local p=S.GetLocalPlayer();local i=S.GetPlayerId(p)+1
  if i<1 or i>6 then return end
  local actor=S.HopeMini_Actor[i]
  if actor and S.GetUnitTypeId(actor)~=0 then S.HopeMini_Focus(p);return end
  local hero=S.udg_hero[i]
  if hero and S.GetUnitTypeId(hero)~=0 then
   S.HopeCamera_FocusUnit(p,hero,S.LoadBoolean(S.YDHT,S.GetHandleId(hero),0x799151CA))
  else S.DisplayTimedTextToPlayer(p,0,0,8,'暂时没有可聚焦的角色；输入 -room 查看关卡状态。')end
 end
 local attach=S.HopeMini_Attach
 S.HopeMini_Attach=function(p,u)
  local i=S.GetPlayerId(p)+1
  local previous=S.HopeMini_Actor[i]
  if previous==u then return end
  if previous and kinds[S.GetUnitTypeId(previous)]and previous~=S.udg_hero[i]and previous~=S.udg_Bei_bao_danwei[i]then S.RemoveUnit(previous)end
  attach(p,u)
 end
 local games={
  {name='射箭',tip='射中目标，获得对应奖励。',prepare=5,duration=45,create='Trig_X________________030Func002Func001Func008A',workers={{.5,'Trig_X________________030Func002Func001Func016T'}}},
  {name='割草',tip='击败不断出现的敌人。',prepare=4,duration=90,create='Trig_X________________030Func002Func001Func002A',workers={{.75,'Trig_X________________030Func002Func001Func007T'}}},
  {name='躲烈焰捡金币',tip='躲开烈焰风暴，活下来并收集金币。',prepare=5,duration=45,create='Trig_X________________030Func002Func002Func009A',workers={{1,'Trig_X________________030Func002Func002Func017T'},{3,'Trig_X________________030Func002Func002Func018T'}}},
  {name='溜冰',tip='在时限内滑到终点，获得奖励。',prepare=5,duration=60,create='Trig_X________________030Func002Func002Func002A',workers={}},
 }
 local function remaining(t)return t and math.max(0,math.ceil(S.TimerGetRemaining(t)))or 0 end
 S.HopeMini_Status=function()
  if not state.running then return ''end
  local name=state.game and state.game.name or '小游戏'
  if state.phase=='preparing'then return name..' · '..remaining(state.prepareTimer)..'秒后开始'end
  if state.phase=='active'then return name..' · 剩余'..remaining(S.udg_Youxi1_jishiqi)..'秒'end
  return state.failure and '小游戏异常 · 正在返回'or name..' · 正在结束'
 end
 S.HopeMini_Diagnostic=function()
  return '小游戏阶段：'..state.phase..' / '..(state.game and state.game.name or '未选择')..'\n'..S.HopeMini_Status()..'\n'..(state.failure or '')
 end
 local function once(delay,callback)
  local t=S.CreateTimer();local serial=state.serial
  S.TimerStart(t,delay,false,function()
   S.DestroyTimer(t)
   if state.serial==serial and state.running then callback()end
  end)
  return t
 end
 local function report(err)
  state.failure=tostring(err)
  S.__report('小游戏 '..(state.game and state.game.name or '')..' / '..state.phase..'：'..state.failure)
 end
 local function finishTransition()
  for i=0,5 do clean(S.Player(i),true)end
  S.ForGroupBJ(S.YDWEGetUnitsOfPlayerAndTypeIdNull(S.Player(10),string.unpack('>I4','n01B')),S.Trig____________________034Func006A)
  state.running=false;state.finishing=false;state.phase='idle'
  S.ConditionalTriggerExecute(S.gg_trg_________________011)
 end
 S.Trig____________________034Actions=function()
  if not state.running or state.finishing then return end
  state.finishing=true;state.phase='finishing'
  if state.prepareTimer then S.DestroyTimer(state.prepareTimer);state.prepareTimer=nil end
  S.PauseTimer(S.udg_Youxi1_jishiqi)
  if S.udg_Youxi1_jishiqi_ck then S.DestroyTimerDialog(S.udg_Youxi1_jishiqi_ck);S.udg_Youxi1_jishiqi_ck=nil end
  -- Native destruction order must not depend on pointer-keyed Lua hash order.
  for _,t in ipairs(state.workerOrder)do
   if state.workers[t]then S.PauseTimer(t);S.FlushChildHashtable(S.YDLOC,S.GetHandleId(t));S.DestroyTimer(t)end
  end
  state.workers={};state.workerOrder={}
  -- The old mowing spawn callback also did this on its last tick. The
  -- independent deadline now owns cleanup so timer ordering cannot skip it.
  if state.game==games[2]then
   S.ForGroupBJ(S.YDWEGetUnitsOfPlayerMatchingNull(S.Player(S.PLAYER_NEUTRAL_AGGRESSIVE),S.Condition(S.Trig_X________________030Func002Func001Func007Func002Func001001002)),S.Trig_X________________030Func002Func001Func007Func002Func001A)
  end
  S.DisplayTextToForce(S.udg_WJZ,state.failure and '小游戏运行异常，本次停止；保留已获得的奖励，3秒后返回路线。'or '小游戏时间到，3秒后返回路线。')
  state.finishTimer=once(3,function()
   local ok,err=xpcall(finishTransition,debug.traceback)
   if not ok then report(err)end
  end)
 end
 local function activate()
  if state.phase~='preparing'then return end
  state.prepareTimer=nil;state.phase='active'
  local game=state.game;local serial=state.serial
  -- One native timer callback owns the deadline. Keep the original handle
  -- for timer dialogs, but do not also register a second timer-expire trigger.
  S.TimerStart(S.udg_Youxi1_jishiqi,game.duration,false,function()
   if state.serial==serial and state.phase=='active'then S.Trig____________________034Actions()end
  end)
  S.CreateTimerDialogBJ(S.udg_Youxi1_jishiqi,game.name..' · 剩余时间')
  S.udg_Youxi1_jishiqi_ck=S.GetLastCreatedTimerDialogBJ()
  for _,spec in ipairs(game.workers)do
   local t=S.CreateTimer();state.workers[t]=true;state.workerOrder[#state.workerOrder+1]=t
   S.FlushChildHashtable(S.YDLOC,S.GetHandleId(t)) -- each game starts at tick zero
   S.TimerStart(t,spec[1],true,function()
    if state.serial~=serial or state.phase~='active'then return end
    local ok,err=xpcall(S[spec[2]],debug.traceback)
    if not ok then report(err);S.Trig____________________034Actions()end
   end)
  end
  S.DisplayTextToForce(S.udg_WJZ,game.name..'开始！')
 end
 S.Trig_X________________030Actions=function()
  if state.running then return false end
  local node=S.udg_Youxi_xzgq
  if node and state.node==node and state.depth==S.udg_boci and state.chapter==S.udg_quanshu then return false end
  state.running=true;state.finishing=false;state.phase='preparing';state.failure=nil
  state.serial=state.serial+1;state.workers={};state.workerOrder={};state.game=nil
  state.node=node;state.depth=S.udg_boci;state.chapter=S.udg_quanshu
  S.HopeRoute_PickerOpen=false
  local ok,err=xpcall(function()
   for i=0,5 do clean(S.Player(i),false)end
   S.ForForce(S.udg_WJZ,S.Trig_X________________030Func001A)
   local first=S.GetRandomInt(1,2);local second=S.GetRandomInt(1,2)
   state.game=games[(first-1)*2+second]
   if state.game==games[4]then S.ConditionalTriggerExecute(S.gg_trg____________________037)end
   S.ForForce(S.udg_WJZ,S[state.game.create])
   S.DisplayTextToForce(S.udg_WJZ,state.game.name..' · '..state.game.prepare..'秒后开始。\n'..state.game.tip..'操作见右下技能栏。')
   state.prepareTimer=once(state.game.prepare,function()
    local started,failure=xpcall(activate,debug.traceback)
    if not started then report(failure);S.Trig____________________034Actions()end
   end)
  end,debug.traceback)
  if not ok then report(err);S.Trig____________________034Actions();return false end
  return true
 end
 -- The old cleanup removed FirstOfGroup only, leaving duplicates behind.
 S.Trig____________________034Func004A=function()clean(S.GetEnumPlayer(),true)end
 S.InitTrig____________________034=function()
  S.gg_trg____________________034=S.CreateTrigger()
  S.TriggerAddAction(S.gg_trg____________________034,S.Trig____________________034Actions)
 end
 for _,name in ipairs({'HopeRoute_Select','HopeRoute_Depart','HopeRoute_SetReady','HopeRoute_TogglePicker'})do
  local action=S[name]
  S[name]=function(...)
   if state.running then return false end
   return action(...)
  end
 end
end
return M

-- Room-scoped event records and idempotent room dispatch. No rewards are
-- recomputed here; the original room trigger remains the sole rules source.
local M={}
function M.install(S)
 if S.__roomLifecycle then return end
 local state={event=false}
 S.__roomLifecycle=state
 local function same(token)
  return token and token.node==S.udg_Youxi_xzgq and token.depth==S.udg_boci and token.chapter==S.udg_quanshu
 end
 local function token()return {node=S.udg_Youxi_xzgq,depth=S.udg_boci,chapter=S.udg_quanshu}end
 -- A victory schedules a two-second route-camera callback. If the party has
 -- already departed, that old callback must not publish the new room's exits
 -- or pull its camera back to the route map.
 local startTimer=S.TimerStart
 local victoryReturn=S.Trig__________________________0002Func019Func008Func009T
 S.TimerStart=function(t,duration,repeating,callback)
  if callback==victoryReturn then
   local origin=token()
   startTimer(t,duration,repeating,function()
    if same(origin)then callback()end
    S.DestroyTimer(t)
   end)
  else startTimer(t,duration,repeating,callback)end
 end
 -- Service rooms used to unlock the next nodes only after a hero walked into
 -- an unlabelled exit rectangle, far from the arrival point. The route UI can
 -- open without that event but then contains no selectable destinations.
 -- Publish only the original adjacent nodes once entry has completed. Do not
 -- move the camera, advance depth, award anything, or bypass team readiness.
 local function publishRoutes()
  local adjacent=S.LoadGroupHandle(S.YDHT,S.GetHandleId(S.udg_Youxi_xzgq),-1242853960)
  if not adjacent then return end
  local group=S.CreateGroup()
  S.GroupEnumUnitsOfPlayer(group,S.Player(S.PLAYER_NEUTRAL_PASSIVE),nil)
  while true do
   local node=S.FirstOfGroup(group);if not node then break end
   S.GroupRemoveUnit(group,node)
   local h=S.GetHandleId(node)
   if S.LoadInteger(S.YDHT,h,0x66256FC7)==S.udg_boci then
    local reachable=S.IsUnitInGroup(node,adjacent)
    S.SaveBoolean(S.YDHT,h,-1021606187,reachable)
    if reachable then S.SetUnitVertexColorBJ(node,100.,100.,0.,30.)end
   end
  end
  S.DestroyGroup(group)
 end
 local services={
  shop='商店|n可购买装备和技能。',
  fate='随机命运|n点击命运商人领取「随机命运」。',
  fountain='泉水|n入场生命与魔法恢复已结算。',
 }
 S.HopeRoom_Hint=function(p)
  if same(state.entered)and state.failure then return '关卡载入异常|n输入 -room 查看原因。|n请保留报错截图。'end
  if same(state.entered)and not state.completed then return '正在进入关卡…'end
  if not same(state.entered)or not state.completed or not services[state.service]then return ''end
  local text=services[state.service]
  if state.service=='fate'and S.LoadBoolean(S.YDHT,S.GetHandleId(p),0x1551575)then text='随机命运|n本次事件已结算，可查看事件记录。'end
  return text..'|n整理后点击「规划路线」。'
 end
 -- Observe the branch selected by the original trigger, without drawing a
 -- second random number or changing the original six-outcome probabilities.
 for name,kind in pairs({
  Trig______________011Func004Func001A='shop',
  Trig______________011Func005Func001A='fountain',
  Trig______________011Func007Func002Func001Func002A='fate',
  Trig______________011Func007Func002Func002A='randomService',
 })do
  local action=S[name]
  S[name]=function()
   if kind=='randomService'then
    local h=S.GetHandleId(S.GetTriggeringTrigger())
    local step=S.LoadInteger(S.YDLOC,h,-320330265)
    state.service=({[1]='shop',[2]='fate',[3]='fountain'})[S.LoadInteger(S.YDLOC,h*step,-1912979307)]
   else state.service=kind end
   action()
  end
 end
 local function reset()
  for n=0,511 do S.HopeEvent_Line[n]=''end
  S.HopeEvent_Count=0;S.HopeEvent_Start=0;S.HopeEvent_Offset=0
  S.HopeEvent_Open=false;S.HopeEvent_Seen=S.HopeEvent_Sequence
  state.event=false
  S.HopeLayout_Show(S.HopeEvent_Button,false);S.HopeLayout_Show(S.HopeEvent_Panel,false)
  if S.HopeEvent_Body~=0 then S.DzFrameSetText(S.HopeEvent_Body,'')end
  if S.HopeEvent_Status~=0 then S.DzFrameSetText(S.HopeEvent_Status,'')end
 end
 local enter=S.Trig______________011Actions
 S.Trig______________011Actions=function()
  if same(state.entered)then return false end
  state.entered=token() -- consume before the legacy half-second transition wait
  state.completed=false;state.service=nil;state.failure=nil
  local ok,err=xpcall(function()reset();enter()end,debug.traceback)
  if not ok then
   state.failure=tostring(err)
   S.__report('关卡载入中断：'..state.failure)
   return false -- never replay partially granted rewards or silently skip a room
  end
  state.completed=true
  if services[state.service]and not S.udg_ZhandouZhong then publishRoutes()end
  return true
 end
 -- Diagnostics report the stopped stage; they never grant rewards, reroll or
 -- unlock a failed encounter. Visible in-game even when no external log exists.
 local diag=S.CreateTrigger()
 for i=0,5 do S.TriggerRegisterPlayerChatEvent(diag,S.Player(i),'-room',true)end
 S.TriggerAddAction(diag,function()
  local p=S.GetTriggerPlayer();local i=S.GetPlayerId(p)+1
  local hero=S.udg_hero[i];local mini=S.HopeMini_Actor[i]
  local function unit(u)
   if not u or S.GetUnitTypeId(u)==0 then return '无有效单位'end
   return S.GetUnitName(u)..' ['..S.I2S(S.GetUnitTypeId(u))..'] '..S.I2S(S.R2I(S.GetUnitX(u)))..','..S.I2S(S.R2I(S.GetUnitY(u)))
  end
  local phase=state.failure and '失败'or same(state.entered)and (state.completed and '已完成入场'or '正在入场')or '尚未入场'
  local text='关卡诊断 · 层 '..S.I2S(S.udg_boci)..' / '..phase..'|n节点：'..unit(S.udg_Youxi_xzgq)..'|n英雄：'..unit(hero)..'|n小游戏：'..unit(mini)..'|n战斗：'..tostring(S.udg_ZhandouZhong)..' / 房间：'..(state.service or '无服务分支')..'|n'..(state.failure or S.HopeRoom_Hint(p))
  if S.HopeMini_Diagnostic then text=text..'|n'..S.HopeMini_Diagnostic()end
  S.DisplayTimedTextToPlayer(p,0,0,30,(text:gsub('|n','\n')))
 end)
 state.diagnostic=diag
 local begin=S.HopeEvent_Begin
 S.HopeEvent_Begin=function()
  if state.event and same(state.eventRoom)then return end -- aggregate teammates
  reset();state.event=true;state.eventRoom=token()
  begin()
 end
 local add=S.HopeEvent_Add
 S.HopeEvent_Add=function(text)
  if state.event and same(state.eventRoom)then add(text)end
 end
 local show=S.HopeEvent_Show
 S.HopeEvent_Show=function()
  if state.event and same(state.eventRoom)and S.HopeEvent_Count>0 then show()end
 end
 local refresh=S.HopeEvent_Refresh
 S.HopeEvent_Refresh=function()
  if state.event and same(state.eventRoom)then refresh()
  else
   S.HopeEvent_Open=false
   S.HopeLayout_Show(S.HopeEvent_Button,false);S.HopeLayout_Show(S.HopeEvent_Panel,false)
  end
 end
end
return M

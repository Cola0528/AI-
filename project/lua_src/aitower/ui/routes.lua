local T=require 'aitower.ui.theme'
local flow=require 'aitower.ui.textflow'
local M={}
function M.install(S,ui)
 S.HopeLayout_Assignment=function()end -- fixed six-slot layout; inactive rows hide in rule refresh
 S.HopeRoute_CreateExtra=function()
  -- Legacy layout initializes these handles before the new tactical HUD mounts.
  local entry=ui.textButton(nil,.014,.196,.134,.023,'规划路线')
  entry.localAction(S.HopeRoute_TogglePicker);S.HopeLayout_Route=entry.id
  local depart=ui.button({id=S.HopeRoute_Panel},.007,-.051,.12,.023,'出发')
  S.HopeRoute_DepartButton=depart.id
  S.DzFrameSetScriptByCode(depart.id,1,S.HopeRoute_DepartClick,true)
  local assign=ui.panel(nil,.235,.503,.330,.256);assign.show(false)
  S.HopeRoute_AssignPanel=assign.id
  ui.label(assign,.018,-.014,.294,.026,T.gold..'谁来带领这次远征？'..T.clear,.014)
  ui.label(assign,.018,-.050,.294,.028,'队长选路后自动准备，队友确认后才出发。',.009)
  for n=1,6 do
   local slot=n
   local b=ui.textButton(assign,.018+((n-1)%2)*.151,-.098-math.floor((n-1)/2)*.045,.143,.036,'')
   S.HopeRoute_AssignButton[n]=b.id
   S.DzFrameSetScriptByCode(b.id,1,function()S.HopeRoute_Assign(S.DzGetTriggerUIEventPlayer(),slot-1)end,true)
  end
  local p=ui.panel(nil,.197,.538,.410,.346);p.show(false);S.HopeRoute_Picker=p.id
  ui.image(p,.247,-.039,.146,.146,'AITower\\journey.tga').alpha(70)
  S.HopeRoute_PickerTitle=ui.label(p,.016,-.014,.312,.027,'',.012).id
  local close=ui.textButton(p,.342,-.012,.053,.025,'收起');close.localAction(S.HopeRoute_TogglePicker)
  local detail=ui.label(p,.017,-.257,.376,.070,'悬停路线查看关卡说明；选路仍由本局队长决定。',.0085)
  for n=1,6 do
   local slot=n
   local row=ui.textButton(p,.016,-.058-(n-1)*.032,.376,.028,'')
   ui.image(row,.002,-.004,.019,.019,T.icons.abyss).alpha(160)
   S.HopeRoute_NodeButton[n]=row.id
   row.hover(function()
    local node=S.HopeRoute_Available[slot]
    if node then detail.text(flow.pages(S.HopeRoute_Description(node),43,5)[1])end
   end)
   S.DzFrameSetScriptByCode(row.id,1,function()S.HopeRoute_ChooseSlot(slot)end,true)
  end
  ui.image(p,.017,-.250,.376,.0007,'AITower\\gold.tga').alpha(120)
 end
end
return M

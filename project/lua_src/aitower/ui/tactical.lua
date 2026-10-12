local theme=require 'aitower.ui.theme'
local M={}
function M.new(S,ui,bus,native)
 local view={}
 view.route=ui.panel(nil,.014,.456,.156,.150)
 view.title=ui.label(view.route,.008,-.008,.140,.018,'',.010)
 view.ready=ui.button(view.route,.008,-.033,.091,.027,'准备出发')
 bus.bind(view.ready.id,'ready')
 view.wait=ui.button(view.route,.008,-.033,.091,.027,'已准备 · 取消')
 S.DzFrameSetScriptByCode(view.wait.id,1,S.HopeRoute_WaitClick,true)
 local details=ui.button(view.route,.104,-.033,.044,.027,'说明');details.localAction(S.HopeRoute_ToggleDetails)
 view.depart=ui.button(view.route,.008,-.066,.140,.027,'全员准备后出发')
 S.DzFrameSetScriptByCode(view.depart.id,1,S.HopeRoute_DepartClick,true)
 view.members=ui.label(view.route,.008,-.102,.140,.040,'',.008)
 view.enemy=ui.panel(nil,.014,.545,.182,.076)
 view.enemyTitle=ui.label(view.enemy,.008,-.006,.166,.017,'',.010)
 view.enemyBody=ui.label(view.enemy,.008,-.028,.166,.038,'',.0085)
 view.routeEntry=ui.button(nil,.014,.196,.134,.023,'规划路线')
 view.routeEntry.localAction(S.HopeRoute_TogglePicker)
 view.relicEntry=ui.button(nil,.084,.248,.064,.021,'本局遗物')
 view.relicEntry.localAction(function()S.HopeRelic_OpenFor(S.GetLocalPlayer())end)
 -- Existing attribute and relic entry callbacks remain in use; their new
 -- positions no longer collide with the unified archive entry.
 function view.refresh()
  local p=S.GetLocalPlayer();local owner=S.GetPlayerId(p)
  local active=owner>=0 and owner<6 and S.udg_hero[owner+1]~=nil
  local mode=S.HopeLayout_Mode()
  S.HopeLayout_Show(S.HopeRoute_Panel,false)
  S.HopeLayout_Show(S.HopeIntent_Panel,false)
  S.HopeLayout_Show(S.HopeLayout_Route,false)
  S.HopeLayout_Show(S.HopeLayout_Relic,false)
  view.relicEntry.show(active and mode==0)
  local mini=S.HopeMini_IsRunning()
  view.routeEntry.show(active and not S.udg_ZhandouZhong and not mini and mode==0)
  local route=active and mode==0 and not mini and S.HopeRoute_Valid()and not S.HopeRoute_RewardPending(owner)
  view.route.show(route)
  if route then
   view.title.text(theme.gold..S.HopeRoute_Title(S.HopeRoute_Node)..theme.clear)
   view.ready.show(not S.HopeRoute_Ready[owner]);view.wait.show(S.HopeRoute_Ready[owner])
   view.depart.show(owner==S.HopeRoute_Leader())
   view.depart.text(S.HopeRoute_AllReady()and theme.green..'全员已齐 · 出发'..theme.clear or '等待队友准备')
   local lines={}
   for i=0,5 do if S.HopeRoute_Active(i)then
    lines[#lines+1]=S.HopeName_Label(S.Player(i),55)..(i==S.HopeRoute_Leader()and '★ 'or ' ')..(S.HopeRoute_RewardPending(i)and '待选奖励' or S.HopeRoute_Ready[i]and theme.green..'已准备'..theme.clear or '未准备')
   end end
   local start=owner==S.HopeRoute_Leader()and -.102 or -.070
   view.members.place(.008,start,.140,#lines*.013+.004)
   view.members.text(table.concat(lines,'|n'))
   view.route.place(.174,.490,.156,-start+#lines*.013+.012)
  end
  local enemy=S.HopeIntent_Selected
  local show=active and mode==0 and S.udg_ZhandouZhong and enemy~=nil and S.IsUnitAliveBJ(enemy)and S.IsUnitVisible(enemy,p)and S.IsUnitSelected(enemy,p)
  -- Detailed inspection lives beside the new enemy roster, not over the left
  -- HUD. Keep this retired frame hidden for legacy-handle compatibility.
  view.enemy.show(false)
  if show then
   view.enemyTitle.text(theme.gold..S.GetUnitName(enemy)..theme.clear)
   local lines={S.HopeIntent_Description(enemy)}
   for _,s in ipairs({S.HopeStatus_PoisonDetails(enemy,p),S.HopeStatus_PoisonPreviewLine(enemy),S.HopeStatus_PoisonLastLine(enemy),S.HopeDebuff_Details(enemy)})do if s~=''then lines[#lines+1]=s end end
   local text=table.concat(lines,'|n')
   local _,breaks=text:gsub('|n','')
   local height=math.min(.24,.052+(breaks+1)*.013)
   view.enemy.place(native.available and .014 or .174,.545,.182,height)
   view.enemyBody.place(.008,-.028,.166,height-.036);view.enemyBody.text(text)
  end
 end
 return view
end
return M

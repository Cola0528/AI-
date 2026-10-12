local T=require 'aitower.ui.theme'
local flow=require 'aitower.ui.textflow'
local M={}
function M.new(S,ui,native)
 local v={page=0,units={},rows={},folded=true,detailPage=0}
 -- Right-side roster, separate from the damage board at the very top. The
 -- battlefield centre stays clear; basic intent never requires a selection.
 v.root=ui.panel(nil,.616,.466,.172,.288)
 v.header=ui.textButton(v.root,.006,-.005,.158,.022,'敌方动向')
 v.header.localAction(function()v.folded=not v.folded end)
 for n=1,4 do
  local slot=n
  local row=ui.textButton(v.root,.006,-.034-(n-1)*.037,.158,.033,'')
  row.name=ui.label(row,.002,0,.154,.012,'',.0075)
  row.intent=ui.label(row,.002,-.013,.154,.018,'',.008)
  row.life=ui.bar(row,.002,-.032,.152,.0015,'AITower\\life.tga')
  row.localAction(function()
   local u=v.units[v.page*4+slot]
   if u and S.IsUnitAliveBJ(u)and S.IsUnitVisible(u,S.GetLocalPlayer())then
    -- Inspect locally without replacing the hero's native command card.
    v.selected=u;v.detailPage=0
   end
  end)
  v.rows[n]=row
 end
 v.previous=ui.textButton(v.root,.006,-.261,.037,.021,'‹')
 v.next=ui.textButton(v.root,.129,-.261,.037,.021,'›')
 v.counter=ui.label(v.root,.047,-.264,.080,.018,'',.008)
 v.previous.localAction(function()v.page=math.max(0,v.page-1)end)
 v.next.localAction(function()v.page=v.page+1 end)
 v.detail=ui.panel(nil,.399,.466,.207,.160);v.detail.show(false)
 v.detailTitle=ui.label(v.detail,.009,-.008,.151,.020,'',.010)
 v.detailText=ui.label(v.detail,.009,-.036,.188,.096,'',.008)
 local close=ui.textButton(v.detail,.166,-.007,.033,.021,'×')
 close.localAction(function()v.selected=nil end)
 v.more=ui.textButton(v.detail,.102,-.134,.096,.021,'下一页')
 v.more.localAction(function()v.detailPage=v.detailPage+1 end)
 function v.refresh()
  local p=S.GetLocalPlayer();local i=S.GetPlayerId(p)+1
  local active=i>=1 and i<=6 and S.udg_hero[i]~=nil and S.udg_ZhandouZhong and S.HopeMini_Actor[i]==nil and S.HopeLayout_Mode()==0
  -- Native tooltips can extend far above the console. Yield this side while
  -- hovering, without altering native callbacks or the player's folded state.
  active=active and not native.tooltipVisible()
  v.root.show(active);v.detail.show(false)
  if not active then return end
  local world=S.HopeIntent_Selected
  if world and S.IsUnitSelected(world,p)then
   if world~=v.lastWorldSelection then v.selected=world;v.detailPage=0 end
   v.lastWorldSelection=world
  else v.lastWorldSelection=nil end
  v.units={}
  for n=1,S.HopeIntent_Count do
   local u=S.HopeIntent_Units[n]
   if u and S.IsUnitAliveBJ(u)and S.IsUnitVisible(u,p)then v.units[#v.units+1]=u end
  end
  table.sort(v.units,function(a,b)return S.GetHandleId(a)<S.GetHandleId(b)end)
  v.page=math.max(0,math.min(v.page,math.ceil(#v.units/4)-1))
  local rows=math.min(4,#v.units)
  v.root.place(.616,.485,.172,(v.folded or rows==0)and .032 or .068+rows*.037)
  v.previous.place(.006,-.039-rows*.037,.037,.021)
  v.next.place(.129,-.039-rows*.037,.037,.021)
  v.counter.place(.047,-.042-rows*.037,.080,.018)
  v.header.text(T.gold..(v.folded and '展开敌方动向' or '敌方动向')..' · '..#v.units..T.clear)
  for n,row in ipairs(v.rows)do
   local u=v.units[v.page*4+n];row.show(not v.folded and u~=nil)
   if u then
    local hp=S.GetUnitState(u,S.UNIT_STATE_LIFE);local maximum=S.GetUnitState(u,S.UNIT_STATE_MAX_LIFE)
    row.name.text(S.GetUnitName(u)..'  '..math.floor(hp)..'/'..math.floor(maximum))
    row.intent.text(S.HopeIntent_Headline(u));row.life.set(hp,maximum)
   end
  end
  local paged=not v.folded and #v.units>4
  v.previous.show(paged);v.next.show(paged);v.counter.show(not v.folded and rows>0)
  v.counter.text(paged and (v.page+1)..' / '..math.ceil(#v.units/4)or '点击查看状态')
  if v.selected and S.IsUnitAliveBJ(v.selected)and S.IsUnitVisible(v.selected,p)then
   v.detail.show(true);v.detailTitle.text(T.gold..S.GetUnitName(v.selected)..T.clear)
   local texts={S.HopeIntent_Description(v.selected)}
   for _,line in ipairs({S.HopeStatus_PoisonDetails(v.selected,p),S.HopeStatus_PoisonPreviewLine(v.selected),S.HopeStatus_PoisonLastLine(v.selected),S.HopeDebuff_Details(v.selected)})do
    if line~=''then texts[#texts+1]=line end
   end
   local pages=flow.pages(table.concat(texts,'|n'),22,7)
   v.detailPage=v.detailPage%#pages;v.detailText.text(pages[v.detailPage+1]);v.more.show(#pages>1)
   v.more.text('下一页 '..(v.detailPage+1)..'/'..#pages)
  end
 end
 return v
end
return M

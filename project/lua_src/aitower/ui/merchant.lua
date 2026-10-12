local T=require 'aitower.ui.theme'
local flow=require 'aitower.ui.textflow'
local M={}
function M.new(S,ui,app)
 local v={open=false,tab=1,selected=nil,rows={}}
 v.panel=ui.panel(nil,.177,.560,.610,.393);v.panel.show(false)
 ui.image(v.panel,.453,-.010,.070,.039,'AITower\\reliquary.tga').alpha(180)
 v.title=ui.label(v.panel,.018,-.014,.410,.028,T.gold..'旅途商会'..T.clear,.017)
 local close=ui.textButton(v.panel,.536,-.013,.055,.026,'收起');close.localAction(function()v.close()end)
 v.tabs={}
 for n,name in ipairs({'能力卷轴','装备货架'})do
  local index=n;v.tabs[n]=ui.textButton(v.panel,.018+(n-1)*.134,-.055,.125,.027,name)
  v.tabs[n].localAction(function()v.choose(index)end)
 end
 local exchange=ui.textButton(v.panel,.298,-.055,.117,.027,'金币 / 木材')
 exchange.localAction(function()v.close();app.open(11)end)
 v.balance=ui.label(v.panel,.421,-.060,.173,.022,'',.0085)
 for n=1,8 do
  local slot=n
  local row=ui.textButton(v.panel,.018,-.097-(n-1)*.031,.247,.028,'')
  row.localAction(function()v.selected=v.ids[slot];v.detailPage=0 end)
  row.icon=ui.image(row,.002,-.002,.024,.024,T.icons.relic)
  row.name=ui.label(row,.034,-.003,.204,.023,'',.0085)
  v.rows[n]=row
 end
 v.itemName=ui.label(v.panel,.291,-.100,.299,.026,'',.012)
 v.cost=ui.label(v.panel,.291,-.134,.299,.020,'',.009)
 v.detail=ui.label(v.panel,.291,-.163,.299,.094,'',.0085)
 v.more=ui.textButton(v.panel,.503,-.243,.090,.020,'翻页')
 v.more.localAction(function()v.detailPage=(v.detailPage or 0)+1 end)
 ui.label(v.panel,.291,-.267,.298,.032,'购买 / 刷新：点击屏幕底部商品图标。|n这里的目录用于比较效果。',.008)
 v.note=ui.label(v.panel,.018,-.357,.244,.027,'点货架查看详情；购买仍受距离、金币和库存限制。',.0078)
 v.entry=ui.button(nil,.014,.286,.134,.023,'进入商会');v.entry.show(false)
 v.entry.localAction(function()v.choose(1)end)
 function v.allowed()
  local i=S.GetPlayerId(S.GetLocalPlayer())
  return i>=0 and i<6 and S.HopeWood_Allowed(S.gg_unit_n00Q_0028,S.udg_hero[i+1])
 end
 function v.choose(tab)
  if not v.allowed()then return end
  app.close();S.HopeLayout_Focus(16);S.HopeMarket_Open=true
  v.open=true;v.tab=tab;v.selected=nil
  local u=tab==1 and S.gg_unit_n00Q_0028 or S.gg_unit_n00P_0024
  S.ClearSelection();S.SelectUnit(u,true)
 end
 function v.close()
  local p=S.GetLocalPlayer()
  local i=S.GetPlayerId(p)+1
  local shop=v.tab==1 and S.gg_unit_n00Q_0028 or S.gg_unit_n00P_0024
  -- Closing a shop must not leave its sell commands in the combat dock.
  -- Preserve an explicit selection of an assistant/other unit by the player.
  if v.open and shop and S.IsUnitSelected(shop,p)then
   local hero=i>=1 and i<=6 and S.udg_hero[i]
   if hero then S.ClearSelection();S.SelectUnit(hero,true)end
  end
  v.open=false
  S.HopeMarket_Open=false
  if app.native.commandContext then app.native.commandContext(nil)end
 end
 function v.refresh()
  local allowed=v.allowed()
  v.entry.show(allowed and S.HopeLayout_Mode()==0 and not v.open)
  local shop=v.tab==1 and S.gg_unit_n00Q_0028 or S.gg_unit_n00P_0024
  if v.open and (not allowed or not S.HopeMarket_Open or S.HopeLayout_Mode()~=16 or not S.IsUnitSelected(shop,S.GetLocalPlayer()))then v.close()end
  v.panel.show(v.open)
  if not v.open then return end
  if app.native.commandContext then app.native.commandContext(v.panel)end
  v.ids=S.__catalog.list(shop)
  local present=false;for _,id in ipairs(v.ids)do if id==v.selected then present=true end end
  if not present then v.selected=v.ids[1]end
  for n,tab in ipairs(v.tabs)do tab.text((n==v.tab and T.gold or T.muted)..(n==1 and '能力卷轴' or '装备货架')..T.clear)end
  local p=S.GetLocalPlayer()
  v.balance.text('金币 '..S.GetPlayerState(p,S.PLAYER_STATE_RESOURCE_GOLD)..' · 木材 '..S.GetPlayerState(p,S.PLAYER_STATE_RESOURCE_LUMBER))
  for n,row in ipairs(v.rows)do
   local id=v.ids[n];row.show(id~=nil)
   if id then local data=S.__catalog.item(id)
    row.icon.texture(data.icon or T.icons.relic)
    row.name.text((id==v.selected and T.gold or T.white)..data.name..T.clear)
   end
  end
  if v.selected then
   local data=S.__catalog.item(v.selected)
   v.itemName.text(T.gold..data.name..T.clear)
   v.cost.text(data.gold and ('金币 '..data.gold..' / 木材 '..(data.wood or 0))or '售价见商品原生提示')
   -- Long effect text stays available through native tooltip, without guessing
   -- stock order or assigning the wrong item to an engine command button.
   local pages=flow.pages(data.description,32,5)
   v.detailPage=(v.detailPage or 0)%#pages;v.detail.text(pages[v.detailPage+1])
   v.more.show(#pages>1);v.more.text('详情 '..(v.detailPage+1)..'/'..#pages)
  else v.itemName.text('本店暂无库存');v.cost.text('');v.detail.text('刷新商品以补充货架。')end
 end
 return v
end
return M

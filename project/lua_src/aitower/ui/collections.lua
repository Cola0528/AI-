-- The current-run relic book is separate from permanent discovery records.
local M={}
function M.install(S,ui)
 S.HopeRelic_CreateUI=function()
  local p=ui.panel(nil,.160,.545,.480,.350);p.show(false);S.HopeRelic_Panel=p.id
  S.HopeRelic_Heading=ui.label(p,.015,-.014,.354,.024,'本局遗物',.013).id
  local close=ui.button(p,.411,-.011,.054,.026,'关闭');close.localAction(S.HopeRelic_Close)
  S.HopeRelic_Summary=ui.label(p,.015,-.044,.450,.020,'',.009).id
  for n=0,5 do
   local slot=n;local row=ui.textButton(p,.015,-.078-n*.037,.137,.031,'')
   row.localAction(function()S.HopeRelic_SelectRow(slot)end)
   S.HopeRelic_RowButton[n]=row.id;S.HopeRelic_RowIndex[n]=-1
  end
  ui.image(p,.163,-.073,.001,.218,'AITower\\gold.tga').alpha(90)
  S.HopeRelic_Icon=ui.image(p,.181,-.080,.044,.044,'ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp').id
  S.HopeRelic_NameText=ui.label(p,.238,-.083,.227,.033,'',.011).id
  S.HopeRelic_StateText=ui.label(p,.172,-.124,.293,.020,'',.009).id
  S.HopeRelic_DetailText=ui.label(p,.172,-.153,.293,.148,'',.0085).id
  local prev=ui.button(p,.015,-.308,.037,.026,'<');prev.localAction(S.HopeRelic_Prev);S.HopeRelic_PrevButton=prev.id
  S.HopeRelic_PageText=ui.label(p,.060,-.313,.044,.019,'',.009).id
  local next_=ui.button(p,.115,-.308,.037,.026,'>');next_.localAction(S.HopeRelic_Next);S.HopeRelic_NextButton=next_.id
  local more=ui.button(p,.323,-.308,.142,.026,'更多说明');more.localAction(S.HopeRelic_NextDetail);S.HopeRelic_DetailButton=more.id
  S.HopeRelic_UIReady=true
 end
end
return M

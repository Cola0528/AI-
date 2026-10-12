-- Actual reward ownership and transactions stay in the migrated rule modules.
-- This module owns layout and fixed event bindings for the complete choice flow.
local theme=require 'aitower.ui.theme'
local flow=require 'aitower.ui.textflow'
local choiceIcons=require 'aitower.ui.choice_icons'
local M={}
function M.install(S,ui)
 local panels,decorations={},{ }
 local loot
 local refreshChoice=S.HopeChoice_Refresh
 S.HopeChoice_Refresh=function()
  refreshChoice()
  -- Visible choices already contain their own F6 control. The external button
  -- is a restore entry only, never a second fold control over card text.
  S.HopeLayout_Show(S.HopeChoice_Button,S.HopeChoice_HasPending() and S.HopeChoice_Hidden)
  if not loot or not S.HopeChoice_LootPending()then return end
  local getText=S.__backend.japi.DzFrameGetText
  local maxLines=3
  local paged=false
  for _,card in ipairs(loot.cards)do
   card.source.show(not getText);card.body.show(getText~=nil)
   if not getText then
    card.source.place(.009,-.081,.163,.153);card.more.show(false);maxLines=14
   else
   local text=getText and getText(card.source.id)or card.source.value or ''
   if text~=card.original then
    card.original=text;card.pages=flow.pages(text,19,9);card.page=1
   end
   local page=card.pages[card.page]or ''
   for _,part in ipairs(card.pages)do
    local _,breaks=part:gsub('|n','');maxLines=math.max(maxLines,breaks+1)
   end
   -- Preserve the original coloured wording when it fits. Longer descriptions
   -- get explicit pages rather than being clipped or enlarging every card.
   card.body.text(#card.pages==1 and text or page)
   card.more.show(#card.pages>1)
   paged=paged or #card.pages>1
   card.more.text('说明 '..card.page..'/'..#card.pages..'  ›')
   end
  end
  local bodyHeight=maxLines*.011+.006
  local cardHeight=.081+bodyHeight+(paged and .027 or .006)
  for _,card in ipairs(loot.cards)do
   card.root.place(card.root.x,card.root.y,.181,.081+bodyHeight)
   card.body.place(.009,-.081,.163,bodyHeight)
   card.more.place(card.root.x+.080,card.root.y-.081-bodyHeight,.092,.023)
  end
  local height=.079+cardHeight+.043
  loot.panel.place(.104,.550,.592,height)
  loot.skip.place(.435,-height+.035,.141,.025)
 end
 S.Trig_GZ_1______________015Actions=function()
  if S.udg_UI_sg[1]~=0 then return end
  local p=ui.panel(nil,.104,.550,.592,.258);p.show(false);S.udg_UI_sg[1]=p.id
  loot={panel=p,cards={}}
  local highlight=ui.frame(p,0,0,.001,.001);highlight.show(false);S.udg_UI_sg[0]=highlight.id
  ui.label(p,.015,-.013,.428,.024,theme.gold..'战利品 · 选择一件'..theme.clear,.013)
  local fold=ui.button(p,.502,-.011,.074,.025,'收起 F6');fold.localAction(function()S.HopeChoice_Hidden=true end)
  ui.label(p,.015,-.045,.558,.021,'选择后直接领取；背包不足会优先转交助手。',.009)
  for n=0,2 do
   local slot=n+1
   local card=ui.textButton(p,.015+n*.191,-.079,.181,.136,'')
   ui.image(card,.010,-.068,.161,.001,'AITower\\gold.tga').alpha(120)
   if n>0 then S.udg_UI_sg[1+n*4]=card.id end
   S.udg_UI_sg[2+n*4]=ui.image(card,.065,-.007,.051,.051,theme.icons.relic).id
   -- Retain a hidden source label for the old population function to update.
   -- A separate visible label can paginate without corrupting that source.
   local source=ui.label(card,0,0,.001,.001,'',.008);source.show(false)
   S.udg_UI_sg[3+n*4]=source.id
   local body=ui.label(card,.009,-.081,.163,.039,'',.008)
   local more=ui.textButton(p,.015+n*.191+.080,-.197,.092,.023,'')
   -- Independent sibling hit target: paging never bubbles into reward claim.
   local entry={root=card,source=source,body=body,more=more,original=false,pages={''},page=1}
   more.localAction(function()entry.page=entry.page%#entry.pages+1 end);more.show(false)
   loot.cards[#loot.cards+1]=entry
   S.udg_UI_sg[4+n*4]=card.id
   S.DzFrameSetScriptByCode(card.id,1,function()
    local p=S.DzGetTriggerUIEventPlayer();local owner=S.GetPlayerId(p)
    if owner>=0 and owner<6 and S.HaveSavedBoolean(S.YDHT,S.GetHandleId(p),-1422318988)and not S.LoadBoolean(S.YDHT,S.GetHandleId(p),-1422318988)then
     S.TriggerExecute(S['gg_trg_'..slot])
    end
   end,true)
  end
  local skip=ui.button(p,.435,-.223,.141,.025,'')
  loot.skip=skip
  S.udg_UI_sg[13]=skip.id
  local skipIcon=ui.image(skip,0,0,.001,.001,theme.icons.relic);skipIcon.show(false)
  S.udg_UI_sg[14]=skipIcon.id
  S.udg_UI_sg[15]=ui.label(skip,.009,-.004,.123,.017,'放弃选择',.008).id
  S.udg_UI_sg[16]=skip.id
  S.DzFrameSetScriptByCode(skip.id,1,function()
   local p=S.DzGetTriggerUIEventPlayer();local owner=S.GetPlayerId(p)
   if owner>=0 and owner<6 and S.HaveSavedBoolean(S.YDHT,S.GetHandleId(p),-1422318988)and not S.LoadBoolean(S.YDHT,S.GetHandleId(p),-1422318988)then S.TriggerExecute(S.gg_trg_4)end
  end,true)
 end
 S.HopeModern_Create=function()
  for i=1,13 do
   local index=i
   local panel=ui.panel(nil,.130,.515,.540,.265);panel.show(false);panels[i]=panel
   S.HopeModern_Panel[i]=panel.id
   local art=ui.image(panel,.276,-.046,.243,.116,'AITower\\journey.tga');art.alpha(45)
   decorations[i]={art=art,icons={},labels={}}
   S.HopeModern_Title[i]=ui.label(panel,.016,-.013,.408,.024,'',.013).id
   S.HopeModern_Description[i]=ui.label(panel,.016,-.050,.507,.051,'',.009).id
   local fold=ui.button(panel,.453,-.012,.071,.024,'收起 F6')
   fold.localAction(function()S.HopeChoice_Hidden=true end);S.HopeLayout_Fold[i]=fold.id
   for n=1,6 do
    local slot=n
    local button=ui.textButton(panel,.016+((n-1)%3)*.172,-.118-math.floor((n-1)/3)*.062,.164,.054,'')
    decorations[i].icons[n]=ui.image(button,.065,-.007,.034,.034,theme.icons.abyss)
    decorations[i].labels[n]=ui.label(button,.006,-.049,.152,.048,'',.009)
    S.HopeModern_Row[i*8+n]=button.id
    S.DzFrameSetScriptByCode(button.id,1,function()S.HopeModern_Choose(index,slot)end,true)
   end
   -- Replacement skill text uses the complete description, with the existing
   -- scroll model to avoid losing long ability effects or their costs.
   local viewport=ui.frame(panel,.016,-.048,.453,.122)
   S.HopeR_Viewport[i]=viewport.id
   S.DzFrameSetScriptByCode(viewport.id,2,S.HopeScroll_EnterR,false)
   S.DzFrameSetScriptByCode(viewport.id,3,S.HopeScroll_Leave,false)
   S.HopeR_Body[i]=ui.label(viewport,.004,-.003,.444,.116,'',.0085).id
   local up=ui.button(panel,.478,-.049,.045,.025,'上翻');up.localAction(S.HopeScroll_RUp);S.HopeR_Up[i]=up.id
   local down=ui.button(panel,.478,-.112,.045,.025,'下翻');down.localAction(S.HopeScroll_RDown);S.HopeR_Down[i]=down.id
   S.HopeR_Notice[i]=ui.label(panel,.016,-.178,.507,.018,'',.008).id
  end
  S.HopeModern_Ready=true
 end
 S.HopeLayout_Choice=function(i,d)
  local isR=d==S.udg_Rskill_shifoutihuan[S.GetPlayerId(S.GetLocalPlayer())+1]
  local difficulty=d==S.udg_Youxi_ND_XZ
  local upgrade=d==S.udg_Wj_sj_xz[S.GetPlayerId(S.GetLocalPlayer())+1]
  local count=S.LoadInteger(S.HopeModern_Data,S.GetHandleId(d),0)
  local compact=difficulty or count>4
  for n=1,6 do
   local show=not isR and (n<=math.min(count,3)or compact and n<=count)
   decorations[i].icons[n].show(show);decorations[i].labels[n].show(show)
  end
  decorations[i].art.show(false)
  panels[i].place(compact and .225 or .130,.535,compact and .350 or .540,compact and .228 or isR and .265 or .257)
  S.HopeLayout_Place(S.HopeModern_Title[i],panels[i].id,.016,-.013,compact and .230 or .408,.024)
  S.HopeLayout_Place(S.HopeLayout_Fold[i],panels[i].id,compact and .263 or .453,-.012,.071,.024)
  S.HopeLayout_Place(S.HopeModern_Description[i],panels[i].id,.016,-.045,compact and .318 or .507,compact and .030 or .051)
  if difficulty then S.DzFrameSetText(S.HopeModern_Description[i],'选定难度后，再指定路线选择者。')end
  for _,a in ipairs({S.HopeR_Viewport,S.HopeR_Up,S.HopeR_Down,S.HopeR_Notice})do S.HopeLayout_Show(a[i],isR)end
  S.HopeLayout_Show(S.HopeModern_Description[i],not isR)
  for slot=1,count do
   local x,y,w,h
   if isR then
    x,y,w,h=.016+(slot-1)*.260,-.219,.248,.029
    S.DzFrameSetText(S.HopeModern_Row[i*8+slot],slot==1 and '替换技能'or '保留原技能')
   elseif not compact and slot==4 then
    x,y,w,h=.376,-.223,.148,.024
   elseif not difficulty and count<=4 then
    x,y,w,h=.016+(slot-1)*.172,-.112,.164,.102
   else
    x,y,w,h=.014+((slot-1)%2)*.164,-.085-math.floor((slot-1)/2)*.045,.158,.040
   end
   if not isR and slot<=6 then
    local glyph=decorations[i].icons[slot]
    local text=S.LoadStr(S.HopeModern_Data,S.GetHandleId(d),slot)or ''
    local difficultyIcons={'BTNFootman','BTNKnight','BTNGrunt','BTNPitLord','BTNInfernal','BTNOrbOfDarkness'}
    local texture=difficulty and ('ReplaceableTextures\\CommandButtons\\'..difficultyIcons[slot]..'.blp') or upgrade and choiceIcons.forUpgrade(S,d,slot) or text:find('生命')and theme.icons.life or text:find('魔法')and theme.icons.mana or text:find('护甲')and theme.icons.armor or text:find('金币')and theme.icons.gold or theme.icons.attack
    glyph.texture(texture)
    if compact or slot<=3 then
     glyph.place(compact and .006 or .065,compact and -.006 or -.007,compact and .027 or .034,compact and .027 or .034)
     decorations[i].labels[slot].place(compact and .041 or .006,compact and -.004 or -.049,compact and .112 or .152,compact and .033 or h-.053)
     local rounds={'3 轮远征','3 轮远征','4 轮远征','4 轮远征','5 轮远征','无限轮挑战'}
     decorations[i].labels[slot].text(difficulty and text..'|n'..theme.muted..rounds[slot]..theme.clear or text)
     S.DzFrameSetText(S.HopeModern_Row[i*8+slot],'')
    end
   end
   S.HopeLayout_Place(S.HopeModern_Row[i*8+slot],S.HopeModern_Panel[i],x,y,w,h)
  end
 end
 -- Keep raw upgrade/reward values and original choice handlers, but replace the
 -- growth page construction with a compact two-column set of labelled values.
 S.HopeGrowth_CreateUI=function()
  S.DestroyTimer(S.GetExpiredTimer())
  local p=ui.panel(nil,.215,.530,.370,.326);p.show(false);S.HopeGrowth_Panel=p.id
  S.HopeGrowth_Title=ui.label(p,.014,-.013,.240,.022,theme.gold..'选择你的成长'..theme.clear,.013).id
  local fold=ui.button(p,.282,-.011,.074,.025,'收起 F6');fold.localAction(S.HopeGrowth_Fold)
  S.HopeGrowth_Summary=ui.label(p,.014,-.046,.342,.029,'',.009).id
  for n=0,5 do
   local x=.014+math.floor(n/3)*.174;local y=-.084-(n%3)*.033
   S.HopeGrowth_ValueText[n]=ui.label(p,x,y,.167,.025,'',.010).id
  end
  ui.label(p,.014,-.188,.342,.048,'每级成长，小数会持续累积。|n魔力增加技能伤害，专注增加精确打击伤害。|n先看数值与评级，再决定保留或重置。',.0085)
  local free=ui.button(p,.014,-.244,.168,.027,'');S.HopeGrowth_FreeButton=free.id
  local paid=ui.button(p,.190,-.244,.166,.027,'');S.HopeGrowth_PaidButton=paid.id
  local accept=ui.button(p,.190,-.284,.166,.028,'确认成长 · 出发');S.HopeGrowth_AcceptButton=accept.id
  S.DzFrameSetScriptByCode(free.id,1,S.HopeGrowth_FreeClick,true)
  S.DzFrameSetScriptByCode(paid.id,1,S.HopeGrowth_PaidClick,true)
  S.DzFrameSetScriptByCode(accept.id,1,S.HopeGrowth_AcceptClick,true)
  S.HopeGrowth_Footer=ui.label(p,.014,-.284,.167,.031,'',.0078).id
  S.HopeGrowth_UIReady=true
 end
end
return M

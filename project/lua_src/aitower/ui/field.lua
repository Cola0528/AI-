local T=require 'aitower.ui.theme'
local M={}
function M.new(S,ui,app)
 local v={lastBattle=false,lastActor=nil}
 v.phase=ui.frame(nil,.303,.564,.282,.031)
 v.overview=ui.textButton(v.phase,.208,-.004,.066,.024,'看全场')
 function v.focus()
  local x,y,count=0,0,0
  for n=1,6 do local u=S.udg_hero[n]
   if u and S.IsUnitAliveBJ(u)and S.IsUnitVisible(u,S.GetLocalPlayer())then x=x+S.GetUnitX(u);y=y+S.GetUnitY(u);count=count+1 end
  end
  for n=1,S.HopeIntent_Count do local u=S.HopeIntent_Units[n]
   if u and S.IsUnitAliveBJ(u)and S.IsUnitVisible(u,S.GetLocalPlayer())then x=x+S.GetUnitX(u);y=y+S.GetUnitY(u);count=count+1 end
  end
  if count>0 then S.HopeCamera_ResetKeepView();S.PanCameraToTimed(x/count,y/count,.25)end
 end
 v.overview.localAction(v.focus)
 v.hero=ui.textButton(nil,.014,.374,.071,.020,'角色行囊')
 v.bag=ui.textButton(nil,.091,.374,.071,.020,'助手仓库')
 -- Switch inventory without stealing the battle camera. F2/F3 remain the
 -- explicit camera-focus shortcuts, not duplicate clickable key labels.
 v.hero.localAction(function()
  local i=S.GetPlayerId(S.GetLocalPlayer())+1
  if i<1 or i>6 then return end
  local u=S.HopeMini_Actor[i] or S.udg_hero[i]
  if u then S.ClearSelection();S.SelectUnit(u,true)end
 end)
 v.bag.localAction(function()
  local i=S.GetPlayerId(S.GetLocalPlayer())+1
  if i<1 or i>6 or S.HopeMini_Actor[i]then return end
  local u=S.udg_Bei_bao_danwei[i]
  if u then S.ClearSelection();S.SelectUnit(u,true)end
 end)
 v.context=ui.label(nil,.020,.349,.136,.031,'',.0075)
 function v.refresh()
  local p=S.GetLocalPlayer();local i=S.GetPlayerId(p)+1
  local hero=i>=1 and i<=6 and S.udg_hero[i]or nil
  local open=hero~=nil and S.HopeLayout_Mode()==0
  local battle=open and S.udg_ZhandouZhong and S.HopeMini_Actor[i]==nil
  v.phase.show(battle);v.hero.show(open and app.native.available);v.bag.show(open and app.native.available);v.context.show(open and app.native.available)
  if not hero then return end
  local bag=S.udg_Bei_bao_danwei[i]
  v.hero.text('角色 '..S.UnitInventoryCount(hero)..'/6');v.bag.text('助手 '..(bag and S.UnitInventoryCount(bag)or 0)..'/6')
  local mini=S.HopeMini_Actor[i]
  local actor=mini or hero
  local selected=S.IsUnitSelected(actor,p)
  local points=S.GetHeroSkillPoints(hero)
  local roomHint=S.HopeRoom_Hint and S.HopeRoom_Hint(p)or ''
  v.hero.text(mini and '返回小游戏' or not selected and '返回角色' or '行囊 '..S.UnitInventoryCount(hero)..'/6')
  v.bag.show(open and app.native.available and mini==nil)
  v.context.place(.020,.349,.136,roomHint~=''and .047 or .031)
  v.context.text(mini and '小游戏操作 · F3 跟随'
   or roomHint~=''and roomHint
   or not selected and '返回角色可查看战斗技能'
   or points>0 and T.gold..'技能点 '..points..T.clear..'|n点击技能栏「+」学习'
   or S.udg_shengji_dian[i]>0 and T.gold..'属性点 '..S.udg_shengji_dian[i]..T.clear..'|nP 打开升级三选一'
   or '')
  -- Retry once when a delayed mini-game actor first becomes available. Never
  -- recenter every tick or reset the player's scroll-wheel distance.
  if mini and mini~=v.lastActor then S.HopeMini_Focus(p)end
  v.lastActor=mini
 end
 return v
end
return M

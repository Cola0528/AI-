local theme=require 'aitower.ui.theme'
local M={}
function M.new(S,ui,bus,native)
 local hud={}
 -- The native console owns HP/MP, base + bonus attributes, inventory and skills.
 -- Keep only map-specific combat information in the upper-left sidebar.
 local dock=ui.panel(nil,.014,.490,.148,.108)
 native.dock=dock;native.sections={dock}
 hud.ap=ui.label(dock,.008,-.007,.132,.016,'',.009)
 hud.focus=ui.label(dock,.008,-.028,.132,.015,'',.008)
 hud.armor=ui.label(dock,.008,-.048,.132,.015,'',.0078)
 hud.turnMessage=ui.label(dock,.008,-.067,.132,.014,'',.0078)
 hud.turn=ui.frame(dock,.008,-.083,.132,.021)
 hud.endButton=ui.button(hud.turn,0,0,.132,.021,'结束回合  G');bus.bind(hud.endButton.id,'end_turn')
 hud.keys=ui.label(dock,.008,-.084,.132,.017,'',.0075)
 hud.party=ui.panel(nil,.014,.314,.148,.020)
 hud.partyText=ui.label(hud.party,.006,-.004,.136,.014,'',.0075)
 function hud.refresh()
  local p=S.GetLocalPlayer();local i=S.GetPlayerId(p)+1
  local hero=i>=1 and i<=6 and S.udg_hero[i]or nil
  local active=hero~=nil and S.HopeLayout_Mode()==0
  dock.show(active)
  S.HopeLayout_Show(S.HopeQoL_Hud,false);S.HopeLayout_Show(S.HopeTurn_Panel,false)
  if not hero then hud.turn.show(false);hud.party.show(false);return end
  hud.armor.text(require('aitower.game.armor').text(S.GetUnitState(hero,S.ConvertUnitState(32))))
  local focused=S.LoadBoolean(S.YDHT,S.GetHandleId(hero),149034428)
  hud.focus.text('专注 '..S.HopeQoL_CompactNumber(S.udg_zhuanzhuzhi_sy[i])..'/'..S.HopeQoL_CompactNumber(S.udg_DEX[i])..' · '..(focused and '已就绪'or S.udg_zhuanzhuzhi_sy[i]>=3 and 'F 启用'or '不足'))
  hud.ap.text(theme.gold..'行动 '..S.udg_xingdong_dian[i]..' / '..S.udg_xingdong_dianSx[i]..theme.clear)
  local battle=S.udg_ZhandouZhong and S.HopeMini_Actor[i]==nil
  local canEnd=battle and S.HopeTurn_CanEnd(p)
  hud.turn.show(active and canEnd);hud.endButton.show(canEnd)
  hud.turnMessage.text(S.HopeMini_Actor[i]and S.HopeMini_Status()or native.context and '当前：商会交易'or not battle and '整理行囊 · 规划路线'or canEnd and '己方第 '..S.udg_huihe_s..' 回合'or '等待队友 / 敌方结算')
  hud.keys.show(not canEnd)
  hud.keys.text(native.context and '原生图标购买'or S.HopeMini_Actor[i]and 'F3 跟随小游戏'or battle and '本回合已结束'or 'F3 聚焦 · F4 属性')
  -- F5 reduces detail only: end-turn and teammate AP remain independent.
  local expanded=S.HopeQoL_Visible
  hud.focus.show(expanded);hud.armor.show(expanded)
  dock.place(.014,.490,.148,expanded and .108 or .068)
  hud.turnMessage.place(.008,expanded and -.067 or -.027,.132,.014)
  hud.turn.place(.008,expanded and -.083 or -.043,.132,.021)
  hud.keys.place(.008,expanded and -.084 or -.044,.132,.017)
  local lines={}
  for n=0,5 do if n~=i-1 and S.HopeRoute_Active(n)then
   lines[#lines+1]=S.HopeIntent_PlayerLabel(S.Player(n))..'  '..S.udg_xingdong_dian[n+1]..' / '..S.udg_xingdong_dianSx[n+1]
  end end
  hud.party.show(active and battle and #lines>0)
  hud.party.place(.014,.314,.148,.008+#lines*.0105)
  hud.partyText.place(.006,-.004,.136,#lines*.0105);hud.partyText.text(table.concat(lines,'|n'))
 end
 return hud
end
return M

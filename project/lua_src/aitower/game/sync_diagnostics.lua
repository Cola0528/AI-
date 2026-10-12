-- Read-only comparison at a shared chat event. No host-authoritative health
-- overwrite, no extra random draw, no native handles allocated by a snapshot.
local M={}
function M.install(S)
 if S.__syncDiagnostics then return end
 local state={integers=0,reals=0,damage=0,requests=0,spells=0}
 S.__syncDiagnostics=state
 for _,spec in ipairs({{'GetRandomInt','integers'},{'GetRandomReal','reals'}})do
  local fn,key=S[spec[1]],spec[2]
  S[spec[1]]=function(...)state[key]=state[key]+1;return fn(...)end
 end
 local damage=S.Trig____________________005Actions
 S.Trig____________________005Actions=function()
  state.damage=state.damage+1
  return damage()
 end
 local function number(v)return string.format('%.3f',v or 0)end
 function S.HopeSync_Snapshot()
  local parts,lines={},{}
  local function add(v)parts[#parts+1]=tostring(v)end
  add(S.udg_quanshu);add(S.udg_boci);add(S.udg_huihe_s);add(S.udg_ZhandouZhong)
  add(S.GetHandleId(S.udg_Youxi_xzgq));add(state.integers);add(state.reals);add(state.damage);add(state.spells)
  local function unit(u)
   add(S.GetHandleId(u));add(S.GetUnitTypeId(u))
   for _,k in ipairs({0,1,2,3,18,20,32})do add(number(S.GetUnitState(u,S.ConvertUnitState(k))))end
   add(number(S.GetUnitX(u)));add(number(S.GetUnitY(u)))
  end
  for i=1,6 do
   local u=S.udg_hero[i]
   if u and S.GetUnitTypeId(u)~=0 then
    add(i);unit(u)
    add(S.udg_xingdong_dian[i]);add(S.udg_xingdong_dianSx[i]);add(number(S.udg_DEX[i]))
    add(S.GetHeroStr(u,true));add(S.GetHeroAgi(u,true));add(S.GetHeroInt(u,true))
    add(number(S.udg_Fashang_Dm[i]));add(number(S.udg_Skill_Dm[i]));add(number(S.udg_Zuizhong_Dm[i]))
    add(number(S.udg_Shuchu_dm_tj[i]));add(S.IsUnitPaused(u))
    lines[#lines+1]=S.GetPlayerName(S.Player(i-1))..' #'..S.I2S(S.GetHandleId(u))..' HP '..S.I2S(S.R2I(S.GetWidgetLife(u)))..' AP '..S.I2S(S.udg_xingdong_dian[i])..' 伤害 '..S.I2S(S.R2I(S.udg_Shuchu_dm_tj[i]))
   end
  end
  local enemies={}
  if S.udg_Guaiwu_dwz then S.ForGroup(S.udg_Guaiwu_dwz,function()enemies[#enemies+1]=S.GetEnumUnit()end)end
  table.sort(enemies,function(a,b)return S.GetHandleId(a)<S.GetHandleId(b)end)
  add(#enemies)
  for n,u in ipairs(enemies)do
   unit(u)
   for p=0,5 do add(S.HopeStatus_PoisonCount(u,p))end
   if n<=4 then lines[#lines+1]=S.GetUnitName(u)..' #'..S.I2S(S.GetHandleId(u))..' HP '..S.I2S(S.R2I(S.GetWidgetLife(u)))..' 毒 '..S.I2S(S.HopeStatus_PoisonTotal(u))end
  end
  local raw=table.concat(parts,'/');local hash=0
  for n=1,#raw do hash=(hash*131+raw:byte(n))%2147483647 end
  return {signature=string.format('%08X',hash),raw=raw,lines=lines,enemies=#enemies}
 end
 function S.HopeSync_Show()
  state.requests=state.requests+1
  local snapshot=S.HopeSync_Snapshot()
  local title='联机诊断 #'..state.requests..' · 层 '..S.udg_boci..' / 回合 '..S.udg_huihe_s..' · 签名 '..snapshot.signature
  local counts='随机 '..state.integers..'/'..state.reals..' · 施法 '..state.spells..' · 伤害事件 '..state.damage
  S.DisplayTimedTextToPlayer(S.GetLocalPlayer(),0,0,30,title..'\n'..counts..'\n'..table.concat(snapshot.lines,'\n')..'\n请比较双方同一次诊断的签名；不同表示上述状态已分岔。')
  return snapshot
 end
 function state.start()
  if state.chat then return end
  state.chat=S.CreateTrigger()
  for i=0,5 do S.TriggerRegisterPlayerChatEvent(state.chat,S.Player(i),'-sync',true)end
  S.TriggerAddAction(state.chat,S.HopeSync_Show)
  state.casts=S.CreateTrigger()
  S.TriggerRegisterAnyUnitEventBJ(state.casts,S.EVENT_PLAYER_UNIT_SPELL_EFFECT)
  S.TriggerAddAction(state.casts,function()state.spells=state.spells+1 end)
 end
end
return M

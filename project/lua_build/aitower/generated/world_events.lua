-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function Trig_______________2Func005CT()
	s__hardware_Update()
end

function Trig_______________2Func006WT()
	s__hardware_OnWheel()
end

function Trig_______________2Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	CreateQuestBJ(bj_QUESTTYPE_OPT_DISCOVERED, "各类说明", "各类说明\
力量敏捷智力生命成长：字面意思\
魔力成长：每级增加的英雄技能伤害  专注成长：每级增加的英雄精确打击伤害\
\
玩家1可以输入-bug 强制进入敌方回合（慎用）", "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
	SetTerrainFogEx(0, 100000.0, 800000.0, 0, 1, 1, 1)
	SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2046702351, s__hardware_SetWideScreen())
	if LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2046702351) == true then
	else
		SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2046702351, s__hardware_SetWideScreen())
	end
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetUpdateCallbackByCode(Trig_______________2Func005CT)
	end
	if GetLocalPlayer() == GetLocalPlayer() then
		DzTriggerRegisterMouseWheelEventByCode(nil, false, Trig_______________2Func006WT)
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_______________2()
	gg_trg_______________2 = CreateTrigger()
	TriggerAddAction(gg_trg_______________2, Trig_______________2Actions)
end

function Trig____________________016Func001T()
	udg_wuchongtuA = 1
	for _ in _loop_() do
		if udg_wuchongtuA > 6 then break end
		if udg_hero[udg_wuchongtuA] ~= nil then
			SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360, udg_hero[udg_wuchongtuA])
			if udg_Minjie_jiaGong[udg_wuchongtuA] ~= _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), true), 2) then
				SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -137437574, _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), true), 2) - udg_Minjie_jiaGong[udg_wuchongtuA])
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ConvertUnitState(18), GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ConvertUnitState(18)) + I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -137437574)))
				udg_Minjie_jiaGong[udg_wuchongtuA] = _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), true), 2)
			else
			end
			if udg_Zhili_jiaFQ_______u[udg_wuchongtuA] ~= _idiv_(GetHeroInt(udg_hero[udg_wuchongtuA], false), 3) then
				SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1447038034, _idiv_(GetHeroInt(udg_hero[udg_wuchongtuA], true), 3) - udg_Zhili_jiaFQ_______u[udg_wuchongtuA])
				udg_Fashang_Dm[udg_wuchongtuA] = udg_Fashang_Dm[udg_wuchongtuA] + I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1447038034)) / 100.0
				udg_Zhili_jiaFQ_______u[udg_wuchongtuA] = _idiv_(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), false), 3)
			else
			end
		else
		end
		udg_wuchongtuA = udg_wuchongtuA + 1
	end
end

function Trig____________________016Actions()
	local ydl_timer
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -137437574, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -137437574))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -1447038034, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1447038034))
	TimerStart(ydl_timer, 0.2, true, Trig____________________016Func001T)
	ydl_timer = nil
end

function InitTrig____________________016()
	gg_trg____________________016 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________016, 1.0)
	TriggerAddAction(gg_trg____________________016, Trig____________________016Actions)
end

function Trig_Esc_____________026Actions()
	if GetTriggerPlayer() == GetLocalPlayer() then
		if HopeGrowth_Pending[GetPlayerId(GetLocalPlayer())] then
			HopeChoice_Hidden = true
		end
		HopeArchive_Expanded = false
		HopeQoL_Expanded = false
		HopeGift_Expanded = false
		HopeRelic_Expanded = false
		HopeRoute_Details = false
	end
end

function InitTrig_Esc_____________026()
	gg_trg_Esc_____________026 = CreateTrigger()
	TriggerRegisterPlayerEventEndCinematic(gg_trg_Esc_____________026, Player(0))
	TriggerRegisterPlayerEventEndCinematic(gg_trg_Esc_____________026, Player(1))
	TriggerRegisterPlayerEventEndCinematic(gg_trg_Esc_____________026, Player(2))
	TriggerRegisterPlayerEventEndCinematic(gg_trg_Esc_____________026, Player(3))
	TriggerRegisterPlayerEventEndCinematic(gg_trg_Esc_____________026, Player(4))
	TriggerRegisterPlayerEventEndCinematic(gg_trg_Esc_____________026, Player(5))
	TriggerAddAction(gg_trg_Esc_____________026, Trig_Esc_____________026Actions)
end

function Trig____________________041Actions()
	ConditionalTriggerExecute(gg_trg______________003)
	DisplayTextToPlayer(Player(0), 0, 0, "强制进入敌方回合")
end

function InitTrig____________________041()
	gg_trg____________________041 = CreateTrigger()
	TriggerRegisterPlayerChatEvent(gg_trg____________________041, Player(0), "-bug", false)
	TriggerAddAction(gg_trg____________________041, Trig____________________041Actions)
end

function Trig_TABFunc007KT()
	local ydul_i
	SaveInteger(YDLOC, -1223035157, -2022357260, GetConvertedPlayerId(GetLocalPlayer()))
	SaveUnitHandle(YDLOC, -1223035157, -1626575360, udg_hero[LoadInteger(YDLOC, -1223035157, -2022357260)])
	SaveStr(YDLOC, -1223035157, 757068166 + 1, (YDWEGetPlayerColorString(Player(0), "暴击率：") or "") .. (I2S(udg_Baoji_Lv[LoadInteger(YDLOC, -1223035157, -2022357260)]) or "") .. "%")
	SaveStr(YDLOC, -1223035157, 757068166 + 2, (YDWEGetPlayerColorString(Player(0), "暴击伤害：") or "") .. (I2S(R2I(udg_Baoji_Damage[LoadInteger(YDLOC, -1223035157, -2022357260)] * 100.0)) or "") .. "%")
	SaveStr(YDLOC, -1223035157, 757068166 + 3, (YDWEGetPlayerColorString(Player(1), "法术伤害加成：") or "") .. (I2S(R2I((udg_Fashang_Dm[LoadInteger(YDLOC, -1223035157, -2022357260)] + 0.0) * 100.0)) or "") .. "%")
	SaveStr(YDLOC, -1223035157, 757068166 + 4, (YDWEGetPlayerColorString(Player(1), "技能伤害加成：") or "") .. (I2S(R2I(udg_Skill_Dm[LoadInteger(YDLOC, -1223035157, -2022357260)] * 100.0)) or "") .. "%")
	SaveStr(YDLOC, -1223035157, 757068166 + 5, "专注上限：" .. (R2S(udg_DEX[LoadInteger(YDLOC, -1223035157, -2022357260)]) or "") .. " ")
	SaveStr(YDLOC, -1223035157, 757068166 + 6, "精确打击加成：" .. (I2S(R2I(udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, -1223035157, -2022357260)] * 100.0)) or "") .. "%")
	SaveStr(YDLOC, -1223035157, 757068166 + 7, (YDWEGetPlayerColorString(Player(4), "最终伤害加成：") or "") .. (I2S(R2I(udg_Zuizhong_Dm[LoadInteger(YDLOC, -1223035157, -2022357260)] * 100.0)) or "") .. "%")
	SaveStr(YDLOC, -1223035157, 757068166 + 8, "人物额外防御值:" .. (I2S(R2I(udg_Defend_fangyu[LoadInteger(YDLOC, -1223035157, -2022357260)])) or "") .. "")
	SaveStr(YDLOC, -1223035157, 757068166 + 9, "人物回合防御值:" .. (I2S(R2I(udg_Defend_HUIHE[LoadInteger(YDLOC, -1223035157, -2022357260)])) or "") .. "")
	SaveStr(YDLOC, -1223035157, 757068166 + 10, "")
	SaveStr(YDLOC, -1223035157, 757068166 + 11, LoadStr(YDLOC, -1223035157, -896617495))
	SaveStr(YDLOC, -1223035157, 757068166 + 12, LoadStr(YDLOC, -1223035157, -851522963))
	SaveStr(YDLOC, -1223035157, 757068166 + 13, LoadStr(YDLOC, -1223035157, 953358605))
	SaveStr(YDLOC, -1223035157, 757068166 + 14, LoadStr(YDLOC, -1223035157, 667810722))
	SaveStr(YDLOC, -1223035157, 757068166 + 15, LoadStr(YDLOC, -1223035157, -233095157))
	SaveStr(YDLOC, -1223035157, 757068166 + 16, LoadStr(YDLOC, -1223035157, -1427581389))
	SaveStr(YDLOC, -1223035157, 757068166 + 17, LoadStr(YDLOC, -1223035157, -2075885585))
	SaveStr(YDLOC, -1223035157, 757068166 + 18, LoadStr(YDLOC, -1223035157, -35136647))
	SaveStr(YDLOC, -1223035157, 757068166 + 19, LoadStr(YDLOC, -1223035157, -1865118765))
	SaveStr(YDLOC, -1223035157, 757068166 + 20, LoadStr(YDLOC, -1223035157, -1013613603))
	ydul_i = 1
	for _ in _loop_() do
		if ydul_i > 20 then break end
		DzFrameSetText(udg_AAAUI_TAB[ydul_i], LoadStr(YDLOC, -1223035157, 757068166 + ydul_i))
		ydul_i = ydul_i + 1
	end
	DzFrameShow(udg_AAAUI_TAB[0], true)
end

function Trig_TABFunc008KT()
	DzFrameShow(udg_AAAUI_TAB[0], false)
end

function Trig_TABActions()
	local ydul_i
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	udg_AAAUI_TAB[0] = DzCreateFrameByTagName("BACKDROP", "name", DzGetGameUI(), "template", 0)
	DzFrameSetTexture(udg_AAAUI_TAB[0], "UI-AA011.tga", 0)
	DzFrameSetPoint(udg_AAAUI_TAB[0], 6, DzGetGameUI(), 6, 0.0246, 0.201181)
	DzFrameSetSize(udg_AAAUI_TAB[0], 0.249988, 0.28246)
	DzFrameShow(udg_AAAUI_TAB[0], false)
	ydul_i = 1
	for _ in _loop_() do
		if ydul_i > 20 then break end
		if ydul_i == 1 then
			udg_AAAUI_TAB[ydul_i] = DzCreateFrameByTagName("TEXT", "name", udg_AAAUI_TAB[0], "template", 0)
			DzFrameSetPoint(udg_AAAUI_TAB[ydul_i], 0, udg_AAAUI_TAB[0], 0, 0.023616, -0.018942)
		else
		end
		if ydul_i > 1 and ydul_i < 11 then
			udg_AAAUI_TAB[ydul_i] = DzCreateFrameByTagName("TEXT", "name", udg_AAAUI_TAB[0], "template", 0)
			DzFrameSetText(udg_AAAUI_TAB[ydul_i], "子弹伤害：10.00")
			DzFrameSetPoint(udg_AAAUI_TAB[ydul_i], 1, udg_AAAUI_TAB[ydul_i - 1], 7, 0.0, -0.005)
		else
		end
		if ydul_i == 11 then
			udg_AAAUI_TAB[ydul_i] = DzCreateFrameByTagName("TEXT", "name", udg_AAAUI_TAB[0], "template", 0)
			DzFrameSetPoint(udg_AAAUI_TAB[ydul_i], 3, udg_AAAUI_TAB[1], 5, 0.008, 0.0)
		else
		end
		if ydul_i > 11 then
			udg_AAAUI_TAB[ydul_i] = DzCreateFrameByTagName("TEXT", "name", udg_AAAUI_TAB[0], "template", 0)
			DzFrameSetPoint(udg_AAAUI_TAB[ydul_i], 1, udg_AAAUI_TAB[ydul_i - 1], 7, 0.0, -0.005)
		else
		end
		DzFrameSetText(udg_AAAUI_TAB[ydul_i], "子弹伤害：10.00")
		DzFrameSetSize(udg_AAAUI_TAB[ydul_i], 0.1, 0.022386)
		DzFrameShow(udg_AAAUI_TAB[ydul_i], true)
		ydul_i = ydul_i + 1
	end
	SaveInteger(YDLOC, -1223035157, -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	SaveStr(YDLOC, -1223035157, 757068166, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166))
	SaveStr(YDLOC, -1223035157, -896617495, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -896617495))
	SaveStr(YDLOC, -1223035157, 667810722, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 667810722))
	SaveStr(YDLOC, -1223035157, -233095157, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -233095157))
	SaveStr(YDLOC, -1223035157, -1427581389, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1427581389))
	SaveStr(YDLOC, -1223035157, -851522963, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -851522963))
	SaveStr(YDLOC, -1223035157, -2075885585, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2075885585))
	SaveStr(YDLOC, -1223035157, -35136647, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -35136647))
	SaveStr(YDLOC, -1223035157, 953358605, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 953358605))
	SaveStr(YDLOC, -1223035157, -1865118765, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1865118765))
	SaveStr(YDLOC, -1223035157, -1013613603, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1013613603))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzTriggerRegisterKeyEventByCode(nil, 9, 1, false, Trig_TABFunc007KT)
	end
	if GetLocalPlayer() == GetLocalPlayer() then
		DzTriggerRegisterKeyEventByCode(nil, 9, 0, false, Trig_TABFunc008KT)
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_TAB()
	gg_trg_TAB = CreateTrigger()
	TriggerAddAction(gg_trg_TAB, Trig_TABActions)
end

function Trig______________uActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	ShowUnitHide(gg_unit_n019_0032)
	ShowUnitHide(gg_unit_n01C_0003)
	SaveInteger(YDHT, 1, 2121810082, 1848651826)
	SaveInteger(YDHT, 2, 2121810082, 1966092339)
	SaveInteger(YDHT, 3, 2121810082, 1848651858)
	SaveInteger(YDHT, 4, 2121810082, 1848651861)
	SaveInteger(YDHT, 5, 2121810082, 1848651859)
	SaveInteger(YDHT, 6, 2121810082, 1848651860)
	bj_forLoopAIndex = 0
	bj_forLoopAIndexEnd = 3
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		InitHashtableBJ()
		udg_luxianditu[bj_forLoopAIndex] = GetLastCreatedHashtableBJ()
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		CreateFogModifierRectBJ(true, ConvertedPlayer(bj_forLoopAIndex), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	CreateFogModifierRectBJ(true, Player(11), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1814949198, 11)
	udg_Sd_guanghuan_lx[1] = 1848651855
	udg_Sd_guanghuan_lx[2] = 1848651855
	udg_Sd_guanghuan_lx[3] = 1848651851
	udg_Sd_guanghuan_lx[4] = 1848651851
	udg_Sd_guanghuan_lx[5] = 1848651853
	udg_BOSS_LX_______DA[1] = 1432642913
	SaveStr(YDHT, udg_BOSS_LX_______DA[1], 715936045, "召唤")
	udg_BOSS_LX_______DA[2] = 1966092353
	udg_BOSS_LX_______DA[3] = 1214344551
	udg_BOSS_LX_______DA[4] = 1315334514
	SaveStr(YDHT, udg_BOSS_LX_______DA[4], -1951079047, "Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl")
	SaveReal(YDHT, udg_BOSS_LX_______DA[4], 1932103989, 10.0)
	udg_BOSS_LX[0] = 1966092337
	udg_BOSS_LX[1] = 1848651833
	SaveStr(YDHT, udg_BOSS_LX[1], 715936045, "回血")
	udg_BOSS_LX[2] = 1966092358
	SaveStr(YDHT, udg_BOSS_LX[2], 715936045, "全体攻击")
	SaveStr(YDHT, udg_BOSS_LX[2], -1951079047, "Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl")
	udg_BOSS_LX[3] = 1966092343
	SaveStr(YDHT, udg_BOSS_LX[3], -1951079047, "Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl")
	udg_BOSS_LX[4] = 1966092345
	SaveStr(YDHT, udg_BOSS_LX[4], -1951079047, "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
	udg_BOSS_LX[5] = 1433168227
	SaveStr(YDHT, udg_BOSS_LX[5], -1951079047, "Abilities\\Weapons\\LichMissile\\LichMissile.mdl")
	udg_BOSS_LX[6] = 1848651866
	SaveStr(YDHT, udg_BOSS_LX[6], -1951079047, "Abilities\\Weapons\\SearingArrow\\SearingArrowMissile.mdl")
	udg_BOSS_LX[7] = 1848652083
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 7
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		SaveBoolean(YDHT, udg_BOSS_LX[bj_forLoopAIndex], -74861460, true)
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	SaveBoolean(YDHT, udg_BOSS_LX_______DA[1], -74861460, true)
	udg_boci_gw_lx[0] = 1848651824
	udg_boci_gw_lx[1] = 1848651863
	udg_boci_gw_lx[2] = 1848651826
	udg_boci_gw_lx[3] = 1848651825
	SaveStr(YDHT, udg_boci_gw_lx[3], -1951079047, "Abilities\\Weapons\\Arrow\\ArrowMissile.mdl")
	udg_boci_gw_lx[4] = 1966092336
	udg_boci_gw_lx[5] = 1848651828
	SaveStr(YDHT, udg_boci_gw_lx[5], -1951079047, "Abilities\\Weapons\\NecromancerMissile\\NecromancerMissile.mdl")
	udg_boci_gw_lx[6] = 1966092339
	udg_boci_gw_lx[7] = 1848651829
	udg_boci_gw_lx[8] = 1970169187
	SaveStr(YDHT, udg_boci_gw_lx[8], -1951079047, "Abilities\\Weapons\\NecromancerMissile\\NecromancerMissile.mdl")
	udg_boci_gw_lx[9] = 1966092342
	udg_boci_gw_lx[10] = 1966092341
	SaveStr(YDHT, udg_boci_gw_lx[10], -1951079047, "Abilities\\Weapons\\ZigguratMissile\\ZigguratMissile.mdl")
	udg_boci_gw_lx[11] = 1848651865
	udg_boci_gw_lx[12] = 1966092356
	udg_boci_gw_lx[13] = 1848652080
	udg_boci_gw_lx[14] = 1848652082
	SaveStr(YDHT, udg_boci_gw_lx[14], -1951079047, "Abilities\\Weapons\\NecromancerMissile\\NecromancerMissile.mdl")
	udg_boci_gw_lx[15] = 1848652081
	udg_boci_gw_lx[16] = 1966092360
	SaveStr(YDHT, udg_boci_gw_lx[16], -1951079047, "Abilities\\Weapons\\SkeletalMageMissile\\SkeletalMageMissile.mdl")
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig______________u()
	gg_trg______________u = CreateTrigger()
	TriggerAddAction(gg_trg______________u, Trig______________uActions)
end

function Trig_______uFunc009A()
	PanCameraToTimedLocWithZForPlayer(GetOwningPlayer(GetEnumUnit()), udg_dtzhongxindian[2], 1200.0, 0.01)
	udg_Hero_dian[GetConvertedPlayerId(GetOwningPlayer(GetEnumUnit()))] = GetUnitLoc(GetEnumUnit())
	RemoveUnit(GetEnumUnit())
end

function Trig_______uActions()
	local ydl_group
	local ydl_unit
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	udg_dtzhongxindian[1] = GetRectCenter(gg_rct______________000)
	udg_dtzhongxindian[2] = GetRectCenter(gg_rct______________002)
	udg_dtzhongxindian[3] = GetRectCenter(gg_rct______________001)
	udg_Boss_dian[1] = GetRectCenter(gg_rct______________003)
	udg_Shangdian_dian[1] = Location(-3024.0, -872.0)
	udg_Shangdian_dian[2] = Location(-3024.0, 765.0)
	udg_Shangdian_dian[3] = Location(-3024.0, 2485.0)
	udg_Guaiwu_dwz = YDWEGetUnitsOfPlayerAllNull(Player(11))
	ForGroupBJ(YDWEGetUnitsInRectAllNull(gg_rct______________001), Trig_______uFunc009A)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880, DzCreateFrameByTagName("FRAME", "name", DzGetGameUI(), "template", 0))
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		if GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251) + 1.0)
			udg_xingdongdian_xs[bj_forLoopAIndex] = DzCreateFrameByTagName("TEXT", "name", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880), "template", 0)
			DzFrameSetAbsolutePoint(udg_xingdongdian_xs[bj_forLoopAIndex], 4, 0.42, S2R("0.12300"))
			DzFrameSetSize(udg_xingdongdian_xs[bj_forLoopAIndex], 0.2, 0.1)
			DzFrameSetFont(udg_xingdongdian_xs[bj_forLoopAIndex], "Fonts\\ZiTi.ttf", 0.02, 0)
			DzFrameSetText(udg_xingdongdian_xs[bj_forLoopAIndex], "行动点: " .. (I2S(udg_xingdong_dian[bj_forLoopAIndex]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[bj_forLoopAIndex]) or ""))
			DzFrameShow(udg_xingdongdian_xs[bj_forLoopAIndex], false)
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	SaveInteger(YDHT, 1, 1093503686, 1093677108)
	SaveInteger(YDHT, 1, 1068628448, 1093677145)
	SaveInteger(YDHT, 1, 1494149627, 1093677402)
	SaveInteger(YDHT, 2, 1093503686, 1093677109)
	SaveInteger(YDHT, 2, 1068628448, 1093677146)
	SaveInteger(YDHT, 2, 1494149627, 1093677397)
	SaveInteger(YDHT, 3, 1093503686, 1093677110)
	SaveInteger(YDHT, 3, 1068628448, 1093677360)
	SaveInteger(YDHT, 3, 1494149627, 1093677398)
	SaveInteger(YDHT, 4, 1093503686, 1093677111)
	SaveInteger(YDHT, 4, 1068628448, 1093677361)
	SaveInteger(YDHT, 4, 1494149627, 1093677399)
	SaveInteger(YDHT, 5, 1093503686, 1093677112)
	SaveInteger(YDHT, 5, 1068628448, 1093677362)
	SaveInteger(YDHT, 5, 1494149627, 1093677400)
	SaveInteger(YDHT, 6, 1093503686, 1093677107)
	SaveInteger(YDHT, 6, 1068628448, 1093677363)
	SaveInteger(YDHT, 6, 1494149627, 1093677401)
	udg_x_Skill[1] = 1093678169
	udg_x_Skill[2] = 1093678384
	udg_x_Skill[3] = 1093678168
	udg_x_Skill[4] = 1093678385
	udg_x_Skill[5] = 1093678386
	udg_x_Skill[6] = 1093678388
	udg_x_Skill[7] = 1093678402
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig_______u()
	gg_trg_______u = CreateTrigger()
	TriggerAddAction(gg_trg_______u, Trig_______uActions)
end

function Trig____________________008Actions()
	DzFrameShow(udg_xingdongdian_xs[GetConvertedPlayerId(GetLocalPlayer())], true)
end

function InitTrig____________________008()
	gg_trg____________________008 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________008, 1.0)
	TriggerAddAction(gg_trg____________________008, Trig____________________008Actions)
end

function Trig____________________003Actions()
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		if GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(ConvertedPlayer(bj_forLoopAIndex)) == MAP_CONTROL_USER then
			HopeModern_Message(udg_Youxi_ND_XZ, "难度选择")
			HopeModern_Add(udg_Youxi_ND_XZ, "简单")
			SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 1)
			HopeModern_Add(udg_Youxi_ND_XZ, "普通")
			SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 2)
			HopeModern_Add(udg_Youxi_ND_XZ, "困难")
			SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 3)
			HopeModern_Add(udg_Youxi_ND_XZ, "极难")
			SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 4)
			HopeModern_Add(udg_Youxi_ND_XZ, "炼狱（5轮）")
			SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 5)
			HopeModern_Add(udg_Youxi_ND_XZ, "无限挑战（无限轮）")
			SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 6)
			HopeChoice_DialogDisplay(ConvertedPlayer(bj_forLoopAIndex), udg_Youxi_ND_XZ, true)
			DoNothing()
			if true then break end
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
end

function InitTrig____________________003()
	gg_trg____________________003 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________003, 1.0)
	TriggerAddAction(gg_trg____________________003, Trig____________________003Actions)
end

function Trig____________________006Func002Func002A()
	AdjustPlayerStateBJ(150, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	AdjustPlayerStateBJ(3, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
end

function Trig____________________006Func003Func002A()
	AdjustPlayerStateBJ(100, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	AdjustPlayerStateBJ(2, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
end

function Trig____________________006Func004Func004A()
	AdjustPlayerStateBJ(50, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	AdjustPlayerStateBJ(1, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
end

function Trig____________________006Func005Func004A()
	AdjustPlayerStateBJ(0, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	AdjustPlayerStateBJ(1, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
end

function Trig____________________006Func006A()
	if GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(GetEnumPlayer()) == MAP_CONTROL_USER then
		ForceAddPlayer(udg_WJZ, GetEnumPlayer())
		ForceAddPlayer(udg_WJZ_______cunhuo, GetEnumPlayer())
		ForceAddPlayer(udg_WJZ_______weizhunbei, GetEnumPlayer())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
		udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.5 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
		udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.5 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
		udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.5 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261) > 7.0 then
			udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
			udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
			udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
			if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261) > 7.0 then
				udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
				udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
				udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
			else
				if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261) > 7.0 then
					udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
					udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
					udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.0 - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
					SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
				else
				end
			end
		else
		end
		udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(2.0, 10.0)
		udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.5, 3.5)
		udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.5, 3.5)
		CreateNUnitsAtLoc(1, 1211117616, GetEnumPlayer(), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 120.0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -865791214, GetRandomInt(1, 7))
		UnitAddAbilityBJ(udg_x_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -865791214)], GetLastCreatedUnit())
		udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_x_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -865791214)]
		UnitAddAbilityBJ(LoadInteger(YDHT, GetConvertedPlayerId(GetEnumPlayer()), 1093503686), GetLastCreatedUnit())
		UnitAddAbilityBJ(LoadInteger(YDHT, GetConvertedPlayerId(GetEnumPlayer()), 1068628448), GetLastCreatedUnit())
		UnitAddAbilityBJ(LoadInteger(YDHT, GetConvertedPlayerId(GetEnumPlayer()), 1494149627), GetLastCreatedUnit())
		udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetLastCreatedUnit()
		AdjustPlayerStateBJ(20 * (GetUnitAbilityLevelSwapped(1093677878, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
		AdjustPlayerStateBJ(1 * (GetUnitAbilityLevelSwapped(1093677879, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], ConvertUnitState(18)) + (I2R(GetUnitAbilityLevelSwapped(1093677872, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])) - 1.0))
		udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetUnitAbilityLevelSwapped(1093677872, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], UNIT_STATE_MAX_LIFE, GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], UNIT_STATE_MAX_LIFE) + I2R(GetUnitAbilityLevelSwapped(1093677876, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])) * 10.0)
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], UNIT_STATE_MAX_MANA, GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], UNIT_STATE_MAX_MANA) + I2R(GetUnitAbilityLevelSwapped(1093677877, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])) * 1.0)
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], bj_MODIFYMETHOD_ADD, GetUnitAbilityLevelSwapped(1093677873, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1)
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], bj_MODIFYMETHOD_ADD, GetUnitAbilityLevelSwapped(1093677874, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1)
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], bj_MODIFYMETHOD_ADD, GetUnitAbilityLevelSwapped(1093677875, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1)
		ModifyHeroStat(bj_HEROSTAT_STR, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_STR_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		ModifyHeroStat(bj_HEROSTAT_AGI, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_AGI_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		ModifyHeroStat(bj_HEROSTAT_INT, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_INT_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		SetUnitLifePercentBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 100)
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + (GetUnitAbilityLevelSwapped(1093677880, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1)
		udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + 0.01 * I2R(GetUnitAbilityLevelSwapped(1093677881, udg_Cundang_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 1)
		SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
		CreateFogModifierRectBJ(true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct______________000)
		PanCameraToTimedLocWithZForPlayer(GetEnumPlayer(), udg_dtzhongxindian[2], 1200.0, 0.01)
		udg_Guaiwu_sl = udg_Guaiwu_sl + 2 + 0
		if udg_Guaiwu_sl > 5 then
			udg_Guaiwu_sl = udg_Guaiwu_sl - 1 + 0
		-- Multiplayer handicap is recalculated by HopeCoop_BeginRoom.
		else
		end
		CreateNUnitsAtLoc(1, 1747988530, GetEnumPlayer(), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 120.0)
		udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetLastCreatedUnit()
		CreateNUnitsAtLoc(1, 1747988533, GetEnumPlayer(), GetRectCenter(gg_rct______________015), 120.0)
		udg_Bei_bao_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetLastCreatedUnit()
	else
	end
end

function Trig____________________006Func008A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -162887091, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -162887091) + 1)
	udg_Guaiwu_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -162887091)] = GetUnitLoc(GetEnumUnit())
	RemoveUnit(GetEnumUnit())
end

function Trig____________________006Func009001002()
	return LoadInteger(YDHT, GetHandleId(GetFilterUnit()), 1713729479) == 1
end

function Trig____________________006Func009A()
	YDWETimerDestroyEffect(2, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl", GetEnumUnit(), "origin"))
	SetUnitVertexColorBJ(GetEnumUnit(), 100.0, 100, 0.0, 30.0)
	SaveBoolean(YDHT, GetHandleId(GetEnumUnit()), -1021606187, true)
end

function Trig____________________006Func011T()
	DisplayTimedTextToForce(GetPlayersAll(), 10.0, YDWEGetPlayerColorString(Player(0), "路线选择者选路后自动准备；队友处理好奖励并准备后，选择者点击准备面板的【出发】"))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________006Func012T()
	DisplayTimedTextToForce(GetPlayersAll(), 10.0, YDWEGetPlayerColorString(Player(1), "路线选择者选路后自动准备；队友处理好奖励并准备后，选择者点击准备面板的【出发】"))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________006Func013T()
	DisplayTimedTextToForce(GetPlayersAll(), 10.0, YDWEGetPlayerColorString(Player(4), "路线选择者选路后自动准备；队友处理好奖励并准备后，选择者点击准备面板的【出发】"))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________006Actions()
	local ydl_group
	local ydl_unit
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296, LoadInteger(YDHT, GetHandleId(HopeModern_GetButton()), 54591090))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 1 then

		ForForce(GetPlayersAll(), Trig____________________006Func002Func002A)
		SetPlayerHandicapBJ(Player(11), 100.0)
		udg_diren_xueliang = 100.0
		udg_Yx_Nd_Dj = 1
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 2 then

		ForForce(GetPlayersAll(), Trig____________________006Func003Func002A)
		udg_diren_xueliang = 118.0
		SetPlayerHandicapBJ(Player(11), 100.0)
		udg_Yx_Nd_Dj = 2
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 3 then

		udg_diren_xueliang = 154.0
		SetPlayerHandicapBJ(Player(11), 100.0)
		ForForce(GetPlayersAll(), Trig____________________006Func004Func004A)
		udg_Yx_Nd_Dj = 3
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548, 0.3)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 4 then

		udg_diren_xueliang = 208.0
		SetPlayerHandicapBJ(Player(11), 100.0)
		ForForce(GetPlayersAll(), Trig____________________006Func005Func004A)
		udg_Yx_Nd_Dj = 4
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548, 0.4)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 5 or LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 6 then
		udg_Yx_Nd_Dj = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296)
		udg_ND_sz = 5
		udg_diren_xueliang = 283.0
		SetPlayerHandicapBJ(Player(11), 100.0)
		ForForce(GetPlayersAll(), Trig____________________006Func005Func004A)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548, 0.5)
		if udg_Yx_Nd_Dj == 5 then
			DisplayTimedTextToForce(GetPlayersAll(), 15.0, "炼狱：击败第5轮最终BOSS通关。有限难度统一按生命、威胁和通关轮数调校；第5轮出现新敌人。")
		else
			DisplayTimedTextToForce(GetPlayersAll(), 15.0, "无限挑战：没有通关轮数，击败本轮BOSS后继续下一轮，直到队伍失败。以炼狱为基础，第5轮起新敌人轮换，怪物逐轮变强。")
		end
	end
	DisplayTimedTextToForce(GetPlayersAll(), 10.0, "v19难度同时计算敌人生命、攻击和整局轮数；人数主要增加耐久，数量仅小幅增加。无限模式继续逐轮增强。")
	udg_diren_xueliang = 100.0 * HopeDifficulty_Hp(udg_Yx_Nd_Dj)
	ForForce(GetPlayersAll(), Trig____________________006Func006A)
	if CountPlayersInForceBJ(udg_WJZ_______cunhuo) == 1 then
		ForForce(udg_WJZ, HopeCoop_SoloBonus)
	else
	end
	ForGroupBJ(udg_Guaiwu_dwz, Trig____________________006Func008A)
	ForGroupBJ(YDWEGetUnitsOfPlayerMatchingNull(Player(PLAYER_NEUTRAL_PASSIVE), Condition(Trig____________________006Func009001002)), Trig____________________006Func009A)
	DisplayTimedTextToForce(GetPlayersAll(), 10.0, "路线选择者选路后自动准备；队友处理好奖励并准备后，选择者点击准备面板的【出发】")
	ydl_timer = CreateTimer()
	TimerStart(ydl_timer, 1.0, false, Trig____________________006Func011T)
	ydl_timer = CreateTimer()
	TimerStart(ydl_timer, 2.0, false, Trig____________________006Func012T)
	ydl_timer = CreateTimer()
	TimerStart(ydl_timer, 3.0, false, Trig____________________006Func013T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_group = nil
	ydl_unit = nil
	ydl_timer = nil
end

function InitTrig____________________006()
	gg_trg____________________006 = CreateTrigger()
	TriggerRegisterDialogEvent(gg_trg____________________006, udg_Youxi_ND_XZ)
	TriggerAddAction(gg_trg____________________006, Trig____________________006Actions)
end

function Trig__________________________037Func001Func005A()
	if GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(GetEnumPlayer()) == MAP_CONTROL_USER then
		ForceAddPlayer(udg_WJZ, GetEnumPlayer())
		ForceAddPlayer(udg_WJZ_______cunhuo, GetEnumPlayer())
		ForceAddPlayer(udg_WJZ_______weizhunbei, GetEnumPlayer())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
		udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.5)
		udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.5)
		udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.8, 3.5)
		udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(2.0, 10.0)
		udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.2, 3.5)
		udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetRandomReal(0.5, 3.5)
		CreateNUnitsAtLoc(1, 1211117616, GetEnumPlayer(), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 120.0)
		ModifyHeroStat(bj_HEROSTAT_STR, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_STR_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		ModifyHeroStat(bj_HEROSTAT_AGI, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_AGI_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		ModifyHeroStat(bj_HEROSTAT_INT, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_INT_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		UnitAddItemByIdSwapped(1885889889, GetLastCreatedUnit())
		UnitAddAbilityBJ(LoadInteger(YDHT, GetConvertedPlayerId(GetEnumPlayer()), 1093503686), GetLastCreatedUnit())
		udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetLastCreatedUnit()
		SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
		CreateFogModifierRectBJ(true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct______________000)
		PanCameraToTimedLocWithZForPlayer(GetEnumPlayer(), udg_dtzhongxindian[2], 1200.0, 0.01)
		udg_Guaiwu_sl = udg_Guaiwu_sl + 2 + 0
		if udg_Guaiwu_sl > 5 then
			udg_Guaiwu_sl = udg_Guaiwu_sl - 1 + 0
		-- Multiplayer handicap is recalculated by HopeCoop_BeginRoom.
		else
		end
		CreateNUnitsAtLoc(1, 1747988530, GetEnumPlayer(), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 120.0)
		udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = GetLastCreatedUnit()
	else
	end
end

function Trig__________________________037Actions()
	if udg_Yx_Nd_Dj == 0 then
		DisplayTextToForce(GetPlayersAll(), "60秒未选难度，采用简单难度。请指定路线选择者。")
		udg_Yx_Nd_Dj = 1
		HopeRoute_Assigning = true
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = 6
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			if GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING then
				HopeChoice_DialogDisplay(ConvertedPlayer(bj_forLoopAIndex), udg_Youxi_ND_XZ, false)
			else
			end
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
		ForForce(GetPlayersAll(), Trig__________________________037Func001Func005A)
	else
	end
end

function InitTrig__________________________037()
	gg_trg__________________________037 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg__________________________037, 60.0)
	TriggerAddAction(gg_trg__________________________037, Trig__________________________037Actions)
end

function Trig______________009Conditions()
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true
end

function Trig______________009Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	YDWEPolledWaitNull(0.1)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1285070339, "力量成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1281042980, "|n敏捷成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2096591623, "|n智力成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 3.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 3.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 4.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 4.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 5.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 5.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 6.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 6.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 7.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 8.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 9.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 9.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1852901043, "|n生命成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 329436922, "|n魔力成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1556213582, "|n专注成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1093503686), 1, 218, (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1285070339) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1281042980) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2096591623) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1852901043) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 329436922) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1556213582) or ""))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig______________009()
	gg_trg______________009 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg______________009, GetPlayableMapRect())
	TriggerAddCondition(gg_trg______________009, Condition(Trig______________009Conditions))
	TriggerAddAction(gg_trg______________009, Trig______________009Actions)
end

function Trig______________026Func001A()
	SetPlayerAllianceStateBJ(GetTriggerPlayer(), GetEnumPlayer(), bj_ALLIANCE_ALLIED_ADVUNITS)
end

function Trig______________026Actions()
	ForForce(udg_WJZ, Trig______________026Func001A)
end

function InitTrig______________026()
	gg_trg______________026 = CreateTrigger()
	TriggerRegisterPlayerEventLeave(gg_trg______________026, Player(0))
	TriggerRegisterPlayerEventLeave(gg_trg______________026, Player(1))
	TriggerRegisterPlayerEventLeave(gg_trg______________026, Player(2))
	TriggerRegisterPlayerEventLeave(gg_trg______________026, Player(3))
	TriggerRegisterPlayerEventLeave(gg_trg______________026, Player(4))
	TriggerRegisterPlayerEventLeave(gg_trg______________026, Player(5))
	TriggerAddAction(gg_trg______________026, Trig______________026Actions)
end

function Trig__________________________041Conditions()
	return GetUnitTypeId(GetTriggerUnit()) == 1211117616
end

function Trig__________________________041Actions()
	HopeGrowth_Begin(GetTriggerUnit())
end

function InitTrig__________________________041()
	gg_trg__________________________041 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg__________________________041, GetPlayableMapRect())
	TriggerAddCondition(gg_trg__________________________041, Condition(Trig__________________________041Conditions))
	TriggerAddAction(gg_trg__________________________041, Trig__________________________041Actions)
end

function Trig_________________________0_042Actions()
-- Initial growth now uses synchronized frame callbacks.
end

function InitTrig_________________________0_042()
	gg_trg_________________________0_042 = CreateTrigger()
	TriggerRegisterDialogEvent(gg_trg_________________________0_042, udg_duihuak[1])
	TriggerRegisterDialogEvent(gg_trg_________________________0_042, udg_duihuak[2])
	TriggerRegisterDialogEvent(gg_trg_________________________0_042, udg_duihuak[3])
	TriggerRegisterDialogEvent(gg_trg_________________________0_042, udg_duihuak[4])
	TriggerRegisterDialogEvent(gg_trg_________________________0_042, udg_duihuak[5])
	TriggerRegisterDialogEvent(gg_trg_________________________0_042, udg_duihuak[6])
	TriggerAddAction(gg_trg_________________________0_042, Trig_________________________0_042Actions)
end

function Trig_Y______009Conditions()
	return GetSpellAbilityId() == 1093677402 or GetSpellAbilityId() == 1093677397 or GetSpellAbilityId() == 1093677398 or GetSpellAbilityId() == 1093677399 or GetSpellAbilityId() == 1093677400 or GetSpellAbilityId() == 1093677401
end

function Trig_Y______009Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1446360359, GetSpellAbilityId())
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 3.0 then
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "专注！")
		SaveBoolean(YDHT, GetHandleId(GetTriggerUnit()), 149034428, true)
		udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 3.0
		YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1446360359), 1, 218, "消耗专注值使一下次攻击发动精确打击 |n 所需专注值：3 |n |c00fffc01当前剩余专注值: " .. (R2S(udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. "|r")
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "专注值不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_Y______009()
	gg_trg_Y______009 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_Y______009, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_Y______009, Condition(Trig_Y______009Conditions))
	TriggerAddAction(gg_trg_Y______009, Trig_Y______009Actions)
end

function Trig____________________039Conditions()
	return GetUnitTypeId(GetTriggerUnit()) == 1211117637
end

function Trig____________________039Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599, GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093678161) + 1)
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599)) or "") .. "/" .. (I2S(GetUnitAbilityLevelSwapped(1093678161, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 1) or ""))
	CreateTextTagUnitBJ(LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166), GetTriggerUnit(), -120.0, 12.0, 100, 100, 100, 0)
	SaveTextTagHandle(YDHT, GetHandleId(GetTriggerUnit()), 46981737, GetLastCreatedTextTag())
	SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 812780749, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________039()
	gg_trg____________________039 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg____________________039, GetPlayableMapRect())
	TriggerAddCondition(gg_trg____________________039, Condition(Trig____________________039Conditions))
	TriggerAddAction(gg_trg____________________039, Trig____________________039Actions)
end

function Trig_Y_____________001Conditions()
	return GetSpellAbilityId() == 1093677145 or GetSpellAbilityId() == 1093677146 or GetSpellAbilityId() == 1093677360 or GetSpellAbilityId() == 1093677361 or GetSpellAbilityId() == 1093677362 or GetSpellAbilityId() == 1093677363
end

function Trig_Y_____________001Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1446360359, GetSpellAbilityId())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) > 0 then
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "生命恢复30%")
		if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093678137) == 1 then
			SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), GetUnitLifePercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 50.0)
		else
			SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), GetUnitLifePercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 30.0)
		end
		SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), GetUnitManaPercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 50.0)
		udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1446360359), 1, 218, "恢复30%的最大生命值和50%的最大魔法值 |n |c00fffc01当前剩余可用次数: " .. (I2S(udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. "|r")
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "没药了！")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_Y_____________001()
	gg_trg_Y_____________001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_Y_____________001, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_Y_____________001, Condition(Trig_Y_____________001Conditions))
	TriggerAddAction(gg_trg_Y_____________001, Trig_Y_____________001Actions)
end

function Trig_R_____________016Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDHT, 1227895350, 541453229, 1093677387)
	SaveInteger(YDHT, 1227895346, 541453229, 1093677364)
	SaveInteger(YDHT, 1227895348, 541453229, 1093677385)
	SaveInteger(YDHT, 1227895349, 541453229, 1093677386)
	SaveInteger(YDHT, 1227895352, 541453229, 1093677384)
	SaveInteger(YDHT, 1227895347, 541453229, 1093677365)
	SaveInteger(YDHT, 1227895351, 541453229, 1093677390)
	SaveInteger(YDHT, 1227895366, 541453229, 1093677616)
	SaveInteger(YDHT, 1227895361, 541453229, 1093677391)
	SaveInteger(YDHT, 1227895367, 541453229, 1093677617)
	SaveInteger(YDHT, 1227895619, 541453229, 1093677890)
	SaveInteger(YDHT, 1227895626, 541453229, 1093677379)
	SaveInteger(YDHT, 1227895627, 541453229, 1093677380)
	SaveInteger(YDHT, 1227895628, 541453229, 1093677891)
	SaveInteger(YDHT, 1227895863, 541453229, 1093677913)
	SaveInteger(YDHT, 1227895864, 541453229, 1093677914)
	SaveInteger(YDHT, 1227895874, 541453229, 1093678133)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895350
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895346
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895348
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895349
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895352
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895347
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895351
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895361
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895366
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895367
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895619
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895626
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895627
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895628
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895863
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895864
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_Skill_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895874
	udg_zhengskill = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_R_____________016()
	gg_trg_R_____________016 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg_R_____________016, 6.0)
	TriggerAddAction(gg_trg_R_____________016, Trig_R_____________016Actions)
end

function Trig_R_____________017Conditions()
	return HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 541453229) == true
end

function Trig_R_____________017Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if HopeChoice_DeferSkill(GetOwningPlayer(GetTriggerUnit()), LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 541453229)) then
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 541453229))
	if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677388 then
		UnitAddAbility(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))
		udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503)
		if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677616 then
			udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 15
			udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
		else
		end
		if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677380 then
			udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.3
			udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.2
		else
		end
	else
		HopeModern_Message(udg_Rskill_shifoutihuan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "是否替换当前R技能" .. (GetAbilityName(udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveInteger(YDHT, GetHandleId(udg_Rskill_shifoutihuan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]), -711261722, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))
		HopeModern_Add(udg_Rskill_shifoutihuan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "是")
		SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 1)
		HopeModern_Add(udg_Rskill_shifoutihuan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "否（不退还所消耗金钱和木材）")
		SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 2)
		HopeChoice_DialogDisplay(GetOwningPlayer(GetTriggerUnit()), udg_Rskill_shifoutihuan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_R_____________017()
	gg_trg_R_____________017 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_R_____________017, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg_R_____________017, Condition(Trig_R_____________017Conditions))
	TriggerAddAction(gg_trg_R_____________017, Trig_R_____________017Actions)
end

function Trig_R_____________018Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if HopeChoice_DialogClicked() then
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(HopeModern_GetPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296, LoadInteger(YDHT, GetHandleId(HopeModern_GetButton()), 54591090))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, LoadInteger(YDHT, GetHandleId(HopeModern_GetDialog()), -711261722))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 1 then
		if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677616 then
			udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 15
			udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.5
		else
		end
		if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677380 then
			udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.3
			udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.2
		else
		end
		UnitRemoveAbilityBJ(udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		UnitAddAbility(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))
		udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503)
		if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677616 then
			udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 15
			udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
		else
		end
		if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 1093677380 then
			udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.3
			udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.2
		else
		end
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1270894296) == 2 then
	else
	end
	HopeChoice_DialogClear(HopeModern_GetDialog())
	HopeChoice_ShowNextSkill(HopeModern_GetPlayer())
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_R_____________018()
	gg_trg_R_____________018 = CreateTrigger()
	TriggerRegisterDialogEvent(gg_trg_R_____________018, udg_Rskill_shifoutihuan[1])
	TriggerRegisterDialogEvent(gg_trg_R_____________018, udg_Rskill_shifoutihuan[2])
	TriggerRegisterDialogEvent(gg_trg_R_____________018, udg_Rskill_shifoutihuan[3])
	TriggerRegisterDialogEvent(gg_trg_R_____________018, udg_Rskill_shifoutihuan[4])
	TriggerRegisterDialogEvent(gg_trg_R_____________018, udg_Rskill_shifoutihuan[5])
	TriggerRegisterDialogEvent(gg_trg_R_____________018, udg_Rskill_shifoutihuan[6])
	TriggerAddAction(gg_trg_R_____________018, Trig_R_____________018Actions)
end

function Trig_RJN_______001Conditions()
	return GetSpellAbilityId() == 1093677364
end

function Trig_RJN_______001Func004Func012Func003T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_______001Func004Func012Func004T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_______001Func004Func012T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.3, false, Trig_RJN_______001Func004Func012Func003T)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_RJN_______001Func004Func012Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_RJN_______001Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32)) * 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.7, 0.03, 0, false, false, false, "origin", "", "")
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		TimerStart(ydl_timer, 1.0, false, Trig_RJN_______001Func004Func012T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN_______001()
	gg_trg_RJN_______001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_______001, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN_______001, Condition(Trig_RJN_______001Conditions))
	TriggerAddAction(gg_trg_RJN_______001, Trig_RJN_______001Actions)
end

function Trig_RJN_____________002Conditions()
	return GetSpellAbilityId() == 1093677365
end

function Trig_RJN_____________002Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if GetSpellAbilityId() == 1093677365 then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroInt(GetTriggerUnit(), true)) * 4.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		YDWESetUnitAbilityDataReal(GetTriggerUnit(), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), 1, 108, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_RJN_____________002()
	gg_trg_RJN_____________002 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_____________002, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
	TriggerAddCondition(gg_trg_RJN_____________002, Condition(Trig_RJN_____________002Conditions))
	TriggerAddAction(gg_trg_RJN_____________002, Trig_RJN_____________002Actions)
end

function Trig_RJN_______003Conditions()
	return GetSpellAbilityId() == 1093677384
end

function Trig_RJN_______003Func001Func010001001002()
	return IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig_RJN_______003Actions()
	HopeMeditation_Apply(GetTriggerUnit())
end

function InitTrig_RJN_______003()
	gg_trg_RJN_______003 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_______003, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN_______003, Condition(Trig_RJN_______003Conditions))
	TriggerAddAction(gg_trg_RJN_______003, Trig_RJN_______003Actions)
end

function Trig_RJN______004Conditions()
	return GetSpellAbilityId() == 1093677385
end

function Trig_RJN______004Func015T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 100 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 18.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 18.0)
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090) + 0, 2.0)))
		if SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090), 2.0)) <= 60.0 then
			DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
end

function Trig_RJN______004Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), 342818117))
	SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 342818117, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 1)
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 4.0 * (I2R(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) + 0))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1032314929, 1.0 / Pow(2.0, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817))))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1032314929))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + I2R(GetHeroAgi(GetTriggerUnit(), true)) / 100.0))
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
	SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
	SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090))
	TimerStart(ydl_timer, 0.03, true, Trig_RJN______004Func015T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN______004()
	gg_trg_RJN______004 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN______004, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN______004, Condition(Trig_RJN______004Conditions))
	TriggerAddAction(gg_trg_RJN______004, Trig_RJN______004Actions)
end

function Trig_RJN_____________________________________005Func004Func002Func012T()
	YDWETimerDestroyEffect(2, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "origin"))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_____________________________________005Func004Func002Func015T()
	local ydl_group
	local ydl_unit
	ydl_group = CreateGroup()
	GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 300.0, nil)
	for _ in _loop_() do
		ydl_unit = FirstOfGroup(ydl_group)
		if ydl_unit == nil then break end
		GroupRemoveUnit(ydl_group, ydl_unit)
		if IsUnitEnemy(ydl_unit, Player(0)) == true then
			YDWEJumpTimer(ydl_unit, GetRandomDirectionDeg(), 0.0, 0.5, 0.01, 300)
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
		else
		end
	end
	DestroyGroup(ydl_group)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
end

function Trig_RJN_____________________________________005Func004Func002Func016T()
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_____________________________________005Func005Func002Func020Func003Func002003003()
	return IsUnitAliveBJ(GetFilterUnit()) == true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))) == true
end

function Trig_RJN_____________________________________005Func005Func002Func020Func003Func004A()
	if IsUnitInGroup(GetEnumUnit(), LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968)) ~= true then
		GroupAddUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968), GetEnumUnit())
	else
	end
end

function Trig_RJN_____________________________________005Func005Func002Func020Func004A()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE)
end

function Trig_RJN_____________________________________005Func005Func002Func020T()
	local ydl_group
	local ydl_unit
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 7 then
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	end
	SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968, CreateGroup())
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 15
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 532205493, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), 80.0 * I2R(bj_forLoopAIndex), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)))
		SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988, YDWEGetUnitsInRangeOfLocMatchingNull(250.0, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 532205493), Condition(Trig_RJN_____________________________________005Func005Func002Func020Func003Func002003003)))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 532205493))
		ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988), Trig_RJN_____________________________________005Func005Func002Func020Func003Func004A)
		DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988))
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968), Trig_RJN_____________________________________005Func005Func002Func020Func004A)
	DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
end

function Trig_RJN_____________________________________005Actions()
	local hopeDebuffBefore
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	if GetSpellAbilityId() == 1093677386 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) - 999.0)
	else
	end
	if GetSpellAbilityId() == 1093677391 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), ConvertUnitState(32)) >= 0.0 then
			hopeDebuffBefore = GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), ConvertUnitState(32))
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)) - 15.0)
			HopeDebuff_RecordArmor(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), hopeDebuffBefore)
		else
		end
	else
	end
	if GetSpellAbilityId() == 1093677890 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
		if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
			udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
			DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(11))))
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroAgi(GetTriggerUnit(), true)) * 1.5)
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + I2R(GetHeroAgi(GetTriggerUnit(), true)) / 100.0))
			SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "attack")
			CreateNUnitsAtLoc(1, 1697656913, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 120.0)
			UnitAddAbilityBJ(1093677623, GetLastCreatedUnit())
			IssueTargetOrder(GetLastCreatedUnit(), "attackonce", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
			SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			YDWETimerRemoveUnit(3.0, GetLastCreatedUnit())
		else
			DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
		end
	else
	end
	if GetSpellAbilityId() == 1093677617 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
		if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
			udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
			DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetSpellTargetLoc())
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroStr(GetTriggerUnit(), true)) * 3.5)
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "spell")
			YDWEJumpTimer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)), DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)), 0.6, 0.01, 300)
			ydl_timer = CreateTimer()
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			TimerStart(ydl_timer, 0.6, false, Trig_RJN_____________________________________005Func004Func002Func012T)
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, GetLocationX(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
			ydl_timer = CreateTimer()
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
			TimerStart(ydl_timer, 0.7, false, Trig_RJN_____________________________________005Func004Func002Func015T)
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
			TimerStart(ydl_timer, 1.0, false, Trig_RJN_____________________________________005Func004Func002Func016T)
		else
			DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
		end
	else
	end
	if GetSpellAbilityId() == 1093677379 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
		if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetSpellTargetLoc())
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
			SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638)))
			udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
			DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -210439235, GetSpellAbilityId())
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true) * 6))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681, AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 92975974, AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), 300.0, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 92975974)))
			DestroyEffect(AddSpecialEffectLoc("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
			YDWETimerPatternRushSlide(GetTriggerUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 92975974), 200.0, 0.5, 0.03, 0, false, false, false, "origin", "", "")
			AddSpecialEffectLocBJ(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), "fect-02.mdx")
			EXEffectMatRotateZ(bj_lastCreatedEffect, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
			YDWETimerDestroyEffect(1.0, bj_lastCreatedEffect)
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -168352345, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 2066548968, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968))
			SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 339273988, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 339273988))
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 532205493, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
			TimerStart(ydl_timer, 0.2, false, Trig_RJN_____________________________________005Func005Func002Func020T)
		else
			DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
		end
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN_____________________________________005()
	gg_trg_RJN_____________________________________005 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_____________________________________005, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddAction(gg_trg_RJN_____________________________________005, Trig_RJN_____________________________________005Actions)
end

function Trig_RJN_______006Conditions()
	return GetSpellAbilityId() == 1093677387
end

function Trig_RJN_______006Func013Func005T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2099578670, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	if IsUnitAliveBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)) == true then
		YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2099578670), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304)), DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2099578670)), 0.5, 0.03, 0, false, false, false, "origin", "", "")
	else
	end
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2099578670))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_______006Func013T()
	local ydl_timer
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
	YDWEJumpTimer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)), 300.0, 0.7, 0.01, 300)
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1162754304, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 2099578670, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2099578670))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.8, false, Trig_RJN_______006Func013Func005T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_RJN_______006Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, LoadStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), -1661751302))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) * 4.0)
	if LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586) == "defend" or LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586) == "buff" then
		SaveStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), -1661751302, "1")
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) * 8.0)
	else
	end
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
	YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.5, 0.03, 0, false, false, false, "origin", "", "")
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1162754304, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1162754304))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 2099578670, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2099578670))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	TimerStart(ydl_timer, 0.5, false, Trig_RJN_______006Func013T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN_______006()
	gg_trg_RJN_______006 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_______006, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN_______006, Condition(Trig_RJN_______006Conditions))
	TriggerAddAction(gg_trg_RJN_______006, Trig_RJN_______006Actions)
end

function Trig_RJN_______013Conditions()
	return GetSpellAbilityId() == 1093678133
end

function Trig_RJN_______013Func003Func013T()
	SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1.0)
	SetUnitVertexColorBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), 100.0 - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) * 2.0, 100.0 - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) * 2.0, 100.0 - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) * 2.0, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) * 4.0)
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) > 25.0 then
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
		SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
	end
end

function Trig_RJN_______013Func003Func014Func008T()
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Orc\\Orcblood\\BattrollBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), -299321171, 1)
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_______013Func003Func014Func009T()
	SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], 120.0)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_RJN_______013Func003Func014T()
	local ydl_timer
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304), 100.0, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))))
	SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	SetUnitVertexColorBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), 100, 100, 100, 0.0)
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1162754304))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_RJN_______013Func003Func014Func008T)
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 1.0, false, Trig_RJN_______013Func003Func014Func009T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_RJN_______013Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, GetTriggerUnit(), true) * 5) + GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 2.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + I2R(GetHeroAgi(GetTriggerUnit(), true)) / 100.0))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetSpellTargetUnit(), GetTriggerUnit()), 150.0, 0.5, 0.03, 0, false, false, false, "origin", "", "")
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -68293548, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN_______013Func003Func013T)
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1162754304, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1162754304))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		TimerStart(ydl_timer, 0.8, false, Trig_RJN_______013Func003Func014T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN_______013()
	gg_trg_RJN_______013 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_______013, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN_______013, Condition(Trig_RJN_______013Conditions))
	TriggerAddAction(gg_trg_RJN_______013, Trig_RJN_______013Actions)
end

function Trig_RJN__________013Conditions()
	return GetSpellAbilityId() == 1093677914
end

function Trig_RJN__________013Func002Func009Func002Func004Func003003003()
	return IsUnitAliveBJ(GetFilterUnit()) == true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))) == true
end

function Trig_RJN__________013Func002Func009Func002Func004Func004A()
	if IsUnitEnemy(GetEnumUnit(), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))) == true then
		UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1062474422), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS)
	else
	end
end

function Trig_RJN__________013Func002Func009Func002Func004T()
	local ydl_group
	local ydl_unit
	AddSpecialEffectLocBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), "Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl")
	YDWETimerDestroyEffect(2.0, bj_lastCreatedEffect)
	SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1134131624, YDWEGetUnitsInRangeOfLocMatchingNull(250.0, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), Condition(Trig_RJN__________013Func002Func009Func002Func004Func003003003)))
	ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1134131624), Trig_RJN__________013Func002Func009Func002Func004Func004A)
	DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1134131624))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
end

function Trig_RJN__________013Func002Func009T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 6 then
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), GetRandomReal(0, 500.0), GetRandomDirectionDeg()))
		AddSpecialEffectLocBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), "Units\\Demon\\Infernal\\InfernalBirth.mdl")
		YDWETimerDestroyEffect(2.0, bj_lastCreatedEffect)
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1062474422, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1062474422))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), -1134131624, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1134131624))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		TimerStart(ydl_timer, 0.7, false, Trig_RJN__________013Func002Func009Func002Func004T)
	else
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_RJN__________013Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetSpellTargetLoc())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1062474422, I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true) * 1 * 3))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1062474422, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1062474422) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -168352345, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1062474422, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1062474422))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), -1134131624, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		TimerStart(ydl_timer, 0.2, true, Trig_RJN__________013Func002Func009T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN__________013()
	gg_trg_RJN__________013 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN__________013, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN__________013, Condition(Trig_RJN__________013Conditions))
	TriggerAddAction(gg_trg_RJN__________013, Trig_RJN__________013Actions)
end

function Trig_RJN_____________011Conditions()
	return GetSpellAbilityId() == 1093677891
end

function Trig_RJN_____________011Func004Func013Func002Func009T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 100 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 25.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 25.0)
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090) + 0, 2.0)))
		if SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090), 2.0)) <= 60.0 then
			DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
end

function Trig_RJN_____________011Func004Func013T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757))) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(2.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\DragonHawkMissile\\DragonHawkMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
		EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), 80.0)
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090))
		TimerStart(ydl_timer, 0.03, true, Trig_RJN_____________011Func004Func013Func002Func009T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_RJN_____________011Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 5.0 * (GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 300)
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		CreateTextTagUnitBJ((I2S(GetRandomInt(65, 110)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_RJN_____________011Func004Func013T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN_____________011()
	gg_trg_RJN_____________011 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN_____________011, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN_____________011, Condition(Trig_RJN_____________011Conditions))
	TriggerAddAction(gg_trg_RJN_____________011, Trig_RJN_____________011Actions)
end

function Trig_RJN___________________012Conditions()
	return GetSpellAbilityId() == 1093677913
end

function Trig_RJN___________________012Func002Func032T()
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 532205493) <= 20.0 then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 532205493, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 532205493) + 1)
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -112775636), "阿", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 532205493))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
end

function Trig_RJN___________________012Func002Func034T()
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1167319294) <= 20.0 then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 1167319294, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1167319294) + 1)
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1609340305), "修", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1167319294))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
end

function Trig_RJN___________________012Func002Func036T()
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -457628762) <= 20.0 then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -457628762, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -457628762) + 1)
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -993464515), "罗", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -457628762))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
end

function Trig_RJN___________________012Func002Func038T()
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -761250343) <= 20.0 then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -761250343, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -761250343) + 1)
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -282684207), "霸", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -761250343))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
end

function Trig_RJN___________________012Func002Func040T()
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 81053115) <= 20.0 then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 81053115, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 81053115) + 1)
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 844141781), "凰", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 81053115))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
end

function Trig_RJN___________________012Func002Func042Func001Func007A()
	CameraSetEQNoiseForPlayer(GetEnumPlayer(), 2.0)
end

function Trig_RJN___________________012Func002Func042Func001Func018T()
	SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Hero_dian[GetConvertedPlayerId(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))])
	if IsUnitAliveBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)) == true then
		SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
end

function Trig_RJN___________________012Func002Func042T()
	local ydl_timer
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 854790963) <= 20.0 then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 854790963, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 854790963) + 1)
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 749316953), "拳", LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 854790963))
	else
		YDWETimerDestroyTextTag(2.5, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -112775636))
		YDWETimerDestroyTextTag(2.5, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1609340305))
		YDWETimerDestroyTextTag(2.5, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -993464515))
		YDWETimerDestroyTextTag(2.5, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -282684207))
		YDWETimerDestroyTextTag(2.5, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 844141781))
		YDWETimerDestroyTextTag(2.5, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 749316953))
		ForForce(udg_WJZ, Trig_RJN___________________012Func002Func042Func001Func007A)
		UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), (GetUnitStateSwap(UNIT_STATE_MANA, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) * 0.04 + 1.0) * (7.5 * I2R(GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), true)) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
		YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)), 200.0, 0.25, 0.03, 0, false, false, false, "origin", "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", "")
		SetUnitManaBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), 0)
		AddSpecialEffectTargetUnitBJ("origin", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl")
		YDWETimerDestroyEffect(2, bj_lastCreatedEffect)
		AddSpecialEffectTargetUnitBJ("origin", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl")
		YDWETimerDestroyEffect(2, bj_lastCreatedEffect)
		AddSpecialEffectLocBJ(GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)), "Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl")
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), -100.0, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))))
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 1.0, false, Trig_RJN___________________012Func002Func042Func001Func018T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_RJN___________________012Func002Func044A()
	CameraClearNoiseForPlayer(GetEnumPlayer())
end

function Trig_RJN___________________012Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 2 then
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 3
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SetUnitPositionLoc(GetTriggerUnit(), PolarProjectionBJ(GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), 256, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), GetTriggerUnit())))
		CreateTextTagLocBJ(" ", PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), 250.0, 180.0), 0, 5.0, 0.0, 0.0, 0.0, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -112775636, GetLastCreatedTextTag())
		CreateTextTagLocBJ(" ", PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), 150.0, 180.0), 0, 5.0, 0.0, 0.0, 0.0, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1609340305, GetLastCreatedTextTag())
		CreateTextTagLocBJ(" ", PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), 50.0, 180.0), 0, 5.0, 0.0, 0.0, 0.0, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -993464515, GetLastCreatedTextTag())
		CreateTextTagLocBJ(" ", PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), 50.0, 0.0), 0, 5.0, 0.0, 0.0, 0.0, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -282684207, GetLastCreatedTextTag())
		CreateTextTagLocBJ(" ", PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), 150.0, 0.0), 0, 5.0, 0.0, 0.0, 0.0, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 844141781, GetLastCreatedTextTag())
		CreateTextTagLocBJ(" ", PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), 250.0, 0.0), 0, 5.0, 0.0, 0.0, 0.0, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 749316953, GetLastCreatedTextTag())
		SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1132341824, CreateTimer())
		SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -647782241, CreateTimer())
		SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -854572045, CreateTimer())
		SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -680649701, CreateTimer())
		SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -943650483, CreateTimer())
		SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -671760605, CreateTimer())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493, 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1167319294, 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -457628762, 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -761250343, 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 81053115, 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 854790963, 5.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1345957883, 1.0)
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		ydl_timer = LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1132341824)
		SaveReal(YDLOC, GetHandleId(ydl_timer), 532205493, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -112775636, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -112775636))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN___________________012Func002Func032T)
		TriggerSleepAction(0.1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		ydl_timer = LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -647782241)
		SaveReal(YDLOC, GetHandleId(ydl_timer), 1167319294, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1167319294))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -1609340305, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1609340305))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN___________________012Func002Func034T)
		TriggerSleepAction(0.1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		ydl_timer = LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -854572045)
		SaveReal(YDLOC, GetHandleId(ydl_timer), -457628762, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -457628762))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -993464515, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -993464515))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN___________________012Func002Func036T)
		TriggerSleepAction(0.1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		ydl_timer = LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -680649701)
		SaveReal(YDLOC, GetHandleId(ydl_timer), -761250343, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -761250343))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -282684207, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -282684207))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN___________________012Func002Func038T)
		TriggerSleepAction(0.1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		ydl_timer = LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -943650483)
		SaveReal(YDLOC, GetHandleId(ydl_timer), 81053115, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 81053115))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 844141781, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 844141781))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN___________________012Func002Func040T)
		TriggerSleepAction(0.1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		ydl_timer = LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -671760605)
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 854790963, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 854790963))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -112775636, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -112775636))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -1609340305, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1609340305))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -993464515, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -993464515))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -282684207, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -282684207))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 844141781, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 844141781))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 749316953, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 749316953))
		TimerStart(ydl_timer, 0.02, true, Trig_RJN___________________012Func002Func042T)
		TriggerSleepAction(2.0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		ForForce(udg_WJZ, Trig_RJN___________________012Func002Func044A)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_RJN___________________012()
	gg_trg_RJN___________________012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_RJN___________________012, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_RJN___________________012, Condition(Trig_RJN___________________012Conditions))
	TriggerAddAction(gg_trg_RJN___________________012, Trig_RJN___________________012Actions)
end

function Trig_X__________041Conditions()
	return GetSpellAbilityId() == 1093678384 or GetSpellAbilityId() == 1093678168 or GetSpellAbilityId() == 1093678388 or GetSpellAbilityId() == 1093678169
end

function Trig_X__________041Func005Func005Func005Func003T()
	UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_MEDIUM_CHOP)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_X__________041Func005Func005Func005Func004T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923, DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_X__________041Func005Func005Func005T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_X__________041Func005Func005Func005Func003T)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_X__________041Func005Func005Func005Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_X__________041Func005Func006Func005Func003Func003T()
	UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_MEDIUM_CHOP)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_X__________041Func005Func006Func005Func003T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_MEDIUM_CHOP)
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_X__________041Func005Func006Func005Func003Func003T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_X__________041Func005Func006Func005Func004T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923, DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_X__________041Func005Func006Func005T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_X__________041Func005Func006Func005Func003T)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_X__________041Func005Func006Func005Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_X__________041Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SetUnitAnimation(GetTriggerUnit(), "attack")
		if GetSpellAbilityId() == 1093678168 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)) - 100.0)
			YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.65, 0.03, 0, false, false, false, "origin", "", "")
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -730831923))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
			TimerStart(ydl_timer, 0.8, false, Trig_X__________041Func005Func005Func005T)
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, 10.0 + udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))
			YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
			CreateTextTagUnitBJ("护甲+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 5.0, 15.0, 100, 100, 100, 0)
			SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
			YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
		else
		end
		if GetSpellAbilityId() == 1093678388 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 0.85 * (GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)) - 100.0)
			YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.65, 0.03, 0, false, false, false, "origin", "", "")
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -730831923))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
			TimerStart(ydl_timer, 0.8, false, Trig_X__________041Func005Func006Func005T)
		else
		end
		if GetSpellAbilityId() == 1093678169 then
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493, GetSpellTargetLoc())
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.25 * (GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0))
			CreateNUnitsAtLoc(1, 1747988530, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), 120.0)
			UnitAddAbilityBJ(1093678170, GetLastCreatedUnit())
			IssuePointOrderLoc(GetLastCreatedUnit(), "shockwave", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493))
			YDWETimerRemoveUnit(3.0, GetLastCreatedUnit())
			SaveReal(YDHT, GetHandleId(GetLastCreatedUnit()), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493))
		else
		end
		if GetSpellAbilityId() == 1093678384 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.5 * (GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			YDWESetUnitAbilityDataReal(GetTriggerUnit(), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), 1, 108, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		else
		end
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_X__________041()
	gg_trg_X__________041 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_X__________041, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_X__________041, Condition(Trig_X__________041Conditions))
	TriggerAddAction(gg_trg_X__________041, Trig_X__________041Actions)
end

function Trig____________________001_______uConditions()
	return RectContainsUnit(gg_rct______________000, GetTriggerUnit()) == true and GetSpellAbilityId() == 1093677105
end

function Trig____________________001_______uFunc005T()
	if RectContainsUnit(gg_rct______________017, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) == false and RectContainsUnit(gg_rct______________016, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) == false then
		SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], 120.0)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________001_______uFunc006T()
	if RectContainsUnit(gg_rct______________017, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) == false and RectContainsUnit(gg_rct______________016, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) == false then
		SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], 120.0)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________001_______uFunc015Func002Func005Func001A()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_COLD)
end

function Trig____________________001_______uFunc015Func002Func005T()
	local ydl_group
	local ydl_unit
	ForGroupBJ(udg_Guaiwu_dwz, Trig____________________001_______uFunc015Func002Func005Func001A)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
end

function Trig____________________001_______uFunc019T()
	ForceRemovePlayer(udg_WJZ_______weizhunbei, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	if CountPlayersInForceBJ(udg_WJZ_______weizhunbei) == 0 then
		ConditionalTriggerExecute(gg_trg______________003)
		DisplayTextToPlayer(Player(0), 0, 0, "敌方回合")
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________001_______uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 342818117, 0)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	TimerStart(ydl_timer, 1.0, false, Trig____________________001_______uFunc005T)
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	TimerStart(ydl_timer, 2.0, false, Trig____________________001_______uFunc006T)
	CreateTextTagUnitBJ("回合结束", GetTriggerUnit(), -5.0, 15.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
	YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
	UnitResetCooldown(GetTriggerUnit())
	if udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] ~= 0.0 then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
	else
	end
	HopeMeditation_Clear(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	udg_Linshi_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
	udg_Ls_zj_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
	if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093677907) > 0 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true) + GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true) + GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == ModuloInteger(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034), 10) then
			YDWETimerDestroyEffect(2, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1) * I2R(GetHeroStr(GetTriggerUnit(), true) + GetHeroAgi(GetTriggerUnit(), true) + GetHeroInt(GetTriggerUnit(), true)))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) / 200.0)))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			ydl_timer = CreateTimer()
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			TimerStart(ydl_timer, 0.5, false, Trig____________________001_______uFunc015Func002Func005T)
		else
		end
	else
	end
	if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093678150) > 0 and udg_ZhandouZhong == true then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] * 10)
		udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558)
		if udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 100 then
			udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558)
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, 100 - udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 100
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558) > 0 then
			AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558), ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), PLAYER_STATE_RESOURCE_GOLD)
			AddHeroXPSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
		else
		end
	else
	end
	PauseUnitBJ(true, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SetUnitVertexColorBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 50.0, 50.0, 50.0, 0)
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	TimerStart(ydl_timer, 1.0, false, Trig____________________001_______uFunc019T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig____________________001_______u()
	gg_trg____________________001_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________001_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg____________________001_______u, Condition(Trig____________________001_______uConditions))
	TriggerAddAction(gg_trg____________________001_______u, Trig____________________001_______uActions)
end

function Trig______________0012Conditions()
	return IsUnitAlly(GetTriggerUnit(), Player(0)) == true and IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true
end

function Trig______________0012Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	ForceRemovePlayerSimple(GetOwningPlayer(GetTriggerUnit()), udg_WJZ_______weizhunbei)
	ForceRemovePlayerSimple(GetOwningPlayer(GetTriggerUnit()), udg_WJZ_______cunhuo)
	ForceAddPlayerSimple(GetOwningPlayer(GetTriggerUnit()), udg_WJZ_______siwang)
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		if IsUnitAliveBJ(udg_hero[bj_forLoopAIndex]) == true then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 690231728, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 690231728) + 1)
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 690231728) == 0 then
		DisplayTextToForce(GetPlayersAll(), "所有玩家死亡，游戏失败！")
		TriggerSleepAction(10.0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = 6
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			CustomDefeatBJ(ConvertedPlayer(bj_forLoopAIndex), "失败!")
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig______________0012()
	gg_trg______________0012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg______________0012, EVENT_PLAYER_UNIT_DEATH)
	TriggerAddCondition(gg_trg______________0012, Condition(Trig______________0012Conditions))
	TriggerAddAction(gg_trg______________0012, Trig______________0012Actions)
end

function Trig______________003Func005003002()
	return IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig______________003Func006A()
	local hopePoisonBefore = 0.0
	local hopePoisonActual = 0.0
	local hopePoisonTicked = false
	SetUnitState(GetEnumUnit(), ConvertUnitState(32), LoadReal(YDHT, GetUnitTypeId(GetEnumUnit()), 1932103989))
	HopeDebuff_ClearArmor(GetEnumUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -364137826, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), -374736685))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -364137826)) * (GetUnitState(udg_hero[1], ConvertUnitState(20)) * 0.3) * I2R(GetUnitAbilityLevelSwapped(1093677653, udg_hero[1])))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746) > 0.0 then
		hopePoisonBefore = RMaxBJ(0.0, GetWidgetLife(GetEnumUnit()))
		hopePoisonTicked = true
		UnitDamageTargetBJ(udg_hero[1], GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_POISON)
		hopePoisonActual = hopePoisonActual + RMaxBJ(0.0, hopePoisonBefore - RMaxBJ(0.0, GetWidgetLife(GetEnumUnit())))
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), -374736685, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -364137826) - 1)
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", GetEnumUnit(), "origin"))
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1215590983, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 806467174))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1215590983)) * (GetUnitState(udg_hero[2], ConvertUnitState(20)) * 0.3) * I2R(GetUnitAbilityLevel(udg_hero[2], 1093677653)))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746) > 0.0 then
		hopePoisonBefore = RMaxBJ(0.0, GetWidgetLife(GetEnumUnit()))
		hopePoisonTicked = true
		UnitDamageTargetBJ(udg_hero[2], GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_POISON)
		hopePoisonActual = hopePoisonActual + RMaxBJ(0.0, hopePoisonBefore - RMaxBJ(0.0, GetWidgetLife(GetEnumUnit())))
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 806467174, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1215590983) - 1)
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", GetEnumUnit(), "origin"))
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 232942618, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 370822118))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 232942618)) * (GetUnitState(udg_hero[3], ConvertUnitState(20)) * 0.3) * I2R(GetUnitAbilityLevel(udg_hero[3], 1093677653)))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746) > 0.0 then
		hopePoisonBefore = RMaxBJ(0.0, GetWidgetLife(GetEnumUnit()))
		hopePoisonTicked = true
		UnitDamageTargetBJ(udg_hero[3], GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_POISON)
		hopePoisonActual = hopePoisonActual + RMaxBJ(0.0, hopePoisonBefore - RMaxBJ(0.0, GetWidgetLife(GetEnumUnit())))
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 370822118, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 232942618) - 1)
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", GetEnumUnit(), "origin"))
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1071027130, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 67668322))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1071027130)) * (GetUnitState(udg_hero[4], ConvertUnitState(20)) * 0.3) * I2R(GetUnitAbilityLevelSwapped(1093677653, udg_hero[4])))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746) > 0.0 then
		hopePoisonBefore = RMaxBJ(0.0, GetWidgetLife(GetEnumUnit()))
		hopePoisonTicked = true
		UnitDamageTargetBJ(udg_hero[4], GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_POISON)
		hopePoisonActual = hopePoisonActual + RMaxBJ(0.0, hopePoisonBefore - RMaxBJ(0.0, GetWidgetLife(GetEnumUnit())))
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 67668322, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1071027130) - 1)
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", GetEnumUnit(), "origin"))
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 540673469, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), -1058892367))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 540673469)) * (GetUnitState(udg_hero[5], ConvertUnitState(20)) * 0.3) * I2R(GetUnitAbilityLevel(udg_hero[5], 1093677653)))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746) > 0.0 then
		hopePoisonBefore = RMaxBJ(0.0, GetWidgetLife(GetEnumUnit()))
		hopePoisonTicked = true
		UnitDamageTargetBJ(udg_hero[5], GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_POISON)
		hopePoisonActual = hopePoisonActual + RMaxBJ(0.0, hopePoisonBefore - RMaxBJ(0.0, GetWidgetLife(GetEnumUnit())))
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), -1058892367, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 540673469) - 1)
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", GetEnumUnit(), "origin"))
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 682811129, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 1622058564))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 682811129)) * (GetUnitState(udg_hero[6], ConvertUnitState(20)) * 0.3) * I2R(GetUnitAbilityLevel(udg_hero[6], 1093677653)))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746) > 0.0 then
		hopePoisonBefore = RMaxBJ(0.0, GetWidgetLife(GetEnumUnit()))
		hopePoisonTicked = true
		UnitDamageTargetBJ(udg_hero[6], GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 517595746), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_POISON)
		hopePoisonActual = hopePoisonActual + RMaxBJ(0.0, hopePoisonBefore - RMaxBJ(0.0, GetWidgetLife(GetEnumUnit())))
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 1622058564, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 682811129) - 1)
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdl", GetEnumUnit(), "origin"))
	else
	end
	if hopePoisonTicked then
		HopeStatus_RecordPoison(GetEnumUnit(), hopePoisonActual)
	end
end

function Trig______________003Func008Func001003002()
	return IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig______________003Func008Func002Func004Func006Func001Func010T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 66 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 18.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 18.0)
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090) + 0, 2.0)))
		if SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090), 2.0)) <= 60.0 then
			DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
end

function Trig______________003Func008Func002Func004Func006Func004Func003T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig______________003Func008Func002Func004Func006Func004T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig______________003Func008Func002Func004Func006Func004Func003T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig______________003Func008Func002Func009T()
	PauseUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), true)
	HopeIntent_SetPhase(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), 2)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig______________003Func008T()
	local ydl_timer
	if CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988)) == 0 then
		DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988))
		ConditionalTriggerExecute(gg_trg______________0001)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430, FirstOfGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988)))
		PauseUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), false)
		HopeIntent_SetPhase(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), 1)
		SaveStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586, LoadStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), -1661751302))
		if LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586) == "attack" and IsUnitAliveBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)) == true then
			SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
			SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766, LoadUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), -272485038))
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)))
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), -1820993401))
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 240964279, false)
			if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), ConvertUnitState(22)) > 400.0 then
				SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
				SaveStr(YDLOC, GetHandleId(GetExpiredTimer()), 1601138186, LoadStr(YDHT, GetUnitTypeId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), -1951079047))
				SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
				SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318, AddSpecialEffectLoc(LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 1601138186), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
				EXEffectMatRotateZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681))
				EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), 50.0)
				ydl_timer = CreateTimer()
				SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
				SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681))
				SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
				SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
				SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558))
				SaveReal(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586))
				SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
				SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090))
				TimerStart(ydl_timer, 0.03, true, Trig______________003Func008Func002Func004Func006Func001Func010T)
			else
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, YDWEDistanceBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)) - 80.0)
				YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
				ydl_timer = CreateTimer()
				SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
				SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
				SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
				SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
				TimerStart(ydl_timer, 0.8, false, Trig______________003Func008Func002Func004Func006Func004T)
			end
		else
		end
		if LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586) == "defend" then
			SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), -1559201479))
			YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), "origin"))
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)) + LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
			CreateTextTagUnitBJ("护甲+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), 5.0, 15.0, 100, 100, 100, 0)
			SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
			YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
		else
		end
		if LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586) == "buff" then
			SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), 400320547))
			YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), "origin"))
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), ConvertUnitState(19), GetUnitStateSwap(ConvertUnitState(19), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)) + LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
			CreateTextTagUnitBJ("攻击+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), 5.0, 15.0, 100, 100, 100, 0)
			SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
			YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
		else
		end
		if LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586) == "skill" then
			SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
			HopeChallenge_PrepareSkill(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
			IssueImmediateOrderById(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), 852526)
		else
		end
		GroupRemoveUnitSimple(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988))
		ydl_timer = CreateTimer()
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
		TimerStart(ydl_timer, 1.0, false, Trig______________003Func008Func002Func009T)
	end
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 20 then
		DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988))
		ConditionalTriggerExecute(gg_trg______________0001)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	end
	ydl_timer = nil
end

function Trig______________003Actions()
	local ydl_group
	local ydl_unit
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	CreateTextTagLocBJ("" .. "敌方" .. "回合开始", udg_dtzhongxindian[1], 0, 20.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
	YDWETimerDestroyTextTag(3.0, GetLastCreatedTextTag())
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		if udg_hero[bj_forLoopAIndex] ~= nil then
			SetUnitVertexColorBJ(udg_hero[bj_forLoopAIndex], 100.0, 100.0, 100.0, 0)
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624, YDWEGetUnitsOfPlayerMatchingNull(Player(11), Condition(Trig______________003Func005003002)))
	ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624), Trig______________003Func006A)
	DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624))
	ydl_timer = CreateTimer()
	SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 339273988, YDWEGetUnitsOfPlayerMatchingNull(Player(11), Condition(Trig______________003Func008Func001003002)))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
	SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
	SaveStr(YDLOC, GetHandleId(ydl_timer), 1601138186, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1601138186))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
	SaveStr(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090))
	TimerStart(ydl_timer, 1.5, true, Trig______________003Func008T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_group = nil
	ydl_unit = nil
	ydl_timer = nil
end

function InitTrig______________003()
	gg_trg______________003 = CreateTrigger()
	TriggerAddAction(gg_trg______________003, Trig______________003Actions)
end

function Trig______________0001Func007A()
	if RectContainsUnit(gg_rct______________000, GetEnumUnit()) == false then
		SetUnitPositionLoc(GetEnumUnit(), udg_Boss_dian[1])
	else
	end
	PauseUnit(GetEnumUnit(), true)
	SetUnitManaPercentBJ(GetEnumUnit(), 100)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430, GetEnumUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 5290936, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 789842799))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 5290936) <= 2 then
		if GetRandomInt(1, 3) == 1 then
			SaveStr(YDHT, GetHandleId(GetEnumUnit()), -1661751302, "buff")
			SaveReal(YDHT, GetHandleId(GetEnumUnit()), 400320547, 1.0 + 0.15 * LoadReal(YDHT, GetHandleId(GetEnumUnit()), 1069445209))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)), 400320547))
		else
			SaveStr(YDHT, GetHandleId(GetEnumUnit()), -1661751302, "attack")
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(ForcePickRandomPlayer(udg_WJZ_______cunhuo)))
			SaveUnitHandle(YDHT, GetHandleId(GetEnumUnit()), -272485038, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
			SaveReal(YDHT, GetHandleId(GetEnumUnit()), -1820993401, GetUnitStateSwap(ConvertUnitState(20), GetEnumUnit()) + GetRandomReal(-1.0, 2.0 * I2R(GetUnitLevel(GetEnumUnit()))))
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766, LoadUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)), -272485038))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)), -1820993401))
		end
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 789842799, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 5290936) + GetRandomInt(1, 2))
	else
		SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 789842799, 0)
		if HaveSavedString(YDHT, GetUnitTypeId(GetEnumUnit()), 715936045) == true then
			SaveStr(YDHT, GetHandleId(GetEnumUnit()), -1661751302, "skill")
		else
			if GetRandomInt(1, 2) == 1 then
				SaveStr(YDHT, GetHandleId(GetEnumUnit()), -1661751302, "buff")
				SaveReal(YDHT, GetHandleId(GetEnumUnit()), 400320547, 1.0 + 0.15 * LoadReal(YDHT, GetHandleId(GetEnumUnit()), 1069445209))
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)), 400320547))
			else
				SaveStr(YDHT, GetHandleId(GetEnumUnit()), -1661751302, "defend")
				SaveReal(YDHT, GetHandleId(GetEnumUnit()), -1559201479, 10.0 + 5.0 * I2R(GetUnitLevel(GetEnumUnit())))
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)), -1559201479))
			end
		end
	end
	HopeIntent_SetPhase(GetEnumUnit(), 0)
end

function Trig______________0001Actions()
	local ydl_group
	local ydl_unit
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	TriggerSleepAction(1.0)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	udg_huihe_s = udg_huihe_s + 1
	HopeChallenge_NextTurn()
	CreateTextTagLocBJ("第" .. (I2S(udg_huihe_s) or "") .. "回合开始", udg_dtzhongxindian[1], 0, 20.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
	YDWETimerDestroyTextTag(3.0, GetLastCreatedTextTag())
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		if udg_hero[bj_forLoopAIndex] ~= nil then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, bj_forLoopAIndex)
			udg_xingdong_dian[bj_forLoopAIndex] = udg_xingdong_dianSx[bj_forLoopAIndex]
			DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
			SetUnitState(udg_hero[bj_forLoopAIndex], ConvertUnitState(32), 0.0)
			if udg_huihe_huilan[bj_forLoopAIndex] > 0.0 then
				YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl", udg_hero[bj_forLoopAIndex], "origin"))
				SetUnitManaBJ(udg_hero[bj_forLoopAIndex], GetUnitStateSwap(UNIT_STATE_MANA, udg_hero[bj_forLoopAIndex]) + udg_huihe_huilan[bj_forLoopAIndex])
			else
			end
			if GetUnitAbilityLevel(udg_hero[bj_forLoopAIndex], 1093677902) > 0 and GetUnitLifePercent(udg_hero[bj_forLoopAIndex]) <= 50.0 then
				SetUnitState(udg_hero[bj_forLoopAIndex], ConvertUnitState(32), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(32)) + I2R(GetHeroAgi(udg_hero[bj_forLoopAIndex], true)) / 2.0)
			else
			end
			if GetUnitAbilityLevel(udg_Yiwu_danwei[bj_forLoopAIndex], 1093678145) > 0 and (udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 2.8 or udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 2.8 or udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 2.8) and udg_huihe_s == 2 and udg_Zuizhong_Dm_Hh_jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] <= 0.0 then
				YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Disenchant\\DisenchantSpecialArt.mdl", udg_hero[bj_forLoopAIndex], "origin"))
				udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
				udg_Zuizhong_Dm_Hh_jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm_Hh_jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
			else
			end
			if GetUnitAbilityLevel(udg_Yiwu_danwei[bj_forLoopAIndex], 1093677382) > 0 and udg_huihe_s == 1 then
				if GetUnitAbilityLevel(udg_hero[bj_forLoopAIndex], 1093678147) == 0 then
					UnitAddAbilityBJ(1093678147, udg_hero[bj_forLoopAIndex])
				else
				end
			else
			end
			PauseUnitBJ(false, udg_hero[bj_forLoopAIndex])
			if IsUnitAliveBJ(udg_hero[bj_forLoopAIndex]) == true then
				ForceAddPlayerSimple(ConvertedPlayer(bj_forLoopAIndex), udg_WJZ_______weizhunbei)
			else
			end
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	ForGroupBJ(udg_Guaiwu_dwz, Trig______________0001Func007A)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig______________0001()
	gg_trg______________0001 = CreateTrigger()
	TriggerAddAction(gg_trg______________0001, Trig______________0001Actions)
end

function Trig__________________________0002Conditions()
	return GetOwningPlayer(GetTriggerUnit()) == Player(11)
end

function Trig__________________________0002Func002Func003A()
	AdjustPlayerStateBJ(10, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
end

function Trig__________________________0002Func017A()
	AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -170615977), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	if GetUnitAbilityLevel(udg_Yiwu_danwei[GetConvertedPlayerId(GetEnumPlayer())], 1093677649) > 0 then
		AdjustPlayerStateBJ(10, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	else
	end
	AddHeroXPSwapped(10 * GetUnitLevel(GetTriggerUnit()), udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
end

function Trig__________________________0002Func018Func004T()
	udg_Guaiwu_Fuhuo_Zhong = udg_Guaiwu_Fuhuo_Zhong - 1
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)))
	CreateNUnitsAtLoc(1, GetUnitTypeId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)), Player(11), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), 240.0)
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", GetLastCreatedUnit(), "overhead"))
	GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
	PauseUnit(GetLastCreatedUnit(), true)
	RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig__________________________0002Func019Func007A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SaveInteger(YDHT, GetHandleId(udg_hero[GetConvertedPlayerId(GetEnumPlayer())]), 342818117, 0)
	PauseUnitBJ(false, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	HopeMeditation_Clear(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260))
	udg_Linshi_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = 0
	udg_Ls_zj_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = 0
	udg_Moyu_Limit[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = 0
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
	if GetUnitTypeId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)) == 1211117637 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1611510599, GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 1093678161) + 1)
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)), 812780749, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1611510599))
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -689684256, LoadTextTagHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)), 46981737))
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 757068166, (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1611510599)) or "") .. "/" .. (I2S(GetUnitAbilityLevelSwapped(1093678161, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)) + 1) or ""))
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -689684256), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 757068166), 10)
	else
	end
	if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093677644) > 0 then
		AdjustPlayerStateBJ(1, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
	else
	end
	AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -765671455) + udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	DisplayTextToPlayer(GetEnumPlayer(), 0, 0, "战斗胜利！获得金钱奖励" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -765671455)) or "") .. (YDWEGetPlayerColorString(Player(4), "额外奖励：" .. (I2S(udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) or "")) or ""))
	AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 399424136), GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
	if IsUnitDeadBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) == true or IsPlayerInForce(GetEnumPlayer(), udg_WJZ_______siwang) == true then
		ReviveHeroLoc(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], true)
		SetUnitLifePercentBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 20.0)
		ForceAddPlayerSimple(GetEnumPlayer(), udg_WJZ_______cunhuo)
		ForceRemovePlayerSimple(GetEnumPlayer(), udg_WJZ_______siwang)
	else
	end
	if GetUnitAbilityLevel(udg_Yiwu_danwei[GetConvertedPlayerId(GetEnumPlayer())], 1093677650) > 0 then
		SetUnitLifePercentBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], GetUnitLifePercent(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) + 10.0)
	else
	end
	if GetUnitAbilityLevel(udg_hero[GetConvertedPlayerId(GetEnumPlayer())], 1093678402) > 0 then
		SetUnitLifeBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], GetUnitStateSwap(UNIT_STATE_LIFE, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) + 20.0)
	else
	end
	if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093678145) > 0 and udg_Zuizhong_Dm_Hh_jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] > 0.0 then
		udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] - 0.5
		udg_Zuizhong_Dm_Hh_jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Zuizhong_Dm_Hh_jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] - 0.5
	else
	end
	if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093678146) > 0 and (GetUnitTypeId(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) == 1311781174 or GetUnitTypeId(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) == 1311780919) and udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] <= 1.6 and udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] <= 1.6 then
		udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + 0.03
		udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + 0.03
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], bj_MODIFYMETHOD_ADD, 3)
	else
	end
	if GetUnitAbilityLevel(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093677902) > 0 then
		SetUnitLifePercentBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], GetUnitLifePercent(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) + 5.0)
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], bj_MODIFYMETHOD_ADD, 1)
	else
	end
	if HaveSavedBoolean(YDHT, GetHandleId(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]), -364772706) == true then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
		udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] - 1.0
		ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_MODIFYMETHOD_SUB, 200)
		ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_MODIFYMETHOD_SUB, 200)
		ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_MODIFYMETHOD_SUB, 200)
		RemoveSavedBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)), -364772706)
	else
	end
end

function Trig__________________________0002Func019Func008Func002T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 30 then
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
	end
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, PolarProjectionBJ(udg_dtzhongxindian[1], GetRandomReal(0, 700.0), GetRandomDirectionDeg()))
	if GetRandomInt(1, 2) == 1 then
		YDWETimerDestroyEffect(2, AddSpecialEffectLoc("Abilities\\Spells\\Human\\Flare\\FlareTarget.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
	else
		YDWETimerDestroyEffect(2, AddSpecialEffectLoc("Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
	end
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
end

function Trig__________________________0002Func019Func008Func006A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	udg_Wj_jf[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_Wj_jf[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 240652701)
	DzAPI_Map_StoreInteger(GetEnumPlayer(), "boss_jf", udg_Wj_jf[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	HopeMeta_Earn(GetEnumPlayer(), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 240652701), true)
end

function Trig__________________________0002Func019Func008Func007T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 30 then
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
	end
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, PolarProjectionBJ(udg_dtzhongxindian[1], GetRandomReal(0, 700.0), GetRandomDirectionDeg()))
	if GetRandomInt(1, 2) == 1 then
		YDWETimerDestroyEffect(2, AddSpecialEffectLoc("Abilities\\Spells\\Human\\Flare\\FlareTarget.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
	else
		YDWETimerDestroyEffect(2, AddSpecialEffectLoc("Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
	end
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
end

function Trig__________________________0002Func019Func008Func009T()
	ConditionalTriggerExecute(gg_trg_________________011)
end

function Trig__________________________0002Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	GroupRemoveUnitSimple(GetTriggerUnit(), udg_Guaiwu_dwz)
	if udg_Guaiwu_jsshu > 40 then
		DisplayTextToForce(GetPlayersAll(), "击杀满40个小怪，获得10金币补给（不产永久积分）")
		ForForce(udg_WJZ, Trig__________________________0002Func002Func003A)
		udg_Guaiwu_jsshu = 0
	else
		udg_Guaiwu_jsshu = udg_Guaiwu_jsshu + 1
	end
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, GetUnitLevel(GetTriggerUnit()) * 6)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, _idiv_(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977), CountPlayersInForceBJ(udg_WJZ)))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977) + 1)
	CreateTextTagUnitBJ(YDWEGetPlayerColorString(Player(4), "+" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977)) or "")), GetTriggerUnit(), 0, 10, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 32.0, 90.0)
	YDWETimerDestroyTextTag(2.0, GetLastCreatedTextTag())
	FlushChildHashtable(YDHT, GetHandleId(GetTriggerUnit()))
	HopeStatus_ClearHistory(GetTriggerUnit())
	if GetUnitAbilityLevel(udg_Yiwu_danwei[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], 1093677625) > 0 then
		if IsUnitAliveBJ(udg_hero[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))]) == true then
			SetUnitState(udg_hero[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], UNIT_STATE_LIFE, GetUnitState(udg_hero[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], UNIT_STATE_LIFE) + 5.0)
		else
		end
	else
	end
	if GetUnitAbilityLevel(udg_Yiwu_danwei[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], 1093677377) > 0 then
		SetUnitState(udg_hero[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], ConvertUnitState(18), GetUnitState(udg_hero[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))], ConvertUnitState(18)) + 1.0)
		udg_Gongjili_Jc[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))] = udg_Gongjili_Jc[GetConvertedPlayerId(GetOwningPlayer(GetKillingUnitBJ()))] + 1
	else
	end
	ForForce(udg_WJZ, Trig__________________________0002Func017A)
	if udg_Guaiwu_Fuhuo_cs > 0 then
		udg_Guaiwu_Fuhuo_cs = udg_Guaiwu_Fuhuo_cs - 1
		udg_Guaiwu_Fuhuo_Zhong = udg_Guaiwu_Fuhuo_Zhong + 1
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))
		TimerStart(ydl_timer, 1.0, false, Trig__________________________0002Func018Func004T)
	else
	end
	if CountUnitsInGroup(udg_Guaiwu_dwz) == 0 and udg_Guaiwu_Fuhuo_cs == 0 and udg_Guaiwu_Fuhuo_Zhong == 0 then
		if HaveSavedInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460) == false then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -765671455, 30)
		else
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -765671455, 80)
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 399424136, 2)
		end
		CreateTextTagLocBJ("战斗胜利！获得金钱奖励", udg_dtzhongxindian[1], 0, 20.0, 100, 100, 100, 0)
		SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
		YDWETimerDestroyTextTag(3.0, GetLastCreatedTextTag())
		udg_ZhandouZhong = false
		ConditionalTriggerExecute(gg_trg_____________________________028_______u)
		ForForce(udg_WJZ, Trig__________________________0002Func019Func007A)
		if udg_Youxi_xzgq == gg_unit_n00N_0023 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 240652701, HopeChallenge_BossPoints())
			DisplayTextToForce(GetPlayersAll(), "恭喜你们击杀BOSS,获得boss积分:" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 240652701)) or ""))
			ForForce(udg_WJZ, Trig__________________________0002Func019Func008Func006A)
			ConditionalTriggerExecute(gg_trg_X_____________004)
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
			TimerStart(ydl_timer, 0.1, true, Trig__________________________0002Func019Func008Func002T)
			ConditionalTriggerExecute(gg_trg_______1_______0001)
		else
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
			TimerStart(ydl_timer, 0.1, true, Trig__________________________0002Func019Func008Func007T)
			ConditionalTriggerExecute(gg_trg_______1_______0001)
			ydl_timer = CreateTimer()
			TimerStart(ydl_timer, 2.0, false, Trig__________________________0002Func019Func008Func009T)
		end
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig__________________________0002()
	gg_trg__________________________0002 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg__________________________0002, EVENT_PLAYER_UNIT_DEATH)
	TriggerAddCondition(gg_trg__________________________0002, Condition(Trig__________________________0002Conditions))
	TriggerAddAction(gg_trg__________________________0002, Trig__________________________0002Actions)
end

function Trig________________________________028Func001A()
	SetItemDroppable(GetEnumItem(), false)
end

function Trig________________________________028Func003A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		SetItemDroppable(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_forLoopBIndex), false)
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_Bei_bao_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		SetItemDroppable(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_forLoopBIndex), false)
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
end

function Trig________________________________028Actions()
	EnumItemsInRectBJ(gg_rct______________000, Trig________________________________028Func001A)
	HopeThird_Reset()
	HopeMonk_Reset()
	HopeBattle_Cleanup()
	udg_ZhandouZhong = true
	ForForce(udg_WJZ, Trig________________________________028Func003A)
end

function InitTrig________________________________028()
	gg_trg________________________________028 = CreateTrigger()
	TriggerAddAction(gg_trg________________________________028, Trig________________________________028Actions)
end

function Trig_____________________________028_______uFunc001A()
	SetItemDroppable(GetEnumItem(), true)
end

function Trig_____________________________028_______uFunc003A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		SetItemDroppable(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_forLoopBIndex), true)
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_Bei_bao_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		SetItemDroppable(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), bj_forLoopBIndex), true)
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
end

function Trig_____________________________028_______uActions()
	EnumItemsInRectBJ(gg_rct______________000, Trig_____________________________028_______uFunc001A)
	udg_ZhandouZhong = false
	HopeBattle_Cleanup()
	ForForce(udg_WJZ, Trig_____________________________028_______uFunc003A)
end

function InitTrig_____________________________028_______u()
	gg_trg_____________________________028_______u = CreateTrigger()
	TriggerAddAction(gg_trg_____________________________028_______u, Trig_____________________________028_______uActions)
end

function Trig____________________005Conditions()
	return GetEventDamage() > 0.0 and GetOwningPlayer(GetEventDamageSource()) ~= Player(PLAYER_NEUTRAL_AGGRESSIVE)
end

function Trig____________________005Func006Func004Func001T()
	CreateTextTagUnitBJ("疾风连击！", udg_hero[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], 5.0, 12.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 10.0, GetRandomDirectionDeg())
	YDWETimerDestroyTextTag(0.5, GetLastCreatedTextTag())
	UnitDamageTargetBJ(udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), GetUnitStateSwap(ConvertUnitState(20), udg_hero[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________005Func009Func012T()
	SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1.0)
	if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 10.0 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1052916177), YDWEGetPlayerColorString(Player(0), "暴击！" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1997250533))) or "")), 7.0 + LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) * 1.5)
	else
		if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15.0 then
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1052916177), YDWEGetPlayerColorString(Player(0), "暴击！" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1997250533))) or "")), 32.0 - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) * 1.0)
		else
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		end
	end
end

function Trig____________________005Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetEventDamageSource())))
	if GetUnitTypeId(GetEventDamageSource()) == 1747988530 then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDHT, GetHandleId(GetEventDamageSource()), -1152683245))
		if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) == 0.0 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetEventDamage())
		else
		end
	else
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetEventDamage())
		if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093677366) > 0 and GetRandomInt(1, 10) >= 7 then
			ydl_timer = CreateTimer()
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
			TimerStart(ydl_timer, 0.1, false, Trig____________________005Func006Func004Func001T)
		else
		end
	end
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, HopeThird_Damage(GetEventDamageSource(), GetTriggerUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL) ~= true then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 - LoadReal(YDHT, GetHandleId(GetTriggerUnit()), 877254238)))
	else
	end
	SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1215972101, false)
	if (udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= GetRandomInt(1, 100) or LoadInteger(YDHT, GetHandleId(GetEventDamageSource()), -299321171) > 0) and YDWEIsEventAttackType(ATTACK_TYPE_CHAOS) == true then
		SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1215972101, true)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533, HopeMeta_Damage(GetEventDamageSource(), GetTriggerUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1215972101)))
		CreateTextTagUnitBJ(YDWEGetPlayerColorString(Player(0), "暴击！" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533))) or "")), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430), 5.0, 10.0, 100, 100, 100, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1052916177, GetLastCreatedTextTag())
		SetTextTagVelocityBJ(GetLastCreatedTextTag(), 20.0, GetRandomDirectionDeg())
		YDWETimerDestroyTextTag(2.5, GetLastCreatedTextTag())
		SaveInteger(YDHT, GetHandleId(GetEventDamageSource()), -299321171, LoadInteger(YDHT, GetHandleId(GetEventDamageSource()), -299321171) - 1)
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -68293548, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 1997250533, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), -1052916177, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1052916177))
		TimerStart(ydl_timer, 0.03, true, Trig____________________005Func009Func012T)
	else
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) - 0.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533, HopeMeta_Damage(GetEventDamageSource(), GetTriggerUnit(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533), LoadBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1215972101)))
		CreateTextTagUnitBJ(YDWEGetPlayerColorString(GetOwningPlayer(GetEventDamageSource()), "-" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533))) or "")), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430), 5.0, 15.0, 100, 100, 100, 0)
		SetTextTagVelocityBJ(GetLastCreatedTextTag(), 32.0, 90.0)
		YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
	end
	YDWESetEventDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533))
	if IsUnitAlly(GetEventDamageSource(), Player(0)) == true and GetOwningPlayer(GetTriggerUnit()) == Player(11) and GetEventDamage() > 0.0 then
		SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, GetOwningPlayer(GetEventDamageSource()))
		udg_Shuchu_dm_tj[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Shuchu_dm_tj[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533)
		HopeDamage_Total[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = HopeDamage_Total[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533)
		if GetUnitAbilityLevel(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093678405) > 0 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1534980427, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1997250533) / 100.0))
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1534980427) >= 10 * GetUnitAbilityLevelSwapped(1093678405, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) then
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1534980427, 10 * GetUnitAbilityLevel(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093678405))
				YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "origin"))
			else
			end
			AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1534980427), GetOwningPlayer(GetEventDamageSource()), PLAYER_STATE_RESOURCE_GOLD)
		else
		end
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig____________________005()
	gg_trg____________________005 = CreateTrigger()
	YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg____________________005)
	TriggerAddCondition(gg_trg____________________005, Condition(Trig____________________005Conditions))
	TriggerAddAction(gg_trg____________________005, Trig____________________005Actions)
end

function Trig____________________001Conditions()
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true
end

function Trig____________________001Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if HopeReclass_Replacing then
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757693831, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2113928565, ModuloReal(udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1.0))
	udg_zcSTR_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zcSTR_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2113928565)
	if udg_zcSTR_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 1.0 then
		ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, 1)
		udg_zcSTR_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zcSTR_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1.0
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 859865553, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757693831) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2113928565)))
	ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 859865553))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1698842604, udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -458908505, ModuloReal(udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1.0))
	udg_zcAGI_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zcAGI_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -458908505)
	if udg_zcAGI_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 1.0 then
		ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, 1)
		udg_zcAGI_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zcAGI_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1.0
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -756655360, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1698842604) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -458908505)))
	ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -756655360))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1462083387, udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1517251136, ModuloReal(udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1.0))
	udg_zcINT_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zcINT_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1517251136)
	if udg_zcINT_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 1.0 then
		ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, 1)
		udg_zcINT_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_zcINT_XS[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1.0
	else
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -438258720, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1462083387) - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1517251136)))
	ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -438258720))
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE) + udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] / 200.0
	udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] / 200.0
	if ModuloInteger(GetHeroLevel(GetTriggerUnit()), 2) == 0 then
		if GetUnitAbilityLevelSwapped(1098085732, GetTriggerUnit()) == 0 then
			UnitAddAbility(GetTriggerUnit(), 1098085732)
		else
		end
		udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
		AddUnitToStockBJ(1747988550, GetTriggerUnit(), udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	else
	end
	if ModuloInteger(GetHeroLevel(GetTriggerUnit()), 5) == 0 then
		udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1.0
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "英雄每5级获得一点专注值上限")
	else
	end
	if GetUnitLevel(GetTriggerUnit()) >= 20 and (YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895858) == true or YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895096) == true or YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895865) == true) then
		bj_forLoopBIndex = 1
		bj_forLoopBIndexEnd = 6
		for _ in _loop_() do
			if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
			if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopBIndex)) == 1227895858 then
				RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopBIndex))
				ModifyHeroStat(bj_HEROSTAT_STR, GetTriggerUnit(), bj_MODIFYMETHOD_ADD, 15)
			else
			end
			if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopBIndex)) == 1227895096 then
				RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopBIndex))
				ModifyHeroStat(bj_HEROSTAT_INT, GetTriggerUnit(), bj_MODIFYMETHOD_ADD, 15)
			else
			end
			if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopBIndex)) == 1227895865 then
				RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopBIndex))
				ModifyHeroStat(bj_HEROSTAT_AGI, GetTriggerUnit(), bj_MODIFYMETHOD_ADD, 15)
			else
			end
			bj_forLoopBIndex = bj_forLoopBIndex + 1
		end
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________001()
	gg_trg____________________001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________001, EVENT_PLAYER_HERO_LEVEL)
	TriggerAddCondition(gg_trg____________________001, Condition(Trig____________________001Conditions))
	TriggerAddAction(gg_trg____________________001, Trig____________________001Actions)
end

function Trig____________________040Conditions()
	return GetUnitTypeId(GetSoldUnit()) == 1747988550
end

function Trig____________________040Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if HopeChoice_ReopenUpgrade(GetOwningPlayer(GetSellingUnit()), GetSellingUnit(), GetSoldUnit()) then
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetSellingUnit())))

	udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
	if udg_shengji_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 0 then
		RemoveUnitFromStockBJ(1747988550, GetSellingUnit())
	else
	end
	HopeModern_Message(udg_Wj_sj_xz[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "升级选择")
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, HopeChoice_PickUnique(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 1.0)
	if GetRandomInt(1, 2) ~= 1 then
		if GetRandomInt(1, 3) ~= 2 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 2.0)
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 3.0)
		end
	else
	end
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831) * LoadReal(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), -2132284599))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978) < 1.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948, (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978) * 100.0)) or "") .. "%")
	else
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948, I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978))))
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (LoadStr(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), 1048700768) or "") .. " " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948) or ""))
	HopeModern_Add(udg_Wj_sj_xz[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], HopeChoice_RateText((LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or "") .. "", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978)))
	SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936))
	SaveReal(YDHT, GetHandleId(GetLastCreatedButtonBJ()), -2132284599, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, HopeChoice_PickUnique(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 2))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 1.0)
	if GetRandomInt(1, 2) ~= 1 then
		if GetRandomInt(1, 3) ~= 2 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 2.0)
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 3.0)
		end
	else
	end
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831) * LoadReal(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), -2132284599))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978) < 1.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948, (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978) * 100.0)) or "") .. "%")
	else
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948, I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978))))
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (LoadStr(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), 1048700768) or "") .. " " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948) or ""))
	HopeModern_Add(udg_Wj_sj_xz[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], HopeChoice_RateText((LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or "") .. "", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978)))
	SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936))
	SaveReal(YDHT, GetHandleId(GetLastCreatedButtonBJ()), -2132284599, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, HopeChoice_PickUnique(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 3))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 1.0)
	if GetRandomInt(1, 2) ~= 1 then
		if GetRandomInt(1, 3) ~= 2 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 2.0)
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831, 3.0)
		end
	else
	end
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1801217831) * LoadReal(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), -2132284599))
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978) < 1.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948, (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978) * 100.0)) or "") .. "%")
	else
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948, I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978))))
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (LoadStr(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), 1048700768) or "") .. " " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1967538948) or ""))
	HopeModern_Add(udg_Wj_sj_xz[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], HopeChoice_RateText((LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or "") .. "", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978)))
	SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936))
	SaveReal(YDHT, GetHandleId(GetLastCreatedButtonBJ()), -2132284599, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 968663978))
	HopeModern_Add(udg_Wj_sj_xz[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "放弃选择")
	SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 99)
	HopeChoice_DialogDisplay(GetOwningPlayer(GetTriggerUnit()), udg_Wj_sj_xz[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________040()
	gg_trg____________________040 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________040, EVENT_PLAYER_UNIT_SELL)
	TriggerAddCondition(gg_trg____________________040, Condition(Trig____________________040Conditions))
	TriggerAddAction(gg_trg____________________040, Trig____________________040Actions)
end

function Trig____________________013________2Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if HopeChoice_DialogClicked() then
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, HopeModern_GetPlayer())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(HopeModern_GetPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097, LoadInteger(YDHT, GetHandleId(HopeModern_GetButton()), 54591090))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -927162099, LoadInteger(YDHT, GetHandleId(HopeModern_GetButton()), 54591090))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644, LoadReal(YDHT, GetHandleId(HopeModern_GetButton()), -2132284599))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 1 then
		ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)))
	else
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 2 then
			ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)))
		else
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 3 then
				ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)))
			else
				if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 4 then
					udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
				else
					if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 5 then
						SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
						SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_LIFE, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_LIFE) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
					else
						if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 6 then
							udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
						else
							if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 7 then
								ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)))
								ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)))
								ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)))
							else
								if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 8 then
									AdjustPlayerStateBJ(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), PLAYER_STATE_RESOURCE_GOLD)
								else
									if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 9 then
										udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
									else
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 10 then
		udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
	else
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 11 then
			udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
		else
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 12 then
				udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
			else
				if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 13 then
					udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
				else
					if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 14 then
						SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_MANA, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_MANA) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
					else
						if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 15 then
							udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
						else
							if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 16 then
								udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)
							else
								if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097) == 17 then
									SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
									udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644))
								else
								end
							end
						end
					end
				end
			end
		end
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (LoadStr(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1775250097), 1048700768) or "") .. (R2S(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1066507644)) or ""))
	DisplayTextToPlayer(HopeModern_GetPlayer(), 0, 0, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166))
	HopeChoice_DialogClear(HopeModern_GetDialog())
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________013________2()
	gg_trg____________________013________2 = CreateTrigger()
	TriggerRegisterDialogEvent(gg_trg____________________013________2, udg_Wj_sj_xz[1])
	TriggerRegisterDialogEvent(gg_trg____________________013________2, udg_Wj_sj_xz[2])
	TriggerRegisterDialogEvent(gg_trg____________________013________2, udg_Wj_sj_xz[3])
	TriggerRegisterDialogEvent(gg_trg____________________013________2, udg_Wj_sj_xz[4])
	TriggerRegisterDialogEvent(gg_trg____________________013________2, udg_Wj_sj_xz[5])
	TriggerRegisterDialogEvent(gg_trg____________________013________2, udg_Wj_sj_xz[6])
	TriggerAddAction(gg_trg____________________013________2, Trig____________________013________2Actions)
end

function Trig____________________011_______uActions()
	SaveStr(YDHT, 1, 1048700768, "力量+")
	SaveReal(YDHT, 1, -2132284599, 1.0)
	SaveStr(YDHT, 2, 1048700768, "敏捷+")
	SaveReal(YDHT, 2, -2132284599, 1.0)
	SaveStr(YDHT, 3, 1048700768, "智力+")
	SaveReal(YDHT, 3, -2132284599, 1.0)
	SaveStr(YDHT, 4, 1048700768, "回合防御+")
	SaveReal(YDHT, 4, -2132284599, 1.0)
	SaveStr(YDHT, 5, 1048700768, "生命最大值+")
	SaveReal(YDHT, 5, -2132284599, 20.0)
	SaveStr(YDHT, 6, 1048700768, "额外防御+")
	SaveReal(YDHT, 6, -2132284599, 1.0)
	SaveStr(YDHT, 7, 1048700768, "全属性+")
	SaveReal(YDHT, 7, -2132284599, 1.0)
	SaveStr(YDHT, 8, 1048700768, "金钱+")
	SaveReal(YDHT, 8, -2132284599, 150.0)
	SaveStr(YDHT, 9, 1048700768, "胜利金钱+")
	SaveReal(YDHT, 9, -2132284599, 10.0)
	SaveStr(YDHT, 10, 1048700768, "法术强度+")
	SaveReal(YDHT, 10, -2132284599, 0.03)
	SaveStr(YDHT, 11, 1048700768, "技能伤害+")
	SaveReal(YDHT, 11, -2132284599, 0.03)
	SaveStr(YDHT, 12, 1048700768, "暴击率+")
	SaveReal(YDHT, 12, -2132284599, 1.0)
	SaveStr(YDHT, 13, 1048700768, "暴击伤害+")
	SaveReal(YDHT, 13, -2132284599, 0.03)
	SaveStr(YDHT, 14, 1048700768, "魔法值+")
	SaveReal(YDHT, 14, -2132284599, 10.0)
	SaveStr(YDHT, 15, 1048700768, "精确打击伤害+")
	SaveReal(YDHT, 15, -2132284599, 0.03)
	SaveStr(YDHT, 16, 1048700768, "最终伤害+")
	SaveReal(YDHT, 16, -2132284599, 0.01)
	SaveStr(YDHT, 17, 1048700768, "攻击力+")
	SaveReal(YDHT, 17, -2132284599, 1.0)
end

function InitTrig____________________011_______u()
	gg_trg____________________011_______u = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________011_______u, 1.5)
	TriggerAddAction(gg_trg____________________011_______u, Trig____________________011_______uActions)
end

function Trig___________________0002Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895880
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895093
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894873
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894874
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895604
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895884
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895129
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895130
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895883
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894869
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1667854953
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1650814070
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1650946932
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1668181858
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895107
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894832
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894834
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1667854953
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1650814070
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1650946932
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1751348590
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1835233141
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1752588652
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895126
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1919182131
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895344
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895125
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895109
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894835
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894852
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894850
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894851
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895114
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894853
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895113
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227894840
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895127
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1919182130
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895345
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895128
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895363
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895364
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895362
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895110
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895112
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895617
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895088
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895105
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895108
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895637
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895640
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895639
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895638
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895641
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895858
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895865
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895096
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
	udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = 1227895873
	udg_zhengshu = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig___________________0002()
	gg_trg___________________0002 = CreateTrigger()
	TriggerAddAction(gg_trg___________________0002, Trig___________________0002Actions)
end

function Trig_______1_______0001Func001A()
	SaveBoolean(YDHT, GetHandleId(GetEnumPlayer()), -1422318988, false)
	HopeReward_DrawCount[GetConvertedPlayerId(GetEnumPlayer())] = 0
	HopeChoice_RewardIssued(GetEnumPlayer())
	HopeRoute_Ready[GetPlayerId(GetEnumPlayer())] = false
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1184922996, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538)])
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952, ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538)))
	if HaveSavedInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460) == false then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1587459251, GetRandomInt(1, 4))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 1, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1587459251)])
		SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), -952593264, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1587459251))
	else
		if udg_Youxi_xzgq == gg_unit_n00N_0023 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1587459251, GetRandomInt(28, udg_zhengshu))
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 1, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1587459251)])
			SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), -952593264, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1587459251))
		else
			SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307, HopeReward_DrawRelic(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538)))
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 1, GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307)))
			YDWETimerRemoveItem(0.1, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307))
			SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), -952593264, LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 1), 2010520239))
		end
	end
	if HaveSavedInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460) == false then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 968663978, GetRandomInt(5, 27))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 2, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 968663978)])
		SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), 1900399059, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 968663978))
	else
		SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307, HopeReward_DrawRelic(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538)))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 2, GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307)))
		YDWETimerRemoveItem(0.1, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307))
		SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), 1900399059, LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 2), 2010520239))
	end
	if HaveSavedInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460) == false then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1983126667, GetRandomInt(5, 27))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 3, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1983126667)])
		SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), -406266061, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1983126667))
	else
		SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307, HopeReward_DrawRelic(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538)))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 3, GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307)))
		YDWETimerRemoveItem(0.1, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1011494307))
		SaveInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952)), -406266061, LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 3), 2010520239))
	end
	SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -541832965, CreateItem(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 1), 0, 0))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1132341824, GetItemName(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -541832965)))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 511036305, YDWEGetItemDataString(GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -541832965)), 3))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -342938139, EXExecuteScript("(require'jass.slk').item[" .. (I2S(GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -541832965))) or "") .. "].Art"))
	SetItemVisible(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -541832965), false)
	YDWETimerRemoveItem(2, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -541832965))
	SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 617900173, CreateItem(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 2), 0, 0))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -647782241, GetItemName(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 617900173)))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1900398459, YDWEGetItemDataString(GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 617900173)), 3))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -51857775, EXExecuteScript("(require'jass.slk').item[" .. (I2S(GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 617900173))) or "") .. "].Art"))
	SetItemVisible(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 617900173), false)
	YDWETimerRemoveItem(2, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 617900173))
	SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1883451387, CreateItem(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 3), 0, 0))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -854572045, GetItemName(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1883451387)))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -540077629, YDWEGetItemDataString(GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1883451387)), 3))
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1357934660, EXExecuteScript("(require'jass.slk').item[" .. (I2S(GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1883451387))) or "") .. "].Art"))
	SetItemVisible(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1883451387), false)
	YDWETimerRemoveItem(2, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1883451387))
	HopeMeta_SupplyOwner = GetPlayerId(GetEnumPlayer())
	HopeMeta_SupplyItem[0] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 1)
	HopeMeta_SupplyItem[1] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 2)
	HopeMeta_SupplyItem[2] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -783338327 + 3)
	ExecuteFunc("HopeMeta_OfferRelic")
	if LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 849994952) == GetLocalPlayer() then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 0)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], true)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 1)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], true)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 2)
		DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -342938139), 0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 3)
		DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1132341824) or "") .. "|n|n" .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 511036305) or ""))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 6)
		DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -51857775), 0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 7)
		DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -647782241) or "") .. "|n|n" .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1900398459) or ""))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 10)
		DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1357934660), 0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 11)
		DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -854572045) or "") .. "|n|n" .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -540077629) or ""))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976, 15)
		DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 635090976)], "放弃选择")
	else
	end
end

function Trig_______1_______0001Actions()
	HopeMeta_PostRoom()
	ForForce(udg_WJZ, Trig_______1_______0001Func001A)
end

function InitTrig_______1_______0001()
	gg_trg_______1_______0001 = CreateTrigger()
	TriggerAddAction(gg_trg_______1_______0001, Trig_______1_______0001Actions)
end

function Trig_GZ_1______________015Func001Func002Func008Func007FT()
	DzFrameClearAllPoints(udg_UI_sg[0])
	DzFrameSetPoint(udg_UI_sg[0], 0, udg_UI_sg[LoadInteger(YDLOC, -688061268, 635090976) - 3], 0, -0.0015, S2R("0.0015"))
	DzFrameSetPoint(udg_UI_sg[0], 8, udg_UI_sg[LoadInteger(YDLOC, -688061268, 635090976) - 3], 8, 0.0015, S2R("-0.0015"))
	if not HopeChoice_Hidden and HopeChoice_LootPending() then
		DzFrameShow(udg_UI_sg[0], true)
	end
end

function Trig_GZ_1______________015Func001Func002Func008Func008FT()
	DzFrameShow(udg_UI_sg[0], false)
	SaveInteger(YDLOC, -1878573984, 635090976, LoadInteger(YDLOC, -1878573984, 635090976))
end

function Trig_GZ_1______________015Func001Func002Func008Func009003()
	TriggerExecute(gg_trg_1)
end

function Trig_GZ_1______________015Func001Func003Func008Func007FT()
	DzFrameClearAllPoints(udg_UI_sg[0])
	DzFrameSetPoint(udg_UI_sg[0], 0, udg_UI_sg[LoadInteger(YDLOC, -2020057841, 635090976) - 3], 0, -0.0015, S2R("0.0015"))
	DzFrameSetPoint(udg_UI_sg[0], 8, udg_UI_sg[LoadInteger(YDLOC, -2020057841, 635090976) - 3], 8, 0.0015, S2R("-0.0015"))
	if not HopeChoice_Hidden and HopeChoice_LootPending() then
		DzFrameShow(udg_UI_sg[0], true)
	end
end

function Trig_GZ_1______________015Func001Func003Func008Func008FT()
	DzFrameShow(udg_UI_sg[0], false)
	SaveInteger(YDLOC, 371389683, 635090976, LoadInteger(YDLOC, 371389683, 635090976))
end

function Trig_GZ_1______________015Func001Func003Func008Func009003()
	TriggerExecute(gg_trg_2)
end

function Trig_GZ_1______________015Func001Func004Func008Func007FT()
	DzFrameClearAllPoints(udg_UI_sg[0])
	DzFrameSetPoint(udg_UI_sg[0], 0, udg_UI_sg[LoadInteger(YDLOC, 374219549, 635090976) - 3], 0, -0.0015, S2R("0.0015"))
	DzFrameSetPoint(udg_UI_sg[0], 8, udg_UI_sg[LoadInteger(YDLOC, 374219549, 635090976) - 3], 8, 0.0015, S2R("-0.0015"))
	if not HopeChoice_Hidden and HopeChoice_LootPending() then
		DzFrameShow(udg_UI_sg[0], true)
	end
end

function Trig_GZ_1______________015Func001Func004Func008Func008FT()
	DzFrameShow(udg_UI_sg[0], false)
	SaveInteger(YDLOC, 1916398880, 635090976, LoadInteger(YDLOC, 1916398880, 635090976))
end

function Trig_GZ_1______________015Func001Func004Func008Func009003()
	TriggerExecute(gg_trg_3)
end

function Trig_GZ_1______________015Func001Func005Func008Func007FT()
	DzFrameClearAllPoints(udg_UI_sg[0])
	DzFrameSetPoint(udg_UI_sg[0], 0, udg_UI_sg[LoadInteger(YDLOC, -1716951967, 635090976) - 3], 0, -0.0015, S2R("0.0015"))
	DzFrameSetPoint(udg_UI_sg[0], 8, udg_UI_sg[LoadInteger(YDLOC, -1716951967, 635090976) - 3], 8, 0.0015, S2R("-0.0015"))
	if not HopeChoice_Hidden and HopeChoice_LootPending() then
		DzFrameShow(udg_UI_sg[0], true)
	end
end

function Trig_GZ_1______________015Func001Func005Func008Func008FT()
	DzFrameShow(udg_UI_sg[0], false)
	SaveInteger(YDLOC, -1924250022, 635090976, LoadInteger(YDLOC, -1924250022, 635090976))
end

function Trig_GZ_1______________015Func001Func005Func008Func009003()
	TriggerExecute(gg_trg_4)
end

function Trig_GZ_1______________015Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 0)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", DzGetGameUI(), "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 1)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", DzGetGameUI(), "EscMenuBackdrop", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Textures\\Black32.blp", 0)
	DzFrameSetPoint(udg_UI_sg[1], 1, DzFrameGetHeroBarButton(0), 7, S2R("0.182"), S2R("0"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.165"), S2R("0.25"))
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 2)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], 1, 0.0, S2R("-0.025"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.03"), S2R("0.03"))
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp", 0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 3)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("TEXT", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 1, 0.0, -0.07)
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.11"), S2R("0.4"))
	DzFrameSetTextAlignment(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 50)
	DzFrameSetFont(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Fonts\\ZiTi.ttf", S2R("0.010"), 0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n" .. "测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n")
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 4)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("GLUETEXTBUTTON", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 0, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 0, 0.0, 0.0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 8, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 8, 0.0, 0.0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, -688061268, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 2, Trig_GZ_1______________015Func001Func002Func008Func007FT, false)
	end
	SaveInteger(YDLOC, -1878573984, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, Trig_GZ_1______________015Func001Func002Func008Func008FT, false)
	end
	DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, Trig_GZ_1______________015Func001Func002Func008Func009003, true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 5)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", udg_UI_sg[1], "EscMenuBackdrop", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Textures\\Black32.blp", 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], 5, S2R("0.05"), S2R("0"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.165"), S2R("0.25"))
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 6)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], 1, 0.0, S2R("-0.025"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.03"), S2R("0.03"))
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp", 0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 7)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("TEXT", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 1, 0.0, -0.07)
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.11"), S2R("0.4"))
	DzFrameSetFont(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Fonts\\ZiTi.ttf", S2R("0.010"), 0)
	DzFrameSetTextAlignment(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 50)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n" .. "测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n")
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 8)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("GLUETEXTBUTTON", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 0, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 0, 0.0, 0.0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 8, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 8, 0.0, 0.0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, -2020057841, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 2, Trig_GZ_1______________015Func001Func003Func008Func007FT, false)
	end
	SaveInteger(YDLOC, 371389683, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, Trig_GZ_1______________015Func001Func003Func008Func008FT, false)
	end
	DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, Trig_GZ_1______________015Func001Func003Func008Func009003, true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 9)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", udg_UI_sg[1], "EscMenuBackdrop", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Textures\\Black32.blp", 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], 5, S2R("0.05"), S2R("0"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.165"), S2R("0.25"))
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 10)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], 1, 0.0, S2R("-0.025"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.03"), S2R("0.03"))
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp", 0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 11)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("TEXT", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 1, 0.0, -0.07)
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.11"), S2R("0.3"))
	DzFrameSetFont(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Fonts\\ZiTi.ttf", S2R("0.010"), 0)
	DzFrameSetTextAlignment(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 50)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n" .. "测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n测试文本！！！！！！！！！|n")
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 12)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("GLUETEXTBUTTON", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 0, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 0, 0.0, 0.0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 8, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 8, 0.0, 0.0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, 374219549, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 2, Trig_GZ_1______________015Func001Func004Func008Func007FT, false)
	end
	SaveInteger(YDLOC, 1916398880, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, Trig_GZ_1______________015Func001Func004Func008Func008FT, false)
	end
	DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, Trig_GZ_1______________015Func001Func004Func008Func009003, true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 13)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("BACKDROP", "name", udg_UI_sg[1], "EscMenuBackdrop", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetTexture(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Textures\\Black32.blp", 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], 5, S2R("-0.2"), S2R("-0.2"))
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.12"), S2R("0.07"))
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 15)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("TEXT", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 4, 0.0, 0.0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 2], 1, 0.0, 0.0)
	DzFrameSetSize(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], S2R("0.08"), S2R("0.08"))
	DzFrameSetFont(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "Fonts\\ZiTi.ttf", S2R("0.010"), 0)
	DzFrameSetTextAlignment(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 50)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	DzFrameSetText(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], "放弃选择")
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 16)
	udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = DzCreateFrameByTagName("GLUETEXTBUTTON", "name", udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 1], "template", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 4, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 4, 0, 0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 0, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 0, 0.0, 0.0)
	DzFrameSetPoint(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 8, udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) - 3], 8, 0.0, 0.0)
	DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], true)
	SaveInteger(YDLOC, -1716951967, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 2, Trig_GZ_1______________015Func001Func005Func008Func007FT, false)
	end
	SaveInteger(YDLOC, -1924250022, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
	if GetLocalPlayer() == GetLocalPlayer() then
		DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 3, Trig_GZ_1______________015Func001Func005Func008Func008FT, false)
	end
	DzFrameSetScriptByCode(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 1, Trig_GZ_1______________015Func001Func005Func008Func009003, true)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_GZ_1______________015()
	gg_trg_GZ_1______________015 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg_GZ_1______________015, 0.01)
	TriggerAddAction(gg_trg_GZ_1______________015, Trig_GZ_1______________015Actions)
end

function Trig_1Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538, GetConvertedPlayerId(DzGetTriggerUIEventPlayer()))
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952, ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251, LoadInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -952593264))
	if LoadBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988) == false then
		SaveBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988, true)
		if HaveSavedInteger(YDHT, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], 241451190) == true then
			UnitAddItemByIdSwapped(udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)])
		else
			HopeInventory_Give(udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)])
		end
	else
	end
	if LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952) == GetLocalPlayer() then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 1)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 0)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_1()
	gg_trg_1 = CreateTrigger()
	TriggerAddAction(gg_trg_1, Trig_1Actions)
end

function Trig_2Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538, GetConvertedPlayerId(DzGetTriggerUIEventPlayer()))
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952, ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251, LoadInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), 1900399059))
	if LoadBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988) == false then
		SaveBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988, true)
		if HaveSavedInteger(YDHT, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], 241451190) == true then
			UnitAddItemByIdSwapped(udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)])
		else
			HopeInventory_Give(udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)])
		end
	else
	end
	if LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952) == GetLocalPlayer() then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 1)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 0)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_2()
	gg_trg_2 = CreateTrigger()
	TriggerAddAction(gg_trg_2, Trig_2Actions)
end

function Trig_3Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538, GetConvertedPlayerId(DzGetTriggerUIEventPlayer()))
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952, ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251, LoadInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -406266061))
	if LoadBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988) == false then
		SaveBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988, true)
		if HaveSavedInteger(YDHT, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], 241451190) == true then
			UnitAddItemByIdSwapped(udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)])
		else
			HopeInventory_Give(udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251)], udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)])
		end
	else
	end
	if LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952) == GetLocalPlayer() then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 1)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 0)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_3()
	gg_trg_3 = CreateTrigger()
	TriggerAddAction(gg_trg_3, Trig_3Actions)
end

function Trig_4Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538, GetConvertedPlayerId(DzGetTriggerUIEventPlayer()))
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952, ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1872163538)))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1587459251, LoadInteger(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), 536250864))
	if LoadBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988) == false then
		SaveBoolean(YDHT, GetHandleId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952)), -1422318988, true)
	else
	end
	if LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 849994952) == GetLocalPlayer() then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 1)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 0)
		DzFrameShow(udg_UI_sg[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], false)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_4()
	gg_trg_4 = CreateTrigger()
	TriggerAddAction(gg_trg_4, Trig_4Actions)
end

function Trig_G_____________004Conditions()
	return GetOwningPlayer(GetTriggerUnit()) == Player(11) and GetUnitTypeId(GetTriggerUnit()) ~= 1697656913 and GetUnitTypeId(GetTriggerUnit()) ~= 1848651842
end

function Trig_G_____________004Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	HopeStatus_ClearHistory(GetTriggerUnit())
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	if HaveSavedReal(YDHT, GetUnitTypeId(GetTriggerUnit()), -2060661797) == true then
		SaveReal(YDHT, GetHandleId(GetTriggerUnit()), 877254238, LoadReal(YDHT, GetUnitTypeId(GetTriggerUnit()), -2060661797))
	else
		SaveReal(YDHT, GetHandleId(GetTriggerUnit()), 877254238, 0.1 * I2R(udg_quanshu))
	end
	HopeChallenge_ScaleEnemy(GetTriggerUnit())
	HopeCoop_ScaleEnemy(GetTriggerUnit())
	SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 789842799, GetRandomInt(0, 3))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 789842799))
	SaveReal(YDHT, GetHandleId(GetTriggerUnit()), 1069445209, GetUnitStateSwap(ConvertUnitState(20), GetTriggerUnit()))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) <= 2 then
		if GetRandomInt(1, 3) == 1 then
			SaveStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1661751302, "buff")
			SaveReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 400320547, 1.0 + 0.15 * LoadReal(YDHT, GetHandleId(GetTriggerUnit()), 1069445209))
		else
			SaveStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1661751302, "attack")
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(ForcePickRandomPlayer(udg_WJZ_______cunhuo)))
			SaveUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -272485038, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			SaveReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1820993401, GetUnitStateSwap(ConvertUnitState(20), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)) + GetRandomReal(-1.0, 2.0 * I2R(GetUnitLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)))))
		end
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 789842799, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) + GetRandomInt(1, 2))
	else
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 789842799, 0)
		if HaveSavedString(YDHT, GetUnitTypeId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 715936045) == true then
			SaveStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1661751302, "skill")
		else
			if GetRandomInt(1, 2) == 1 then
				SaveStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1661751302, "buff")
				SaveReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 400320547, 1.0 + 0.15 * LoadReal(YDHT, GetHandleId(GetTriggerUnit()), 1069445209))
			else
				SaveStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1661751302, "defend")
				SaveReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1559201479, 10.0 + 5.0 * I2R(GetUnitLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))))
			end
		end
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, LoadStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1661751302))
	if LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586) == "attack" then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, LoadUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -272485038))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1820993401))
	else
	end
	if LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586) == "defend" then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), -1559201479))
	else
	end
	if LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586) == "buff" then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)), 400320547))
	else
	end
	if LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586) == "skill" then
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	HopeIntent_SetPhase(GetTriggerUnit(), 0)
end

function InitTrig_G_____________004()
	gg_trg_G_____________004 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg_G_____________004, GetPlayableMapRect())
	TriggerAddCondition(gg_trg_G_____________004, Condition(Trig_G_____________004Conditions))
	TriggerAddAction(gg_trg_G_____________004, Trig_G_____________004Actions)
end

function Trig_X_____________004_______uConditions()
	return GetOwningPlayer(GetTriggerUnit()) == Player(11)
end

function Trig_X_____________004_______uActions()
	HopeIntent_Select(GetTriggerPlayer(), GetTriggerUnit())
end

function InitTrig_X_____________004_______u()
	gg_trg_X_____________004_______u = CreateTrigger()
	TriggerRegisterPlayerSelectionEventBJ(gg_trg_X_____________004_______u, Player(0), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg_X_____________004_______u, Player(1), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg_X_____________004_______u, Player(2), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg_X_____________004_______u, Player(3), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg_X_____________004_______u, Player(4), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg_X_____________004_______u, Player(5), true)
	TriggerAddCondition(gg_trg_X_____________004_______u, Condition(Trig_X_____________004_______uConditions))
	TriggerAddAction(gg_trg_X_____________004_______u, Trig_X_____________004_______uActions)
end

function Trig_X_____________004Func001001002()
	return RectContainsUnit(gg_rct______________005, GetFilterUnit()) == true
end

function Trig_X_____________004Func001A()
	if GetEnumUnit() ~= gg_unit_n00N_0023 then
		HopeChallenge_ReleaseNode(GetEnumUnit())
		RemoveUnit(GetEnumUnit())
		FlushChildHashtable(YDHT, GetHandleId(GetEnumUnit()))
		HopeStatus_ClearHistory(GetEnumUnit())
	else
	end
end

function Trig_X_____________004Func016001002()
	return LoadInteger(YDHT, GetHandleId(GetFilterUnit()), 1713729479) == 1
end

function Trig_X_____________004Func016A()
	YDWETimerDestroyEffect(2, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl", GetEnumUnit(), "origin"))
	SetUnitVertexColorBJ(GetEnumUnit(), 100.0, 100, 0.0, 30.0)
	SaveBoolean(YDHT, GetHandleId(GetEnumUnit()), -1021606187, true)
end

function Trig_X_____________004Actions()
	local ydl_group
	local ydl_unit
	ForGroupBJ(YDWEGetUnitsOfPlayerMatchingNull(Player(PLAYER_NEUTRAL_PASSIVE), Condition(Trig_X_____________004Func001001002)), Trig_X_____________004Func001A)
	bj_forLoopAIndex = 0
	bj_forLoopAIndexEnd = udg_shandian_sl
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		DestroyLightning(udg_Luxian_shandian[bj_forLoopAIndex])
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	udg_shandian_sl = 0
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		AdjustPlayerStateBJ(100 * (udg_boci_______boss + 1), ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_GOLD)
		AdjustPlayerStateBJ(1 * (udg_boci_______boss + 1), ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_LUMBER)
		AddHeroXPSwapped(100 * (udg_boci_______boss + 1), udg_hero[bj_forLoopAIndex], true)
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	YDWEPolledWaitNull(3.0)
	TriggerExecute(gg_trg_MGCJ__________01)
	udg_quanshu = udg_quanshu + 1
	HopeChallenge_NextMonsterCount()
	DestroyTextTag(udg_Quanshu)
	CreateTextTagLocBJ(I2S(udg_quanshu + 1), GetRectCenter(gg_rct______________002), 0, 10, 100, 100, 100, 0)
	udg_Quanshu = GetLastCreatedTextTag()
	if udg_quanshu == 2 then
		ShowUnit(gg_unit_n019_0032, true)
		ShowUnit(gg_unit_n01C_0003, true)
	else
	end
	if HopeChallenge_Won() then
		HopeMeta_Win(HopeCoop_CountPlayers())
		CustomVictoryBJ(Player(0), true, true)
		CustomVictoryBJ(Player(1), true, true)
		CustomVictoryBJ(Player(2), true, true)
		CustomVictoryBJ(Player(3), true, true)
		CustomVictoryBJ(Player(4), true, true)
		CustomVictoryBJ(Player(5), true, true)
		DisableTrigger(GetTriggeringTrigger())
	else
		if udg_Yx_Nd_Dj >= 5 then
			DisplayTimedTextToForce(GetPlayersAll(), 12.0, "即将进入第" .. (I2S(udg_quanshu + 1) or "") .. "轮。三转需要30木材；新一轮敌人已强化。")
		end
	end
	udg_boci = 1
	YDWEPolledWaitNull(3.0)
	ForGroupBJ(YDWEGetUnitsOfPlayerMatchingNull(Player(PLAYER_NEUTRAL_PASSIVE), Condition(Trig_X_____________004Func016001002)), Trig_X_____________004Func016A)
	PanCameraToTimed(1400.0, -2800.0 + 200.0 * I2R(udg_boci), 0.0)
	if udg_quanshu == 1 then
		udg_boci_gw_lx[0] = 1848651825
		udg_boci_gw_lx[1] = 1966092342
		udg_boci_gw_lx[2] = 1966092336
		udg_boci_gw_lx[3] = 1848651829
		udg_boci_gw_lx[4] = 1970169187
		udg_BOSS_LX[0] = 1966092358
		SaveStr(YDHT, udg_BOSS_LX[0], 715936045, "全体魔法攻击")
		udg_BOSS_LX[1] = 1966092343
		SaveStr(YDHT, udg_BOSS_LX[1], 715936045, "群体生命回复")
		udg_BOSS_LX[2] = 1966092345
		SaveStr(YDHT, udg_BOSS_LX[2], 715936045, "寒冰吐息")
		udg_BOSS_LX_______DA[1] = 1433168227
		SaveStr(YDHT, udg_BOSS_LX_______DA[1], 715936045, "群体霜冻新星")
	else
	end
	if udg_quanshu == 2 then
		udg_boci_gw_lx[0] = 1848651828
		SaveStr(YDHT, udg_boci_gw_lx[0], 715936045, "全体加攻")
		udg_boci_gw_lx[1] = 1970169187
		SaveStr(YDHT, udg_boci_gw_lx[1], 715936045, "全体魔法攻击")
		udg_boci_gw_lx[2] = 1966092341
		udg_boci_gw_lx[3] = 1966092356
		udg_boci_gw_lx[4] = 1966092356
		udg_BOSS_LX[0] = 1966092345
		SaveStr(YDHT, udg_BOSS_LX[0], 715936045, "寒冰吐息")
		udg_BOSS_LX[1] = 1848651866
		SaveStr(YDHT, udg_BOSS_LX[1], 715936045, "全体攻击")
		udg_BOSS_LX[2] = 1848651866
		SaveStr(YDHT, udg_BOSS_LX[2], 715936045, "全体攻击")
		udg_BOSS_LX_______DA[1] = 1315334514
		SaveStr(YDHT, udg_BOSS_LX_______DA[1], 715936045, "召唤小炎魔")
	else
	end
	if udg_quanshu == 3 then
		udg_boci_gw_lx[0] = 1966092356
		udg_boci_gw_lx[1] = 1848651865
		udg_boci_gw_lx[2] = 1848652082
		SaveStr(YDHT, udg_boci_gw_lx[2], 715936045, "全体魔法攻击")
		udg_boci_gw_lx[3] = 1848652081
		udg_boci_gw_lx[4] = 1966092360
		udg_BOSS_LX[0] = 1848652083
		SaveStr(YDHT, udg_BOSS_LX[0], 715936045, "踩踏")
		udg_BOSS_LX[1] = 1966092361
		SaveStr(YDHT, udg_BOSS_LX[1], 715936045, "幽冥爆轰")
		SaveStr(YDHT, udg_BOSS_LX[1], -1951079047, "Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl")
		udg_BOSS_LX[2] = 1966092344
		SaveStr(YDHT, udg_BOSS_LX[2], 715936045, "智力审判")
		SaveStr(YDHT, udg_BOSS_LX[2], -1951079047, "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
		udg_BOSS_LX_______DA[1] = 1432580716
		SaveStr(YDHT, udg_BOSS_LX_______DA[1], 715936045, "群体穿刺（物理）")
		SaveReal(YDHT, udg_BOSS_LX_______DA[1], 1932103989, 25.0)
	else
	end
	HopeChallenge_SetRoster()
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig_X_____________004()
	gg_trg_X_____________004 = CreateTrigger()
	TriggerAddAction(gg_trg_X_____________004, Trig_X_____________004Actions)
end

function Trig_MGCJ__________01Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	udg_meiceng_GQS[0] = 3
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 11
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061, udg_meiceng_GQS[bj_forLoopBIndex - 1] + GetRandomInt(-2, 2))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061) < 3 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061, 3)
		else
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061) >= 6 then
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061, 6)
			else
			end
		end
		udg_meiceng_GQS[bj_forLoopBIndex] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061)
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061)
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			if bj_forLoopBIndex <= 3 then
				if GetRandomInt(1, 10) <= 6 then
					SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651849)
				else
					if GetRandomInt(1, 10) <= 7 then
						SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651852)
					else
						SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651855)
					end
				end
			else
				if GetRandomInt(1, 10) <= 3 then
					SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651849)
				else
					if GetRandomInt(1, 10) <= 3 then
						SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651850)
					else
						if GetRandomInt(1, 10) <= 7 then
							SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, udg_Sd_guanghuan_lx[GetRandomInt(1, 5)])
						else
							SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651852)
						end
					end
				end
			end
			if bj_forLoopBIndex == 5 or bj_forLoopBIndex == 11 then
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651853)
			else
			end
			if bj_forLoopBIndex == 6 then
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120, 1848651850)
			else
			end
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 730946120), Player(PLAYER_NEUTRAL_PASSIVE), Location(100.0 + 2000.0 / I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1399450061) + 1) * I2R(bj_forLoopAIndex), -3200.0 + 275.0 * I2R(bj_forLoopBIndex)), bj_UNIT_FACING)
			SaveGroupHandle(YDHT, GetHandleId(GetLastCreatedUnit()), -1242853960, CreateGroup())
			SaveUnitHandleBJ(GetLastCreatedUnit(), bj_forLoopAIndex, bj_forLoopBIndex, udg_luxianditu[udg_boci_______boss])
			SaveInteger(YDHT, GetHandleId(GetLastCreatedUnit()), 1713729479, bj_forLoopBIndex)
			if bj_forLoopBIndex > 1 then
				SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetUnitLoc(GetLastCreatedUnit()))
				if bj_forLoopBIndex == 11 then
					SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, gg_unit_n00N_0023)
					SaveInteger(YDHT, GetHandleId(gg_unit_n00N_0023), 1713729479, 12)
					SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
					AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
					SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
					GroupAddUnitSimple(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373), LoadGroupHandle(YDHT, GetHandleId(GetLastCreatedUnit()), -1242853960))
					udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
					udg_shandian_sl = udg_shandian_sl + 1
				else
				end
				if udg_meiceng_GQS[bj_forLoopBIndex] > udg_meiceng_GQS[bj_forLoopBIndex - 1] then
					if bj_forLoopAIndex == 2 then
						SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(1, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
						SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
						AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
						SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
						udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
						udg_shandian_sl = udg_shandian_sl + 1
						GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
						if GetRandomInt(1, 2) == 1 then
							SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(2, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
							SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
							AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
							SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
							udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
							udg_shandian_sl = udg_shandian_sl + 1
							GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
						else
						end
					else
						if bj_forLoopAIndex > udg_meiceng_GQS[bj_forLoopBIndex - 1] then
							SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(udg_meiceng_GQS[bj_forLoopBIndex - 1], bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
							SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
							AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
							SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
							udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
							udg_shandian_sl = udg_shandian_sl + 1
							GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
						else
							if bj_forLoopAIndex == 1 then
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(1, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
							else
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex - 1, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
							end
						end
					end
				else
					if udg_meiceng_GQS[bj_forLoopBIndex] == udg_meiceng_GQS[bj_forLoopBIndex - 1] then
						SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
						SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
						AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
						SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
						udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
						udg_shandian_sl = udg_shandian_sl + 1
						GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
						if bj_forLoopAIndex == 2 or bj_forLoopAIndex == 4 then
							if GetRandomInt(1, 4) <= 3 then
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex - 1, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
							else
							end
							if bj_forLoopAIndex + 1 <= udg_meiceng_GQS[bj_forLoopBIndex - 1] then
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex + 1, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
							else
							end
						else
						end
					else
						if bj_forLoopAIndex == udg_meiceng_GQS[bj_forLoopBIndex] then
							udg_Gh = bj_forLoopAIndex
							for _ in _loop_() do
								if udg_Gh > udg_meiceng_GQS[bj_forLoopBIndex - 1] then break end
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(udg_Gh, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
								udg_Gh = udg_Gh + 1
							end
						else
							SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
							SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
							AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
							SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
							udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
							udg_shandian_sl = udg_shandian_sl + 1
							GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
							if GetRandomInt(1, 4) <= 3 then
								SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373, LoadUnitHandleBJ(bj_forLoopAIndex + 1, bj_forLoopBIndex - 1, udg_luxianditu[udg_boci_______boss]))
								SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)))
								AddLightningLoc("DRAM", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
								SetLightningColor(GetLastCreatedLightningBJ(), 1, 1, 1, 0.3)
								udg_Luxian_shandian[udg_shandian_sl] = GetLastCreatedLightningBJ()
								udg_shandian_sl = udg_shandian_sl + 1
								GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1666916373)), -1242853960))
							else
							end
						end
					end
				end
			else
				GroupAddUnitSimple(GetLastCreatedUnit(), LoadGroupHandle(YDHT, GetHandleId(gg_unit_n00N_0023), -1242853960))
				GroupAddUnitSimple(GetLastCreatedUnit(), udg_qi_dwz[1])
			end
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_MGCJ__________01()
	gg_trg_MGCJ__________01 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg_MGCJ__________01, 0.5)
	TriggerAddAction(gg_trg_MGCJ__________01, Trig_MGCJ__________01Actions)
end

function Trig____________________025Conditions()
	return GetOwningPlayer(GetEnteringUnit()) == Player(PLAYER_NEUTRAL_PASSIVE)
end

function Trig____________________025Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	if GetUnitTypeId(GetEnteringUnit()) == 1848651849 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetEnteringUnit()))
		CreateNUnitsAtLoc(1, LoadInteger(YDHT, 1, 2121810082), Player(PLAYER_NEUTRAL_PASSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), bj_UNIT_FACING)
		UnitAddAbilityBJ(1097625443, GetLastCreatedUnit())
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	if GetUnitTypeId(GetEnteringUnit()) == 1848651850 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetEnteringUnit()))
		CreateNUnitsAtLoc(1, LoadInteger(YDHT, 2, 2121810082), Player(PLAYER_NEUTRAL_PASSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), bj_UNIT_FACING)
		UnitAddAbilityBJ(1097625443, GetLastCreatedUnit())
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	if GetUnitTypeId(GetEnteringUnit()) == 1848651851 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetEnteringUnit()))
		CreateNUnitsAtLoc(1, LoadInteger(YDHT, 3, 2121810082), Player(PLAYER_NEUTRAL_PASSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	if GetUnitTypeId(GetEnteringUnit()) == 1848651855 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetEnteringUnit()))
		CreateNUnitsAtLoc(1, LoadInteger(YDHT, 4, 2121810082), Player(PLAYER_NEUTRAL_PASSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	if GetUnitTypeId(GetEnteringUnit()) == 1848651853 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetEnteringUnit()))
		CreateNUnitsAtLoc(1, LoadInteger(YDHT, 5, 2121810082), Player(PLAYER_NEUTRAL_PASSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	if GetUnitTypeId(GetEnteringUnit()) == 1848651852 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetEnteringUnit()))
		CreateNUnitsAtLoc(1, LoadInteger(YDHT, 6, 2121810082), Player(PLAYER_NEUTRAL_PASSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________025()
	gg_trg____________________025 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg____________________025, GetPlayableMapRect())
	TriggerAddCondition(gg_trg____________________025, Condition(Trig____________________025Conditions))
	TriggerAddAction(gg_trg____________________025, Trig____________________025Actions)
end

function Trig______________012Conditions()
	return GetOwningPlayer(GetTriggerUnit()) == Player(PLAYER_NEUTRAL_PASSIVE) and LoadBoolean(YDHT, GetHandleId(GetTriggerUnit()), -1021606187) == true
end

function Trig______________012Func001Func008A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 1713729479))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817) ~= 0 then
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817) == udg_boci - 1 then
			SaveBoolean(YDHT, GetHandleId(GetEnumUnit()), -1021606187, false)
			if IsUnitInGroup(GetEnumUnit(), udg_zouguo_luxian) == true then
				SetUnitVertexColorBJ(GetEnumUnit(), 100.0, 0.0, 0.0, 30.0)
			else
				SetUnitVertexColorBJ(GetEnumUnit(), 50.0, 50.0, 50.0, 70.0)
			end
		else
		end
	else
	end
end

function Trig______________012Func001Func012T()
	udg_shuangji_queding = false
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig______________012Actions()
	HopeRoute_Select(GetTriggerPlayer(), GetTriggerUnit())
end

function InitTrig______________012()
	gg_trg______________012 = CreateTrigger()
	TriggerRegisterPlayerSelectionEventBJ(gg_trg______________012, Player(0), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg______________012, Player(1), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg______________012, Player(2), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg______________012, Player(3), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg______________012, Player(4), true)
	TriggerRegisterPlayerSelectionEventBJ(gg_trg______________012, Player(5), true)
	TriggerAddCondition(gg_trg______________012, Condition(Trig______________012Conditions))
	TriggerAddAction(gg_trg______________012, Trig______________012Actions)
end

function Trig_________________011Func002A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817, LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 1713729479))
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817) ~= 0 then
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817) == udg_boci then
			if IsUnitInGroup(GetEnumUnit(), LoadGroupHandle(YDHT, GetHandleId(udg_Youxi_xzgq), -1242853960)) == true then
				SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1663695754, GetUnitLoc(GetEnumUnit()))
				SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1657081318, AddSpecialEffectLoc("Abilities\\Spells\\Other\\Aneu\\AneuCaster.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1663695754)))
				EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1657081318), 100.0)
				EXSetEffectSize(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1657081318), 2.5)
				YDWETimerDestroyEffect(3.0, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1657081318))
				SetUnitVertexColorBJ(GetEnumUnit(), 100.0, 100, 0.0, 30.0)
				SaveBoolean(YDHT, GetHandleId(GetEnumUnit()), -1021606187, true)
			else
				SetUnitVertexColorBJ(GetEnumUnit(), 50.0, 50.0, 50.0, 70.0)
			end
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 601864817) == udg_boci - 1 then
			SaveBoolean(YDHT, GetHandleId(GetEnumUnit()), -1021606187, false)
			if IsUnitInGroup(GetEnumUnit(), udg_zouguo_luxian) == true then
				SetUnitVertexColorBJ(GetEnumUnit(), 100.0, 0.0, 0.0, 30.0)
			else
				SetUnitVertexColorBJ(GetEnumUnit(), 50.0, 50.0, 50.0, 70.0)
			end
		else
		end
	else
	end
end

function Trig_________________011Actions()
	local ydl_group
	local ydl_unit
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	PanCameraToTimed(1400.0, -2800.0 + 200.0 * I2R(udg_boci), 0.0)
	ForGroupBJ(YDWEGetUnitsOfPlayerAllNull(Player(PLAYER_NEUTRAL_PASSIVE)), Trig_________________011Func002A)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig_________________011()
	gg_trg_________________011 = CreateTrigger()
	TriggerAddAction(gg_trg_________________011, Trig_________________011Actions)
end

function Trig______________011Func002Func004A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingLocBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_dtzhongxindian[1])
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 0.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(32), 0.0)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	if GetUnitAbilityLevel(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093677902) > 0 and GetUnitLifePercent(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) <= 50.0 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], ConvertUnitState(32), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], ConvertUnitState(32)) + I2R(GetHeroAgi(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], true)) / 2.0)
	else
	end
end

function Trig______________011Func003Func005A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingLocBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_dtzhongxindian[1])
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 0.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(32), 0.0)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	if GetUnitAbilityLevel(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093677902) > 0 and GetUnitLifePercent(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) <= 50.0 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], ConvertUnitState(32), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], ConvertUnitState(32)) + I2R(GetHeroAgi(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], true)) / 2.0)
	else
	end
end

function Trig______________011Func004Func001A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_Shangdian_dian[1], bj_UNIT_FACING)
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 300.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
end

function Trig______________011Func005Func001A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_Shangdian_dian[3], bj_UNIT_FACING)
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 300.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), GetUnitLifePercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)) + 30.0)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
end

function Trig______________011Func007Func002Func001Func001Func004A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingLocBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_dtzhongxindian[1])
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 0.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(32), 0.0)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
end

function Trig______________011Func007Func002Func001Func002A()
	SaveBoolean(YDHT, GetHandleId(GetEnumPlayer()), 22353269, false)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_Shangdian_dian[2], bj_UNIT_FACING)
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 300.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
end

function Trig______________011Func007Func002Func002A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_Shangdian_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1912979307)], bj_UNIT_FACING)
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 300.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1912979307) == 2 then
		SaveBoolean(YDHT, GetHandleId(GetEnumPlayer()), 22353269, false)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1912979307) == 3 then
		SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), GetUnitLifePercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)) + 30.0)
		AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
	else
	end
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
end

function Trig______________011Func008Func005A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	SetUnitPositionLocFacingLocBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], udg_dtzhongxindian[1])
	SetUnitMoveSpeed(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 0.0)
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 100)
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(32), 0.0)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
end

function Trig______________011Func009A()
	HopeCamera_EnterRoom(GetEnumPlayer())
	ForceAddPlayerSimple(GetEnumPlayer(), udg_WJZ_______weizhunbei)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)])
	HopeMeditation_Clear(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260))
	udg_Linshi_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = 0
	UnitResetCooldown(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1446360359, LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260), 1494149627))
	SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)), 149034428, false)
	udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] + 2.0
	if udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] > udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] then
		udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]
	else
	end
	YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1446360359), 1, 218, "消耗专注值使一下次攻击发动精确打击 |n 所需专注值：3 |n |c00fffc01当前剩余专注值: " .. (R2S(udg_zhuanzhuzhi_sy[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) or "") .. "|r")
	if GetUnitAbilityLevel(udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 1093677646) > 0 then
		AdjustPlayerStateBJ(75, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	else
	end
	udg_Shuchu_dm_tj[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)] = 0.0
end

function Trig______________011Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	TriggerSleepAction(0.5)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	HopeMarket_InRoom = false
	HopeCoop_BeginRoom()
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651849 then
		udg_huihe_s = 0
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956, R2I(I2R(udg_boci) / 4.0 + 0.0))
		ConditionalTriggerExecute(gg_trg________________________________028)
		ForForce(udg_WJZ, Trig______________011Func002Func004A)
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = udg_Guaiwu_sl + GetRandomInt(0, 1)
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			if GetRandomInt(1, 10) <= 2 then
				CreateNUnitsAtLocFacingLocBJ(1, udg_boci_gw_lx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956) + 1], Player(11), udg_Guaiwu_dian[bj_forLoopAIndex], udg_dtzhongxindian[3])
			else
				CreateNUnitsAtLocFacingLocBJ(1, udg_boci_gw_lx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956)], Player(11), udg_Guaiwu_dian[bj_forLoopAIndex], udg_dtzhongxindian[3])
			end
			SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
			PauseUnitBJ(true, GetLastCreatedUnit())
			GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
	else
	end
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651850 then
		udg_huihe_s = 0
		SaveInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460, 1)
		if udg_boci <= 7 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956, GetRandomInt(0, 1))
		else
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956, GetRandomInt(1, 2))
		end
		ConditionalTriggerExecute(gg_trg________________________________028)
		ForForce(udg_WJZ, Trig______________011Func003Func005A)
		CreateNUnitsAtLocFacingLocBJ(1, udg_BOSS_LX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956)], Player(11), udg_Boss_dian[1], udg_dtzhongxindian[3])
		SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
		SetUnitState(GetLastCreatedUnit(), UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetLastCreatedUnit()) * (0.9 + 0.1 * I2R(udg_Guaiwu_sl)))
		SetUnitLifePercentBJ(GetLastCreatedUnit(), 100)
		PauseUnitBJ(true, GetLastCreatedUnit())
		GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
	else
	end
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651851 then
		ForForce(udg_WJZ, Trig______________011Func004Func001A)
		AddItemToStockBJ(1227895618, gg_unit_n00P_0024, 1, 1)
		HopeMarket_InRoom = true
		AddItemToStockBJ(1227895618, gg_unit_n00Q_0028, 1, 1)
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = udg_zhengshu
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			RemoveItemFromStockBJ(udg_wp[bj_forLoopAIndex], gg_unit_n00P_0024)
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = 6
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			AddItemToStockBJ(udg_wp[GetRandomInt(5, udg_zhengshu)], gg_unit_n00P_0024, 1, 1)
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
		bj_forLoopAIndex = 1
		bj_forLoopAIndexEnd = udg_zhengskill
		for _ in _loop_() do
			if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
			RemoveItemFromStockBJ(udg_Skill_wp[bj_forLoopAIndex], gg_unit_n00Q_0028)
			bj_forLoopAIndex = bj_forLoopAIndex + 1
		end
		bj_forLoopBIndex = 1
		bj_forLoopBIndexEnd = 3
		for _ in _loop_() do
			if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
			AddItemToStockBJ(udg_Skill_wp[GetRandomInt(1, udg_zhengskill)], gg_unit_n00Q_0028, 1, 1)
			bj_forLoopBIndex = bj_forLoopBIndex + 1
		end
		EnableTrigger(gg_trg_L____________0012)
	else
	end
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651853 then
		ForForce(udg_WJZ, Trig______________011Func005Func001A)
		EnableTrigger(gg_trg_L____________0012)
	else
	end
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651855 then
		ConditionalTriggerExecute(gg_trg_X________________030)
	else
	end
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651852 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1912979307, GetRandomInt(1, 6))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1912979307) <= 3 then
			ForForce(udg_WJZ, Trig______________011Func007Func002Func002A)
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1912979307) == 1 then
				AddItemToStockBJ(1227895618, gg_unit_n00P_0024, 1, 1)
				HopeMarket_InRoom = true
				AddItemToStockBJ(1227895618, gg_unit_n00Q_0028, 1, 1)
				bj_forLoopAIndex = 1
				bj_forLoopAIndexEnd = udg_zhengshu
				for _ in _loop_() do
					if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
					RemoveItemFromStockBJ(udg_wp[bj_forLoopAIndex], gg_unit_n00P_0024)
					bj_forLoopAIndex = bj_forLoopAIndex + 1
				end
				bj_forLoopAIndex = 1
				bj_forLoopAIndexEnd = 6
				for _ in _loop_() do
					if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
					AddItemToStockBJ(udg_wp[GetRandomInt(5, udg_zhengshu)], gg_unit_n00P_0024, 1, 1)
					bj_forLoopAIndex = bj_forLoopAIndex + 1
				end
				bj_forLoopAIndex = 1
				bj_forLoopAIndexEnd = udg_zhengskill
				for _ in _loop_() do
					if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
					RemoveItemFromStockBJ(udg_Skill_wp[bj_forLoopAIndex], gg_unit_n00Q_0028)
					bj_forLoopAIndex = bj_forLoopAIndex + 1
				end
				bj_forLoopAIndex = 1
				bj_forLoopAIndexEnd = 3
				for _ in _loop_() do
					if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
					AddItemToStockBJ(udg_Skill_wp[GetRandomInt(1, udg_zhengskill)], gg_unit_n00Q_0028, 1, 1)
					bj_forLoopAIndex = bj_forLoopAIndex + 1
				end
			else
			end
		else
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1912979307) == 4 then
				ForForce(udg_WJZ, Trig______________011Func007Func002Func001Func002A)
			else
				if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1912979307) == 5 then
					ConditionalTriggerExecute(gg_trg_X________________030)
				else
					udg_huihe_s = 0
					SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956, R2I(I2R(udg_boci) / 4.0 + 0.0))
					ForForce(udg_WJZ, Trig______________011Func007Func002Func001Func001Func004A)
					bj_forLoopAIndex = 1
					bj_forLoopAIndexEnd = udg_Guaiwu_sl
					for _ in _loop_() do
						if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
						if GetRandomInt(1, 10) <= 2 then
							CreateNUnitsAtLocFacingLocBJ(1, udg_boci_gw_lx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956) + 1], Player(11), udg_Guaiwu_dian[bj_forLoopAIndex], udg_dtzhongxindian[3])
						else
							CreateNUnitsAtLocFacingLocBJ(1, udg_boci_gw_lx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956)], Player(11), udg_Guaiwu_dian[bj_forLoopAIndex], udg_dtzhongxindian[3])
						end
						SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
						PauseUnitBJ(true, GetLastCreatedUnit())
						GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
						bj_forLoopAIndex = bj_forLoopAIndex + 1
					end
					ConditionalTriggerExecute(gg_trg________________________________028)
					udg_Guaiwu_Fuhuo_cs = GetRandomInt(1, udg_Guaiwu_sl)
					HopeEvent_Begin()
					HopeEvent_Add("你们随机到了特殊小怪关卡，小怪会有数次复活机会")
				end
			end
		end
		EnableTrigger(gg_trg_L____________0012)
	else
	end
	if GetUnitTypeId(udg_Youxi_xzgq) == 1848651854 then
		udg_huihe_s = 0
		SaveInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460, 1)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1840415956, R2I(I2R(udg_boci) / 4.0 + 0.0))
		ConditionalTriggerExecute(gg_trg________________________________028)
		ForForce(udg_WJZ, Trig______________011Func008Func005A)
		CreateNUnitsAtLocFacingLocBJ(1, udg_BOSS_LX_______DA[1], Player(11), udg_Boss_dian[1], udg_dtzhongxindian[3])
		SetHeroLevelBJ(GetLastCreatedUnit(), 5, false)
		SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
		SetUnitState(GetLastCreatedUnit(), UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetLastCreatedUnit()) * (1.0 + 0.2 * I2R(udg_Guaiwu_sl)))
		SetUnitLifePercentBJ(GetLastCreatedUnit(), 100)
		PauseUnitBJ(true, GetLastCreatedUnit())
		GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
	else
	end
	ForForce(udg_WJZ, Trig______________011Func009A)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig______________011()
	gg_trg______________011 = CreateTrigger()
	TriggerAddAction(gg_trg______________011, Trig______________011Actions)
end

function Trig_L____________0012Actions()
	ConditionalTriggerExecute(gg_trg_________________011)
	DisableTrigger(GetTriggeringTrigger())
end

function InitTrig_L____________0012()
	gg_trg_L____________0012 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg_L____________0012, gg_rct______________004________2)
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg_L____________0012, gg_rct______________004_______u)
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg_L____________0012, gg_rct______________004)
	TriggerAddAction(gg_trg_L____________0012, Trig_L____________0012Actions)
end

function Trig____________________038Actions()
	if GetItemTypeId(GetManipulatedItem()) == 1227895618 or GetItemTypeId(GetManipulatedItem()) == 1227895889 or GetItemTypeId(GetManipulatedItem()) == 1227895888 or GetItemTypeId(GetManipulatedItem()) == 1953066546 or GetItemTypeId(GetManipulatedItem()) == 1952741426 or GetItemTypeId(GetManipulatedItem()) == 1953723442 then
		RemoveItem(GetManipulatedItem())
	else
	end
end

function InitTrig____________________038()
	gg_trg____________________038 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________038, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddAction(gg_trg____________________038, Trig____________________038Actions)
end

function Trig_____________00013Func001A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
end

function Trig_____________00013Actions()
	ForForce(udg_WJZ, Trig_____________00013Func001A)
end

function InitTrig_____________00013()
	gg_trg_____________00013 = CreateTrigger()
	TriggerAddAction(gg_trg_____________00013, Trig_____________00013Actions)
end

function Trig____________________031Actions()
	udg_Youxi1_dian[1] = Location(1632.0, 3047.0)
	udg_Youxi1_dian[2] = Location(1732.0, 3047.0)
	udg_Youxi1_dian[3] = Location(1832.0, 3047.0)
	udg_Youxi1_dian[4] = Location(1932.0, 3047.0)
	udg_Youxi1_dian[5] = Location(2032.0, 3047.0)
	udg_Youxi1_dian[6] = Location(2132.0, 3047.0)
	udg_Youxi1_dian[7] = Location(2232.0, 3047.0)
	udg_Youxi1_dian[8] = Location(2332.0, 3047.0)
	udg_Youxi1_dian[11] = Location(1682.0, 1337.0)
	udg_Youxi1_dian[12] = Location(1782.0, 1337.0)
	udg_Youxi1_dian[13] = Location(1882.0, 1337.0)
	udg_Youxi1_dian[14] = Location(1982.0, 1337.0)
	udg_Youxi1_dian[15] = Location(2082.0, 1337.0)
	udg_Youxi1_dian[16] = Location(2182.0, 1337.0)
	udg_Youxi1_dian[17] = Location(2282.0, 1337.0)
	udg_Youxi1_dian[18] = Location(2382.0, 1337.0)
	udg_Lieyan = Location(4985.0, 1865.0)
	udg_Youxi1_sjgwlx[1] = 1697656916
	udg_Youxi1_sjgwlx[2] = 1697656917
	udg_Youxi1_sjgwlx[3] = 1697656921
	udg_Youxi1_sjgwlx[4] = 1697656918
	udg_Youxi1_sjgwlx[5] = 1697656919
	udg_Youxi1_sjgwlx[6] = 1697656920
	udg_Youxi1_sjgwlx[7] = 1697656922
	udg_Youxi1_sjgwlx[8] = 1697656922
	udg_Youxi1_sjgwlx[9] = 1697656922
end

function InitTrig____________________031()
	gg_trg____________________031 = CreateTrigger()
	TriggerAddAction(gg_trg____________________031, Trig____________________031Actions)
end

function Trig____________________037Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 15
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetRandomLocInRect(gg_rct______________011))
		CreateNUnitsAtLoc(1, 1848652098, Player(10), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), bj_UNIT_FACING)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, GetLocationX(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)))
		if GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) >= -2000.0 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) + GetRandomReal(-400.0, -1000.0))
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) + GetRandomReal(400.0, 1000.0))
		end
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, Location(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414)))
		IssuePointOrderByIdLoc(GetLastCreatedUnit(), 851990, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 5
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		if GetRandomInt(1, 2) == 1 then
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetRandomLocInRect(gg_rct______________013))
			CreateNUnitsAtLoc(1, 1848652098, Player(10), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), bj_UNIT_FACING)
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, GetLocationX(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) - GetRandomReal(-400.0, -800.0))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) + 0.0)
		else
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetRandomLocInRect(gg_rct______________012))
			CreateNUnitsAtLoc(1, 1848652098, Player(10), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), bj_UNIT_FACING)
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, GetLocationX(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) + GetRandomReal(400.0, 800.0))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345)) + 0.0)
		end
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, Location(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414)))
		IssuePointOrderByIdLoc(GetLastCreatedUnit(), 851990, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________037()
	gg_trg____________________037 = CreateTrigger()
	TriggerAddAction(gg_trg____________________037, Trig____________________037Actions)
end

function Trig_X________________030Func001A()
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
	AddHeroXPSwapped(150, udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true)
end

function Trig_X________________030Func002Func001Func002A()
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261, CreateUnit(GetEnumPlayer(), 1747988551, -1700.0, -6300.0, 0))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261), UNIT_STATE_MAX_LIFE, 100.0 + GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], UNIT_STATE_MAX_LIFE))
	SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261), 100)
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261), ConvertUnitState(18), 20.0 + GetUnitStateSwap(ConvertUnitState(20), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) / 3.0)
	HopeMini_Attach(GetEnumPlayer(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -866047261))
end

function Trig_X________________030Func002Func001Func007Func002Func001001002()
	return RectContainsUnit(gg_rct______________018, GetFilterUnit()) == true
end

function Trig_X________________030Func002Func001Func007Func002Func001A()
	KillUnit(GetEnumUnit())
	YDWETimerRemoveUnit(2, GetEnumUnit())
end

function Trig_X________________030Func002Func001Func007T()
	local ydl_group
	local ydl_unit
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 120 then
		ForGroupBJ(YDWEGetUnitsOfPlayerMatchingNull(Player(PLAYER_NEUTRAL_AGGRESSIVE), Condition(Trig_X________________030Func002Func001Func007Func002Func001001002)), Trig_X________________030Func002Func001Func007Func002Func001A)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, 1966092362)
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetRandomLocInRect(gg_rct______________018))
		CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(PLAYER_NEUTRAL_AGGRESSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, 1966092362)
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetRandomLocInRect(gg_rct______________018))
		CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(PLAYER_NEUTRAL_AGGRESSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 30 and GetRandomInt(1, 4) == 1 then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, 1966092363)
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetRandomLocInRect(gg_rct______________018))
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(PLAYER_NEUTRAL_AGGRESSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), bj_UNIT_FACING)
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 30 and GetRandomInt(1, 4) == 1 then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, 1966092365)
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetRandomLocInRect(gg_rct______________018))
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(PLAYER_NEUTRAL_AGGRESSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), bj_UNIT_FACING)
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 30 and GetRandomInt(1, 4) == 1 then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, 1966092366)
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetRandomLocInRect(gg_rct______________018))
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(PLAYER_NEUTRAL_AGGRESSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), bj_UNIT_FACING)
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 60 and GetRandomInt(1, 5) == 1 then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, 1966092364)
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetRandomLocInRect(gg_rct______________018))
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(PLAYER_NEUTRAL_AGGRESSIVE), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), bj_UNIT_FACING)
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		else
		end
	end
	ydl_group = nil
	ydl_unit = nil
end

function Trig_X________________030Func002Func001Func008A()
	HopeMini_Attach(GetEnumPlayer(), CreateUnit(GetEnumPlayer(), 1747988537, 400.0, 2000.0, bj_UNIT_FACING))
end

function Trig_X________________030Func002Func001Func011A()
	HopeMini_Focus(GetEnumPlayer())
end

function Trig_X________________030Func002Func001Func016T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 90 then
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		if GetRandomInt(1, 2) == 1 then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, udg_Youxi1_sjgwlx[GetRandomInt(1, 9)])
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 886448910, GetRandomReal(3.0, 7.0))
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(10), udg_Youxi1_dian[GetRandomInt(1, 8)], bj_UNIT_FACING)
			YDWETimerPatternRushSlide(GetLastCreatedUnit(), 270.0, 1800.0, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 886448910), 0.03, 0, false, false, false, "origin", "", "")
			YDWETimerRemoveUnit(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 886448910) - 0.05, GetLastCreatedUnit())
		else
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936, udg_Youxi1_sjgwlx[GetRandomInt(1, 9)])
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 886448910, GetRandomReal(3.0, 7.0))
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 5290936), Player(10), udg_Youxi1_dian[GetRandomInt(11, 18)], bj_UNIT_FACING)
			YDWETimerPatternRushSlide(GetLastCreatedUnit(), 90.0, 1800.0, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 886448910), 0.03, 0, false, false, false, "origin", "", "")
			YDWETimerRemoveUnit(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 886448910) - 0.05, GetLastCreatedUnit())
		end
	end
end

function Trig_X________________030Func002Func002Func002Func003Func001Func002Func007Func001Func001Func004T()
	ResetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	YDWETimerDestroyEffect(2, AddSpecialEffectTarget("Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "origin"))
	SetUnitPosition(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), 3500.0, -724.0)
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), UNIT_STATE_LIFE, 5.0)
	PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_X________________030Func002Func002Func002Func003T()
	local ydl_group
	local ydl_unit
	local ydl_timer
	if RectContainsUnit(gg_rct______________010, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) == true then
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
		if GetTerrainTypeBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)) == 1315529573 then
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, GetLocationX(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)) + CosBJ(GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))) * 20.0)
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)) + SinBJ(GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))) * 20.0)
			if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) >= 7438.0 then
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, 7438.0)
			else
			end
			if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) <= 3344.0 then
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, 3344.0)
			else
			end
			if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) >= -356.0 then
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, -356.0)
			else
			end
			if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) <= -3604.0 then
				SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, -3604.0)
			else
			end
			if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), UNIT_STATE_LIFE) > 2.0 then
				ydl_group = CreateGroup()
				GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 120.0, nil)
				for _ in _loop_() do
					ydl_unit = FirstOfGroup(ydl_group)
					if ydl_unit == nil then break end
					GroupRemoveUnit(ydl_group, ydl_unit)
					if GetUnitTypeId(ydl_unit) == 1848652098 then
						SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "death")
						PauseUnitBJ(true, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
						SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), UNIT_STATE_LIFE, 1.0)
						ydl_timer = CreateTimer()
						SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
						TimerStart(ydl_timer, 3.0, false, Trig_X________________030Func002Func002Func002Func003Func001Func002Func007Func001Func001Func004T)
					else
					end
				end
				DestroyGroup(ydl_group)
			else
			end
			if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), UNIT_STATE_LIFE) > 2.0 then
				SetUnitPosition(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
			else
			end
		else
		end
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_group = nil
	ydl_unit = nil
	ydl_timer = nil
end

function Trig_X________________030Func002Func002Func002A()
	local ydl_timer
	CreateNUnitsAtLoc(1, 1747988547, GetEnumPlayer(), GetRandomLocInRect(gg_rct______________009), bj_UNIT_FACING)
	HopeMini_Attach(GetEnumPlayer(), GetLastCreatedUnit())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, GetLastCreatedUnit())
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1663695754))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1449975558))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -34188414))
	TimerStart(ydl_timer, 0.03, true, Trig_X________________030Func002Func002Func002Func003T)
	ydl_timer = nil
end

function Trig_X________________030Func002Func002Func009A()
	HopeMini_Attach(GetEnumPlayer(), CreateUnit(GetEnumPlayer(), 1747988545, 4946.0, 1850.0, bj_UNIT_FACING))
end

function Trig_X________________030Func002Func002Func012A()
	HopeMini_Focus(GetEnumPlayer())
end

function Trig_X________________030Func002Func002Func017T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 45 then
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		if GetRandomInt(1, 5) ~= 1 then
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
			CreateItemLoc(1227895092, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
			YDWETimerRemoveItem(25.0, GetLastCreatedItem())
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
			if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 15 then
				SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
				CreateItemLoc(1227895092, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
				YDWETimerRemoveItem(25.0, GetLastCreatedItem())
				RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
			else
			end
			if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 30 then
				SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
				CreateItemLoc(1227895092, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
				YDWETimerRemoveItem(25.0, GetLastCreatedItem())
				RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
				SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
				CreateItemLoc(1227895092, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
				YDWETimerRemoveItem(25.0, GetLastCreatedItem())
				RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
			else
			end
		else
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
			CreateItemLoc(1227895881, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
			YDWETimerRemoveItem(15.0, GetLastCreatedItem())
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		end
		if GetRandomInt(1, 20) == 1 then
			SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
			CreateItemLoc(1227895353, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
			YDWETimerRemoveItem(15.0, GetLastCreatedItem())
			RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		else
		end
	end
end

function Trig_X________________030Func002Func002Func018Func002Func005T()
	if RectContainsUnit(gg_rct______________008, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430)) == true then
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
		IssuePointOrderLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), "flamestrike", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
end

function Trig_X________________030Func002Func002Func018T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -468084177, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -468084177) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -468084177) <= 10 then
		SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430, CreateUnitAtLoc(Player(10), 1747988546, udg_Lieyan, 0))
		YDWETimerRemoveUnit(20.0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430))
		TimerStart(ydl_timer, GetRandomReal(2.0, 3.0), true, Trig_X________________030Func002Func002Func018Func002Func005T)
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetRandomLocInRect(gg_rct______________008))
		IssuePointOrderLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), "flamestrike", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	else
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_X________________030Actions()
	local ydl_timer
	ForForce(udg_WJZ, Trig_X________________030Func001A)
	if GetRandomInt(1, 2) == 1 then
		if GetRandomInt(1, 2) == 1 then
			ForForce(udg_WJZ, Trig_X________________030Func002Func001Func008A)
			TriggerSleepAction(1.0)
			DisplayTextToForce(GetPlayersAll(), "你们进入了小游戏房，5秒后游戏开始~请做好准备\
进入射箭小游戏，射中什么就可以获得什么奖励~")
			ForForce(udg_WJZ, Trig_X________________030Func002Func001Func011A)
			TriggerSleepAction(4.0)
			CreateTimerDialogBJ(udg_Youxi1_jishiqi, "游戏时间剩余:")
			udg_Youxi1_jishiqi_ck = GetLastCreatedTimerDialogBJ()
			StartTimerBJ(udg_Youxi1_jishiqi, false, 45.0)
			ydl_timer = CreateTimer()
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
			SaveReal(YDLOC, GetHandleId(ydl_timer), 886448910, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 886448910))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), 5290936, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 5290936))
			TimerStart(ydl_timer, 0.5, true, Trig_X________________030Func002Func001Func016T)
		else
			DisplayTextToForce(GetPlayersAll(), "你们进入了小游戏房，5秒后游戏开始~请做好准备\
割草就完事了")
			ForForce(udg_WJZ, Trig_X________________030Func002Func001Func002A)
			TriggerSleepAction(4.0)
			CreateTimerDialogBJ(udg_Youxi1_jishiqi, "游戏时间剩余:")
			udg_Youxi1_jishiqi_ck = GetLastCreatedTimerDialogBJ()
			StartTimerBJ(udg_Youxi1_jishiqi, false, 90.0)
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -168352345, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -168352345))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), 5290936, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 5290936))
			TimerStart(ydl_timer, 0.75, true, Trig_X________________030Func002Func001Func007T)
		end
	else
		if GetRandomInt(1, 2) == 1 then
			ForForce(udg_WJZ, Trig_X________________030Func002Func002Func009A)
			TriggerSleepAction(1.0)
			DisplayTextToForce(GetPlayersAll(), "你们进入了小游戏房，5秒后游戏开始~请做好准备\
躲开烈焰风暴活下来！顺便捡钱！")
			ForForce(udg_WJZ, Trig_X________________030Func002Func002Func012A)
			TriggerSleepAction(4.0)
			CreateTimerDialogBJ(udg_Youxi1_jishiqi, "游戏时间剩余:")
			udg_Youxi1_jishiqi_ck = GetLastCreatedTimerDialogBJ()
			StartTimerBJ(udg_Youxi1_jishiqi, false, 45.0)
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1663695754))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -68293548))
			TimerStart(ydl_timer, 1.0, true, Trig_X________________030Func002Func002Func017T)
			ydl_timer = CreateTimer()
			SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1663695754))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -468084177, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -468084177))
			TimerStart(ydl_timer, 3.0, true, Trig_X________________030Func002Func002Func018T)
		else
			ConditionalTriggerExecute(gg_trg____________________037)
			ForForce(udg_WJZ, Trig_X________________030Func002Func002Func002A)
			TriggerSleepAction(1.0)
			DisplayTextToForce(GetPlayersAll(), "你们进入了小游戏房，5秒后游戏开始~请做好准备\
在有限的时间内溜冰到达终点即可获得奖励")
			TriggerSleepAction(4.0)
			CreateTimerDialogBJ(udg_Youxi1_jishiqi, "游戏时间剩余:")
			udg_Youxi1_jishiqi_ck = GetLastCreatedTimerDialogBJ()
			StartTimerBJ(udg_Youxi1_jishiqi, false, 60.0)
		end
	end
	ydl_timer = nil
end

function InitTrig_X________________030()
	gg_trg_X________________030 = CreateTrigger()
	TriggerAddAction(gg_trg_X________________030, Trig_X________________030Actions)
end

function Trig____________________032Conditions()
	return GetSpellAbilityId() == 1093678136
end

function Trig____________________032Func010T()
	local ydl_group
	local ydl_unit
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 80 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 30.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 30.0)
		if LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) > 3047.0 then
			SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, 3047.0)
		else
		end
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		ydl_group = CreateGroup()
		GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 90.0, nil)
		for _ in _loop_() do
			ydl_unit = FirstOfGroup(ydl_group)
			if ydl_unit == nil then break end
			GroupRemoveUnit(ydl_group, ydl_unit)
			if IsUnitAliveBJ(ydl_unit) == true and GetOwningPlayer(ydl_unit) == Player(10) then
				DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
				UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, 200.0, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_ENHANCED)
				FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
				DestroyTimer(GetExpiredTimer())
			else
			end
		end
		DestroyGroup(ydl_group)
	end
	ydl_group = nil
	ydl_unit = nil
end

function Trig____________________032Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "attack")
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493, GetSpellTargetLoc())
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681, AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493)))
	SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\BallistaMissile\\BallistaMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
	EXEffectMatRotateZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
	EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), 50.0)
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
	SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
	TimerStart(ydl_timer, 0.03, true, Trig____________________032Func010T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig____________________032()
	gg_trg____________________032 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________032, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg____________________032, Condition(Trig____________________032Conditions))
	TriggerAddAction(gg_trg____________________032, Trig____________________032Actions)
end

function Trig____________________033Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, GetOwningPlayer(GetKillingUnitBJ()))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638)))
	if GetUnitTypeId(GetTriggerUnit()) == 1966092362 then
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "击杀小鬼，攻击力+3")
		SetUnitState(GetKillingUnitBJ(), ConvertUnitState(18), GetUnitState(GetKillingUnitBJ(), ConvertUnitState(18)) + 3.0)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092363 then
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "击杀攻速食尸鬼，攻击速度+20%")
		SetUnitState(GetKillingUnitBJ(), ConvertUnitState(81), GetUnitState(GetKillingUnitBJ(), ConvertUnitState(81)) + 0.2)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092365 then
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "击杀恢复食尸鬼，生命魔法恢复15%")
		SetUnitLifePercentBJ(GetKillingUnitBJ(), GetUnitLifePercent(GetKillingUnitBJ()) + 15.0)
		SetUnitManaPercentBJ(GetKillingUnitBJ(), GetUnitManaPercent(GetKillingUnitBJ()) + 15.0)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092366 then
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "击杀分裂食尸鬼，分裂等级+1")
		if GetUnitAbilityLevelSwapped(1093678404, GetKillingUnitBJ()) == 0 then
			UnitAddAbilityBJ(1093678404, GetKillingUnitBJ())
		else
			if GetUnitAbilityLevelSwapped(1093678404, GetKillingUnitBJ()) < 10 then
				IncUnitAbilityLevelSwapped(1093678404, GetKillingUnitBJ())
			else
				DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "击杀分裂食尸鬼，分裂等级已满")
			end
		end
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656916 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 100 * (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了金币，获得金钱奖励" .. (YDWEGetPlayerColorString(Player(4), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))) or ""))
		AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), PLAYER_STATE_RESOURCE_GOLD)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656921 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 200 * (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了经验书，获得经验奖励+" .. (YDWEGetPlayerColorString(Player(4), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))) or ""))
		AddHeroXP(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977), true)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656918 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 1 + (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了力量书，力量+" .. (YDWEGetPlayerColorString(Player(0), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))) or ""))
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656919 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 1 + (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了敏捷书，敏捷+" .. (YDWEGetPlayerColorString(Player(6), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))) or ""))
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656917 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 2 + (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了木材，木材+3")
		AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977), LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), PLAYER_STATE_RESOURCE_LUMBER)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656920 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 2 + (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了智力书，智力+" .. (YDWEGetPlayerColorString(Player(1), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))) or ""))
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977))
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1697656922 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977, 30 * (udg_quanshu + 1))
		DisplayTextToPlayer(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), 0, 0, "射中了石头，射的真准，获得了少量经验")
		AddHeroXP(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -170615977), true)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________033()
	gg_trg____________________033 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________033, EVENT_PLAYER_UNIT_DEATH)
	TriggerAddAction(gg_trg____________________033, Trig____________________033Actions)
end

function Trig____________________034Func004A()
	HopeMini_Detach(GetEnumPlayer())
	RemoveUnit(FirstOfGroup(YDWEGetUnitsOfPlayerAndTypeIdNull(GetEnumPlayer(), 1747988537)))
	RemoveUnit(FirstOfGroup(YDWEGetUnitsOfPlayerAndTypeIdNull(GetEnumPlayer(), 1747988545)))
	RemoveUnit(FirstOfGroup(YDWEGetUnitsOfPlayerAndTypeIdNull(GetEnumPlayer(), 1747988547)))
	RemoveUnit(FirstOfGroup(YDWEGetUnitsOfPlayerAndTypeIdNull(GetEnumPlayer(), 1747988551)))
end

function Trig____________________034Func006A()
	RemoveUnit(GetEnumUnit())
end

function Trig____________________034Actions()
	local ydl_group
	local ydl_unit
	DestroyTimerDialog(udg_Youxi1_jishiqi_ck)
	DisplayTextToForce(GetPlayersAll(), "小游戏时间到，进入下一关")
	TriggerSleepAction(3.0)
	ForForce(udg_WJZ, Trig____________________034Func004A)
	ConditionalTriggerExecute(gg_trg_________________011)
	ForGroupBJ(YDWEGetUnitsOfPlayerAndTypeIdNull(Player(10), 1848652098), Trig____________________034Func006A)
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig____________________034()
	gg_trg____________________034 = CreateTrigger()
	TriggerRegisterTimerExpireEvent(gg_trg____________________034, udg_Youxi1_jishiqi)
	TriggerAddAction(gg_trg____________________034, Trig____________________034Actions)
end

function Trig____________________030Conditions()
	return GetUnitTypeId(GetTriggerUnit()) == 1747988547
end

function Trig____________________030Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345, GetUnitLoc(GetTriggerUnit()))
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356, GetOrderPointLoc())
	SetUnitFacingTimed(GetTriggerUnit(), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356)), 0)
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________030()
	gg_trg____________________030 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________030, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
	TriggerAddCondition(gg_trg____________________030, Condition(Trig____________________030Conditions))
	TriggerAddAction(gg_trg____________________030, Trig____________________030Actions)
end

function Trig____________________035Conditions()
	return GetSpellAbilityId() == 1093678152
end

function Trig____________________035Actions()
	if LoadBoolean(YDHT, GetHandleId(GetTriggerUnit()), 2039566794) == false then
		SetCameraTargetControllerNoZForPlayer(GetOwningPlayer(GetTriggerUnit()), GetTriggerUnit(), 0, 0, false)
		SaveBoolean(YDHT, GetHandleId(GetTriggerUnit()), 2039566794, true)
	else
		if GetOwningPlayer(GetTriggerUnit()) == GetLocalPlayer() then
			HopeCamera_ResetKeepView()
		end
		SaveBoolean(YDHT, GetHandleId(GetTriggerUnit()), 2039566794, false)
	end
end

function InitTrig____________________035()
	gg_trg____________________035 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________035, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg____________________035, Condition(Trig____________________035Conditions))
	TriggerAddAction(gg_trg____________________035, Trig____________________035Actions)
end

function Trig____________________036Conditions()
	return GetUnitTypeId(GetTriggerUnit()) == 1747988547
end

function Trig____________________036Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SetUnitPositionLocFacingBJ(GetTriggerUnit(), GetRectCenter(gg_rct______________009), bj_UNIT_FACING)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530, 200 + 100 * udg_quanshu)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530) * 4)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	DisplayTextToForce(GetPlayersAll(), "恭喜玩家" .. (GetPlayerName(GetOwningPlayer(GetTriggerUnit())) or "") .. "到达终点 ，获得经验奖励：" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530)) or "") .. " 金钱奖励 200")
	AddHeroXPSwapped(_idiv_(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530), 4), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
	AddHeroXPSwapped(_idiv_(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530), 4), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
	AddHeroXPSwapped(_idiv_(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530), 4), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
	AddHeroXPSwapped(_idiv_(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1052731530), 4), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], true)
	AdjustPlayerStateBJ(200, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________036()
	gg_trg____________________036 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg____________________036, gg_rct______________014)
	TriggerAddCondition(gg_trg____________________036, Condition(Trig____________________036Conditions))
	TriggerAddAction(gg_trg____________________036, Trig____________________036Actions)
end

function Trig____________________018Conditions()
	return GetItemTypeId(GetManipulatedItem()) == 1227895368
end

function Trig____________________018Func004Func015Func002A()
	AdjustPlayerStateBJ(300, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	AdjustPlayerStateBJ(5, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
	HopeEvent_Result(GetEnumPlayer(), "金钱 +300，木材 +5")
end

function Trig____________________018Func004Func016Func002A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1960837124, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1960837124) + GetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD))
end

function Trig____________________018Func004Func016Func004A()
	SetPlayerStateBJ(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1960837124))
	HopeEvent_Result(GetEnumPlayer(), "均分后金钱：" .. (I2S(GetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)) or ""))
end

function Trig____________________018Func004Func017Func002A()
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430, udg_hero[GetConvertedPlayerId(GetEnumPlayer())])
	if GetRandomInt(1, 100) <= GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), true) then
		HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
		HopeEvent_Write(GetEnumPlayer(), "身手敏捷躲开了机关！没有受到伤害", false)
		HopeEvent_Write(GetEnumPlayer(), "吓出一身冷汗同时感觉自己的敏捷增加了1点", true)
		ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), bj_MODIFYMETHOD_ADD, 1)
	else
		if GetRandomInt(1, 100) <= 50 then
			HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
			HopeEvent_Write(GetEnumPlayer(), "没躲开机关受了伤", false)
			HopeEvent_Write(GetEnumPlayer(), " HP-30", true)
			if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), UNIT_STATE_LIFE) > 31.0 then
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), UNIT_STATE_LIFE, GetUnitStateSwap(UNIT_STATE_LIFE, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)) - 30.0)
			else
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), UNIT_STATE_LIFE, 1.0)
			end
		else
			HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
			HopeEvent_Write(GetEnumPlayer(), "躲开了机关但是用力过猛撞到了头", false)
			HopeEvent_Write(GetEnumPlayer(), "HP-10 智力-1", true)
			ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), bj_MODIFYMETHOD_SUB, 1)
			if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), UNIT_STATE_LIFE) > 11.0 then
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), UNIT_STATE_LIFE, GetUnitStateSwap(UNIT_STATE_LIFE, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)) - 10.0)
			else
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), UNIT_STATE_LIFE, 1.0)
			end
		end
	end
	TriggerSleepAction(0.5)
end

function Trig____________________018Func004Func021Func002A()
	local goldBefore = GetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	AdjustPlayerStateBJ(-150, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	HopeEvent_Result(GetEnumPlayer(), "金钱 -" .. (I2S(goldBefore - GetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)) or ""))
end

function Trig____________________018Func004Func023Func002A()
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430, udg_hero[GetConvertedPlayerId(GetEnumPlayer())])
	if GetRandomInt(1, 10) >= 5 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 94460517, _idiv_(GetHeroInt(udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true), 10) + GetRandomInt(1, 3))
		HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
		HopeEvent_Write(GetEnumPlayer(), "小小的领悟了，", false)
		HopeEvent_Write(GetEnumPlayer(), "技能伤害增加" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 94460517)) or "") .. "%", true)
		udg_Skill_Dm[GetConvertedPlayerId(GetEnumPlayer())] = udg_Skill_Dm[GetConvertedPlayerId(GetEnumPlayer())] + I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 94460517)) / 100.0
	else
		if GetRandomInt(1, 10) >= 5 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 94460517, _idiv_(GetHeroInt(udg_hero[GetConvertedPlayerId(GetEnumPlayer())], true), 5) + GetRandomInt(1, 10))
			udg_Skill_Dm[GetConvertedPlayerId(GetEnumPlayer())] = udg_Skill_Dm[GetConvertedPlayerId(GetEnumPlayer())] + I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 94460517)) / 100.0
			HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
			HopeEvent_Write(GetEnumPlayer(), "大彻大悟，感觉自己无敌了，", false)
			HopeEvent_Write(GetEnumPlayer(), "技能伤害增加" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 94460517)) or "") .. "%", true)
		else
			HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
			HopeEvent_Write(GetEnumPlayer(), "全明白了，感觉自己无敌了（其实是错觉）", false)
			HopeEvent_Write(GetEnumPlayer(), "什么也没增加", true)
		end
	end
	TriggerSleepAction(0.5)
end

function Trig____________________018Func004Func024Func002Func005Func003A()
	AdjustPlayerStateBJ(300, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
	HopeEvent_Result(GetEnumPlayer(), "金钱 +300")
end

function Trig____________________018Func004Func024Func002A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -610460479, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[GetConvertedPlayerId(GetEnumPlayer())])
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1927260811, GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), true) * 1 + 0)
	HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
	HopeEvent_Write(GetEnumPlayer(), "上去用力打了一下", false)
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1927260811) >= GetRandomInt(15, 75) then
		HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
		HopeEvent_Write(GetEnumPlayer(), "力大无穷，巨石被砸出一个大洞，里面掉出了无数金币！（全团金钱+300）", false)
		ForForce(udg_WJZ, Trig____________________018Func004Func024Func002Func005Func003A)
	else
		if GetRandomInt(1, 10) >= 5 then
			HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
			HopeEvent_Write(GetEnumPlayer(), "虽然用力砸了但是巨石纹丝不动似乎在嘲笑你没吃饭吗", false)
			HopeEvent_Write(GetEnumPlayer(), " 什么也没发生", true)
		else
			HopeEvent_Write(GetEnumPlayer(), HopeName_Clean(GetPlayerName(GetEnumPlayer())), true)
			HopeEvent_Write(GetEnumPlayer(), "用力一砸武器坏了！", false)
			HopeEvent_Write(GetEnumPlayer(), "（攻击力-5）", true)
			HopeEvent_Write(GetEnumPlayer(), "巨石纹丝不动", false)
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(18), GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(18)) - 5.0)
		end
	end
	TriggerSleepAction(0.5)
end

function Trig____________________018Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, GetOwningPlayer(GetTriggerUnit()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadBoolean(YDHT, GetHandleId(GetOwningPlayer(GetTriggerUnit())), 22353269) == false then
		HopeEvent_Begin()
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, GetRandomInt(1, 21))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 1 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被祝福了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，力量永久+3 经验值+300", true)
			ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 3)
			AddHeroXPSwapped(300, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 2 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被祝福了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，敏捷永久+3 经验值+300", true)
			ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 3)
			AddHeroXPSwapped(300, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 3 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被祝福了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，智力永久+3 经验值+300", true)
			ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 3)
			AddHeroXPSwapped(300, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 4 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被祝福了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，全属性永久+2 经验值+200", true)
			ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 2)
			ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 2)
			ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 2)
			AddHeroXPSwapped(200, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 5 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被祝福了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，经验+750", true)
			AddHeroXPSwapped(250, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
			AddHeroXPSwapped(250, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
			AddHeroXPSwapped(250, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 6 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "突然捡到钱了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，金钱+250", true)
			AdjustPlayerStateBJ(250, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), PLAYER_STATE_RESOURCE_GOLD)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 7 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "突然被钱砸了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "，金钱+500 当前生命-20", true)
			AdjustPlayerStateBJ(500, LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), PLAYER_STATE_RESOURCE_GOLD)
			if GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_LIFE) > 21.0 then
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_LIFE, GetUnitStateSwap(UNIT_STATE_LIFE, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) - 20.0)
			else
				SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_LIFE, 1.0)
			end
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 8 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "与恶魔签订了契约", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "当前全属性+5，HP上限-30", true)
			ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
			ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
			ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) - 30.0)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 9 then
			SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 421792254, ForcePickRandomPlayer(udg_WJZ))
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "与恶魔签订了契约但是出卖了队友", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "全属性+5" .. "", true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 421792254), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 421792254))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 421792254), "HP上限-30" .. "", true)
			ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
			ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
			ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
			SetUnitState(udg_hero[GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 421792254))], UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_hero[GetConvertedPlayerId(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 421792254))]) - 30.0)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 10 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被战神祝福", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "暴击率+5% 智力-5", true)
			ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_SUB, 5)
			udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 11 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被战神祝福", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "暴击伤害+10%", true)
			udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.1
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 12 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被财神祝福", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "所有玩家金钱+300 木材+5", false)
			ForForce(udg_WJZ, Trig____________________018Func004Func015Func002A)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 13 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "看到了一张卡片，捡起来一看是均贫卡", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "所有玩家金钱平分了", false)
			ForForce(udg_WJZ, Trig____________________018Func004Func016Func002A)
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1960837124, _idiv_(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1960837124), CountPlayersInForceBJ(udg_WJZ)))
			ForForce(udg_WJZ, Trig____________________018Func004Func016Func004A)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 14 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "不小心触发了机关！对所有玩家造成了伤害！", false)
			ForForce(udg_WJZ, Trig____________________018Func004Func017Func002A)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 15 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "命运女神开了个小差~", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "什么也没发生", true)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 16 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被邪神灌输了奇怪的知识", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "智力+10 力量-3 敏捷-3", true)
			ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_SUB, 3)
			ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_SUB, 3)
			ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 17 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被祝福了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "生命值全恢复", true)
			SetUnitLifePercentBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 100)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 18 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "被穷神盯上了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "所有玩家金钱-150", false)
			ForForce(udg_WJZ, Trig____________________018Func004Func021Func002A)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 19 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "发现了一个旧箱子，里面有1瓶药剂", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "药水次数+1", true)
			udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 20 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "发现了一本破旧的秘籍，让大家一起学习了", false)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "大家各自凭智力领悟了里面的内容", false)
			ForForce(udg_WJZ, Trig____________________018Func004Func023Func002A)
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936) == 21 then
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), HopeName_Clean(GetPlayerName(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638))), true)
			HopeEvent_Write(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "命运女神指引向了一块巨石，可能这块巨石里面有很多金币", false)
			ForForce(udg_WJZ, Trig____________________018Func004Func024Func002A)
		else
		end
		SaveBoolean(YDHT, GetHandleId(GetOwningPlayer(GetTriggerUnit())), 22353269, true)
	else
		if GetOwningPlayer(GetTriggerUnit()) == GetLocalPlayer() then
			HopeEvent_Open = true
			HopeLayout_Focus(14)
		end
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________018()
	gg_trg____________________018 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________018, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________018, Condition(Trig____________________018Conditions))
	TriggerAddAction(gg_trg____________________018, Trig____________________018Actions)
end

function Trig____________________019Actions()
	SaveInteger(YDHT, 1227895097, -825594136, 1429221445)
	SaveInteger(YDHT, 1227895097, 525422436, 1211117616)
	SaveInteger(YDHT, 1227895097, -1987608745, 10)
	SaveInteger(YDHT, 1227894849, -825594136, 1311780932)
	SaveInteger(YDHT, 1227894849, 525422436, 1211117616)
	SaveInteger(YDHT, 1227894849, -1987608745, 8)
	SaveInteger(YDHT, 1227894849, 1515921469, 8)
	SaveInteger(YDHT, 1227894839, -825594136, 1211117619)
	SaveInteger(YDHT, 1227894839, 525422436, 1211117616)
	SaveInteger(YDHT, 1227894839, 1515921469, 10)
	SaveInteger(YDHT, 1227894836, -825594136, 1211117617)
	SaveInteger(YDHT, 1227894836, 525422436, 1211117616)
	SaveInteger(YDHT, 1227894836, -1987608745, 10)
	SaveInteger(YDHT, 1227894838, -825594136, 1311780919)
	SaveInteger(YDHT, 1227894838, 1531982669, 1093677127)
	SaveInteger(YDHT, 1227894838, 525422436, 1211117616)
	SaveInteger(YDHT, 1227894838, -1133130087, 10)
	SaveInteger(YDHT, 1227894837, -825594136, 1160785976)
	SaveInteger(YDHT, 1227894837, 1531982669, 1093677128)
	SaveInteger(YDHT, 1227894837, 525422436, 1211117616)
	SaveInteger(YDHT, 1227894837, 1515921469, 10)
	SaveInteger(YDHT, 1227894856, -825594136, 1311780933)
	SaveInteger(YDHT, 1227894856, -1133130087, 10)
	SaveInteger(YDHT, 1227894856, 525422436, 1211117616)
	SaveInteger(YDHT, 1227895365, -825594136, 1328558129)
	SaveInteger(YDHT, 1227895365, 525422436, 1211117616)
	SaveInteger(YDHT, 1227895365, -1987608745, 12)
	SaveInteger(YDHT, 1227895605, -825594136, 1328558131)
	SaveInteger(YDHT, 1227895605, 525422436, 1211117616)
	SaveInteger(YDHT, 1227895605, -1987608745, 10)
	SaveInteger(YDHT, 1227895629, -825594136, 1211117624)
	SaveInteger(YDHT, 1227895629, 525422436, 1211117617)
	SaveInteger(YDHT, 1227895629, -1987608745, 25)
	SaveInteger(YDHT, 1227895886, -825594136, 1211117636)
	SaveInteger(YDHT, 1227895886, 525422436, 1211117617)
	SaveInteger(YDHT, 1227895886, -1987608745, 25)
	SaveInteger(YDHT, 1227895634, -825594136, 1311781175)
	SaveInteger(YDHT, 1227895634, 525422436, 1311780933)
	SaveInteger(YDHT, 1227895634, -1133130087, 30)
	SaveInteger(YDHT, 1227895898, -825594136, 1311781191)
	SaveInteger(YDHT, 1227895898, 525422436, 1311780933)
	SaveInteger(YDHT, 1227895898, -1133130087, 30)
	SaveInteger(YDHT, 1227895631, -825594136, 1311781176)
	SaveInteger(YDHT, 1227895631, 525422436, 1311780932)
	SaveInteger(YDHT, 1227895631, -1987608745, 15)
	SaveInteger(YDHT, 1227895631, 1515921469, 20)
	SaveInteger(YDHT, 1227895897, -825594136, 1311781190)
	SaveInteger(YDHT, 1227895897, 525422436, 1311780932)
	SaveInteger(YDHT, 1227895897, -1987608745, 15)
	SaveInteger(YDHT, 1227895897, 1515921469, 20)
	SaveInteger(YDHT, 1227895630, -825594136, 1160786003)
	SaveInteger(YDHT, 1227895630, 525422436, 1160785976)
	SaveInteger(YDHT, 1227895630, 1515921469, 25)
	SaveInteger(YDHT, 1227895887, -825594136, 1160786224)
	SaveInteger(YDHT, 1227895887, 525422436, 1160785976)
	SaveInteger(YDHT, 1227895887, 1515921469, 15)
	SaveInteger(YDHT, 1227895887, -1987608745, 15)
	SaveInteger(YDHT, 1227895633, -825594136, 1211117620)
	SaveInteger(YDHT, 1227895633, 525422436, 1211117619)
	SaveInteger(YDHT, 1227895633, 1515921469, 30)
	SaveInteger(YDHT, 1227895893, -825594136, 1211117637)
	SaveInteger(YDHT, 1227895893, 525422436, 1211117619)
	SaveInteger(YDHT, 1227895893, 1515921469, 25)
	SaveInteger(YDHT, 1227895632, -825594136, 1311781174)
	SaveInteger(YDHT, 1227895632, 525422436, 1311780919)
	SaveInteger(YDHT, 1227895632, -1133130087, 30)
	SaveInteger(YDHT, 1227895895, -825594136, 1311781189)
	SaveInteger(YDHT, 1227895895, 525422436, 1311780919)
	SaveInteger(YDHT, 1227895895, -1133130087, 30)
	SaveInteger(YDHT, 1227895635, -825594136, 1328558132)
	SaveInteger(YDHT, 1227895635, 525422436, 1328558131)
	SaveInteger(YDHT, 1227895635, -1987608745, 20)
	SaveInteger(YDHT, 1227896116, -825594136, 1328558134)
	SaveInteger(YDHT, 1227896116, 525422436, 1328558131)
	SaveInteger(YDHT, 1227896116, -1987608745, 20)
	SaveInteger(YDHT, 1227896116, 1515921469, 20)
	SaveInteger(YDHT, 1227895636, -825594136, 1311781185)
	SaveInteger(YDHT, 1227895636, 525422436, 1328558129)
	SaveInteger(YDHT, 1227895636, -1987608745, 30)
	SaveInteger(YDHT, 1227896115, -825594136, 1328558133)
	SaveInteger(YDHT, 1227896115, 525422436, 1328558129)
	SaveInteger(YDHT, 1227896115, -1987608745, 30)
end

function InitTrig____________________019()
	gg_trg____________________019 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________019, 0.1)
	TriggerAddAction(gg_trg____________________019, Trig____________________019Actions)
end

function Trig____________________020Conditions()
	return GetHeroLevel(GetTriggerUnit()) >= 5 and HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -825594136) == true and GetUnitTypeId(GetTriggerUnit()) == 1211117616
end

function Trig____________________020Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 43514761, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 525422436))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1248605477, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -825594136))
	if GetUnitTypeId(GetTriggerUnit()) == LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 43514761) then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757693831, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1987608745))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1698842604, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 1515921469))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1462083387, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1133130087))
		if HopeJob_RandomPromotion or GetHeroStr(GetTriggerUnit(), false) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757693831) and GetHeroAgi(GetTriggerUnit(), false) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1698842604) and GetHeroInt(GetTriggerUnit(), false) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1462083387) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1248605477), GetOwningPlayer(GetTriggerUnit()), GetUnitLoc(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]), bj_UNIT_FACING)
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261, GetLastCreatedUnit())
			bj_forLoopBIndex = 1
			bj_forLoopBIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
				UnitAddItem(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopBIndex))
				bj_forLoopBIndex = bj_forLoopBIndex + 1
			end
			SetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), false), true)
			SetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), false), true)
			SetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), false), true)
			ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), bj_MODIFYMETHOD_SUB, udg_Ls_zj_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			udg_Ls_zj_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), UNIT_STATE_MAX_LIFE, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE))
			SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), 100)
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), UNIT_STATE_MAX_MANA, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_MANA))
			udg_Minjie_jiaGong[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
			RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261)
			UnitAddAbilityBJ(LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1093503686), GetLastCreatedUnit())
			UnitAddAbilityBJ(LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1068628448), GetLastCreatedUnit())
			UnitAddAbilityBJ(LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1494149627), GetLastCreatedUnit())
			if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] ~= 1093677388 then
				UnitAddAbilityBJ(udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], GetLastCreatedUnit())
			else
			end
			SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), GetUnitState(GetLastCreatedUnit(), ConvertUnitState(18)) + I2R(udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]))
			if HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 1531982669) == true then
				UnitAddAbilityBJ(LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 1531982669), udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			else
			end
		else
			DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "属性不达标,转职失败")
		end
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "你的英雄无法转职该职业")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________020()
	gg_trg____________________020 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________020, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________020, Condition(Trig____________________020Conditions))
	TriggerAddAction(gg_trg____________________020, Trig____________________020Actions)
end

function Trig____________________020_______uConditions()
	return GetHeroLevel(GetTriggerUnit()) >= 15 and HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -825594136) == true and GetUnitTypeId(GetTriggerUnit()) ~= 1211117616
end

function Trig____________________020_______uActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 43514761, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 525422436))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1248605477, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -825594136))
	if GetUnitTypeId(GetTriggerUnit()) == LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 43514761) then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757693831, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1987608745))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1698842604, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 1515921469))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1462083387, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1133130087))
		if GetHeroStr(GetTriggerUnit(), false) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757693831) and GetHeroAgi(GetTriggerUnit(), false) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1698842604) and GetHeroInt(GetTriggerUnit(), false) >= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1462083387) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			CreateNUnitsAtLoc(1, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1248605477), GetOwningPlayer(GetTriggerUnit()), GetUnitLoc(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]), bj_UNIT_FACING)
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261, GetLastCreatedUnit())
			SetHeroLevelBJ(GetLastCreatedUnit(), GetHeroLevel(GetTriggerUnit()), false)
			bj_forLoopBIndex = 1
			bj_forLoopBIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
				UnitAddItem(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopBIndex))
				bj_forLoopBIndex = bj_forLoopBIndex + 1
			end
			SetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), false), true)
			SetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), false), true)
			SetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), false), true)
			ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), bj_MODIFYMETHOD_SUB, udg_Ls_zj_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			udg_Ls_zj_Int[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
			ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), bj_MODIFYMETHOD_SUB, udg_Linshi_Str[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			udg_Linshi_Str[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), UNIT_STATE_MAX_LIFE, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_LIFE))
			SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), 100)
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261), UNIT_STATE_MAX_MANA, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), UNIT_STATE_MAX_MANA))
			udg_Minjie_jiaGong[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
			RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -866047261)
			UnitAddAbilityBJ(LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1093503686), GetLastCreatedUnit())
			UnitAddAbilityBJ(LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1068628448), GetLastCreatedUnit())
			UnitAddAbilityBJ(LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1494149627), GetLastCreatedUnit())
			if udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] ~= 1093677388 then
				UnitAddAbilityBJ(udg_R_Skill[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], GetLastCreatedUnit())
			else
			end
			SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), GetUnitState(GetLastCreatedUnit(), ConvertUnitState(18)) + I2R(udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]))
			if HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 1531982669) == true then
				UnitAddAbilityBJ(LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 1531982669), udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
			else
			end
			if GetItemTypeId(GetManipulatedItem()) == 1227895886 or GetItemTypeId(GetManipulatedItem()) == 1227895629 or GetItemTypeId(GetManipulatedItem()) == 1227895630 or GetItemTypeId(GetManipulatedItem()) == 1227895887 or GetItemTypeId(GetManipulatedItem()) == 1227895635 or GetItemTypeId(GetManipulatedItem()) == 1227896116 or GetItemTypeId(GetManipulatedItem()) == 1227895895 then
				udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
			else
			end
			if GetItemTypeId(GetManipulatedItem()) == 1227895632 or GetItemTypeId(GetManipulatedItem()) == 1227895634 or GetItemTypeId(GetManipulatedItem()) == 1227895898 then
				udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.3
			else
			end
			if GetItemTypeId(GetManipulatedItem()) == 1227895633 or GetItemTypeId(GetManipulatedItem()) == 1227895893 then
				ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10)
				ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 20)
			else
			end
			if GetItemTypeId(GetManipulatedItem()) == 1227895631 or GetItemTypeId(GetManipulatedItem()) == 1227895897 then
				udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 20
			else
			end
			if GetItemTypeId(GetManipulatedItem()) == 1227895636 or GetItemTypeId(GetManipulatedItem()) == 1227896115 then
				udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
			else
			end
		else
			DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "属性不达标,转职失败")
		end
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "你的英雄无法转职该职业")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________020_______u()
	gg_trg____________________020_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________020_______u, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________020_______u, Condition(Trig____________________020_______uConditions))
	TriggerAddAction(gg_trg____________________020_______u, Trig____________________020_______uActions)
end

function Trig____________________017Conditions()
	return GetUnitTypeId(GetTriggerUnit()) == 1966092343
end

function Trig____________________017Actions()
	CreateNUnitsAtLocFacingLocBJ(1, 1966092339, Player(11), udg_Guaiwu_dian[GetRandomInt(1, 3)], udg_Hero_dian[1])
	SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
	PauseUnitBJ(true, GetLastCreatedUnit())
	GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
	CreateNUnitsAtLocFacingLocBJ(1, 1966092339, Player(11), udg_Guaiwu_dian[GetRandomInt(4, 6)], udg_Hero_dian[1])
	SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
	PauseUnitBJ(true, GetLastCreatedUnit())
	GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
	CreateNUnitsAtLocFacingLocBJ(1, 1966092339, Player(11), udg_Guaiwu_dian[GetRandomInt(7, 9)], udg_Hero_dian[1])
	SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
	PauseUnitBJ(true, GetLastCreatedUnit())
	GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
end

function InitTrig____________________017()
	gg_trg____________________017 = CreateTrigger()
	YDWETriggerRegisterEnterRectSimpleNull(gg_trg____________________017, gg_rct______________000)
	TriggerAddCondition(gg_trg____________________017, Condition(Trig____________________017Conditions))
	TriggerAddAction(gg_trg____________________017, Trig____________________017Actions)
end

function Trig____________________010Actions()
	SaveInteger(YDHT, 1227895883, -1278123678, 20)
	SaveInteger(YDHT, 1227895884, -1278123678, 40)
	SaveInteger(YDHT, 1227895885, -1278123678, 80)
	SaveReal(YDHT, 1227895107, 901026765, 3.0)
	SaveReal(YDHT, 1227895125, 901026765, 6.0)
	SaveReal(YDHT, 1227895127, 901026765, 9.0)
	SaveReal(YDHT, 1919182129, -630699264, 2.0)
	SaveReal(YDHT, 1919182131, -630699264, 4.0)
	SaveReal(YDHT, 1919182130, -630699264, 8.0)
	SaveReal(YDHT, 1227894869, -1784052414, 5.0)
	SaveReal(YDHT, 1227895126, -1784052414, 10.0)
	SaveReal(YDHT, 1227895128, -1784052414, 15.0)
	SaveReal(YDHT, 1227895130, 1628368292, 2.0)
	SaveReal(YDHT, 1227895344, 1628368292, 4.0)
	SaveReal(YDHT, 1227895345, 1628368292, 8.0)
	SaveInteger(YDHT, 1227895110, -504227619, 10)
	SaveReal(YDHT, 1227895108, -1001420974, 0.2)
	SaveReal(YDHT, 1227895640, -1001420974, 1.5)
	SaveInteger(YDHT, 1227895640, -504227619, -10)
	SaveReal(YDHT, 1227895640, 901026765, -10.0)
	SaveReal(YDHT, 1227895088, -1001420974, 0.3)
	SaveReal(YDHT, 1227895112, -1784052414, 15.0)
	SaveReal(YDHT, 1227895617, 1959322958, 0.3)
	SaveReal(YDHT, 1227895345, 1959322958, 0.15)
	SaveReal(YDHT, 1227895638, 1959322958, 0.15)
	SaveReal(YDHT, 1227895638, -1360657686, 0.15)
	SaveReal(YDHT, 1227895639, -1360657686, 0.5)
	SaveReal(YDHT, 1227895639, -1001420974, -0.5)
	SaveReal(YDHT, 1227895105, -1360657686, 0.3)
	SaveReal(YDHT, 1227895637, 799791034, 0.5)
	SaveReal(YDHT, 1227895641, 1408365651, 0.7)
	SaveReal(YDHT, 1227895641, -1317765802, 0.7)
	SaveReal(YDHT, 1227895641, 390633158, 0.7)
	SaveReal(YDHT, 1227895858, 1408365651, 1.0)
	SaveReal(YDHT, 1227895865, -1317765802, 1.0)
	SaveReal(YDHT, 1227895096, 390633158, 1.0)
	SaveReal(YDHT, 1227895873, 799791034, 1.5)
	SaveReal(YDHT, 1227895873, 901026765, 5.0)
	SaveReal(YDHT, 1227895873, -1001420974, -1.0)
end

function InitTrig____________________010()
	gg_trg____________________010 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________010, 5)
	TriggerAddAction(gg_trg____________________010, Trig____________________010Actions)
end

function Trig___________012Conditions()
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true
end

function Trig___________012Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if GetItemTypeId(GetManipulatedItem()) == 1227894840 then
		udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig___________012()
	gg_trg___________012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg___________012, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg___________012, Condition(Trig___________012Conditions))
	TriggerAddAction(gg_trg___________012, Trig___________012Actions)
end

function Trig_________________012Conditions()
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true
end

function Trig_________________012Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if GetItemTypeId(GetManipulatedItem()) == 1227894840 then
		udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_________________012()
	gg_trg_________________012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_________________012, EVENT_PLAYER_UNIT_DROP_ITEM)
	TriggerAddCondition(gg_trg_________________012, Condition(Trig_________________012Conditions))
	TriggerAddAction(gg_trg_________________012, Trig_________________012Actions)
end

function Trig____________________009Conditions()
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true and (LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 901026765) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -630699264) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1784052414) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1628368292) > 0.0 or LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -504227619) > 0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1959322958) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1001420974) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1360657686) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 799791034) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 857784917) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1408365651) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1317765802) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 390633158) > 0.0 or LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1278123678) > 0)
end

function Trig____________________009Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 901026765, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 901026765))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -29031923, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -630699264))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1784052414, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1784052414))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1628368292, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1628368292))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -504227619, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -504227619))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1959322958, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1959322958))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1001420974, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1001420974))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1360657686, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1360657686))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 799791034, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 799791034))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 857784917, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 857784917))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1408365651, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1408365651))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1317765802, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1317765802))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 390633158, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 390633158))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1278123678, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1278123678))
	udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 901026765)
	udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -29031923)
	udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1784052414)
	udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1628368292)
	udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -504227619)
	udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1959322958)
	udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1001420974)
	udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1360657686)
	udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 799791034)
	udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 857784917)
	udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1408365651)
	udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1317765802)
	udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 390633158)
	udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1278123678)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1285070339, "力量成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1281042980, "|n敏捷成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2096591623, "|n智力成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 3.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 3.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 4.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 4.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 5.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 5.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 6.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 6.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 7.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 8.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 9.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 9.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1852901043, "|n生命成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 329436922, "|n魔力成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1556213582, "|n专注成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1093503686), 1, 218, (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1285070339) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1281042980) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2096591623) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1852901043) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 329436922) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1556213582) or ""))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________009()
	gg_trg____________________009 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________009, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________009, Condition(Trig____________________009Conditions))
	TriggerAddAction(gg_trg____________________009, Trig____________________009Actions)
end

function Trig____________________009________3Conditions()
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true and (LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 901026765) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -630699264) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1784052414) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1628368292) > 0.0 or LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -504227619) > 0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1959322958) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1001420974) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1360657686) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 799791034) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 857784917) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1408365651) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1317765802) > 0.0 or LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 390633158) > 0.0 or LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1278123678) > 0)
end

function Trig____________________009________3Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 901026765, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 901026765))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -29031923, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -630699264))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1784052414, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1784052414))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1628368292, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1628368292))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -504227619, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -504227619))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1959322958, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1959322958))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1001420974, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1001420974))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1360657686, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1360657686))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 799791034, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 799791034))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 857784917, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 857784917))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1408365651, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 1408365651))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1317765802, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), -1317765802))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 390633158, LoadReal(YDHT, GetItemTypeId(GetManipulatedItem()), 390633158))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1278123678, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1278123678))
	udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 901026765)
	udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -29031923)
	udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1784052414)
	udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1628368292)
	udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -504227619)
	udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1959322958)
	udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1001420974)
	udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1360657686)
	udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 799791034)
	udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 857784917)
	udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1408365651)
	udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1317765802)
	udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 390633158)
	udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1278123678)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1285070339, "力量成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1281042980, "|n敏捷成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2096591623, "|n智力成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 3.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 3.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 4.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 4.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 5.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 5.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 6.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 6.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 7.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 8.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 9.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 9.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1852901043, "|n生命成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz5Mp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 329436922, "|n魔力成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 0.9 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(8), "E"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 0.9 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.2 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, "D")
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.2 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 1.6 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(6), "C"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 1.6 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.0 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(1), "B"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.0 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.4 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(0), "A"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.4 and LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) <= 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(5), "S"))
	else
	end
	if LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) > 2.8 then
		SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, YDWEGetPlayerColorString(Player(4), "EX"))
	else
	end
	SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1556213582, "|n专注成长: " .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166) or ""))
	YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1093503686), 1, 218, (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1285070339) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1281042980) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2096591623) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1852901043) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 329436922) or "") .. (LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1556213582) or ""))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________009________3()
	gg_trg____________________009________3 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________009________3, EVENT_PLAYER_UNIT_DROP_ITEM)
	TriggerAddCondition(gg_trg____________________009________3, Condition(Trig____________________009________3Conditions))
	TriggerAddAction(gg_trg____________________009________3, Trig____________________009________3Actions)
end

function Trig____________________009________2Conditions()
	return GetItemTypeId(GetManipulatedItem()) == 1227894873 or GetItemTypeId(GetManipulatedItem()) == 1227895093
end

function Trig____________________009________2Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	if GetItemTypeId(GetManipulatedItem()) == 1227894873 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, GetRandomInt(50, 200))
		AdjustPlayerStateBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD)
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "获得金钱" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936)) or ""))
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895093 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, GetRandomInt(250, 350))
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "获得经验" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936)) or ""))
		AddHeroXPSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________009________2()
	gg_trg____________________009________2 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________009________2, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________009________2, Condition(Trig____________________009________2Conditions))
	TriggerAddAction(gg_trg____________________009________2, Trig____________________009________2Actions)
end

function Trig____________________011Conditions()
	return GetSpellAbilityId() ~= 1093677105 and udg_xingdong_dian[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))] > 0 and (YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895113) == true or YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895114) == true)
end

function Trig____________________011Func001Func001Func004Func001T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_COLD)
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Undead\\FrostArmor\\FrostArmorDamage.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), "origin"))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________011Func002Func002Func003Func001A()
	SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430, GetEnumUnit())
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_COLD)
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Undead\\FrostArmor\\FrostArmorDamage.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1860346430), "origin"))
end

function Trig____________________011Func002Func002Func003T()
	local ydl_group
	local ydl_unit
	ForGroupBJ(YDWEGetUnitsOfPlayerAllNull(Player(11)), Trig____________________011Func002Func002Func003Func001A)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
end

function Trig____________________011Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895114) == true then
		if GetRandomInt(1, 10) <= 3 then
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroStr(GetTriggerUnit(), true)) * 2.0)
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetSpellTargetUnit())
			if GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)) == Player(11) then
				ydl_timer = CreateTimer()
				SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
				TimerStart(ydl_timer, 1.5, false, Trig____________________011Func001Func001Func004Func001T)
			else
			end
		else
		end
	else
	end
	if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895113) == true then
		if GetRandomInt(1, 10) <= 3 then
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) * 1.0)
			ydl_timer = CreateTimer()
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1860346430, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			TimerStart(ydl_timer, 1.5, false, Trig____________________011Func002Func002Func003T)
		else
		end
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig____________________011()
	gg_trg____________________011 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________011, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg____________________011, Condition(Trig____________________011Conditions))
	TriggerAddAction(gg_trg____________________011, Trig____________________011Actions)
end

function Trig_W_______0001Conditions()
	return GetSpellAbilityId() == 1093677144
end

function Trig_W_______0001Func011T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 100 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 18.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 18.0)
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090) + 0, 2.0)))
		if SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090), 2.0)) <= 60.0 then
			DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE)
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
end

function Trig_W_______0001Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.5 * (I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) + 0))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1032314929, udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) / 200.0)
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1032314929))
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
	SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\DemonHunterMissile\\DemonHunterMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
	SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090))
	TimerStart(ydl_timer, 0.03, true, Trig_W_______0001Func011T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_W_______0001()
	gg_trg_W_______0001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_W_______0001, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_W_______0001, Condition(Trig_W_______0001Conditions))
	TriggerAddAction(gg_trg_W_______0001, Trig_W_______0001Actions)
end

function Trig_W_______0002_______uConditions()
	return GetSpellAbilityId() == 1093677651
end

function Trig_W_______0002_______uFunc010Func003T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_W_______0002_______uFunc010Func004T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], 120.0)
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_W_______0002_______uFunc010T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_W_______0002_______uFunc010Func003T)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_W_______0002_______uFunc010Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_W_______0002_______uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * GetUnitState(GetTriggerUnit(), ConvertUnitState(21)))
	SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
	YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.7, 0.03, 0, false, false, false, "origin", "", "")
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	TimerStart(ydl_timer, 1.0, false, Trig_W_______0002_______uFunc010T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_W_______0002_______u()
	gg_trg_W_______0002_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_W_______0002_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_W_______0002_______u, Condition(Trig_W_______0002_______uConditions))
	TriggerAddAction(gg_trg_W_______0002_______u, Trig_W_______0002_______uActions)
end

function Trig_W_______0003Conditions()
	return GetSpellAbilityId() == 1093678387
end

function Trig_W_______0003Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, 8.0 + udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
	CreateTextTagUnitBJ("护甲+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 5.0, 15.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
	YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_W_______0003()
	gg_trg_W_______0003 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_W_______0003, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_W_______0003, Condition(Trig_W_______0003Conditions))
	TriggerAddAction(gg_trg_W_______0003, Trig_W_______0003Actions)
end

function Trig_W_________________________016Actions()
	YDWENewItemsFormula(1227895364, 1, 1227895363, 1, 1227895362, 1, 1667786099, 0, 1667786099, 0, 1667786099, 0, 1667984999)
	SaveInteger(YDHT, 1227895883, -1617317639, 1227895884)
	SaveInteger(YDHT, 1227895884, -1617317639, 1227895885)
	SaveInteger(YDHT, 1920169009, -1617317639, 1650946932)
	SaveInteger(YDHT, 1650946932, -1617317639, 1227894850)
	SaveInteger(YDHT, 1227894850, -1617317639, 1227895606)
	SaveInteger(YDHT, 1918986033, -1617317639, 1650814070)
	SaveInteger(YDHT, 1650814070, -1617317639, 1227894851)
	SaveInteger(YDHT, 1227894851, -1617317639, 1227895607)
	SaveInteger(YDHT, 1919512113, -1617317639, 1667854953)
	SaveInteger(YDHT, 1667854953, -1617317639, 1227894852)
	SaveInteger(YDHT, 1227894852, -1617317639, 1227895608)
	SaveInteger(YDHT, 1227895107, -1617317639, 1227895125)
	SaveInteger(YDHT, 1227895125, -1617317639, 1227895127)
	SaveInteger(YDHT, 1918989366, -1617317639, 1227894832)
	SaveInteger(YDHT, 1227894832, -1617317639, 1227894835)
	SaveInteger(YDHT, 1227894835, -1617317639, 1227894833)
	SaveInteger(YDHT, 1668181858, -1617317639, 1227894834)
	SaveInteger(YDHT, 1227894834, -1617317639, 1227894853)
	SaveInteger(YDHT, 1227894869, -1617317639, 1227895126)
	SaveInteger(YDHT, 1227895126, -1617317639, 1227895128)
	SaveInteger(YDHT, 1919182129, -1617317639, 1919182131)
	SaveInteger(YDHT, 1919182131, -1617317639, 1919182130)
	SaveInteger(YDHT, 1227895130, -1617317639, 1227895344)
	SaveInteger(YDHT, 1227895344, -1617317639, 1227895345)
	SaveInteger(YDHT, 1751348590, -1617317639, 1227895364)
	SaveInteger(YDHT, 1752588652, -1617317639, 1227895363)
	SaveInteger(YDHT, 1835233141, -1617317639, 1227895362)
end

function InitTrig_W_________________________016()
	gg_trg_W_________________________016 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg_W_________________________016, 5)
	TriggerAddAction(gg_trg_W_________________________016, Trig_W_________________________016Actions)
end

function Trig______________030Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if GetItemTypeId(GetManipulatedItem()) == 1227895127 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 专注值上限+5")
		udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5.0
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895885 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 战斗胜利金钱奖励+40")
		udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_sl_jinqian_jiangli[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 40
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895608 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 智力+10")
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227894853 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 全属性+4")
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 4)
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 4)
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 4)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895606 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 力量+10")
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895607 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 敏捷+10")
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895128 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 额外防御+8")
		udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 8.0
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895345 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 回蓝+4 技能伤害+5%")
		udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 4.0
		udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.05
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227894833 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 攻击力+15")
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18)) + 15.0)
		udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 15
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1667984999 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 全属性+8")
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 8)
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 8)
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 8)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1919182130 then
		RemoveItem(GetManipulatedItem())
		DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "已成功吞噬" .. (GetItemName(GetManipulatedItem()) or "") .. "获得其一半属性 回合防御+4")
		udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 4.0
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig______________030()
	gg_trg______________030 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg______________030, EVENT_PLAYER_UNIT_USE_ITEM)
	TriggerAddAction(gg_trg______________030, Trig______________030Actions)
end

function Trig____________________015Conditions()
	return HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1617317639) == true
end

function Trig____________________015Actions()
	local ydul_XA
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -783338327, GetManipulatedItem())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1337360663, GetItemTypeId(GetManipulatedItem()))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1261503230, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), -1617317639))
	ydul_XA = 1
	for _ in _loop_() do
		if ydul_XA > 6 then break end
		if GetItemTypeId(GetManipulatedItem()) == GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), ydul_XA)) and UnitItemInSlotBJ(GetTriggerUnit(), ydul_XA) ~= GetManipulatedItem() then
			RemoveItem(LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -783338327))
			RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), ydul_XA))
			HopeInventory_Give(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1261503230), GetTriggerUnit())
			DoNothing()
			if true then break end
		else
		end
		ydul_XA = ydul_XA + 1
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________015()
	gg_trg____________________015 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________015, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________015, Condition(Trig____________________015Conditions))
	TriggerAddAction(gg_trg____________________015, Trig____________________015Actions)
end

function Trig____________________035_______uConditions()
	return GetItemTypeId(GetManipulatedItem()) == 1885889889
end

function Trig____________________035_______uActions()
	local p = GetOwningPlayer(GetTriggerUnit())
	local i = GetPlayerId(p) + 1
	local aid = 0
	local u = nil
	if i >= 1 and i <= 6 then
		u = udg_hero[i]
		if u == nil and IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) then
			u = GetTriggerUnit()
		end
		udg_Yaoshui_shenyu_cs[i] = udg_Yaoshui_shenyu_cs[i] + 1
		aid = LoadInteger(YDHT, i, 1068628448)
		if u ~= nil and aid ~= 0 then
			YDWESetUnitAbilityDataString(u, aid, 1, 218, "药水剩余次数：" .. (I2S(udg_Yaoshui_shenyu_cs[i]) or ""))
		end
		DisplayTextToPlayer(p, 0, 0, "药水可用次数+1 当前剩余次数：" .. (I2S(udg_Yaoshui_shenyu_cs[i]) or ""))
	end
	RemoveItem(GetManipulatedItem())
	u = nil
	p = nil
end

function InitTrig____________________035_______u()
	gg_trg____________________035_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________035_______u, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________035_______u, Condition(Trig____________________035_______uConditions))
	TriggerAddAction(gg_trg____________________035_______u, Trig____________________035_______uActions)
end

function Trig_Y__________________027Conditions()
	return GetUnitAbilityLevelSwapped(1093677369, udg_Yiwu_danwei[GetConvertedPlayerId(GetOwningPlayer(GetEventDamageSource()))]) > 0 and GetEventDamage() > 0.0
end

function Trig_Y__________________027Func002T()
	udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] = 0
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_Y__________________027Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetEventDamageSource())))
	ydl_timer = CreateTimer()
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	TimerStart(ydl_timer, 0.1, false, Trig_Y__________________027Func002T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_Y__________________027()
	gg_trg_Y__________________027 = CreateTrigger()
	YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_Y__________________027)
	TriggerAddCondition(gg_trg_Y__________________027, Condition(Trig_Y__________________027Conditions))
	TriggerAddAction(gg_trg_Y__________________027, Trig_Y__________________027Actions)
end

function Trig_Y______0028_______uConditions()
	return GetUnitAbilityLevelSwapped(1093677908, udg_Yiwu_danwei[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]) > 0 and GetEventDamage() > 0.0
end

function Trig_Y______0028_______uActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SetUnitState(GetTriggerUnit(), ConvertUnitState(32), GetUnitState(GetTriggerUnit(), ConvertUnitState(32)) + 30.0)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_Y______0028_______u()
	gg_trg_Y______0028_______u = CreateTrigger()
	YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_Y______0028_______u)
	TriggerAddCondition(gg_trg_Y______0028_______u, Condition(Trig_Y______0028_______uConditions))
	TriggerAddAction(gg_trg_Y______0028_______u, Trig_Y______0028_______uActions)
end

function Trig____________________023Conditions()
	return HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 241451190) == true
end

function Trig____________________023Func031Func001A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1997868639, GetConvertedPlayerId(GetEnumPlayer()))
	udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1997868639)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1997868639)] + 0.1
	DisplayTextToPlayer(GetEnumPlayer(), 0, 0, "最终伤害+10% 来源：" .. (YDWEGetPlayerColorString(GetOwningPlayer(GetTriggerUnit()), GetPlayerName(GetOwningPlayer(GetTriggerUnit()))) or ""))
end

function Trig____________________023Func036Func001Func004T()
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig____________________023Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2011937874, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 241451190))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, (GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2011937874)) or "") .. "已获得")
	UnitAddAbilityBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2011937874), udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	HopeRelic_Record(GetOwningPlayer(GetTriggerUnit()), GetItemTypeId(GetManipulatedItem()))
	ItemPoolRemoveItemType(udg_YiwuChi[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], GetItemTypeId(GetManipulatedItem()))
	if GetItemTypeId(GetManipulatedItem()) == 1227895089 then
		udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.35
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895609 then
		udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.35
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895369 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18)) + 30.0)
		udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 30
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_MAX_LIFE, GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_MAX_LIFE) - 30.0)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895380 then
		udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895370 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_MAX_LIFE, GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_MAX_LIFE) / 2.0)
		udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz4Hp_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] / 2.0
		udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 10.0
		udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895371 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18)) - 5.0)
		udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 5
		udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 20.0
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895381 then
		udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895372 then
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
		udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895382 then
		udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895383 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895384 then
		AdjustPlayerStateBJ(800, ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), PLAYER_STATE_RESOURCE_GOLD)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895385 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895373 then
		udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5.0
		udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz6Dex_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895374 then
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
		udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895375 then
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895376 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_LIFE, GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_LIFE) / 2.0)
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 15
		udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.25 * I2R(udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1446360359, LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1068628448))
		YDWESetUnitAbilityDataString(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1446360359), 1, 218, "恢复30%的最大生命值和50%的最大魔法值 |n |c00fffc01当前剩余可用次数: " .. (I2S(udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. "|r")
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895377 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18)) + 15.0)
		udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 15
		udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.15
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895378 then
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 5)
		udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895379 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895386 then
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_SUB, 10)
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 35
		udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.3
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895600 then
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 15
		udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1.0
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895601 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_MAX_LIFE, GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], UNIT_STATE_MAX_LIFE) * 1.2)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895602 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895603 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895623 then
		ForForce(udg_WJZ, Trig____________________023Func031Func001A)
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895621 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895622 then
		udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.6
		udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 30.0
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895620 then
		udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.2
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5
		udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Damage[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.3
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895624 then
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895857 then
		HopeDraw_Ten(GetOwningPlayer(GetTriggerUnit()))
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895860 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818, R2I(I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], false)) * 0.1))
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10 + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895859 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818, R2I(I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], false)) * 0.1))
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10 + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895861 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818, R2I(I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], false)) * 0.1))
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 10 + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895890 and EXExecuteScript("(require'jass.slk').unit[" .. (I2S(GetUnitTypeId(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])) or "") .. "].Primary") == "STR" then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818, R2I(Pow(4.5 - udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 2.0) * 7.0))
		ModifyHeroStat(bj_HEROSTAT_STR, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 0 + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "力量潜力开发！ 力量+" .. (YDWEGetPlayerColorString(Player(0), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))) or ""))
		udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz1Str_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895891 and EXExecuteScript("(require'jass.slk').unit[" .. (I2S(GetUnitTypeId(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])) or "") .. "].Primary") == "AGI" then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818, R2I(Pow(4.5 - udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 2.0) * 7.0))
		ModifyHeroStat(bj_HEROSTAT_AGI, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 0 + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "敏捷潜力开发！ 敏捷+" .. (YDWEGetPlayerColorString(Player(6), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))) or ""))
		udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz2Agi_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.5
	else
	end
	if GetItemTypeId(GetManipulatedItem()) == 1227895892 and EXExecuteScript("(require'jass.slk').unit[" .. (I2S(GetUnitTypeId(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])) or "") .. "].Primary") == "INT" then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818, R2I(Pow(4.5 - udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 2.0) * 7.0))
		ModifyHeroStat(bj_HEROSTAT_INT, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], bj_MODIFYMETHOD_ADD, 0 + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "智力潜力开发！ 智力+" .. (YDWEGetPlayerColorString(Player(6), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 582028818))) or ""))
		udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_cz3Int_up[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 0.5
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig____________________023()
	gg_trg____________________023 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________023, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________023, Condition(Trig____________________023Conditions))
	TriggerAddAction(gg_trg____________________023, Trig____________________023Actions)
end

function Trig____________________021Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		udg_Yiwu_danwei[bj_forLoopAIndex] = CreateUnit(ConvertedPlayer(bj_forLoopAIndex), 1747988534, 42.0, 2040.0, 0)
		udg_Yiwu_danwei_2[bj_forLoopAIndex] = CreateUnit(ConvertedPlayer(bj_forLoopAIndex), 1747988534, 42.0, 2040.0, 0)
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	SaveInteger(YDHT, 1227895369, 241451190, 1093677620)
	SaveInteger(YDHT, 1227895609, 241451190, 1093677657)
	SaveInteger(YDHT, 1227895089, 241451190, 1093677381)
	SaveInteger(YDHT, 1227895380, 241451190, 1093677643)
	SaveInteger(YDHT, 1227895370, 241451190, 1093677624)
	SaveInteger(YDHT, 1227895371, 241451190, 1093677621)
	SaveInteger(YDHT, 1227895381, 241451190, 1093677640)
	SaveInteger(YDHT, 1227895372, 241451190, 1093677633)
	SaveInteger(YDHT, 1227895382, 241451190, 1093677647)
	SaveInteger(YDHT, 1227895383, 241451190, 1093677644)
	SaveInteger(YDHT, 1227895384, 241451190, 1093677645)
	SaveInteger(YDHT, 1227895385, 241451190, 1093677646)
	SaveInteger(YDHT, 1227895373, 241451190, 1093677636)
	SaveInteger(YDHT, 1227895374, 241451190, 1093677634)
	SaveInteger(YDHT, 1227895375, 241451190, 1093677635)
	SaveInteger(YDHT, 1227895376, 241451190, 1093677638)
	SaveInteger(YDHT, 1227895377, 241451190, 1093677637)
	SaveInteger(YDHT, 1227895378, 241451190, 1093677622)
	SaveInteger(YDHT, 1227895379, 241451190, 1093677625)
	SaveInteger(YDHT, 1227895386, 241451190, 1093677641)
	SaveInteger(YDHT, 1227895600, 241451190, 1093677642)
	SaveInteger(YDHT, 1227895601, 241451190, 1093677648)
	SaveInteger(YDHT, 1227895602, 241451190, 1093677649)
	SaveInteger(YDHT, 1227895603, 241451190, 1093677650)
	SaveInteger(YDHT, 1227895621, 241451190, 1093677366)
	SaveInteger(YDHT, 1227895624, 241451190, 1093677378)
	SaveInteger(YDHT, 1227895622, 241451190, 1093677369)
	SaveInteger(YDHT, 1227895620, 241451190, 1093677367)
	SaveInteger(YDHT, 1227895623, 241451190, 1093677368)
	SaveInteger(YDHT, 1227895625, 241451190, 1093677377)
	SaveInteger(YDHT, 1227895856, 241451190, 1093677907)
	SaveInteger(YDHT, 1227895857, 241451190, 1093677904)
	SaveInteger(YDHT, 1227895642, 241451190, 1093677908)
	SaveInteger(YDHT, 1227895860, 241451190, 1093677910)
	SaveInteger(YDHT, 1227895859, 241451190, 1093677909)
	SaveInteger(YDHT, 1227895861, 241451190, 1093677911)
	SaveInteger(YDHT, 1227895877, 241451190, 1093678137)
	SaveInteger(YDHT, 1227895878, 241451190, 1093678145)
	SaveInteger(YDHT, 1227895879, 241451190, 1093678146)
	SaveInteger(YDHT, 1227895862, 241451190, 1093677382)
	SaveInteger(YDHT, 1227895882, 241451190, 1093678150)
	SaveInteger(YDHT, 1227895890, 241451190, 1093678157)
	SaveInteger(YDHT, 1227895891, 241451190, 1093678158)
	SaveInteger(YDHT, 1227895892, 241451190, 1093678159)
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 7
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		udg_YiwuChi[bj_forLoopAIndex] = CreateItemPool()
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895369, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895380, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895878, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895370, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895371, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895603, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895381, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895372, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895382, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895383, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895089, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895860, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895384, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895601, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895877, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895856, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895385, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895621, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895624, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895373, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895374, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895609, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895879, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895375, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895376, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895377, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895378, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895625, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895859, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895622, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895379, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895602, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895861, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895620, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895386, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895600, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895857, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895623, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895642, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895862, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895882, 1)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895890, 0.5)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895891, 0.5)
		ItemPoolAddItemType(udg_YiwuChi[bj_forLoopAIndex], 1227895892, 0.5)
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, 100)
	bj_forLoopBIndex = 1
	bj_forLoopBIndexEnd = 44
	for _ in _loop_() do
		if bj_forLoopBIndex > bj_forLoopBIndexEnd then break end
		YDWEPlaceRandomItem(udg_YiwuChi[7], 0, 0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1011494307, GetItemTypeId(YDWEGetLastPoolAbstractedItem()))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976) + 1)
		udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)] = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1011494307)
		SaveInteger(YDHT, udg_wp[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976)], 2010520239, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 635090976))
		ItemPoolRemoveItemType(udg_YiwuChi[7], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1011494307))
		YDWETimerRemoveItem(0.1, YDWEGetLastPoolAbstractedItem())
		bj_forLoopBIndex = bj_forLoopBIndex + 1
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________021()
	gg_trg____________________021 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________021, 4.0)
	TriggerAddAction(gg_trg____________________021, Trig____________________021Actions)
end

function Trig_Y______________028Conditions()
	return GetEventDamage() > 0.0 and CountPlayersInForceBJ(udg_WJZ_______cunhuo) == 1 and GetUnitAbilityLevelSwapped(1093677378, udg_Yiwu_danwei[GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit()))]) > 0 and GetUnitLifePercent(GetTriggerUnit()) <= 30.0
end

function Trig_Y______________028Func005T()
	StopMusic(true)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_Y______________028Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	YDWESetEventDamage(0.0)
	StopMusic(false)
	PlayThematicMusic("juexing.mp3")
	ydl_timer = CreateTimer()
	TimerStart(ydl_timer, 100.0, false, Trig_Y______________028Func005T)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetTriggerPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	YDWETimerDestroyEffect(2, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectCaster.mdl", GetTriggerUnit(), "overhead"))
	udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zuizhong_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1.0
	ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, 200)
	ModifyHeroStat(bj_HEROSTAT_AGI, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, 200)
	ModifyHeroStat(bj_HEROSTAT_INT, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, 200)
	UnitRemoveAbilityBJ(1093677378, udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), -364772706, true)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_Y______________028()
	gg_trg_Y______________028 = CreateTrigger()
	YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_Y______________028)
	TriggerAddCondition(gg_trg_Y______________028, Condition(Trig_Y______________028Conditions))
	TriggerAddAction(gg_trg_Y______________028, Trig_Y______________028Actions)
end

function Trig____________________027Conditions()
	return HaveSavedInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 241451190) == true
end

function Trig____________________027Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2011937874, LoadInteger(YDHT, GetItemTypeId(GetManipulatedItem()), 241451190))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	udg_Yiwu_sl[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Yiwu_sl[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
	if udg_Yiwu_sl[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 11 then
		UnitAddAbilityBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2011937874), udg_Yiwu_danwei_2[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	else
	end
	if udg_Yiwu_sl[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] == 12 then
		UnitAddAbilityBJ(1093677912, udg_Yiwu_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________027()
	gg_trg____________________027 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________027, EVENT_PLAYER_UNIT_PICKUP_ITEM)
	TriggerAddCondition(gg_trg____________________027, Condition(Trig____________________027Conditions))
	TriggerAddAction(gg_trg____________________027, Trig____________________027Actions)
end

function Trig____________________024Conditions()
	return GetSpellAbilityId() == 1093677912
end

function Trig____________________024Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SelectUnitForPlayerSingle(udg_Yiwu_danwei_2[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], GetOwningPlayer(GetTriggerUnit()))
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________024()
	gg_trg____________________024 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________024, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg____________________024, Condition(Trig____________________024Conditions))
	TriggerAddAction(gg_trg____________________024, Trig____________________024Actions)
end

function Trig____________________029Actions()
	CreateLeaderboardBJ(GetPlayersAll(), "输出榜")
	udg_shuchubang = bj_lastCreatedLeaderboard
	LeaderboardDisplay(udg_shuchubang, false)
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		if GetPlayerSlotState(ConvertedPlayer(bj_forLoopAIndex)) == PLAYER_SLOT_STATE_PLAYING then
			LeaderboardAddItemBJ(ConvertedPlayer(bj_forLoopAIndex), udg_shuchubang, GetPlayerName(ConvertedPlayer(bj_forLoopAIndex)), 0)
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	DestroyTrigger(GetTriggeringTrigger())
end

function InitTrig____________________029()
	gg_trg____________________029 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________029, 3.0)
	TriggerAddAction(gg_trg____________________029, Trig____________________029Actions)
end

function Trig_______SD_017Func012003()
	if HopeArchive_OpenFor(DzGetTriggerUIEventPlayer()) then
		return
	end
	SelectUnitForPlayerSingle(udg_Cundang_danwei[GetConvertedPlayerId(DzGetTriggerUIEventPlayer())], DzGetTriggerUIEventPlayer())
	HopeCloud_Report(DzGetTriggerUIEventPlayer())
end

function Trig_______SD_017Func023003()
	if HopeRelic_OpenFor(DzGetTriggerUIEventPlayer()) then
		return
	end
	SelectUnitForPlayerSingle(udg_Yiwu_danwei[GetConvertedPlayerId(DzGetTriggerUIEventPlayer())], DzGetTriggerUIEventPlayer())
end

function Trig_______SD_017Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		udg_Wj_jf[bj_forLoopAIndex] = DzAPI_Map_GetStoredInteger(ConvertedPlayer(bj_forLoopAIndex), "boss_jf")
		udg_Cundang_danwei[bj_forLoopAIndex] = CreateUnit(ConvertedPlayer(bj_forLoopAIndex), 1747988535, 42.0, 2040.0, 0)
		SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, ConvertedPlayer(bj_forLoopAIndex))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677872)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677878)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677879)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677873)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677874)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677875)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677876)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677877)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677880)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, 1093677881)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, DzAPI_Map_GetStoredInteger(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), GetAbilityName(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395) > 0 then
			SetUnitAbilityLevelSwapped(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), udg_Cundang_danwei[bj_forLoopAIndex], LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
		else
		end
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880, DzCreateFrameByTagName("FRAME", "name", DzGetGameUI(), "template", 0))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1956820501, DzCreateFrameByTagName("BACKDROP", "name", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880), "template", 0))
	DzFrameSetAbsolutePoint(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1956820501), 0, 0.0, 0.18)
	DzFrameSetSize(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1956820501), S2R("0.055"), S2R("0.025"))
	DzFrameSetTexture(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1956820501), "UI\\Widgets\\EscMenu\\Human\\human-options-menu-background.blp", 0)
	DzFrameShow(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1956820501), false)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762, HopeQoL_Button("HopeSave", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880), 0, 0, 0.035, 0.024, ""))
	DzFrameSetAbsolutePoint(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762), 0, 0.025, 0.208)
	DzFrameSetSize(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762), 0.035, 0.024)
	DzFrameSetText(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762), " 存档 ")
	DzFrameSetFont(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762), "Fonts\\ZiTi.ttf", 0.009, 0)
	DzFrameSetScriptByCode(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762), 1, Trig_______SD_017Func012003, true)
	HopeLayout_Save = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -260936762)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -979923401, DzCreateFrameByTagName("BACKDROP", "name", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880), "template", 0))
	DzFrameSetAbsolutePoint(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -979923401), 0, 0.0, S2R("0.212"))
	DzFrameSetSize(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -979923401), S2R("0.055"), S2R("0.025"))
	DzFrameSetTexture(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -979923401), "UI\\Widgets\\EscMenu\\Human\\human-options-menu-background.blp", 0)
	DzFrameShow(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -979923401), false)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778, HopeQoL_Button("HopeRelic", LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 516839880), 0, 0, 0.035, 0.024, ""))
	DzFrameSetAbsolutePoint(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778), 0, 0.065, 0.208)
	DzFrameSetSize(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778), 0.035, 0.024)
	DzFrameSetText(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778), " 遗物 ")
	DzFrameSetFont(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778), "Fonts\\ZiTi.ttf", 0.009, 0)
	DzFrameSetScriptByCode(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778), 1, Trig_______SD_017Func023003, true)
	HopeLayout_Relic = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1936176778)
	SaveInteger(YDHT, 1093677872, -237385485, 10)
	SaveInteger(YDHT, 1093677878, -237385485, 10)
	SaveInteger(YDHT, 1093677879, -237385485, 10)
	SaveInteger(YDHT, 1093677873, -237385485, 30)
	SaveInteger(YDHT, 1093677874, -237385485, 30)
	SaveInteger(YDHT, 1093677875, -237385485, 30)
	SaveInteger(YDHT, 1093677876, -237385485, 20)
	SaveInteger(YDHT, 1093677877, -237385485, 20)
	SaveInteger(YDHT, 1093677880, -237385485, 50)
	SaveInteger(YDHT, 1093677881, -237385485, 50)
	HopeArchive_CaptureAll()
	HopeGift_LoadPoints()
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_______SD_017()
	gg_trg_______SD_017 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg_______SD_017, 0.2)
	TriggerAddAction(gg_trg_______SD_017, Trig_______SD_017Actions)
	HopeCloud_Init()
end

function Trig____________________028Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	bj_forLoopAIndex = 1
	bj_forLoopAIndexEnd = 6
	for _ in _loop_() do
		if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
		SavePlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638, ConvertedPlayer(bj_forLoopAIndex))
		if DzAPI_Map_GetServerValue(ConvertedPlayer(bj_forLoopAIndex), "maptest2020") == "1" then
			SetPlayerTechResearchedSwap(1378889776, 1, ConvertedPlayer(bj_forLoopAIndex))
			HopeGift_Applied[(bj_forLoopAIndex - 1) * 6 + 0] = true
			AdjustPlayerStateBJ(50, ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_GOLD)
			udg_STR_cs[bj_forLoopAIndex] = udg_STR_cs[bj_forLoopAIndex] + 1
			udg_AGI_cs[bj_forLoopAIndex] = udg_AGI_cs[bj_forLoopAIndex] + 1
			udg_INT_cs[bj_forLoopAIndex] = udg_INT_cs[bj_forLoopAIndex] + 1
		else
		end
		if DzAPI_Map_GetServerValue(ConvertedPlayer(bj_forLoopAIndex), "prebook2023") == "1" then
			SetPlayerTechResearchedSwap(1378889779, 1, ConvertedPlayer(bj_forLoopAIndex))
			HopeGift_Applied[(bj_forLoopAIndex - 1) * 6 + 3] = true
			AdjustPlayerStateBJ(1, ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_LUMBER)
			udg_STR_cs[bj_forLoopAIndex] = udg_STR_cs[bj_forLoopAIndex] + 1
			udg_AGI_cs[bj_forLoopAIndex] = udg_AGI_cs[bj_forLoopAIndex] + 1
			udg_INT_cs[bj_forLoopAIndex] = udg_INT_cs[bj_forLoopAIndex] + 1
		else
		end
		if DzAPI_Map_HasMallItem(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "MUCAI") == true then
			SetPlayerTechResearchedSwap(1378889778, 1, ConvertedPlayer(bj_forLoopAIndex))
			HopeGift_Applied[(bj_forLoopAIndex - 1) * 6 + 2] = true
			AdjustPlayerStateBJ(1, ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_LUMBER)
		else
		end
		if DzAPI_Map_HasMallItem(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "JINBI") == true then
			SetPlayerTechResearchedSwap(1378889777, 1, ConvertedPlayer(bj_forLoopAIndex))
			HopeGift_Applied[(bj_forLoopAIndex - 1) * 6 + 1] = true
			AdjustPlayerStateBJ(50, ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_GOLD)
		else
		end
		if DzAPI_Map_HasMallItem(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "SHOUCHONG") == true then
			SetPlayerTechResearchedSwap(1378889780, 1, ConvertedPlayer(bj_forLoopAIndex))
			HopeGift_Applied[(bj_forLoopAIndex - 1) * 6 + 4] = true
			AdjustPlayerStateBJ(100, ConvertedPlayer(bj_forLoopAIndex), PLAYER_STATE_RESOURCE_GOLD)
			udg_STR_cs[bj_forLoopAIndex] = udg_STR_cs[bj_forLoopAIndex] + 1
			udg_AGI_cs[bj_forLoopAIndex] = udg_AGI_cs[bj_forLoopAIndex] + 1
			udg_INT_cs[bj_forLoopAIndex] = udg_INT_cs[bj_forLoopAIndex] + 1
		else
		end
		if DzAPI_Map_HasMallItem(LoadPlayerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1214605638), "CHONGSUI") == true then
			SetPlayerTechResearchedSwap(1378889781, 1, ConvertedPlayer(bj_forLoopAIndex))
			HopeGift_Applied[(bj_forLoopAIndex - 1) * 6 + 5] = true
			udg_CZ_czcs[bj_forLoopAIndex] = udg_CZ_czcs[bj_forLoopAIndex] + 3
		else
		end
		HopeGift_Checked[bj_forLoopAIndex - 1] = true
		bj_forLoopAIndex = bj_forLoopAIndex + 1
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig____________________028()
	gg_trg____________________028 = CreateTrigger()
	TriggerRegisterTimerEventSingle(gg_trg____________________028, 0.1)
	TriggerAddAction(gg_trg____________________028, Trig____________________028Actions)
end

function Trig____________________012Conditions()
	return HaveSavedInteger(YDHT, GetSpellAbilityId(), -237385485) == true
end

function Trig____________________012Actions()
	HopeArchive_Purchase(GetOwningPlayer(GetTriggerUnit()), GetTriggerUnit(), GetSpellAbilityId())
end

function InitTrig____________________012()
	gg_trg____________________012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg____________________012, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg____________________012, Condition(Trig____________________012Conditions))
	TriggerAddAction(gg_trg____________________012, Trig____________________012Actions)
end

function Trig_______________2222Actions()
	local ydul_k
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	DisableTrigger(GetTriggeringTrigger())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430))))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -787194290, GetIssuedOrderId())
	SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 392811314, GetOrderTargetItem())
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -787194290) >= 852002 and LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -787194290) <= 852007 then
		ydul_k = 0
		for _ in _loop_() do
			if ydul_k > 5 then break end
			if UnitItemInSlot(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430), ydul_k) == LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 392811314) and 852002 + ydul_k == LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -787194290) then
				if LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430) == udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] then
					if UnitAddItem(udg_Bei_bao_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 392811314)) then
						DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "|cff80ef90已转交给助手。|r")
					else
						DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "|cffff8080转交失败：请检查助手的空格及物品限制。|r")
					end
				else
					if LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430) == udg_Bei_bao_danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] then
						if UnitAddItem(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 392811314)) then
							DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "|cff80ef90已转交给英雄。|r")
						else
							DisplayTextToPlayer(ConvertedPlayer(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)), 0, 0, "|cffff8080转交失败：请检查英雄的空格及物品限制。|r")
						end
					else
					end
				end
				DoNothing()
				if true then break end
			else
			end
			ydul_k = ydul_k + 1
		end
	else
	end
	EnableTrigger(GetTriggeringTrigger())
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_______________2222()
	gg_trg_______________2222 = CreateTrigger()
	YDWESyStemItemUnmovableRegistTrigger(gg_trg_______________2222)
	TriggerAddAction(gg_trg_______________2222, Trig_______________2222Actions)
end

end

-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function Trig_S___________________012Conditions()
	return GetItemTypeId(GetSoldItem()) == 1227895618 or GetItemTypeId(GetSoldItem()) == 1227895888 or GetItemTypeId(GetSoldItem()) == 1227895889
end

function Trig_S___________________012Actions()
	if GetSellingUnit() == gg_unit_n00P_0024 then
		if GetItemTypeId(GetSoldItem()) == 1227895618 then
			AddItemToStockBJ(1227895888, gg_unit_n00P_0024, 1, 1)
		else
		end
		if GetItemTypeId(GetSoldItem()) == 1227895888 then
			AddItemToStockBJ(1227895889, gg_unit_n00P_0024, 1, 1)
		else
		end
		if GetItemTypeId(GetSoldItem()) == 1227895889 then
			AddItemToStockBJ(1227895889, gg_unit_n00P_0024, 1, 1)
		else
		end
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
	else
		if GetItemTypeId(GetSoldItem()) == 1227895618 then
			AddItemToStockBJ(1227895888, gg_unit_n00Q_0028, 1, 1)
		else
		end
		if GetItemTypeId(GetSoldItem()) == 1227895888 then
			AddItemToStockBJ(1227895889, gg_unit_n00Q_0028, 1, 1)
		else
		end
		if GetItemTypeId(GetSoldItem()) == 1227895889 then
			AddItemToStockBJ(1227895889, gg_unit_n00Q_0028, 1, 1)
		else
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
	end
end

function InitTrig_S___________________012()
	gg_trg_S___________________012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_S___________________012, EVENT_PLAYER_UNIT_SELL_ITEM)
	TriggerAddCondition(gg_trg_S___________________012, Condition(Trig_S___________________012Conditions))
	TriggerAddAction(gg_trg_S___________________012, Trig_S___________________012Actions)
end

function Trig_S_______001Conditions()
	return GetSpellAbilityId() == 1093677141
end

function Trig_S_______001Func003Func003T()
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) > 5 then
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetUnitLifePercent(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) + 2.0)
	end
end

function Trig_S_______001Func006Func002001002()
	return IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig_S_______001Func006Func002A()
	SetUnitState(GetEnumUnit(), UNIT_STATE_LIFE, GetUnitState(GetEnumUnit(), UNIT_STATE_LIFE) + 800.0)
end

function Trig_S_______001Func007Func001001002()
	return IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig_S_______001Func007Func001A()
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430, GetEnumUnit())
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), ConvertUnitState(19), GetUnitStateSwap(ConvertUnitState(19), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430)) + GetRandomReal(10.0, 20.0))
	CreateTextTagUnitBJ("攻击+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1860346430), 5.0, 15.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
	YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
end

function Trig_S_______001Func009Func006A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	AddSpecialEffectLocBJ(udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
	YDWETimerDestroyEffect(2, bj_lastCreatedEffect)
	UnitDamageTarget(GetTriggerUnit(), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], 80.0, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_COLD, WEAPON_TYPE_WHOKNOWS)
end

function Trig_S_______001Func010Func002A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	AddSpecialEffectLocBJ(udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], "Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl")
	YDWETimerDestroyEffect(2, bj_lastCreatedEffect)
	UnitDamageTarget(GetTriggerUnit(), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], GetUnitStateSwap(ConvertUnitState(21), GetTriggerUnit()), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
end

function Trig_S_______001Func011Func002003002()
	return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true and IsUnitAlly(GetFilterUnit(), Player(0)) == true
end

function Trig_S_______001Func011Func008Func003Func002003003()
	return IsUnitAlly(GetFilterUnit(), Player(0)) == true and IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true
end

function Trig_S_______001Func011Func008Func003Func003A()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
end

function Trig_S_______001Func011Func008Func003Func005T()
	SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Boss_dian[1], 320.0)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_S_______001Func011Func008Func003T()
	local ydl_group
	local ydl_unit
	local ydl_timer
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988, YDWEGetUnitsInRangeOfLocMatchingNull(300.0, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), Condition(Trig_S_______001Func011Func008Func003Func002003003)))
	ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988), Trig_S_______001Func011Func008Func003Func003A)
	DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988))
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	TimerStart(ydl_timer, 1.5, false, Trig_S_______001Func011Func008Func003Func005T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
	ydl_timer = nil
end

function Trig_S_______001Func011Func008T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "spell")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "origin"))
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 339273988, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 339273988))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	TimerStart(ydl_timer, 0.3, false, Trig_S_______001Func011Func008Func003T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_S_______001Func012Func002A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	AddSpecialEffectLocBJ(udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], "Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl")
	YDWETimerDestroyEffect(2, bj_lastCreatedEffect)
	if GetHeroInt(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], true) <= 150 then
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, 150.0 - I2R(GetHeroInt(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], true)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245) * 2.0)
	else
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, 0.0)
	end
	UnitDamageTarget(GetTriggerUnit(), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
end

function Trig_S_______001Func013Func004A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260, GetConvertedPlayerId(GetEnumPlayer()))
	SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245, 150.0)
	UnitDamageTarget(GetTriggerUnit(), udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_COLD, WEAPON_TYPE_WHOKNOWS)
	SetUnitManaBJ(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)], GetUnitStateSwap(UNIT_STATE_MANA, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -2022357260)]) - 20.0)
end

function Trig_S_______001Actions()
	local ydl_timer
	local ydl_group
	local ydl_unit
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if HopeChallenge_IsEnemy(GetUnitTypeId(GetTriggerUnit())) then
		HopeChallenge_EnemyCast(GetTriggerUnit())
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if GetUnitTypeId(GetTriggerUnit()) == 1848651866 then
		SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "attack")
		CreateNUnitsAtLoc(1, 1697656913, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), udg_Boss_dian[1], bj_UNIT_FACING)
		IssueTargetOrder(GetLastCreatedUnit(), "attackonce", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		UnitAddAbilityBJ(1093677623, GetLastCreatedUnit())
		SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), GetUnitState(GetTriggerUnit(), ConvertUnitState(20)))
		YDWETimerRemoveUnit(2, GetLastCreatedUnit())
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1848651833 then
		YDWETimerDestroyEffect(3.0, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
		ydl_timer = CreateTimer()
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		TimerStart(ydl_timer, 0.5, true, Trig_S_______001Func003Func003T)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1432642913 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 1775071496))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) + 1)
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 1775071496, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034) < 10 then
			CreateNUnitsAtLoc(1, 1966092336, Player(11), udg_Guaiwu_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1447038034)], 290.0)
			SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
			SetUnitState(GetLastCreatedUnit(), UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetLastCreatedUnit()) * (0.8 + 0.2 * I2R(udg_Guaiwu_sl)))
			SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), GetUnitStateSwap(ConvertUnitState(18), GetLastCreatedUnit()) * (0.9 + 0.1 * I2R(udg_Guaiwu_sl)))
			SetUnitLifePercentBJ(GetLastCreatedUnit(), 100)
			PauseUnitBJ(true, GetLastCreatedUnit())
			GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
		else
		end
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1315334514 then
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, PolarProjectionBJ(udg_Boss_dian[1], GetRandomReal(100.0, 300.0), GetRandomReal(240.0, 360.0)))
		CreateNUnitsAtLoc(1, 1848652085, Player(11), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), 120.0)
		SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
		SetUnitState(GetLastCreatedUnit(), UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetLastCreatedUnit()) * (0.8 + 0.2 * I2R(udg_Guaiwu_sl)))
		SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), GetUnitStateSwap(ConvertUnitState(18), GetLastCreatedUnit()) * (0.9 + 0.1 * I2R(udg_Guaiwu_sl)))
		SetUnitLifePercentBJ(GetLastCreatedUnit(), 100)
		PauseUnitBJ(true, GetLastCreatedUnit())
		GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, PolarProjectionBJ(udg_Boss_dian[1], GetRandomReal(100.0, 300.0), GetRandomReal(240.0, 360.0)))
		CreateNUnitsAtLoc(1, 1848652085, Player(11), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), 120.0)
		SetUnitMoveSpeed(GetLastCreatedUnit(), 0.0)
		SetUnitState(GetLastCreatedUnit(), UNIT_STATE_MAX_LIFE, GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetLastCreatedUnit()) * (0.8 + 0.2 * I2R(udg_Guaiwu_sl)))
		SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), GetUnitStateSwap(ConvertUnitState(18), GetLastCreatedUnit()) * (0.9 + 0.1 * I2R(udg_Guaiwu_sl)))
		SetUnitLifePercentBJ(GetLastCreatedUnit(), 100)
		PauseUnitBJ(true, GetLastCreatedUnit())
		GroupAddUnitSimple(GetLastCreatedUnit(), udg_Guaiwu_dwz)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092343 then
		YDWETimerDestroyEffect(2.0, AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishHealth\\ReplenishHealthCasterOverhead.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
		ForGroupBJ(YDWEGetUnitsOfPlayerMatchingNull(Player(11), Condition(Trig_S_______001Func006Func002001002)), Trig_S_______001Func006Func002A)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1969316719 then
		ForGroupBJ(YDWEGetUnitsOfPlayerMatchingNull(Player(11), Condition(Trig_S_______001Func007Func001001002)), Trig_S_______001Func007Func001A)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092345 then
		CreateNUnitsAtLoc(1, 1848651842, Player(11), udg_Boss_dian[1], bj_UNIT_FACING)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936, GetConvertedPlayerId(ForcePickRandomPlayer(udg_WJZ_______cunhuo)))
		IssuePointOrderLoc(GetLastCreatedUnit(), "breathoffrost", udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 5290936)])
		YDWETimerRemoveUnit(6.0, GetLastCreatedUnit())
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1433168227 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
		SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430)) + 25.0)
		CreateTextTagUnitBJ("防御25", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430), 5.0, 15.0, 100, 100, 100, 0)
		SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
		YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
		ForForce(udg_WJZ, Trig_S_______001Func009Func006A)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1432580716 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
		ForForce(udg_WJZ, Trig_S_______001Func010Func002A)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1848652083 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968, YDWEGetUnitsInRectMatchingNull(gg_rct______________000, Condition(Trig_S_______001Func011Func002003002)))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968)))
		DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)) - 80.0)
		YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 250.0)
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 339273988, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 339273988))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		TimerStart(ydl_timer, 0.8, false, Trig_S_______001Func011Func008T)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092344 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
		ForForce(udg_WJZ, Trig_S_______001Func012Func002A)
	else
	end
	if GetUnitTypeId(GetTriggerUnit()) == 1966092361 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1860346430, GetTriggerUnit())
		AddSpecialEffectLocBJ(GetRectCenter(gg_rct______________001), "Units\\NightElf\\Wisp\\WispExplode.mdl")
		YDWETimerDestroyEffect(2, bj_lastCreatedEffect)
		ForForce(udg_WJZ, Trig_S_______001Func013Func004A)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig_S_______001()
	gg_trg_S_______001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_S_______001, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_S_______001, Condition(Trig_S_______001Conditions))
	TriggerAddAction(gg_trg_S_______001, Trig_S_______001Actions)
end

end

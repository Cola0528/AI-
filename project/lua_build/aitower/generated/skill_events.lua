-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function Trig_JN_______001Conditions()
	return GetSpellAbilityId() == 1093677104 or GetSpellAbilityId() == 1093677129 or GetSpellAbilityId() == 1093677394 or GetSpellAbilityId() == 1093678406 or GetSpellAbilityId() == 1093677892
end

function Trig_JN_______001Func005Func012Func002Func009Func003Func001Func002T()
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), I2R(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), true)) * (1.0 + 0.2 * I2R(GetUnitAbilityLevelSwapped(1093677136, udg_hero[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______001Func005Func012Func002Func009Func004T()
	UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_MEDIUM_CHOP)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______001Func005Func012Func002Func009Func005T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923, DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______001Func005Func012Func002Func009T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 355740503) == 1093677129 then
		if GetUnitStateSwap(UNIT_STATE_MANA, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) > 0.8 then
			YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
			ydl_timer = CreateTimer()
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
			TimerStart(ydl_timer, 0.4, false, Trig_JN_______001Func005Func012Func002Func009Func003Func001Func002T)
			SetUnitManaBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetUnitStateSwap(UNIT_STATE_MANA, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) - 1.0 + 0)
		else
		end
	else
	end
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_JN_______001Func005Func012Func002Func009Func004T)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_JN_______001Func005Func012Func002Func009Func005T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_JN_______001Func005Func012T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(50, 120)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, YDWEDistanceBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)) - 100.0)
		YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1166769641), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1166769641), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 773583050)), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.65, 0.03, 0, false, false, false, "origin", "", "")
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 355740503, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 355740503))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
		TimerStart(ydl_timer, 0.8, false, Trig_JN_______001Func005Func012Func002Func009T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______001Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		HopeThird_AfterAction(GetTriggerUnit(), GetSpellAbilityId(), GetSpellTargetUnit())
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		CreateTextTagUnitBJ((I2S(GetRandomInt(50, 120)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		if GetSpellAbilityId() == 1093677394 or GetSpellAbilityId() == 1093678406 then
			if GetSpellAbilityId() == 1093678406 then
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 1.2 + 1.0 * I2R(GetHeroStr(GetTriggerUnit(), true)))
			else
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0.5 * I2R(GetHeroStr(GetTriggerUnit(), true)))
			end
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + I2R(GetUnitAbilityLevel(GetTriggerUnit(), 1093677901)) * 0.15))
			if GetUnitAbilityLevel(GetTriggerUnit(), 1093677901) > 1 then
				udg_Zhongkan_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Zhongkan_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
				if udg_Zhongkan_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] >= 15 then
					ModifyHeroStat(bj_HEROSTAT_STR, GetTriggerUnit(), bj_MODIFYMETHOD_ADD, 1)
					udg_Zhongkan_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = 0
					DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "蓄力重砍效果 力量+1")
				else
				end
			else
			end
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 150 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 50 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
			else
			end
		else
			if GetSpellAbilityId() == 1093677892 then
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 1.0 * GetUnitState(GetTriggerUnit(), ConvertUnitState(32)))
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 150 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 50 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
				if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
					SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
				else
				end
			else
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) + 0.0 * I2R(GetHeroStr(GetTriggerUnit(), true)))
				if GetUnitAbilityLevelSwapped(1093678153, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) > 0 then
					SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + 0.2 * I2R(LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), -1800422954))))
					SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), -1800422954, 0)
				else
				end
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 120 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 90 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
				if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
					SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
				else
				end
			end
		end
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		ydl_timer = CreateTimer()
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 773583050, GetSpellTargetUnit())
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 1166769641, GetTriggerUnit())
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, HopeThird_Base(GetTriggerUnit(), GetSpellAbilityId(), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245), true))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -730831923))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 355740503, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______001Func005Func012T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______001()
	gg_trg_JN_______001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______001, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______001, Condition(Trig_JN_______001Conditions))
	TriggerAddAction(gg_trg_JN_______001, Trig_JN_______001Actions)
end

function Trig_JN_______001_______uConditions()
	return GetSpellAbilityId() == 1093678392
end

function Trig_JN_______001_______uFunc005Func015Func002Func009Func003T()
	if GetRandomInt(1, 2) == 1 then
		UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_MEDIUM_CHOP)
	else
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
		UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * 2.0, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_MEDIUM_CHOP)
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______001_______uFunc005Func015Func002Func009Func004T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923, DistanceBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______001_______uFunc005Func015Func002Func009T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_JN_______001_______uFunc005Func015Func002Func009Func003T)
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_JN_______001_______uFunc005Func015Func002Func009Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_JN_______001_______uFunc005Func015T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(50, 120)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, YDWEDistanceBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)) - 100.0)
		YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1166769641), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1166769641), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 773583050)), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.65, 0.03, 0, false, false, false, "origin", "", "")
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -730831923, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -730831923))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
		TimerStart(ydl_timer, 0.8, false, Trig_JN_______001_______uFunc005Func015Func002Func009T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______001_______uActions()
	HopeMonk_Cast(GetTriggerUnit(), 1093678392, GetSpellTargetUnit())
end

function InitTrig_JN_______001_______u()
	gg_trg_JN_______001_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______001_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______001_______u, Condition(Trig_JN_______001_______uConditions))
	TriggerAddAction(gg_trg_JN_______001_______u, Trig_JN_______001_______uActions)
end

function Trig_JN____________006Conditions()
	return GetSpellAbilityId() == 1093677131
end

function Trig_JN____________006Func004Func012Func003003003()
	return IsUnitEnemy(GetFilterUnit(), Player(0)) == true and IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig_JN____________006Func004Func012Func004A()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	SaveStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586, LoadStr(YDHT, GetHandleId(GetEnumUnit()), -1661751302))
	if LoadStr(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586) == "attack" and LoadBoolean(YDHT, GetHandleId(GetEnumUnit()), 240964279) == false then
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -192394947, LoadReal(YDHT, GetHandleId(GetEnumUnit()), -1820993401))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -192394947, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -192394947) * 0.7)
		SaveReal(YDHT, GetHandleId(GetEnumUnit()), -1820993401, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -192394947))
		SaveBoolean(YDHT, GetHandleId(GetEnumUnit()), 240964279, true)
	else
	end
end

function Trig_JN____________006Func004Func012Func006T()
	SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
	YDWETimerPatternRushSlide(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985) + 0, 0.8, 0.03, 0, false, false, false, "origin", "", "")
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN____________006Func004Func012T()
	local ydl_group
	local ydl_unit
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "origin"))
	SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968, YDWEGetUnitsInRangeOfLocMatchingNull(300.0, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)), Condition(Trig_JN____________006Func004Func012Func003003003)))
	ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968), Trig_JN____________006Func004Func012Func004A)
	DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
	ydl_timer = CreateTimer()
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
	SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1325585356))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
	TimerStart(ydl_timer, 0.7, false, Trig_JN____________006Func004Func012Func006T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
	ydl_timer = nil
end

function Trig_JN____________006Actions()
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
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, (0.5 * I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), GetSpellAbilityId())) + 1.0) * (0.0 + I2R(GetHeroStr(GetTriggerUnit(), true))))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		YDWETimerPatternRushSlide(GetTriggerUnit(), YDWEAngleBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985) + 0, 0.7, 0.03, 0, false, false, false, "origin", "", "")
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1325585356, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1325585356))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -192394947, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192394947))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 2066548968, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 950769985, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveStr(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586))
		TimerStart(ydl_timer, 1.0, false, Trig_JN____________006Func004Func012T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN____________006()
	gg_trg_JN____________006 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN____________006, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN____________006, Condition(Trig_JN____________006Conditions))
	TriggerAddAction(gg_trg_JN____________006, Trig_JN____________006Actions)
end

function Trig_JN______006_______uConditions()
	return GetSpellAbilityId() == 1093678393
end

function Trig_JN______006_______uActions()
	HopeMonk_Cast(GetTriggerUnit(), 1093678393, GetSpellTargetUnit())
end

function InitTrig_JN______006_______u()
	gg_trg_JN______006_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN______006_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN______006_______u, Condition(Trig_JN______006_______uConditions))
	TriggerAddAction(gg_trg_JN______006_______u, Trig_JN______006_______uActions)
end

function Trig_JN____________008Conditions()
	return GetSpellAbilityId() == 1093677395
end

function Trig_JN____________008Func010T()
	ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), bj_MODIFYMETHOD_SUB, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 94460517))
	udg_Ls_zj_Str[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] = udg_Ls_zj_Str[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] - LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 94460517)
	udg_Linshi_Str[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] = udg_Linshi_Str[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] - LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 94460517)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN____________008Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) - 10.0)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517, _idiv_(GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 5))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517) * GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()))
	ModifyHeroStat(bj_HEROSTAT_STR, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_MODIFYMETHOD_ADD, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517))
	udg_Ls_zj_Str[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Ls_zj_Str[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517)
	udg_Linshi_Str[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Linshi_Str[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517)
	ydl_timer = CreateTimer()
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
	SaveInteger(YDLOC, GetHandleId(ydl_timer), 94460517, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 94460517))
	TimerStart(ydl_timer, 15.0, false, Trig_JN____________008Func010T)
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN____________008()
	gg_trg_JN____________008 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN____________008, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN____________008, Condition(Trig_JN____________008Conditions))
	TriggerAddAction(gg_trg_JN____________008, Trig_JN____________008Actions)
end

function Trig_JN_____________008_______uConditions()
	return GetSpellAbilityId() == 1093677134
end

function Trig_JN_____________008_______uFunc005Func008A()
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538, GetConvertedPlayerId(GetEnumPlayer()))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766, udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1872163538)])
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\HealingWave\\HealingWaveTarget.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766), "origin"))
	if IsUnitAliveBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766)) == true then
		SetUnitLifePercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766), GetUnitLifePercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766)) + 25.0)
		SetUnitLifeBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766), GetUnitStateSwap(UNIT_STATE_LIFE, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), 1886625368))
	else
	end
end

function Trig_JN_____________008_______uActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		YDWESetUnitAbilityDataString(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1068628448), 1, 218, "恢复30%的最大生命值和50%的最大魔法值 |n |c00fffc01当前剩余可用次数: " .. (I2S(udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. "|r")
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1886625368, I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)))
		ForForce(udg_WJZ, Trig_JN_____________008_______uFunc005Func008A)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "没药水啦")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_____________008_______u()
	gg_trg_JN_____________008_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_____________008_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_____________008_______u, Condition(Trig_JN_____________008_______uConditions))
	TriggerAddAction(gg_trg_JN_____________008_______u, Trig_JN_____________008_______uActions)
end

function Trig_JN_____________008______________uConditions()
	return GetSpellAbilityId() == 1093678167
end

function Trig_JN_____________008______________uFunc005Func015Func001Func001003002()
	return GetOwningPlayer(GetFilterUnit()) == Player(11) and IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig_JN_____________008______________uFunc005Func015Func001Func002A()
	if GetEnumUnit() ~= LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -520086766) and LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1447038034) <= 2 then
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", GetEnumUnit(), "origin"))
		if IsUnitType(GetEnumUnit(), UNIT_TYPE_UNDEAD) == true then
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), GetEnumUnit(), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245)), GetEnumUnit()), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
		else
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), GetEnumUnit(), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1152683245)), GetEnumUnit()), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
		end
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1447038034, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1447038034) + 1)
	else
	end
end

function Trig_JN_____________008______________uFunc005Func015Func002003002()
	return GetOwningPlayer(GetFilterUnit()) == Player(11) and IsUnitAliveBJ(GetFilterUnit()) == true
end

function Trig_JN_____________008______________uActions()
	local ydl_group
	local ydl_unit
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1886625368, 1.0 * (0.2 * GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit())))
		SetUnitManaPercentBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), GetUnitManaPercent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) - 20.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1886625368) + 1.0 * I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), "origin"))
		if IsUnitType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), UNIT_TYPE_UNDEAD) == true then
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
		else
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
		end
		if GetUnitAbilityLevelSwapped(1093678167, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) == 2 then
			SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624, YDWEGetUnitsInRectMatchingNull(gg_rct______________000, Condition(Trig_JN_____________008______________uFunc005Func015Func002003002)))
			if CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624)) > 1 then
				SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514, GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624)))
				if LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514) == LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766) then
					GroupRemoveUnitSimple(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624))
					SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514, GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624)))
					YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), "origin"))
					if IsUnitType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), UNIT_TYPE_UNDEAD) == true then
						UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514)), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
					else
						UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514)), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
					end
				else
					YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), "origin"))
					if IsUnitType(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), UNIT_TYPE_UNDEAD) == true then
						UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514)), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
					else
						UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514), HopePriest_TargetDamage(HopePriest_BaseDamage(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245)), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 405527514)), ATTACK_TYPE_MAGIC, DAMAGE_TYPE_COLD)
					end
				end
			else
			end
			DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624))
		else
			if GetUnitAbilityLevelSwapped(1093678167, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) == 3 then
				SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624, YDWEGetUnitsInRectMatchingNull(gg_rct______________000, Condition(Trig_JN_____________008______________uFunc005Func015Func001Func001003002)))
				ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1134131624), Trig_JN_____________008______________uFunc005Func015Func001Func002A)
			else
			end
		end
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_group = nil
	ydl_unit = nil
end

function InitTrig_JN_____________008______________u()
	gg_trg_JN_____________008______________u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_____________008______________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_____________008______________u, Condition(Trig_JN_____________008______________uConditions))
	TriggerAddAction(gg_trg_JN_____________008______________u, Trig_JN_____________008______________uActions)
end

function Trig_JN_______008______________uConditions()
	return GetSpellAbilityId() == 1093677137
end

function Trig_JN_______008______________uActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 0.0 + (1.0 + I2R(GetUnitAbilityLevelSwapped(GetSpellAbilityId(), GetTriggerUnit()))) * GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(20)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		YDWESetUnitAbilityDataReal(udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], 1093677138, 1, 108, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		IssueImmediateOrder(udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "fanofknives")
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_______008______________u()
	gg_trg_JN_______008______________u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______008______________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______008______________u, Condition(Trig_JN_______008______________uConditions))
	TriggerAddAction(gg_trg_JN_______008______________u, Trig_JN_______008______________uActions)
end

function Trig_JN_______003Conditions()
	return GetSpellAbilityId() == 1093677130 or GetSpellAbilityId() == 1093677894
end

function Trig_JN_______003Func005Func016Func002Func007Func004Func001T()
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817) >= 3 then
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817) + 1)
		UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	end
end

function Trig_JN_______003Func005Func016Func002Func007Func004Func002T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______003Func005Func016Func002Func007T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 355740503) == 1093677130 then
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 0.2, false, Trig_JN_______003Func005Func016Func002Func007Func004Func002T)
	else
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 601864817, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 0.1, true, Trig_JN_______003Func005Func016Func002Func007Func004Func001T)
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_JN_______003Func005Func016T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(30, 200)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 601864817, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 355740503, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 355740503))
		TimerStart(ydl_timer, 0.5, false, Trig_JN_______003Func005Func016Func002Func007T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______003Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		if GetSpellAbilityId() == 1093677130 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 1.2)
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 0.8)
		end
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		CreateTextTagUnitBJ((I2S(GetRandomInt(30, 200)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 30 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 200 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 355740503, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______003Func005Func016T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______003()
	gg_trg_JN_______003 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______003, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______003, Condition(Trig_JN_______003Conditions))
	TriggerAddAction(gg_trg_JN_______003, Trig_JN_______003Actions)
end

function Trig_JN_______003_______uConditions()
	return GetSpellAbilityId() == 1093678147
end

function Trig_JN_______003_______uFunc005Func015Func002Func007Func004T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______003_______uFunc005Func015Func002Func007T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_JN_______003_______uFunc005Func015Func002Func007Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_JN_______003_______uFunc005Func015T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(30, 200)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 0.5, false, Trig_JN_______003_______uFunc005Func015Func002Func007T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______003_______uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 299.0)
		CreateTextTagUnitBJ((I2S(GetRandomInt(30, 200)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 99 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 299 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______003_______uFunc005Func015T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	UnitRemoveAbilityBJ(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503), GetTriggerUnit())
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______003_______u()
	gg_trg_JN_______003_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______003_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______003_______u, Condition(Trig_JN_______003_______uConditions))
	TriggerAddAction(gg_trg_JN_______003_______u, Trig_JN_______003_______uActions)
end

function Trig_JN_______003______________uConditions()
	return GetSpellAbilityId() == 1093678160
end

function Trig_JN_______003______________uFunc005Func004Func024Func002Func007Func004T()
	UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_METAL_HEAVY_BASH)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______003______________uFunc005Func004Func024Func002Func007T()
	local ydl_timer
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Weapons\\FragDriller\\FragDriller.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
	ydl_timer = CreateTimer()
	SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
	SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	TimerStart(ydl_timer, 0.2, false, Trig_JN_______003______________uFunc005Func004Func024Func002Func007Func004T)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_timer = nil
end

function Trig_JN_______003______________uFunc005Func004Func024T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(30, 200)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			if GetRandomInt(1, 10) > 7 then
				SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, 0)
				if GetRandomInt(1, 3) == 1 then
					SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "哎，致命空枪！"), 12.0)
				else
					if GetRandomInt(1, 2) == 1 then
						SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "打腿没死！"), 12.0)
					else
						SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "一丝一丝大残大残！"), 12.0)
					end
				end
			else
				SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
			end
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 0.5, false, Trig_JN_______003______________uFunc005Func004Func024Func002Func007T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______003______________uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599, LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 812780749))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599) > 0 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599) - 1)
			SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 812780749, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599))
			SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -689684256, LoadTextTagHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 46981737))
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599) == 0 then
				SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (YDWEGetPlayerColorString(Player(0), I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599))) or "") .. "/" .. (I2S(GetUnitAbilityLevelSwapped(1093678161, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 1) or ""))
			else
				SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599)) or "") .. "/" .. (I2S(GetUnitAbilityLevelSwapped(1093678161, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 1) or ""))
			end
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -689684256), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166), 12.0)
			if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
				bj_forLoopAIndex = 1
				bj_forLoopAIndexEnd = 6
				for _ in _loop_() do
					if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
					if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
						if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
							SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
							udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
						else
						end
						DoNothing()
						if true then break end
					else
					end
					bj_forLoopAIndex = bj_forLoopAIndex + 1
				end
			else
			end
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
			SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(20)) * 3.0)
			CreateTextTagUnitBJ((I2S(GetRandomInt(30, 200)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 125 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 200 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
			if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
				SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
			else
			end
			SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
			ydl_timer = CreateTimer()
			SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
			SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
			SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
			SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
			TimerStart(ydl_timer, 0.03, true, Trig_JN_______003______________uFunc005Func004Func024T)
		else
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599, GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093678161) + 1)
			SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -689684256, LoadTextTagHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 46981737))
			SaveStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166, (I2S(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599)) or "") .. "/" .. (I2S(GetUnitAbilityLevelSwapped(1093678161, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + 1) or ""))
			SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 812780749, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1611510599))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -689684256), LoadStr(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 757068166), 10)
			CreateTextTagUnitBJ("装弹中。。。。", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 11.0, 100, 100, 100, 0)
			SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
			YDWETimerDestroyTextTag(3.0, GetLastCreatedTextTag())
		end
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______003______________u()
	gg_trg_JN_______003______________u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______003______________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______003______________u, Condition(Trig_JN_______003______________uConditions))
	TriggerAddAction(gg_trg_JN_______003______________u, Trig_JN_______003______________uActions)
end

function Trig_JN_______0049Conditions()
	return GetSpellAbilityId() == 1093678162
end

function Trig_JN_______0049Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 355740503, GetSpellAbilityId())
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), -299321171, 1)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_______0049()
	gg_trg_JN_______0049 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______0049, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______0049, Condition(Trig_JN_______0049Conditions))
	TriggerAddAction(gg_trg_JN_______0049, Trig_JN_______0049Actions)
end

function Trig_JN_______004Conditions()
	return GetSpellAbilityId() == 1093677124
end

function Trig_JN_______004Func003Func019Func002Func007T()
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	CreateNUnitsAtLoc(1, 1697656913, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), 120.0)
	if GetUnitAbilityLevelSwapped(1093677896, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)) > 0 then
		UnitAddAbility(GetLastCreatedUnit(), 1093677897)
	else
	end
	SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	IssueTargetOrder(GetLastCreatedUnit(), "attackonce", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	YDWETimerRemoveUnit(2, GetLastCreatedUnit())
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______004Func003Func019T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(65, 110)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 0.5, false, Trig_JN_______004Func003Func019Func002Func007T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______004Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		HopeThird_AfterAction(GetTriggerUnit(), GetSpellAbilityId(), GetSpellTargetUnit())
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 1.3)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		CreateTextTagUnitBJ((I2S(GetRandomInt(65, 110)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 65 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 110 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) + 10 * GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093677135))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) + 10 * GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093677135))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______004Func003Func019T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______004()
	gg_trg_JN_______004 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______004, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______004, Condition(Trig_JN_______004Conditions))
	TriggerAddAction(gg_trg_JN_______004, Trig_JN_______004Actions)
end

function Trig_JN_______004_______uConditions()
	return GetSpellAbilityId() == 1093677652 or GetSpellAbilityId() == 1093678391
end

function Trig_JN_______004_______uFunc004Func017Func002Func007T()
	SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
	CreateNUnitsAtLoc(1, 1697656914, GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], bj_UNIT_FACING)
	IssueTargetOrder(GetLastCreatedUnit(), "attackonce", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
	SetUnitState(GetLastCreatedUnit(), ConvertUnitState(18), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
	YDWETimerRemoveUnit(2, GetLastCreatedUnit())
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______004_______uFunc004Func017T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(65, 110)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
		TimerStart(ydl_timer, 0.5, false, Trig_JN_______004_______uFunc004Func017Func002Func007T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______004_______uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		if GetSpellAbilityId() == 1093677652 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 0.8 + 0.8 * I2R(GetHeroStr(GetTriggerUnit(), true)))
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitState(GetTriggerUnit(), ConvertUnitState(20)) * 0.8 + 0.8 * I2R(GetHeroAgi(GetTriggerUnit(), true)))
		end
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		CreateTextTagUnitBJ((I2S(GetRandomInt(65, 110)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 80 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 100 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______004_______uFunc004Func017T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______004_______u()
	gg_trg_JN_______004_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______004_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______004_______u, Condition(Trig_JN_______004_______uConditions))
	TriggerAddAction(gg_trg_JN_______004_______u, Trig_JN_______004_______uActions)
end

function Trig_JN_____________026Conditions()
	return GetUnitTypeId(GetEventDamageSource()) == 1697656914 and GetUnitAbilityLevelSwapped(1093677653, udg_hero[GetConvertedPlayerId(GetOwningPlayer(GetEventDamageSource()))]) > 0
end

function Trig_JN_____________026Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetEventDamageSource())))
	CreateTextTagUnitBJ(YDWEGetPlayerColorString(Player(6), "中毒！"), GetTriggerUnit(), -5.0, 15.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 8.0, 90.0)
	YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260) == 1 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), -374736685))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 30 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) - 1)
		else
		end
		SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), -374736685, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 2)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260) == 2 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), 806467174))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 30 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) - 1)
		else
		end
		SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 806467174, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 2)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260) == 3 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), 370822118))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 30 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) - 1)
		else
		end
		SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 370822118, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 2)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260) == 4 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), 67668322))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 30 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) - 1)
		else
		end
		SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 67668322, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 2)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260) == 5 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), -1058892367))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 30 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) - 1)
		else
		end
		SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), -1058892367, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 2)
	else
	end
	if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260) == 6 then
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDHT, GetHandleId(GetTriggerUnit()), 1622058564))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) >= 30 then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) - 1)
		else
		end
		SaveInteger(YDHT, GetHandleId(GetTriggerUnit()), 1622058564, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817) + 2)
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_____________026()
	gg_trg_JN_____________026 = CreateTrigger()
	YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_JN_____________026)
	TriggerAddCondition(gg_trg_JN_____________026, Condition(Trig_JN_____________026Conditions))
	TriggerAddAction(gg_trg_JN_____________026, Trig_JN_____________026Actions)
end

function Trig_JN_______005Conditions()
	return GetSpellAbilityId() == 1093677126 or GetSpellAbilityId() == 1093677898
end

function Trig_JN_______005Func005Func018Func002Func012T()
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
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_COLD)
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
end

function Trig_JN_______005Func005Func018T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(75, 120)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1446364997) == 1093677126 then
			SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
			EXSetEffectSize(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), 1.0)
		else
			SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
			EXSetEffectSize(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), 1.5)
		end
		EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), 50.0)
		EXEffectMatRotateZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
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
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______005Func005Func018Func002Func012T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN_______005Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		HopeThird_AfterAction(GetTriggerUnit(), GetSpellAbilityId(), GetSpellTargetUnit())
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		if GetSpellAbilityId() == 1093677126 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitStateSwap(ConvertUnitState(20), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) * 0.5 + I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) * 1.0)
			if GetUnitAbilityLevel(GetTriggerUnit(), 1093678166) ~= 0 then
				SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093678166)) * 0.1 + 1.0))
			else
			end
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, HopePriest_TargetDamage(HopePriest_BaseDamage(I2R(GetHeroInt(GetTriggerUnit(), true))), GetSpellTargetUnit()))
		end
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		CreateTextTagUnitBJ((I2S(GetRandomInt(75, 120)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 75 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 120 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1446364997, GetSpellAbilityId())
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 1529581586, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -534744090, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_______005Func005Func018T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______005()
	gg_trg_JN_______005 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______005, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______005, Condition(Trig_JN_______005Conditions))
	TriggerAddAction(gg_trg_JN_______005, Trig_JN_______005Actions)
end

function Trig_JN____________00010Conditions()
	return GetSpellAbilityId() == 1093678390
end

function Trig_JN____________00010Func005Func018T()
	local hopeDebuffBefore
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
			hopeDebuffBefore = GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), ConvertUnitState(32))
			SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)) - I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1296908395)))
			HopeDebuff_RecordArmor(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), hopeDebuffBefore)
			CreateTextTagUnitBJ("护甲-" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1296908395)) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), 0, 8.0, 100, 100, 100, 0)
			SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 270.0)
			YDWETimerDestroyTextTag(0.5, GetLastCreatedTextTag())
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
end

function Trig_JN____________00010Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395, 2 + GetUnitAbilityLevelSwapped(1093678390, GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395)) * (I2R(GetHeroStr(GetTriggerUnit(), true)) + I2R(GetHeroAgi(GetTriggerUnit(), true))))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, AddSpecialEffectLoc("abilities\\weapons\\WyvernSpear\\WyvernSpearMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
		EXSetEffectSize(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), 1.5)
		EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), 50.0)
		EXEffectMatRotateZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1296908395, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1296908395))
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
		TimerStart(ydl_timer, 0.03, true, Trig_JN____________00010Func005Func018T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN____________00010()
	gg_trg_JN____________00010 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN____________00010, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN____________00010, Condition(Trig_JN____________00010Conditions))
	TriggerAddAction(gg_trg_JN____________00010, Trig_JN____________00010Actions)
end

function Trig_JN__________0001Conditions()
	return GetSpellAbilityId() == 1093678165
end

function Trig_JN__________0001Func005Func019T()
	local ydl_group
	local ydl_unit
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 120 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 12.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 12.0)
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 950769985, SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090) + 0, 2.0)))
		if SquareRoot(Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 1529581586), 2.0) + Pow(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) - LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -534744090), 2.0)) <= 60.0 then
			DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
			YDWETimerDestroyEffect(2.0, AddSpecialEffectTarget("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), "origin"))
			ydl_group = CreateGroup()
			GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 300.0, nil)
			for _ in _loop_() do
				ydl_unit = FirstOfGroup(ydl_group)
				if ydl_unit == nil then break end
				GroupRemoveUnit(ydl_group, ydl_unit)
				if IsUnitEnemy(ydl_unit, Player(0)) == true and IsUnitAliveBJ(ydl_unit) == true then
					if ydl_unit == LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766) then
						UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_COLD)
					else
						UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) / 2.0, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_COLD)
					end
				else
				end
			end
			DestroyGroup(ydl_group)
			FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
			DestroyTimer(GetExpiredTimer())
		else
		end
	end
	ydl_group = nil
	ydl_unit = nil
end

function Trig_JN__________0001Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 2 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 3
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 0.0 + I2R(GetHeroInt(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) * (1.5 + 1.5 * I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), GetSpellAbilityId()))) + HopeThird_Embers(GetTriggerUnit(), GetSpellTargetUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 950769985, YDWEDistanceBetweenUnits(GetTriggerUnit(), GetSpellTargetUnit()) - 100.0)
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
		EXSetEffectSize(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), 1.0)
		EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), 80.0)
		EXEffectMatRotateZ(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318), YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
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
		TimerStart(ydl_timer, 0.03, true, Trig_JN__________0001Func005Func019T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN__________0001()
	gg_trg_JN__________0001 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN__________0001, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN__________0001, Condition(Trig_JN__________0001Conditions))
	TriggerAddAction(gg_trg_JN__________0001, Trig_JN__________0001Actions)
end

function Trig_JN__________0012Conditions()
	return GetSpellAbilityId() == 1093678155
end

function Trig_JN__________0012Func004Func018Func002Func012T()
	local hopeDebuffBefore
	local ydl_group
	local ydl_unit
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 80 then
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, EXGetEffectX(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, EXGetEffectY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 25.0)
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * 25.0)
		EXSetEffectXY(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		ydl_group = CreateGroup()
		GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 150.0, nil)
		for _ in _loop_() do
			ydl_unit = FirstOfGroup(ydl_group)
			if ydl_unit == nil then break end
			GroupRemoveUnit(ydl_group, ydl_unit)
			if IsUnitAliveBJ(ydl_unit) == true and IsUnitEnemy(ydl_unit, Player(0)) == true and IsUnitInGroup(ydl_unit, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968)) == false then
				UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * 1.0, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
				SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157, GetUnitLoc(ydl_unit))
				YDWETimerDestroyEffect(1.0, AddSpecialEffectLoc("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157)))
				GroupAddUnitSimple(ydl_unit, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
				if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 1883620563) > 0 then
					hopeDebuffBefore = GetUnitState(ydl_unit, ConvertUnitState(32))
					SetUnitState(ydl_unit, ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), ydl_unit) - I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 1883620563)))
					HopeDebuff_RecordArmor(ydl_unit, hopeDebuffBefore)
					CreateTextTagUnitBJ("护甲-" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 1883620563)) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), 0, 8.0, 100, 100, 100, 0)
					SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 270.0)
					YDWETimerDestroyTextTag(0.5, GetLastCreatedTextTag())
				else
				end
				RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157))
			else
			end
		end
		DestroyGroup(ydl_group)
	end
	ydl_group = nil
	ydl_unit = nil
end

function Trig_JN__________0012Func004Func018T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) <= 15 then
		SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(GetRandomInt(75, 120)) or "") .. "%", 10)
	else
		SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, GetRandomInt(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 330577621), LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)))
		if LoadBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428) == true then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121, R2I(I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -1461476757)) * udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)]))
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), YDWEGetPlayerColorString(Player(0), "精准打击！" .. (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%！"), 15.0)
			SaveBoolean(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 149034428, false)
		else
			SetTextTagTextBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), (I2S(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) or "") .. "%!", 12.0)
		end
		SetTextTagVelocityBJ(LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201), 16.0, 90)
		YDWETimerDestroyTextTag(3.0, LoadTextTagHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1477421201))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * (I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -384785121)) / 100.0))
		SaveEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318, AddSpecialEffectLoc("Abilities\\Weapons\\BallistaMissile\\BallistaMissile.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754)))
		EXSetEffectZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), 50.0)
		EXEffectMatRotateZ(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681))
		SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968, CreateGroup())
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 532205493))
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 1883620563, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 1883620563))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1231493157, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 2066548968, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		TimerStart(ydl_timer, 0.03, true, Trig_JN__________0012Func004Func018Func002Func012T)
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	end
	ydl_timer = nil
end

function Trig_JN__________0012Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		if YDWEUnitHasItemOfTypeBJNull(GetTriggerUnit(), 1227895109) == true then
			bj_forLoopAIndex = 1
			bj_forLoopAIndexEnd = 6
			for _ in _loop_() do
				if bj_forLoopAIndex > bj_forLoopAIndexEnd then break end
				if GetItemTypeId(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) == 1227895109 then
					SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) + 1)
					if GetItemCharges(UnitItemInSlotBJ(GetTriggerUnit(), bj_forLoopAIndex)) > 6 then
						SetItemCharges(UnitItemInSlotBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), bj_forLoopAIndex), 1)
						udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
					else
					end
					DoNothing()
					if true then break end
				else
				end
				bj_forLoopAIndex = bj_forLoopAIndex + 1
			end
		else
		end
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493, GetSpellTargetLoc())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681, AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, GetUnitStateSwap(ConvertUnitState(20), GetTriggerUnit()) * 3.5)
		CreateTextTagUnitBJ((I2S(GetRandomInt(75, 120)) or "") .. "%", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 0, 10, 100, 100, 100, 0)
		SaveTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201, GetLastCreatedTextTag())
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, 100 + _idiv_(GetHeroAgi(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true), 2))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, 150 + GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) + 7 * GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093677135))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) + 7 * GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 1093677135))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1883620563, 5 * GetUnitAbilityLevelSwapped(1093678156, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))
		if LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621) > LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757) then
			SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		else
		end
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 1883620563, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1883620563))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1231493157, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1231493157))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 2066548968, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 532205493, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -1461476757, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1461476757))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 330577621, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 330577621))
		SaveTextTagHandle(YDLOC, GetHandleId(ydl_timer), 1477421201, LoadTextTagHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1477421201))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -384785121, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -384785121))
		TimerStart(ydl_timer, 0.03, true, Trig_JN__________0012Func004Func018T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN__________0012()
	gg_trg_JN__________0012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN__________0012, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN__________0012, Condition(Trig_JN__________0012Conditions))
	TriggerAddAction(gg_trg_JN__________0012, Trig_JN__________0012Actions)
end

function Trig_JN_____________0010Conditions()
	return GetSpellAbilityId() == 1093678153
end

function Trig_JN_____________0010Func004Func018Func002Func011Func001Func008T()
	SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1517793022), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157))
	RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157))
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_____________0010Func004Func018T()
	local ydl_group
	local ydl_unit
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) >= 80 then
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), -1800422954, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910))
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 324862700, 0)
		DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		if ModuloInteger(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548), 5) == 0 then
			SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910) + 1)
			if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910) >= 8 then
				SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910, 8)
			else
			end
			SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)), 324862700, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910))
		else
		end
		if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) == 30 then
			YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Shockwave\\ShockwaveMissile.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "origin"))
		else
		end
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360)))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558) + CosBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * (4.0 + I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910)) * 4.0))
		SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414) + SinBJ(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 758404681)) * (4.0 + 4.0 * I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910))))
		SetUnitPosition(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414))
		ydl_group = CreateGroup()
		GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 200.0, nil)
		for _ in _loop_() do
			ydl_unit = FirstOfGroup(ydl_group)
			if ydl_unit == nil then break end
			GroupRemoveUnit(ydl_group, ydl_unit)
			if IsUnitAliveBJ(ydl_unit) == true and IsUnitEnemy(ydl_unit, Player(0)) == true and IsUnitInGroup(ydl_unit, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968)) == false then
				UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245) * I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910)), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
				YDWETimerDestroyEffect(1.0, AddSpecialEffectLoc("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157)))
				SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1517793022, ydl_unit)
				YDWEJumpTimer(ydl_unit, YDWEAngleBetweenUnits(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit), 50.0 + 50.0 * I2R(LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910)), 0.6, 0.01, 300)
				SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 886448910) - 1)
				SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157, GetUnitLoc(ydl_unit))
				GroupAddUnitSimple(ydl_unit, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 2066548968))
				ydl_timer = CreateTimer()
				SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1231493157, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1231493157))
				SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 1517793022, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1517793022))
				TimerStart(ydl_timer, 2.0, false, Trig_JN_____________0010Func004Func018Func002Func011Func001Func008T)
			else
			end
		end
		DestroyGroup(ydl_group)
	end
	ydl_group = nil
	ydl_unit = nil
	ydl_timer = nil
end

function Trig_JN_____________0010Actions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		HopeThird_AfterAction(GetTriggerUnit(), GetSpellAbilityId(), GetSpellTargetUnit())
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493, GetSpellTargetLoc())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroStr(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), true)) * (0.5 * I2R(GetUnitAbilityLevelSwapped(1093678153, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1529581586, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -534744090, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 886448910, 1)
		SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)), 324862700, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 886448910))
		SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968, CreateGroup())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681, AngleBetweenPoints(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493)))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 532205493))
		ydl_timer = CreateTimer()
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 1231493157, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1231493157))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 2066548968, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 2066548968))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), 758404681, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 758404681))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 886448910, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 886448910))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 1517793022, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1517793022))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
		TimerStart(ydl_timer, 0.03, true, Trig_JN_____________0010Func004Func018T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_____________0010()
	gg_trg_JN_____________0010 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_____________0010, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_____________0010, Condition(Trig_JN_____________0010Conditions))
	TriggerAddAction(gg_trg_JN_____________0010, Trig_JN_____________0010Actions)
end

function Trig_JN__________007_______uConditions()
	return GetSpellAbilityId() == 1093677132
end

function Trig_JN__________007_______uFunc002Func016T()
	local ydl_group
	local ydl_unit
	ydl_group = CreateGroup()
	GroupEnumUnitsInRange(ydl_group, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1449975558), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -34188414), 350.0, nil)
	for _ in _loop_() do
		ydl_unit = FirstOfGroup(ydl_group)
		if ydl_unit == nil then break end
		GroupRemoveUnit(ydl_group, ydl_unit)
		if IsUnitEnemy(ydl_unit, Player(0)) == true then
			UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), ydl_unit, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_COLD)
		else
		end
	end
	DestroyGroup(ydl_group)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
	ydl_group = nil
	ydl_unit = nil
end

function Trig_JN__________007_______uActions()
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
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetSpellTargetLoc())
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, I2R(GetHeroInt(GetTriggerUnit(), true)) * (2.0 + 1.0 * I2R(GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()))))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 1.0 * (LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.0)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		if GetUnitAbilityLevel(GetTriggerUnit(), 1093677895) > 0 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + 0.2 * I2R(GetUnitAbilityLevel(GetTriggerUnit(), 1093677380))))
		else
		end
		SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "spell")
		IssuePointOrderLoc(udg_Mj_Danwei[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "blizzard", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558, GetLocationX(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414, GetLocationY(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754)))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1449975558, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1449975558))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -34188414, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -34188414))
		TimerStart(ydl_timer, 0.5, false, Trig_JN__________007_______uFunc002Func016T)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN__________007_______u()
	gg_trg_JN__________007_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN__________007_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN__________007_______u, Condition(Trig_JN__________007_______uConditions))
	TriggerAddAction(gg_trg_JN__________007_______u, Trig_JN__________007_______uActions)
end

function Trig_JN_______002Conditions()
	return GetSpellAbilityId() == 1093677125 or GetSpellAbilityId() == 1093677106 or GetSpellAbilityId() == 1093678403
end

function Trig_JN_______002Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	if GetSpellAbilityId() == 1093678403 then
		HopeMonk_Cast(GetTriggerUnit(), 1093678403, nil)
		return
	end
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		HopeThird_AfterAction(GetTriggerUnit(), GetSpellAbilityId(), GetSpellTargetUnit())
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		if GetSpellAbilityId() == 1093677125 then
			SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
			if LoadStr(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), -1661751302) == "attack" then
				SaveUnitHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)), -272485038, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
			else
			end
		else
		end
		if GetSpellAbilityId() == 1093677106 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, 10.0 + udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		else
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] * 3.0 + 1.0 * I2R(10))
		end
		if GetSpellAbilityId() == 1093678403 then
			SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, I2R(GetHeroInt(GetTriggerUnit(), true)) / 3.0)
		else
		end
		SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "origin"))
		CreateTextTagUnitBJ("护甲+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), 5.0, 15.0, 100, 100, 100, 0)
		SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
		YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_______002()
	gg_trg_JN_______002 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______002, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______002, Condition(Trig_JN_______002Conditions))
	TriggerAddAction(gg_trg_JN_______002, Trig_JN_______002Actions)
end

function Trig_JN_____________002_______uConditions()
	return GetSpellAbilityId() == 1093677396
end

function Trig_JN_____________002_______uFunc003Func007A()
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360, udg_hero[GetConvertedPlayerId(GetEnumPlayer())])
	SetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), ConvertUnitState(32), GetUnitStateSwap(ConvertUnitState(32), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360)) + LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -192887348))
	YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), "origin"))
	CreateTextTagUnitBJ("护甲+" .. (I2S(R2I(LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -192887348))) or ""), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265), -1626575360), 5.0, 15.0, 100, 100, 100, 0)
	SetTextTagVelocityBJ(GetLastCreatedTextTag(), 16.0, 90.0)
	YDWETimerDestroyTextTag(2, GetLastCreatedTextTag())
end

function Trig_JN_____________002_______uActions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 0 then
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 1
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -192887348, 0.0 + 0.3 * I2R(GetHeroInt(GetTriggerUnit(), true)))
		YDWETimerDestroyEffect(1.0, AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIda\\AIdaCaster.mdl", GetTriggerUnit(), "origin"))
		ForForce(udg_WJZ_______cunhuo, Trig_JN_____________002_______uFunc003Func007A)
	else
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "行动点不足")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_____________002_______u()
	gg_trg_JN_____________002_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_____________002_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_____________002_______u, Condition(Trig_JN_____________002_______uConditions))
	TriggerAddAction(gg_trg_JN_____________002_______u, Trig_JN_____________002_______uActions)
end

function Trig_JN_____________012Actions()
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if GetLearnedSkillBJ() == 1093677136 then
		if GetUnitAbilityLevelSwapped(1093677136, GetTriggerUnit()) == 1 then
			udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 1
		else
		end
	else
	end
	if GetLearnedSkillBJ() == 1093677893 then
		udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_HUIHE[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5.0
		udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Defend_fangyu[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5.0
	else
	end
	if GetLearnedSkillBJ() == 1093677895 then
		udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Fashang_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.1
	else
	end
	if GetLearnedSkillBJ() == 1093678166 then
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5
	else
	end
	if GetLearnedSkillBJ() == 1093677899 then
		udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_huihe_huilan[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 5.0
	else
	end
	if GetLearnedSkillBJ() == 1093678389 then
		udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_jingque_Daji_jiacheng[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 0.2
		udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_DEX[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 3.0
	else
	end
	if GetLearnedSkillBJ() == 1093677134 then
		HopeReclass_PotionLearn(GetTriggerUnit())
		YDWESetUnitAbilityDataString(GetTriggerUnit(), LoadInteger(YDHT, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260), 1068628448), 1, 218, "恢复30%的最大生命值和50%的最大魔法值 |n |c00fffc01当前剩余可用次数: " .. (I2S(udg_Yaoshui_shenyu_cs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. "|r")
	else
	end
	if GetLearnedSkillBJ() == 1093678161 then
		SetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18), GetUnitState(udg_hero[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], ConvertUnitState(18)) + 10.0)
		udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_Gongjili_Jc[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] + 10
	else
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
end

function InitTrig_JN_____________012()
	gg_trg_JN_____________012 = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_____________012, EVENT_PLAYER_HERO_SKILL)
	TriggerAddAction(gg_trg_JN_____________012, Trig_JN_____________012Actions)
end

function Trig_JN_____________009_______uConditions()
	return GetSpellAbilityId() == 1093677900
end

function Trig_JN_____________009_______uFunc003Func013Func002Func006T()
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_____________009_______uFunc003Func013T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) > LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817) then
		SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754), bj_UNIT_FACING)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1663695754))
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
		SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766, GroupPickRandomUnit(udg_Guaiwu_dwz))
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766)))
		SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -207283230, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345), 80.0, GetRandomDirectionDeg()))
		SetUnitPositionLocFacingLocBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -207283230), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		TimerStart(ydl_timer, 0.1, false, Trig_JN_____________009_______uFunc003Func013Func002Func006T)
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -168352345))
		RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), -207283230))
	end
	ydl_timer = nil
end

function Trig_JN_____________009_______uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(GetTriggerUnit()))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 0.55 * (I2R(GetHeroAgi(GetTriggerUnit(), true)) + GetUnitState(GetTriggerUnit(), ConvertUnitState(20))))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + I2R(GetHeroAgi(GetTriggerUnit(), true)) / 200.0))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, GetRandomInt(4, 7))
		AddSpecialEffectTargetUnitBJ("weapon", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "Abilities\\Weapons\\ZigguratMissile\\ZigguratMissile.mdl")
		SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, GetLastCreatedEffectBJ())
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -1663695754, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -168352345, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), -207283230, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -207283230))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
		TimerStart(ydl_timer, 0.4, true, Trig_JN_____________009_______uFunc003Func013T)
	else
		SetUnitState(GetTriggerUnit(), UNIT_STATE_MANA, RMinBJ(GetUnitState(GetTriggerUnit(), UNIT_STATE_MAX_MANA), GetUnitState(GetTriggerUnit(), UNIT_STATE_MANA) + HopeSkill_ManaCost(GetSpellAbilityId(), GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()))))
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "需要2行动点；未执行，已返还魔法。")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_____________009_______u()
	gg_trg_JN_____________009_______u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_____________009_______u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_____________009_______u, Condition(Trig_JN_____________009_______uConditions))
	TriggerAddAction(gg_trg_JN_____________009_______u, Trig_JN_____________009_______uActions)
end

function Trig_JN_______009______________uConditions()
	return GetSpellAbilityId() == 1093678409
end

function Trig_JN_______009______________uFunc003Func015Func002Func002T()
	udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] + 10
	UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL)
	FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
	DestroyTimer(GetExpiredTimer())
end

function Trig_JN_______009______________uFunc003Func015T()
	local ydl_timer
	SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) + 1)
	if LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -68293548) > LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 601864817) then
		SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), udg_Hero_dian[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)], bj_UNIT_FACING)
		DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 1657081318))
		udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] = udg_Baoji_Lv[LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260)] - 50
		FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
		DestroyTimer(GetExpiredTimer())
	else
		SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360), "attack")
		ydl_timer = CreateTimer()
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -1626575360))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), -2022357260))
		TimerStart(ydl_timer, 0.2, false, Trig_JN_______009______________uFunc003Func015Func002Func002T)
	end
	ydl_timer = nil
end

function Trig_JN_______009______________uActions()
	local ydl_timer
	local ydl_localvar_step = LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826)
	ydl_localvar_step = ydl_localvar_step + 3
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -807506826, ydl_localvar_step)
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), -320330265, ydl_localvar_step)
	SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
	SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260, GetConvertedPlayerId(GetOwningPlayer(GetTriggerUnit())))
	if udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] > 1 then
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360, GetTriggerUnit())
		udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] = udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)] - 2
		DzFrameSetText(udg_xingdongdian_xs[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)], "行动点:" .. (I2S(udg_xingdong_dian[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or "") .. " / " .. (I2S(udg_xingdong_dianSx[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)]) or ""))
		SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766, GetSpellTargetUnit())
		SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766)))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, 0.55 * (I2R(GetHeroAgi(GetTriggerUnit(), true)) + GetUnitState(GetTriggerUnit(), ConvertUnitState(20))))
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * udg_Skill_Dm[LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260)])
		SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245) * (1.0 + I2R(GetHeroAgi(GetTriggerUnit(), true)) / 200.0))
		SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817, 5)
		AddSpecialEffectTargetUnitBJ("weapon", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl")
		SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318, GetLastCreatedEffectBJ())
		SetUnitPositionLocFacingLocBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360), PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1663695754), 100.0, GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -168352345))
		ydl_timer = CreateTimer()
		SaveInteger(YDLOC, GetHandleId(ydl_timer), 601864817, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 601864817))
		SaveReal(YDLOC, GetHandleId(ydl_timer), -1152683245, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1152683245))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -1626575360, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -1626575360))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -68293548, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -68293548))
		SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), -520086766, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -520086766))
		SaveInteger(YDLOC, GetHandleId(ydl_timer), -2022357260, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, -2022357260))
		SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 1657081318, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 1657081318))
		TimerStart(ydl_timer, 0.4, true, Trig_JN_______009______________uFunc003Func015T)
	else
		SetUnitState(GetTriggerUnit(), UNIT_STATE_MANA, RMinBJ(GetUnitState(GetTriggerUnit(), UNIT_STATE_MAX_MANA), GetUnitState(GetTriggerUnit(), UNIT_STATE_MANA) + HopeSkill_ManaCost(GetSpellAbilityId(), GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()))))
		DisplayTextToPlayer(GetOwningPlayer(GetTriggerUnit()), 0, 0, "需要2行动点；未执行，已返还魔法。")
	end
	FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
	ydl_timer = nil
end

function InitTrig_JN_______009______________u()
	gg_trg_JN_______009______________u = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_JN_______009______________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(gg_trg_JN_______009______________u, Condition(Trig_JN_______009______________uConditions))
	TriggerAddAction(gg_trg_JN_______009______________u, Trig_JN_______009______________uActions)
end

end

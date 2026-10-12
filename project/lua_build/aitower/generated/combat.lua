-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeMeditation_Clear(u, i)
	local mana = GetUnitState(u, UNIT_STATE_MANA)
	local maximum = GetUnitState(u, UNIT_STATE_MAX_MANA)
	local held = HopeMeditation_Active[i] and HopeMeditation_Unit[i] == u
	SetHeroInt(u, GetHeroInt(u, false) - udg_Linshi_Int[i], true)
	if held then
		SetUnitState(u, UNIT_STATE_MAX_MANA, maximum)
		SetUnitState(u, UNIT_STATE_MANA, RMinBJ(maximum, mana))
		HopeMeditation_Active[i] = false
		HopeMeditation_Unit[i] = nil
	end
end

function HopeMeditation_Apply(u)
	local p = GetOwningPlayer(u)
	local i = GetPlayerId(p) + 1
	local token = HopeChallenge_TurnToken() + 1
	local intelligence = GetHeroInt(u, true)
	local bonus = R2I(I2R(intelligence) * 0.3)
	local mana = GetUnitState(u, UNIT_STATE_MANA)
	local maximum = GetUnitState(u, UNIT_STATE_MAX_MANA)
	local restored = RMinBJ(RMaxBJ(0.0, maximum - mana), 3.0 + I2R(intelligence) / 5.0)
	if i < 1 or i > 6 or u ~= udg_hero[i] or not udg_ZhandouZhong or GetWidgetLife(u) <= 0.405 then
		DisplayTimedTextToPlayer(p, 0, 0, 4.0, "冥想只能由当前英雄在战斗中使用。")
		p = nil
		return
	end
	if udg_xingdong_dian[i] < 1 then
		DisplayTimedTextToPlayer(p, 0, 0, 4.0, "冥想需要1行动点。")
		p = nil
		return
	end
	if HopeMeditation_LastCast[i] == token or HopeMeditation_Active[i] then
		DisplayTimedTextToPlayer(p, 0, 0, 4.0, "冥想每回合只能使用一次。")
		p = nil
		return
	end
	HopeMeditation_LastCast[i] = token
	udg_xingdong_dian[i] = udg_xingdong_dian[i] - 1
	udg_Linshi_Int[i] = udg_Linshi_Int[i] + bonus
	udg_Ls_zj_Int[i] = udg_Ls_zj_Int[i] + bonus
	SetHeroInt(u, GetHeroInt(u, false) + bonus, true)
	-- Neutralize BOTH the native maximum increase and any native current-mana adjustment.
	SetUnitState(u, UNIT_STATE_MAX_MANA, maximum)
	SetUnitState(u, UNIT_STATE_MANA, RMinBJ(maximum, mana + restored))
	HopeMeditation_Active[i] = true
	HopeMeditation_Unit[i] = u
	DisplayTimedTextToPlayer(p, 0, 0, 4.0, "冥想：恢复 " .. (R2S(restored) or "") .. " 魔法，本回合智力 +" .. (I2S(bonus) or "") .. "；行动点 -1。")
	p = nil
end

function HopeSkill_Supported(id)
	return id == 1093677104 or id == 1093677105 or id == 1093677106 or id == 1093677124 or id == 1093677125 or id == 1093677126 or id == 1093677129 or id == 1093677130 or id == 1093677131 or id == 1093677132 or id == 1093677134 or id == 1093677137 or id == 1093677144 or id == 1093677145 or id == 1093677146 or id == 1093677360 or id == 1093677361 or id == 1093677362 or id == 1093677363 or id == 1093677364 or id == 1093677365 or id == 1093677379 or id == 1093677380 or id == 1093677384 or id == 1093677385 or id == 1093677386 or id == 1093677387 or id == 1093677390 or id == 1093677391 or id == 1093677394 or id == 1093677395 or id == 1093677396 or id == 1093677616 or id == 1093677617 or id == 1093677651 or id == 1093677652 or id == 1093677653 or id == 1093677890 or id == 1093677891 or id == 1093677892 or id == 1093677894 or id == 1093677898 or id == 1093677900 or id == 1093677913 or id == 1093677914 or id == 1093678133 or id == 1093678147 or id == 1093678153 or id == 1093678155 or id == 1093678160 or id == 1093678162 or id == 1093678165 or id == 1093678167 or id == 1093678168 or id == 1093678169 or id == 1093678384 or id == 1093678385 or id == 1093678386 or id == 1093678387 or id == 1093678388 or id == 1093678390 or id == 1093678391 or id == 1093678392 or id == 1093678393 or id == 1093678402 or id == 1093678403 or id == 1093678406 or id == 1093678409
end

function HopeThird_Get(h, k)
	if LoadInteger(HopeThird_Data, h, 0) ~= HopeThird_Gen then
		return 0
	end
	return LoadInteger(HopeThird_Data, h, k)
end

function HopeThird_Put(h, k, v)
	if LoadInteger(HopeThird_Data, h, 0) ~= HopeThird_Gen then
		FlushChildHashtable(HopeThird_Data, h)
		SaveInteger(HopeThird_Data, h, 0, HopeThird_Gen)
	end
	SaveInteger(HopeThird_Data, h, k, v)
end

function HopeThird_Level(u)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	if p < 1 or p > 6 or u ~= udg_hero[p] or not HopeJob_Awakened[p] then
		return 0
	end
	return GetUnitAbilityLevel(u, HopeThird_Ability[HopeJob_AwakenOption[p]])
end

function HopeThird_Enemy(target, p)
	return target ~= nil and GetWidgetLife(target) > 0.405 and IsUnitInGroup(target, udg_Guaiwu_dwz) and IsUnitEnemy(target, p)
end

function HopeThird_Heal(u, amount, overflow)
	local missing = RMaxBJ(0.0, GetUnitState(u, UNIT_STATE_MAX_LIFE) - GetWidgetLife(u))
	SetUnitState(u, UNIT_STATE_LIFE, GetWidgetLife(u) + RMinBJ(missing, amount))
	if overflow and amount > missing then
		SetUnitState(u, ConvertUnitState(32), GetUnitState(u, ConvertUnitState(32)) + amount - missing)
	end
end

function HopeThird_Refund(p)
	udg_xingdong_dian[p] = IMinBJ(udg_xingdong_dianSx[p], udg_xingdong_dian[p] + 1)
end

function HopeThird_Reset()
	local p = 1
	HopeThird_Gen = HopeThird_Gen + 1
	for _ in _loop_() do
		if p > 6 then break end
		HopeThird_Cavalry[p] = false
		HopeThird_ComboToken[p] = -1
		HopeThird_PressureToken[p] = -1
		HopeThird_HitsToken[p] = -1
		HopeThird_HiddenToken[p] = -1
		HopeThird_FireTarget[p] = nil
		HopeThird_PressureTarget[p] = nil
		p = p + 1
	end
end

function HopeThird_HiddenAction(u, aid)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local level = HopeThird_Level(u)
	local token = HopeChallenge_TurnToken()
	local mask = 0
	if level <= 0 or GetUnitTypeId(u) ~= 1213870131 then
		return
	end
	if HopeThird_HiddenToken[p] ~= token then
		HopeThird_HiddenToken[p] = token
		HopeThird_HiddenMask[p] = 0
	end
	mask = HopeThird_HiddenMask[p]
	if mask >= 8 then
		return
	end
	if aid == 1096435763 and ModuloInteger(mask, 2) == 0 then
		mask = mask + 1
	elseif aid == 1096435794 and ModuloInteger(mask, 4) < 2 then
		mask = mask + 2
	elseif aid == 1096435780 and mask < 4 then
		mask = mask + 4
	end
	HopeThird_HiddenMask[p] = mask
	if ModuloInteger(mask, 2) + ModuloInteger(_idiv_(mask, 2), 2) + _idiv_(mask, 4) >= 2 then
		HopeThird_HiddenMask[p] = mask + 8
		HopeThird_Refund(p)
		HopeThird_Heal(u, I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true)) * (0.05 + 0.05 * I2R(level)), false)
	end
end

function HopeThird_AfterAction(u, aid, target)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local level = HopeThird_Level(u)
	local kind = GetUnitTypeId(u)
	local token = HopeChallenge_TurnToken()
	local limit = 0
	local count = 0
	local g = nil
	local enemy = nil
	if level <= 0 or not udg_ZhandouZhong then
		return
	end
	if kind == 1211117624 and aid == 1093677125 then
		SetUnitState(u, ConvertUnitState(32), GetUnitState(u, ConvertUnitState(32)) + I2R(GetHeroStr(u, true)) * (0.25 + 0.25 * I2R(level)))
	elseif kind == 1211117636 and aid == 1093678153 then
		HopeThird_Cavalry[p] = true
	elseif kind == 1311781176 and aid == 1093677129 and HopeThird_Enemy(target, GetOwningPlayer(u)) then
		if HopeThird_ComboToken[p] ~= token then
			HopeThird_ComboToken[p] = token
			HopeThird_ComboCount[p] = 0
			HopeThird_ComboPaid[p] = false
		end
		HopeThird_ComboCount[p] = HopeThird_ComboCount[p] + 1
		limit = 2
		if level == 1 then
			limit = 3
		end
		if not HopeThird_ComboPaid[p] and HopeThird_ComboCount[p] >= limit then
			HopeThird_ComboPaid[p] = true
			HopeThird_Refund(p)
			if level == 3 then
				SetUnitState(u, UNIT_STATE_MANA, RMinBJ(GetUnitState(u, UNIT_STATE_MAX_MANA), GetUnitState(u, UNIT_STATE_MANA) + 2.0))
			end
		end
	elseif kind == 1160786003 and aid == 1093677124 and HopeThird_Enemy(target, GetOwningPlayer(u)) then
		limit = IMinBJ(2, level)
		g = CreateGroup()
		GroupAddGroup(udg_Guaiwu_dwz, g)
		for _ in _loop_() do
			enemy = FirstOfGroup(g)
			if enemy == nil or count >= limit then break end
			GroupRemoveUnit(g, enemy)
			if enemy ~= target and HopeThird_Enemy(enemy, GetOwningPlayer(u)) then
				if level == 3 then
					UnitDamageTarget(u, enemy, I2R(GetHeroAgi(u, true)) * 1.6 * udg_Skill_Dm[p], true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
				else
					UnitDamageTarget(u, enemy, I2R(GetHeroAgi(u, true)) * 1.2 * udg_Skill_Dm[p], true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
				end
				DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\Arrow\\ArrowMissile.mdl", enemy, "origin"))
				count = count + 1
			end
		end
		DestroyGroup(g)
	elseif kind == 1311781189 and aid == 1093677126 and HopeThird_Enemy(target, GetOwningPlayer(u)) then
		HopeThird_Put(GetHandleId(target), p, IMinBJ(3, HopeThird_Get(GetHandleId(target), p) + 1))
		HopeThird_FireTarget[p] = target
	end
	enemy = nil
	g = nil
end

function HopeThird_Base(u, aid, amount, consume)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local level = HopeThird_Level(u)
	local kind = GetUnitTypeId(u)
	if level <= 0 then
		return amount
	end
	if kind == 1211117624 and aid == 1093677892 then
		return amount + RMaxBJ(0.0, GetUnitState(u, ConvertUnitState(32))) * (0.25 + 0.25 * I2R(level))
	elseif kind == 1211117636 and aid == 1093677104 and HopeThird_Cavalry[p] then
		if consume then
			HopeThird_Cavalry[p] = false
		end
		return amount * (1.0 + 0.25 + 0.25 * I2R(level))
	elseif kind == 1311781185 and aid == 1093677394 and GetUnitState(u, UNIT_STATE_MAX_LIFE) > 0.0 then
		return amount * (1.0 + RMaxBJ(0.0, 1.0 - GetWidgetLife(u) / GetUnitState(u, UNIT_STATE_MAX_LIFE)) * (0.2 + 0.2 * I2R(level)))
	end
	return amount
end

function HopeThird_Embers(u, target)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local level = HopeThird_Level(u)
	local count = 0
	if level <= 0 or GetUnitTypeId(u) ~= 1311781189 or not udg_ZhandouZhong or not HopeThird_Enemy(target, GetOwningPlayer(u)) then
		return 0.0
	end
	count = HopeThird_Get(GetHandleId(target), p)
	HopeThird_Put(GetHandleId(target), p, 0)
	return I2R(count * GetHeroInt(u, true)) * (0.4 + 0.4 * I2R(level))
end

function HopeThird_Damage(u, target, amount)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local owner = GetPlayerId(GetOwningPlayer(target)) + 1
	local kind = GetUnitTypeId(u)
	local level = HopeThird_Level(u)
	local token = HopeChallenge_TurnToken()
	local h = GetHandleId(target)
	local marks = 0
	if amount <= 0.0 or not udg_ZhandouZhong then
		return amount
	end
	-- Frost affects the marked enemy's next positive damage event against a hero.
	if owner >= 1 and owner <= 6 and target == udg_hero[owner] and IsUnitEnemy(u, GetOwningPlayer(target)) and HopeThird_Get(GetHandleId(u), 101) > 0 then
		HopeThird_Put(GetHandleId(u), 101, 0)
		amount = amount * 0.5
	end
	if p < 1 or p > 6 or u ~= udg_hero[p] or not HopeThird_Enemy(target, GetOwningPlayer(u)) then
		return amount
	end
	-- Hunt belongs to the target: teammates also benefit, one charge per damage event.
	marks = HopeThird_Get(h, 102)
	if marks > 0 then
		HopeThird_Put(h, 102, marks - 1)
		amount = amount * 1.25
		AdjustPlayerStateBJ(10, GetOwningPlayer(u), PLAYER_STATE_RESOURCE_GOLD)
	end
	if level <= 0 then
		return amount
	end
	if kind == 1211117620 then
		if HopeThird_PressureToken[p] ~= token or HopeThird_PressureTarget[p] ~= target then
			HopeThird_PressureToken[p] = token
			HopeThird_PressureTarget[p] = target
			HopeThird_Pressure[p] = 0
		end
		amount = amount * (1.0 + I2R(HopeThird_Pressure[p]) * (0.04 + 0.04 * I2R(level)))
		HopeThird_Pressure[p] = IMinBJ(3, HopeThird_Pressure[p] + 1)
	elseif kind == 1328558134 then
		if HopeThird_HitsToken[p] ~= token then
			HopeThird_HitsToken[p] = token
			HopeThird_Hits[p] = 0
			HopeThird_HealCount[p] = 0
		end
		if HopeThird_HealCount[p] < 2 then
			HopeThird_Hits[p] = HopeThird_Hits[p] + 1
			if HopeThird_Hits[p] >= 3 then
				HopeThird_Hits[p] = 0
				HopeThird_HealCount[p] = HopeThird_HealCount[p] + 1
				HopeThird_Heal(u, I2R(GetHeroStr(u, true) + GetHeroAgi(u, true)) * (0.1 + 0.1 * I2R(level)), true)
			end
		end
	end
	return amount
end

function HopeSkill_InitIds()
	HopeSkill_Ids[0] = 1093677104
	HopeSkill_Ids[1] = 1093677105
	HopeSkill_Ids[2] = 1093677106
	HopeSkill_Ids[3] = 1093677124
	HopeSkill_Ids[4] = 1093677125
	HopeSkill_Ids[5] = 1093677126
	HopeSkill_Ids[6] = 1093677129
	HopeSkill_Ids[7] = 1093677130
	HopeSkill_Ids[8] = 1093677131
	HopeSkill_Ids[9] = 1093677132
	HopeSkill_Ids[10] = 1093677134
	HopeSkill_Ids[11] = 1093677137
	HopeSkill_Ids[12] = 1093677144
	HopeSkill_Ids[13] = 1093677145
	HopeSkill_Ids[14] = 1093677146
	HopeSkill_Ids[15] = 1093677360
	HopeSkill_Ids[16] = 1093677361
	HopeSkill_Ids[17] = 1093677362
	HopeSkill_Ids[18] = 1093677363
	HopeSkill_Ids[19] = 1093677364
	HopeSkill_Ids[20] = 1093677365
	HopeSkill_Ids[21] = 1093677379
	HopeSkill_Ids[22] = 1093677380
	HopeSkill_Ids[23] = 1093677384
	HopeSkill_Ids[24] = 1093677385
	HopeSkill_Ids[25] = 1093677386
	HopeSkill_Ids[26] = 1093677387
	HopeSkill_Ids[27] = 1093677390
	HopeSkill_Ids[28] = 1093677391
	HopeSkill_Ids[29] = 1093677394
	HopeSkill_Ids[30] = 1093677395
	HopeSkill_Ids[31] = 1093677396
	HopeSkill_Ids[32] = 1093677616
	HopeSkill_Ids[33] = 1093677617
	HopeSkill_Ids[34] = 1093677651
	HopeSkill_Ids[35] = 1093677652
	HopeSkill_Ids[36] = 1093677653
	HopeSkill_Ids[37] = 1093677890
	HopeSkill_Ids[38] = 1093677891
	HopeSkill_Ids[39] = 1093677892
	HopeSkill_Ids[40] = 1093677894
	HopeSkill_Ids[41] = 1093677898
	HopeSkill_Ids[42] = 1093677900
	HopeSkill_Ids[43] = 1093677913
	HopeSkill_Ids[44] = 1093677914
	HopeSkill_Ids[45] = 1093678133
	HopeSkill_Ids[46] = 1093678147
	HopeSkill_Ids[47] = 1093678153
	HopeSkill_Ids[48] = 1093678155
	HopeSkill_Ids[49] = 1093678160
	HopeSkill_Ids[50] = 1093678162
	HopeSkill_Ids[51] = 1093678165
	HopeSkill_Ids[52] = 1093678167
	HopeSkill_Ids[53] = 1093678168
	HopeSkill_Ids[54] = 1093678169
	HopeSkill_Ids[55] = 1093678384
	HopeSkill_Ids[56] = 1093678385
	HopeSkill_Ids[57] = 1093678386
	HopeSkill_Ids[58] = 1093678387
	HopeSkill_Ids[59] = 1093678388
	HopeSkill_Ids[60] = 1093678390
	HopeSkill_Ids[61] = 1093678391
	HopeSkill_Ids[62] = 1093678392
	HopeSkill_Ids[63] = 1093678393
	HopeSkill_Ids[64] = 1093678402
	HopeSkill_Ids[65] = 1093678403
	HopeSkill_Ids[66] = 1093678406
	HopeSkill_Ids[67] = 1093678409
	HopeSkill_Ids[68] = 1096036403
	HopeSkill_Ids[69] = 1096430390
	HopeSkill_Ids[70] = 1096036406
	HopeSkill_Ids[71] = 1096036408
	HopeSkill_Ids[72] = 1096036656
	HopeSkill_Ids[73] = 1096036657
	HopeSkill_Ids[74] = 1096036659
	HopeSkill_Ids[75] = 1096036662
	HopeSkill_Count = 76
end

function HopeMonk_Total(u)
	return I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true))
end

function HopeMonk_Reset()
	local i = 1
	for _ in _loop_() do
		if i > 6 then break end
		HopeMonk_Qi[i] = 0
		HopeMonk_LastE[i] = 0
		HopeMonk_LastW[i] = 0
		HopeMonk_LastZ[i] = 0
		i = i + 1
	end
end

function HopeMonk_Ally(u, p)
	return u ~= nil and GetWidgetLife(u) > 0.405 and IsUnitAlly(u, p)
end

function HopeMonk_Heal(u, amount)
	SetUnitState(u, UNIT_STATE_LIFE, RMinBJ(GetUnitState(u, UNIT_STATE_MAX_LIFE), GetWidgetLife(u) + amount))
	DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", u, "origin"))
end

function HopeMonk_Lowest(p)
	local j = 1
	local best = nil
	local ratio = 1.0
	local current = 0.0
	for _ in _loop_() do
		if j > 6 then break end
		if HopeMonk_Ally(udg_hero[j], p) and GetUnitState(udg_hero[j], UNIT_STATE_MAX_LIFE) > 0.0 then
			current = GetWidgetLife(udg_hero[j]) / GetUnitState(udg_hero[j], UNIT_STATE_MAX_LIFE)
			if current < ratio then
				ratio = current
				best = udg_hero[j]
			end
		end
		j = j + 1
	end
	return best
end

function HopeMonk_Cast(u, aid, target)
	local p = GetOwningPlayer(u)
	local i = GetPlayerId(p) + 1
	local token = HopeChallenge_TurnToken() + 1
	local j = 1
	local qi = 0
	local ap = 1
	local mana = 0.0
	local total = HopeMonk_Total(u)
	local amount = 0.0
	local ally = nil
	local g = nil
	if i < 1 or i > 6 or u ~= udg_hero[i] or GetUnitTypeId(u) ~= 1311781191 or GetWidgetLife(u) <= 0.405 or IsUnitPaused(u) or not udg_ZhandouZhong then
		p = nil
		return
	end
	if aid == 1093678393 then
		mana = 3.0
	elseif aid == 1093678403 then
		mana = 2.0
	elseif aid == 1096430390 then
		mana = 3.0
		ap = 2
	elseif aid ~= 1093678392 then
		p = nil
		return
	end
	if (aid == 1093678392 or aid == 1093678393) and (target == nil or not IsUnitInGroup(target, udg_Guaiwu_dwz) or GetWidgetLife(target) <= 0.405 or not IsUnitEnemy(target, p)) then
		DisplayTimedTextToPlayer(p, 0, 0, 3.0, "需要存活的当前敌人。")
		p = nil
		return
	end
	if aid == 1093678393 and (GetUnitAbilityLevel(u, aid) < 1 or HopeMonk_LastE[i] == token) or aid == 1093678403 and HopeMonk_LastW[i] == token or aid == 1096430390 and (not HopeJob_Awakened[i] or HopeJob_UltimateKind[i] ~= 6 or HopeMonk_LastZ[i] == token) then
		DisplayTimedTextToPlayer(p, 0, 0, 3.0, "尚未获得该技能，或本回合已经使用。")
		p = nil
		return
	end
	if udg_xingdong_dian[i] < ap or GetUnitState(u, UNIT_STATE_MANA) < mana then
		DisplayTimedTextToPlayer(p, 0, 0, 3.0, "行动点或魔法不足。")
		p = nil
		return
	end
	qi = HopeMonk_Qi[i]
	udg_xingdong_dian[i] = udg_xingdong_dian[i] - ap
	SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) - mana)
	if aid == 1093678392 then
		HopeMonk_Qi[i] = IMinBJ(3, qi + 1)
		amount = (GetUnitState(u, ConvertUnitState(20)) * 0.8 + total * 0.9) * udg_Skill_Dm[i]
		UnitDamageTarget(u, target, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
	elseif aid == 1093678393 then
		HopeMonk_LastE[i] = token
		HopeMonk_Qi[i] = 0
		ally = HopeMonk_Lowest(p)
		if ally ~= nil then
			HopeMonk_Heal(ally, total * (0.25 + I2R(qi) * 0.15))
		end
		amount = total * (0.8 + I2R(GetUnitAbilityLevel(u, aid)) * 0.4) * (1.0 + I2R(qi) * 0.15) * udg_Skill_Dm[i] * udg_Fashang_Dm[i]
		UnitDamageTarget(u, target, amount, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
	elseif aid == 1093678403 then
		HopeMonk_LastW[i] = token
		HopeMonk_Qi[i] = 0
		amount = total * (0.1 + I2R(qi) * 0.03) + udg_Defend_fangyu[i]
		for _ in _loop_() do
			if j > 6 then break end
			ally = udg_hero[j]
			if HopeMonk_Ally(ally, p) then
				SetUnitState(ally, ConvertUnitState(32), GetUnitState(ally, ConvertUnitState(32)) + amount)
				DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", ally, "origin"))
			end
			j = j + 1
		end
	else
		HopeMonk_LastZ[i] = token
		HopeMonk_Qi[i] = 3
		for _ in _loop_() do
			if j > 6 then break end
			ally = udg_hero[j]
			if HopeMonk_Ally(ally, p) then
				HopeMonk_Heal(ally, total * 0.25)
				SetUnitState(ally, ConvertUnitState(32), GetUnitState(ally, ConvertUnitState(32)) + total * 0.1)
			end
			j = j + 1
		end
		amount = total * 1.1 * udg_Skill_Dm[i] * udg_Fashang_Dm[i]
		g = CreateGroup()
		GroupAddGroup(udg_Guaiwu_dwz, g)
		for _ in _loop_() do
			target = FirstOfGroup(g)
			if target == nil then break end
			GroupRemoveUnit(g, target)
			if GetWidgetLife(target) > 0.405 and IsUnitEnemy(target, p) then
				UnitDamageTarget(u, target, amount, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
			end
		end
		DestroyGroup(g)
	end
	g = nil
	ally = nil
	p = nil
end

function HopeSkill_Original(id, level)
	if id == 1096036403 then
		return "全体存活队友恢复自身生命上限25%+施法者智力×1.5。|n溢出治疗的50%转为护甲，每人最多获得施法者智力×80%护甲。|n每位队友实际恢复2点魔法，不超过上限。|n消耗2行动点、3魔法；战斗中每回合一次。"
	elseif id == 1096430390 then
		return "对当前全体敌人造成三围总和×1.1的法术伤害。|n全体存活队友恢复三围总和×0.25生命，并获得三围总和×0.10护甲。|n自身气补至3层，可继续用渡厄击救助或护心诀护队。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	elseif id == 1096036406 then
		return "选择一名当前敌人，造成（力量+敏捷）×4的物理伤害。|n目标当前生命不高于40%时，伤害提高50%。|n本次击杀目标后返还1行动点，不超过行动点上限。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	elseif id == 1096036408 then
		return "以所选敌人为方向，射出长2000、宽240的贯穿重弩。|n主目标基础物理伤害=攻击力×4+力量×2；射线内其他敌人各受主伤害的70%。|n只打击当前敌人，每个敌人仅命中一次，不命中射线外或身后的敌人。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	elseif id == 1096036656 then
		return "消耗1发现有子弹，对一名当前敌人造成攻击力×5+敏捷×3的物理伤害。|n没有普通狙击的30%落空；不附带群伤。|n已有精确打击时消耗它并乘以精确打击倍率；爆头的必暴效果可正常作用于本次射击。|n空弹时不能施放，请用Q装填。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	elseif id == 1096036657 then
		return "对所选敌人周围450范围内当前敌人造成智力×4的法术伤害，并施加冰封。|n每名被冰封敌人下一次对英雄造成的伤害降低50%，随后解除。|n冰封不叠加，重复施放只刷新；下一场战斗开始清除旧标记。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	elseif id == 1096036659 then
		return "选择中了自己毒矛的当前敌人，立即结算相当于自身1次毒伤基值的伤害。|n基值=当前攻击力×30%×自身毒层数×毒矛等级。|n不消耗毒层，不触发额外叠毒或推进敌方回合；自身恢复生命上限10%。|n消耗2行动点、3魔法；战斗中每回合一次，无自己的毒层不能施放。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	elseif id == 1096036662 then
		return "标记一名当前敌人，其后受到我方英雄的3次有效伤害提高25%。|n每次消耗标记时，造成伤害的玩家获得10金币；同一次伤害只结算一次悬赏。|n标记不能叠层，重复施放刷新至3次；下一场战斗开始清除。|n消耗1行动点、3魔法；战斗中每回合一次。"
	end
	if id == 1093677104 then
		return "基础平砍敌人，保留原版跳字判定。|n基础伤害值：攻击力*1|n普通平砍浮动：90%+敏捷/2（取整） 至 120%+力量；下限不超过上限。|n特殊技能使用各自的浮动区间。|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093677105 then
		return "结束当前回合"
	elseif id == 1093677106 then
		return "防御，增加护甲。没有每回合一次限制，资源足够即可再次使用。|n基础增加护甲：10+额外护甲值；职业效果另计。|n|c00fffc01行动点消耗:1；魔法消耗:1|r"
	elseif id == 1093677124 then
		return "射出一支箭矢攻击敌人|n基础伤害值：攻击力*1.3|n浮动数值65%~110%|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093677125 then
		return "使用盾牌格挡并嘲讽敌人|n增加英雄护甲，并且将敌人的攻击目标变为自己|n增加护甲值：10+额外护甲值*3|n|c00fffc01行动点消耗:1|r|n每回合限定使用1次"
	elseif id == 1093677126 then
		return "发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术"
	elseif id == 1093677129 then
		return "攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）"
	elseif id == 1093677130 then
		return "开枪攻击敌人|n基础伤害值：攻击力*1.2|n浮动数值30%~200%|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093677131 then
		return "冲向敌人使用雷霆一击，对目标周围400范围内所有敌人造成力量*（1+0.5*技能等级）的范围伤害，并且如果敌人行动为攻击则减少其30%的伤害值|n（多个雷霆减伤效果不叠加）|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093677132 then
		return "冰片攻击，对目标区域内的单位造成智力*(2+1*技能等级)的法术伤害|n|c00fffc01行动点消耗:2|r"
	elseif id == 1093677134 then
		return "|c00fffc01注意!该技能需要消耗一瓶血瓶来释放|r|n治疗所有存活队友各自最大生命值的25%|n同时追加英雄智力值的恢复量|n每回合只能释放一次|n|n每学习一次该技能，英雄会获得一瓶药水"
	elseif id == 1093677137 then
		return "对最多3个敌人发动攻击，造成攻击力*（1+技能等级）的魔法伤害|n|c00fffc01行动点消耗:2|r|n每回合只能释放一次"
	elseif id == 1093677144 then
		return "新手法杖主动：智力×1.5×（技能伤害倍率+智力/200）的法术伤害。|n不额外消耗行动点；魔法消耗:2。|n每回合一次，与新手小刀、木盾共享冷却。"
	elseif id == 1093677145 then
		return "恢复最大生命的30%（高级药水为50%）和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。"
	elseif id == 1093677146 then
		return "恢复最大生命的30%（高级药水为50%）和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。"
	elseif id == 1093677360 then
		return "恢复最大生命的30%（高级药水为50%）和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。"
	elseif id == 1093677361 then
		return "恢复最大生命的30%（高级药水为50%）和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。"
	elseif id == 1093677362 then
		return "恢复最大生命的30%（高级药水为50%）和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。"
	elseif id == 1093677363 then
		return "恢复最大生命的30%（高级药水为50%）和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。"
	elseif id == 1093677364 then
		return "对目标敌人造成当前护甲值*5的物理伤害|n|c00fffc01行动点消耗:1|r|n每回合限定使用1次"
	elseif id == 1093677365 then
		return "投掷出一道具有攻击力的闪电，可以对4个敌人造成伤害，伤害值为英雄智力*4|n每回合限用一次"
	elseif id == 1093677379 then
		return "对一直线敌人造成智力*6的法术伤害|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093677380 then
		return "英雄法伤+30% 技能伤害+20%"
	elseif id == 1093677384 then
		return "恢复施法前3+（智力/5）点魔法，最多补满当前魔法上限。|n本回合智力提高30%（取整），不增加魔法上限。|n消耗1行动点、0魔法；每回合一次。|n回合结束移除临时智力，保留已恢复魔法。"
	elseif id == 1093677385 then
		return "丢飞刃攻击敌人造成物理伤害|n基础伤害值：敏捷*4|n每次丢飞刀后伤害减半（可低于1点），回合结束时重置|n每点敏捷增加该伤害1%"
	elseif id == 1093677386 then
		return "增加英雄2点行动值|n同时扣除自身999点护甲|n每回合限用一次|n"
	elseif id == 1093677387 then
		return "向敌人冲锋|n造成力量*4的伤害值|n如果敌人行为是防御或强化攻击则打断其动作并且伤害翻倍|n每回合限用一次|n"
	elseif id == 1093677390 then
		return "增加周围友军单位30%的攻击力。|n持续30秒。|n每回合限用一次"
	elseif id == 1093677391 then
		return "减少目标单位15点的护甲 |n每回合限用一次|n(目标护甲为负时技能无效）"
	elseif id == 1093677394 then
		return "重砍敌人|n基础伤害值：攻击力*1+力量*0.5|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093677395 then
		return "力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	elseif id == 1093677396 then
		return "增加所有友军 0.3*智力值的 防御|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093677616 then
		return "英雄暴击率+15% 暴击伤害+50%"
	elseif id == 1093677617 then
		return "跳跃过去对目标区域内的所有单位造成力量*3.5的物理伤害|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093677651 then
		return "新手小刀主动：以当前攻击上限作为伤害基值。|n不额外消耗行动点；魔法消耗:1。|n每回合一次，与新手法杖、木盾共享冷却。"
	elseif id == 1093677652 then
		return "丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+力量*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093677653 then
		return "投矛命中时，为目标叠加自己来源的2层毒；已有30层或以上时改为1层。|n敌方回合结算：当前攻击力×30%×毒层数×毒矛等级。|n这是结算前基值；最终伤害、暴击和目标减伤按战斗规则另算。|n结算后毒层数减少1；不同玩家的毒独立计算。"
	elseif id == 1093677890 then
		return "万箭齐发，对所有敌人造成 英雄敏捷*1.5的物理伤害|n|c00fffc01行动点消耗:1|r|n每点敏捷增加该伤害1%|n"
	elseif id == 1093677891 then
		return "对敌人释放一次混沌打击，造成物理伤害|n基础伤害值：攻击力*5|n浮动值1%-300% |n(该浮动不会因为力量敏捷专注而改变)|n|c00fffc01行动点消耗:2|r|n每回合限用一次"
	elseif id == 1093677892 then
		return "同时使用剑盾猛攻敌人|n基础伤害值：攻击力*1+防御值*1|n基础浮动50%~150%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n"
	elseif id == 1093677894 then
		return "开枪攻击敌人|n基础伤害值：攻击力*0.8|n浮动数值30%~200%|n|c00fffc01行动点消耗:1|r|n该次攻击可以造成3次伤害"
	elseif id == 1093677898 then
		return "发射圣光球攻击敌人。|n基础伤害值：智力×0.8；对亡灵目标伤害提高25%。|n基础浮动75%~120%，另计敏捷下限、力量上限与精准打击。|n|c00fffc01行动点消耗:1|r|n该攻击属于法术"
	elseif id == 1093677900 then
		return "连续闪烁打击随机敌人，随机攻击4~7次|n每次攻击造成物理伤害|n每次打击伤害值:(攻击力+敏捷)*0.55|n|c00fffc01行动点消耗:2|r|n每回合最多使用一次|n英雄每点敏捷增加该伤害0.5%"
	elseif id == 1093677913 then
		return "消耗所有MP，对敌人造成巨量物理伤害|n基础伤害值：力量*7.5*（1+消耗魔法值/25)|n|c00fffc01行动点消耗:3|r|n每回合限用一次"
	elseif id == 1093677914 then
		return "召唤6颗陨石随机对范围内敌人造成法术伤害|n每颗陨石伤害值：智力*3|n|c00fffc01行动点消耗:2|r|n每回合限用一次"
	elseif id == 1093678133 then
		return "瞬移到敌人身后对其造成物理伤害|n该伤害必定暴击|n基础伤害值：敏捷值*5+攻击力*2|n|c00fffc01行动点消耗：2|r|n每回合限定使用一次|n每点敏捷增加该伤害1%|n"
	elseif id == 1093678147 then
		return "开火攻击敌人|n基础伤害值：299|n浮动数值99%~299%|n|c00fffc01行动点消耗:1|r|n使用后移除该技能|n该技能属于平A 物理伤害"
	elseif id == 1093678153 then
		return "骑兵冲锋，对路径上敌人造成力量*速度*技能等级*0.5的伤害|n使用时骑兵速度会逐渐加快，撞到一个敌人速度-1；同一目标只命中一次|n速度上限为8|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093678155 then
		return "可以发射重型弩箭攻击并穿透敌人|n基础伤害值：攻击力*3.5|n浮动数值100%~150%|n|c00fffc01行动点消耗:2|r"
	elseif id == 1093678160 then
		return "狙击敌人，造成巨量伤害|n基础伤害值：攻击力*3  |n浮动数值125%~200%  （命中率：70%）|n|c00fffc01行动点消耗:1|r|n每次子弹用完后都需要装弹才可以攻击（子弹用完时使用该技能装弹）|n初始子弹数：1"
	elseif id == 1093678162 then
		return "英雄下一次造成伤害必定暴击|n|c00fffc01行动点消耗:1|r|n每回合只能释放一次"
	elseif id == 1093678165 then
		if level == 1 then
			return "发射一发巨大的火球攻击敌人|n对目标敌人造成智力*3倍的伤害，并且对300范围内敌人造成一半伤害|n|c00fffc01行动点消耗:3|r|n造成法术伤害 （该法术可以暴击）|n每回合限用一次"
		elseif level == 2 then
			return "发射一发巨大的火球攻击敌人|n对目标敌人造成智力*4.5倍的伤害，并且对300范围内敌人造成一半伤害|n|c00fffc01行动点消耗:3|r|n造成法术伤害 （该法术可以暴击）|n每回合限用一次"
		elseif level == 3 then
			return "发射一发巨大的火球攻击敌人|n对目标敌人造成智力*6倍的伤害，并且对300范围内敌人造成一半伤害|n|c00fffc01行动点消耗:3|r|n造成法术伤害 （该法术可以暴击）|n每回合限用一次"
		end
		return "发射一发巨大的火球攻击敌人|n对目标敌人造成智力*6倍的伤害，并且对300范围内敌人造成一半伤害|n|c00fffc01行动点消耗:3|r|n造成法术伤害 （该法术可以暴击）|n每回合限用一次"
	elseif id == 1093678167 then
		return "除固定魔法费用外，再消耗最大魔法值的20%打击一名敌人|n2级额外打击1个目标；3级最多额外打击3个目标|n基础伤害：(扣固定费用后当前魔法值×20%+智力)×0.8|n主目标和次目标对亡灵的伤害均提高25%。|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093678168 then
		return "对敌人造成单体造成100%攻击力的伤害|n同时增加英雄10+额外护甲 点护甲值|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093678169 then
		return "对一直线敌人造成125%攻击力的伤害|n|c00fffc01行动点消耗:1|r|n每回合限用一次|n"
	elseif id == 1093678384 then
		return "守望者对周围400码范围的敌人发射出锋利的尖刀进行伤害，每把尖刀造成英雄攻击力*1.5的伤害。|n|c00fffc01行动点消耗:1|r|n每回合限用一次|n以施法者为中心；范围外敌人不会受伤。"
	elseif id == 1093678385 then
		return "增加目标友军单位15%的攻击力|n持续30秒。|n每回合限用1次"
	elseif id == 1093678386 then
		return "增加附近单位的攻击力。"
	elseif id == 1093678387 then
		return "新手木盾主动：增加8+额外防御加成点护甲。|n不额外消耗行动点；魔法消耗:1。|n每回合一次，与新手法杖、小刀共享冷却。"
	elseif id == 1093678388 then
		return "对敌人造成单体造成2次85%攻击力的伤害|n|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093678390 then
		if level == 1 then
			return "蓄力丢出长矛对击中的敌人造成（力量+敏捷）*3的伤害 同时降低目标3点护甲|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
		elseif level == 2 then
			return "蓄力丢出长矛对击中的敌人造成（力量+敏捷）*4的伤害 同时降低目标4点护甲|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
		elseif level == 3 then
			return "蓄力丢出长矛对击中的敌人造成（力量+敏捷）*5的伤害 同时降低目标5点护甲|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
		end
		return "蓄力丢出长矛对击中的敌人造成（力量+敏捷）*5的伤害 同时降低目标5点护甲|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	elseif id == 1093678391 then
		return "丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+敏捷*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093678392 then
		return "三才掌：单体物理伤害基值=攻击力×0.8+三围总和×0.9。|n命中当前敌人获得1气，最多3气；战斗开始清零。|n消耗1行动点、0魔法。三围含装备加成。|n无额外50%翻倍；技能倍率、暴击、最终伤害和减伤按原规则结算。"
	elseif id == 1093678393 then
		return "渡厄击：消耗全部气，打击一名当前敌人并救助队友。|n法术伤害基值=三围总和×(0.8+技能等级×0.4)×(1+气×0.15)。|n治疗生命比例最低的存活队友（可含自己）：三围总和×(0.25+气×0.15)，不超过缺失生命。|n0气也可使用；消耗1行动点、3魔法，每回合一次。"
	elseif id == 1093678402 then
		return "每次战斗胜利恢复英雄20点生命值"
	elseif id == 1093678403 then
		return "护心诀：消耗全部气，为所有存活队友增加护甲。|n每人获得护甲=三围总和×(0.10+气×0.03)+施法者额外护甲。|n0气也可使用；消耗1行动点、2魔法，每回合一次。|n护甲沿用原图吸收伤害与回合清理规则；没有嘲讽。"
	elseif id == 1093678406 then
		return "重砍敌人|n基础伤害值：攻击力*1.2+力量*1|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r"
	elseif id == 1093678409 then
		return "连续打击目标敌人5次|n每次攻击造成物理伤害，同时英雄暴击率+10%，打击结束暴击率加成归0|n每次打击伤害值:(攻击力+敏捷)*0.55|n|c00fffc01行动点消耗:2|r|n每回合最多使用一次|n每点敏捷增加该伤害0.5%"
	end
	return ""
end

function HopeSkill_ManaCost(id, level)
	if id == 1093677104 then
		return 0.0
	elseif id == 1093677105 then
		return 0.0
	elseif id == 1093677106 then
		return 1.0
	elseif id == 1093677124 then
		return 0.0
	elseif id == 1093677125 then
		return 0.0
	elseif id == 1093677126 then
		return 0.0
	elseif id == 1093677129 then
		return 0.0
	elseif id == 1093677130 then
		return 0.0
	elseif id == 1093677131 then
		return 7.0
	elseif id == 1093677132 then
		if level == 1 then
			return 10.0
		elseif level == 2 then
			return 15.0
		elseif level == 3 then
			return 20.0
		end
		return 20.0
	elseif id == 1093677134 then
		if level == 1 then
			return 15.0
		elseif level == 2 then
			return 10.0
		elseif level == 3 then
			return 5.0
		end
		return 5.0
	elseif id == 1093677137 then
		return 5.0
	elseif id == 1093677144 then
		return 2.0
	elseif id == 1093677145 then
		return 0.0
	elseif id == 1093677146 then
		return 0.0
	elseif id == 1093677360 then
		return 0.0
	elseif id == 1093677361 then
		return 0.0
	elseif id == 1093677362 then
		return 0.0
	elseif id == 1093677363 then
		return 0.0
	elseif id == 1093677364 then
		return 0.0
	elseif id == 1093677365 then
		return 5.0
	elseif id == 1093677379 then
		return 10.0
	elseif id == 1093677380 then
		return 0.0
	elseif id == 1093677384 then
		return 0.0
	elseif id == 1093677385 then
		return 3.0
	elseif id == 1093677386 then
		return 1.0
	elseif id == 1093677387 then
		return 5.0
	elseif id == 1093677390 then
		return 5.0
	elseif id == 1093677391 then
		return 5.0
	elseif id == 1093677394 then
		return 0.0
	elseif id == 1093677395 then
		return 0.0
	elseif id == 1093677396 then
		return 3.0
	elseif id == 1093677616 then
		return 0.0
	elseif id == 1093677617 then
		return 10.0
	elseif id == 1093677651 then
		return 1.0
	elseif id == 1093677652 then
		return 0.0
	elseif id == 1093677653 then
		return 0.0
	elseif id == 1093677890 then
		return 5.0
	elseif id == 1093677891 then
		return 8.0
	elseif id == 1093677892 then
		return 0.0
	elseif id == 1093677894 then
		return 0.0
	elseif id == 1093677898 then
		return 0.0
	elseif id == 1093677900 then
		return 10.0
	elseif id == 1093677913 then
		return 5.0
	elseif id == 1093677914 then
		return 10.0
	elseif id == 1093678133 then
		return 3.0
	elseif id == 1093678147 then
		return 0.0
	elseif id == 1093678153 then
		return 5.0
	elseif id == 1093678155 then
		return 0.0
	elseif id == 1093678160 then
		return 0.0
	elseif id == 1093678162 then
		return 10.0
	elseif id == 1093678165 then
		return 0.0
	elseif id == 1093678167 then
		return 10.0
	elseif id == 1093678168 then
		return 2.0
	elseif id == 1093678169 then
		return 5.0
	elseif id == 1093678384 then
		return 5.0
	elseif id == 1093678385 then
		return 5.0
	elseif id == 1093678386 then
		return 0.0
	elseif id == 1093678387 then
		return 1.0
	elseif id == 1093678388 then
		return 2.0
	elseif id == 1093678390 then
		return 5.0
	elseif id == 1093678391 then
		return 0.0
	elseif id == 1093678392 then
		return 0.0
	elseif id == 1093678393 then
		return 0.0
	elseif id == 1093678402 then
		return 0.0
	elseif id == 1093678403 then
		return 0.0
	elseif id == 1093678406 then
		return 0.0
	elseif id == 1093678409 then
		return 10.0
	end
	return 0.0
end

function HopeSkill_Number(v)
	if v == I2R(R2I(v)) then
		return I2S(R2I(v))
	end
	return R2SW(v, 1, 1)
end

function HopeSkill_Range(low, high)
	if RAbsBJ(low - high) < 0.05 then
		return HopeSkill_Number(low)
	end
	return (HopeSkill_Number(low) or "") .. "~" .. (HopeSkill_Number(high) or "")
end

function HopeSkill_Rolled(u, p, base, lower, upper)
	local lo = lower + R2I(I2R(GetHeroAgi(u, true)) / 2.0)
	local hi = upper + GetHeroStr(u, true)
	if lo > hi then
		lo = hi
	end
	if LoadBoolean(YDHT, GetHandleId(u), 149034428) then
		hi = R2I(I2R(hi) * udg_jingque_Daji_jiacheng[p])
		lo = hi
	end
	return HopeSkill_Range(base * I2R(lo) * 0.01 * udg_Zuizhong_Dm[p] * HopeMeta_Out(p - 1, true, false, false), base * I2R(hi) * 0.01 * udg_Zuizhong_Dm[p] * HopeMeta_Out(p - 1, true, false, false))
end

function HopeSkill_IsDamage(id)
	return id == 1093677104 or id == 1093677129 or id == 1093677394 or id == 1093678406 or id == 1093677892 or id == 1093678392 or id == 1093677130 or id == 1093677894 or id == 1093678147 or id == 1093678160 or id == 1093677124 or id == 1093677652 or id == 1093678391 or id == 1093677126 or id == 1093677898 or id == 1093678155 or id == 1093677131 or id == 1093678393 or id == 1093678167 or id == 1093678390 or id == 1093678153 or id == 1093677900 or id == 1093678409 or id == 1093677137 or id == 1093677132 or id == 1093678165 or id == 1093677364 or id == 1093677617 or id == 1093677365 or id == 1093677385 or id == 1093677387 or id == 1093678133 or id == 1093677914 or id == 1093677891 or id == 1093677913 or id == 1093677890 or id == 1093678384 or id == 1093677379 or id == 1093678168 or id == 1093678388 or id == 1093678169 or id == 1093677144 or id == 1093677651
end

function HopeSkill_IsPotion(id)
	return id == 1093677145 or id == 1093677146 or id == 1093677360 or id == 1093677361 or id == 1093677362 or id == 1093677363
end

function HopeSkill_PotionDescription(u)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local percent = "30%"
	if GetUnitAbilityLevel(udg_Yiwu_danwei[p], 1093678137) == 1 then
		percent = "50%"
	end
	-- Inventory is authoritative. Original object text says one bottle forever,
	-- and several original inventory mutations never rewrite that text.
	return "恢复最大生命的" .. (percent or "") .. "和最大魔法的50%。|n消耗1瓶；不消耗行动点与魔法；冷却1秒。|n|cffffd98a剩余药剂：" .. (I2S(udg_Yaoshui_shenyu_cs[p]) or "") .. "瓶|r"
end

function HopeSkill_Preview(u, id, level)
	local p = GetPlayerId(GetOwningPlayer(u)) + 1
	local a = GetUnitState(u, ConvertUnitState(20))
	local s = I2R(GetHeroStr(u, true))
	local d = I2R(GetHeroAgi(u, true))
	local i = I2R(GetHeroInt(u, true))
	local k = udg_Skill_Dm[p]
	local f = udg_Fashang_Dm[p]
	local z = udg_Zuizhong_Dm[p]
	local l = I2R(level)
	local b = 0.0
	local mana = GetUnitState(u, UNIT_STATE_MANA)
	local hp = GetUnitState(u, UNIT_STATE_MAX_LIFE)
	local result = ""
	z = z * HopeMeta_Out(p - 1, true, false, false)
	if id == 1096036403 then
		return "每人恢复：自身生命上限25% + " .. (HopeSkill_Number(i * 1.5) or "") .. "；回蓝2|n溢疗护甲上限 " .. (HopeSkill_Number(i * 0.8) or "")
	elseif id == 1096036406 then
		return "普通目标 " .. (HopeSkill_Number((s + d) * 4.0 * k * z) or "") .. "；低血目标 " .. (HopeSkill_Number((s + d) * 6.0 * k * z) or "") .. "|n击杀后返还1行动点"
	elseif id == 1096036408 then
		return "主目标 " .. (HopeSkill_Number((a * 4.0 + s * 2.0) * k * z) or "") .. "；贯穿副目标 " .. (HopeSkill_Number((a * 4.0 + s * 2.0) * 0.7 * k * z) or "") .. "|n长2000，宽240；只命中射线内敌人"
	elseif id == 1096036656 then
		b = (a * 5.0 + d * 3.0) * k * z
		if LoadBoolean(YDHT, GetHandleId(u), 149034428) then
			b = b * udg_jingque_Daji_jiacheng[p]
		end
		if LoadInteger(YDHT, GetHandleId(u), -299321171) > 0 then
			b = b * udg_Baoji_Damage[p]
			return "必暴重狙 " .. (HopeSkill_Number(b) or "") .. "；剩余 " .. (I2S(LoadInteger(YDHT, GetHandleId(u), 812780749)) or "") .. " 发|n消耗1发；空弹需Q装填，伤害不随机落空"
		end
		return "单体重狙 " .. (HopeSkill_Number(b) or "") .. "；剩余 " .. (I2S(LoadInteger(YDHT, GetHandleId(u), 812780749)) or "") .. " 发|n消耗1发；可配合爆头，伤害不随机落空"
	elseif id == 1096036657 then
		return "区域每目标 " .. (HopeSkill_Number(i * 4.0 * k * f * z) or "") .. "；范围450|n敌人下一次对英雄伤害 -50%"
	elseif id == 1096036659 then
		return "每层自身毒基值 " .. (HopeSkill_Number(a * 0.3 * I2R(GetUnitAbilityLevel(u, 1093677653)) * k * z) or "") .. "|n施放时乘以目标自己的毒层；自身恢复 " .. (HopeSkill_Number(hp * 0.1) or "")
	elseif id == 1096036662 then
		return "全队接下来的3次命中 +25%伤害|n每次命中玩家获得10金币；1行动点、3魔法"
	elseif id == 1096430390 then
		return "敌人各受 " .. (HopeSkill_Number((s + d + i) * 1.1 * k * f * z) or "") .. " 法术伤害|n队友各回复 " .. (HopeSkill_Number((s + d + i) * 0.25) or "") .. "、护甲 +" .. (HopeSkill_Number((s + d + i) * 0.1) or "") .. "；气补至3"
	end
	if id == 1093677104 then
		b = a
		if GetUnitAbilityLevel(u, 1093678153) > 0 then
			b = b * (1.0 + 0.2 * I2R(LoadInteger(YDHT, GetHandleId(u), -1800422954)))
		end
		return "本次伤害 " .. (HopeSkill_Rolled(u, p, HopeThird_Base(u, id, b, false), 90, 120) or "")
	elseif id == 1093677129 then
		b = a
		if GetUnitAbilityLevel(u, 1093678153) > 0 then
			b = b * (1.0 + 0.2 * I2R(LoadInteger(YDHT, GetHandleId(u), -1800422954)))
		end
		result = "主段 " .. (HopeSkill_Rolled(u, p, b, 90, 120) or "")
		if mana > 0.8 then
			return (result or "") .. "；追加 " .. (HopeSkill_Number(d * (1.0 + 0.2 * I2R(GetUnitAbilityLevel(u, 1093677136))) * z) or "") .. "（耗1蓝）"
		end
		return (result or "") .. "；缺蓝，无追加段"
	elseif id == 1093677394 or id == 1093678406 then
		b = (a + 0.5 * s) * (1.0 + 0.15 * I2R(GetUnitAbilityLevel(u, 1093677901)))
		if id == 1093678406 then
			b = (1.2 * a + s) * (1.0 + 0.15 * I2R(GetUnitAbilityLevel(u, 1093677901)))
		end
		if GetUnitAbilityLevel(u, 1093677901) > 1 and udg_Zhongkan_cs[p] >= 14 then
			return "本次伤害 " .. (HopeSkill_Rolled(u, p, HopeThird_Base(u, id, b, false), 50, 151) or "") .. "；本次修炼力量 +1"
		end
		return "本次伤害 " .. (HopeSkill_Rolled(u, p, HopeThird_Base(u, id, b, false), 50, 150) or "")
	elseif id == 1093677892 then
		return "本次伤害 " .. (HopeSkill_Rolled(u, p, HopeThird_Base(u, id, a + GetUnitState(u, ConvertUnitState(32)), false), 50, 150) or "")
	elseif id == 1093678392 then
		return "伤害基值 " .. (HopeSkill_Number(a * 0.8 + (s + d + i) * 0.9) or "") .. "；当前气 " .. (I2S(HopeMonk_Qi[p]) or "") .. "/3"
	elseif id == 1093677130 then
		return "本次伤害 " .. (HopeSkill_Rolled(u, p, 1.2 * a, 30, 200) or "")
	elseif id == 1093677894 then
		return "每段 " .. (HopeSkill_Rolled(u, p, 0.8 * a, 30, 200) or "") .. " ×3段"
	elseif id == 1093678147 then
		return "本次伤害 " .. (HopeSkill_Rolled(u, p, 299.0, 99, 299) or "")
	elseif id == 1093678160 then
		if LoadInteger(YDHT, GetHandleId(u), 812780749) <= 0 then
			return "本次装填，不造成伤害；装满 " .. (I2S(GetUnitAbilityLevel(u, 1093678161) + 1) or "") .. " 发"
		end
		return "命中伤害 " .. (HopeSkill_Rolled(u, p, 3.0 * a, 125, 200) or "") .. "|n剩余 " .. (I2S(LoadInteger(YDHT, GetHandleId(u), 812780749)) or "") .. " 发；非专注时30%落空"
	elseif id == 1093677124 then
		return "命中参考 " .. (HopeSkill_Rolled(u, p, 1.3 * a, 65 + 10 * GetUnitAbilityLevel(u, 1093677135), 110 + 10 * GetUnitAbilityLevel(u, 1093677135)) or "") .. "|n另有伤害骰1~3（自身倍率前）"
	elseif id == 1093678155 then
		return "贯穿每目标 " .. (HopeSkill_Rolled(u, p, 3.5 * a, 100 + 7 * GetUnitAbilityLevel(u, 1093677135), 150 + 7 * GetUnitAbilityLevel(u, 1093677135)) or "")
	elseif id == 1093677652 or id == 1093678391 then
		b = 0.8 * (a + s)
		if id == 1093678391 then
			b = 0.8 * (a + d)
		end
		return "命中参考 " .. (HopeSkill_Rolled(u, p, b, 80, 100) or "") .. "|n另有伤害骰1~3（自身倍率前）"
	elseif id == 1093677126 then
		return "本次伤害 " .. (HopeSkill_Rolled(u, p, (0.5 * a + i) * (1.0 + 0.1 * I2R(GetUnitAbilityLevel(u, 1093678166))) * f, 75, 120) or "")
	elseif id == 1093677898 then
		return "一般目标 " .. (HopeSkill_Rolled(u, p, HopePriest_BaseDamage(i) * f, 75, 120) or "") .. "；亡灵 " .. (HopeSkill_Rolled(u, p, HopePriest_BaseDamage(i) * 1.25 * f, 75, 120) or "")
	elseif id == 1093677131 then
		return "范围每目标 " .. (HopeSkill_Number(s * (1.0 + 0.5 * l) * k * z) or "")
	elseif id == 1093678393 then
		return "法术基值 " .. (HopeSkill_Number((s + d + i) * (0.8 + I2R(level) * 0.4) * (1.0 + I2R(HopeMonk_Qi[p]) * 0.15)) or "") .. "；治疗 " .. (HopeSkill_Number((s + d + i) * (0.25 + I2R(HopeMonk_Qi[p]) * 0.15)) or "") .. "|n当前气 " .. (I2S(HopeMonk_Qi[p]) or "") .. "/3；消耗1行动点、3魔法"
	elseif id == 1093678167 then
		b = HopePriest_BaseDamage(0.2 * RMaxBJ(0.0, mana - HopeSkill_ManaCost(id, level)) + i) * k * f * z
		result = "主目标 " .. (HopeSkill_Number(b) or "") .. "；亡灵 " .. (HopeSkill_Number(b * 1.25) or "")
		if level == 2 then
			return (result or "") .. "|n另1目标 " .. (HopeSkill_Number(b) or "") .. "；亡灵 " .. (HopeSkill_Number(b * 1.25) or "")
		elseif level == 3 then
			return (result or "") .. "|n最多3个次目标各 " .. (HopeSkill_Number(b) or "") .. "；亡灵 " .. (HopeSkill_Number(b * 1.25) or "")
		end
		return result
	elseif id == 1093677137 then
		return "每目标 " .. (HopeSkill_Number(a * (1.0 + l) * k * f * z) or "") .. "；最多3个目标"
	elseif id == 1093678390 then
		return "伤害 " .. (HopeSkill_Number((s + d) * (2.0 + l) * k * z) or "") .. "；命中后护甲 -" .. (I2S(2 + level) or "")
	elseif id == 1093678165 then
		b = i * (1.5 + 1.5 * l) * k * f * z
		return "无火种主目标 " .. (HopeSkill_Number(b) or "") .. "；周围每目标 " .. (HopeSkill_Number(b * 0.5) or "") .. "|n觉醒后额外火种伤害按目标自己的层数结算"
	elseif id == 1093678153 then
		b = s * 0.5 * l * k * z
		return "速度1时 " .. (HopeSkill_Number(b) or "") .. "；速度8时 " .. (HopeSkill_Number(b * 8.0) or "") .. "|n按碰撞时速度结算；同一目标一次"
	elseif id == 1093677132 then
		b = i * (2.0 + l) * k * f * z
		if GetUnitAbilityLevel(u, 1093677895) > 0 then
			b = b * (1.0 + 0.2 * I2R(GetUnitAbilityLevel(u, 1093677380)))
		end
		return "范围每目标 " .. (HopeSkill_Number(b) or "")
	elseif id == 1093677106 or id == 1093677125 or id == 1093678403 or id == 1093678387 then
		b = 10.0 + udg_Defend_fangyu[p]
		if id == 1093677125 then
			b = 10.0 + 3.0 * udg_Defend_fangyu[p]
		elseif id == 1093678403 then
			return "全队各获护甲 " .. (HopeSkill_Number((s + d + i) * (0.1 + I2R(HopeMonk_Qi[p]) * 0.03) + udg_Defend_fangyu[p]) or "") .. "；当前气 " .. (I2S(HopeMonk_Qi[p]) or "") .. "/3|n消耗1行动点、2魔法，每回合一次"
		elseif id == 1093678387 then
			b = 8.0 + udg_Defend_fangyu[p]
		end
		return "本次护甲 +" .. (HopeSkill_Number(b) or "") .. "；施放后 " .. (HopeSkill_Number(GetUnitState(u, ConvertUnitState(32)) + b) or "")
	elseif id == 1093677396 then
		return "每名存活队员护甲 +" .. (HopeSkill_Number(i * 0.3) or "")
	elseif id == 1093677900 or id == 1093678409 then
		b = 0.55 * (a + d) * k * (1.0 + d / 200.0) * z
		if id == 1093678409 then
			return "每段 " .. (HopeSkill_Number(b) or "") .. " ×5段；各段额外暴击率10~50%"
		end
		return "每段 " .. (HopeSkill_Number(b) or "") .. "；随机4~7段，随机选择敌人"
	elseif id == 1093677364 then
		return "本次伤害 " .. (HopeSkill_Number(GetUnitState(u, ConvertUnitState(32)) * 5.0 * k * z) or "")
	elseif id == 1093677365 then
		return "每目标 " .. (HopeSkill_Number(i * 4.0 * k * f * z) or "") .. "；最多4个目标"
	elseif id == 1093677385 then
		return "下一枚 " .. (HopeSkill_Number(d * 4.0 / Pow(2.0, I2R(LoadInteger(YDHT, GetHandleId(u), 342818117))) * k * (1.0 + d / 100.0) * z) or "") .. "；本回合每次减半"
	elseif id == 1093677387 then
		return "一般目标 " .. (HopeSkill_Number(s * 4.0 * k * z) or "") .. "；打断防御/加攻 " .. (HopeSkill_Number(s * 8.0 * k * z) or "")
	elseif id == 1093678133 then
		return "暴击前 " .. (HopeSkill_Number((5.0 * d + 2.0 * a) * k * (1.0 + d / 100.0) * z) or "") .. "；必暴后 " .. (HopeSkill_Number((5.0 * d + 2.0 * a) * k * (1.0 + d / 100.0) * z * udg_Baoji_Damage[p]) or "")
	elseif id == 1093677617 then
		return "范围每目标 " .. (HopeSkill_Number(s * 3.5 * k * z) or "")
	elseif id == 1093677890 then
		return "箭体每目标 " .. (HopeSkill_Number(d * 1.5 * k * (1.0 + d / 100.0) * z) or "") .. "；额外箭矢由原生弹幕结算"
	elseif id == 1093677379 then
		return "光束每目标 " .. (HopeSkill_Number(i * 6.0 * k * f * z) or "")
	elseif id == 1093677914 then
		return "每颗命中 " .. (HopeSkill_Number(i * 3.0 * k * z) or "") .. "；6颗随机落点，可能落空"
	elseif id == 1093677891 then
		return "本次伤害 " .. (HopeSkill_Range(a * 5.0 * k * z * 0.01, a * 5.0 * k * z * 3.0) or "") .. "；不受专注改变浮动"
	elseif id == 1093677913 then
		return "按当前剩余魔法预估 " .. (HopeSkill_Number(s * 7.5 * (1.0 + RMaxBJ(0.0, mana - HopeSkill_ManaCost(id, level)) * 0.04) * k * z) or "") .. "|n命中时重新读取魔法；施放后耗尽"
	elseif id == 1093678168 then
		return "伤害 " .. (HopeSkill_Number(a * k * z) or "") .. "；护甲 +" .. (HopeSkill_Number(10.0 + udg_Defend_fangyu[p]) or "")
	elseif id == 1093678388 then
		return "每段 " .. (HopeSkill_Number(a * 0.85 * k * z) or "") .. " ×2段"
	elseif id == 1093678169 then
		return "波形基础 " .. (HopeSkill_Number(a * 1.25 * z) or "") .. "；命中由原生波形判定"
	elseif id == 1093678384 then
		return "范围每目标 " .. (HopeSkill_Number(a * 1.5 * k * z) or "")
	elseif id == 1093677144 then
		return "本次伤害 " .. (HopeSkill_Number(i * 1.5 * (k + i / 200.0) * z) or "")
	elseif id == 1093677651 then
		return "本次伤害 " .. (HopeSkill_Number(GetUnitState(u, ConvertUnitState(21)) * z) or "")
	elseif id == 1093677395 then
		return "本次力量 +" .. (I2S(R2I(s / 5.0) * level) or "") .. "（15秒）；护甲 -10"
	elseif id == 1093677384 then
		return "本次回蓝 " .. (HopeSkill_Number(RMinBJ(RMaxBJ(0.0, GetUnitState(u, UNIT_STATE_MAX_MANA) - mana), 3.0 + i / 5.0)) or "") .. "；临时智力 +" .. (I2S(R2I(i * 0.3)) or "") .. "；行动点 -1；魔法上限不变"
	elseif id == 1093677386 then
		return "行动点 +2；护甲 -999；不直接造成伤害"
	elseif id == 1093677391 then
		return "目标护甲非负时 -15；不直接造成伤害"
	elseif id == 1093678162 then
		return "下一次混乱类型伤害必暴；当前暴伤 " .. (HopeSkill_Number(udg_Baoji_Damage[p] * 100.0) or "") .. "%"
	elseif id == 1093677134 then
		if udg_Yaoshui_shenyu_cs[p] <= 0 then
			return "剩余药剂 " .. (I2S(udg_Yaoshui_shenyu_cs[p]) or "") .. " 瓶；药剂不足，当前无法治疗"
		end
		return "自身治疗上限 " .. (HopeSkill_Number(hp * 0.25 + i) or "") .. "；每名队友为其生命上限25% +" .. (HopeSkill_Number(i) or "") .. "|n剩余药剂 " .. (I2S(udg_Yaoshui_shenyu_cs[p]) or "") .. " 瓶；实际不超过缺失生命"
	elseif HopeSkill_IsPotion(id) then
		if udg_Yaoshui_shenyu_cs[p] <= 0 then
			return "药剂不足，当前无法恢复生命或魔法"
		end
		b = 0.3
		if GetUnitAbilityLevel(udg_Yiwu_danwei[p], 1093678137) == 1 then
			b = 0.5
		end
		return "当前可恢复生命 " .. (HopeSkill_Number(RMaxBJ(0.0, RMinBJ(hp - GetWidgetLife(u), hp * b))) or "") .. " / 魔法 " .. (HopeSkill_Number(RMaxBJ(0.0, RMinBJ(GetUnitState(u, UNIT_STATE_MAX_MANA) - mana, GetUnitState(u, UNIT_STATE_MAX_MANA) * 0.5))) or "")
	elseif id == 1093677390 then
		return "原生加攻30%，持续30秒；按自身当前攻击折算 +" .. (HopeSkill_Number(a * 0.3) or "") .. "|n实际加成由目标原生攻击与增益叠加规则决定"
	elseif id == 1093678385 then
		return "原生加攻15%，持续30秒；按自身当前攻击折算 +" .. (HopeSkill_Number(a * 0.15) or "") .. "|n实际加成由目标原生攻击与增益叠加规则决定"
	elseif id == 1093678386 then
		return "900范围原生攻击光环10%；按自身当前攻击折算 +" .. (HopeSkill_Number(a * 0.1) or "")
	elseif id == 1093678402 then
		return "每场胜利恢复20生命；不超过缺失生命"
	elseif id == 1093677616 then
		return "装备后暴击率 +15%，暴伤 +50%；当前 " .. (I2S(udg_Baoji_Lv[p]) or "") .. "% / " .. (HopeSkill_Number(udg_Baoji_Damage[p] * 100.0) or "") .. "%"
	elseif id == 1093677380 then
		return "装备后法术 +30%，技能 +20%；当前倍率 " .. (HopeSkill_Number(f * 100.0) or "") .. "% / " .. (HopeSkill_Number(k * 100.0) or "") .. "%"
	elseif id == 1093677653 then
		return "每层每个敌方回合的毒伤基值 " .. (HopeSkill_Number(a * 0.3 * l) or "") .. "；各来源独立结算，未计最终倍率与目标减伤"
	elseif id == 1093677105 then
		return "结束后护甲 +" .. (HopeSkill_Number(udg_Defend_HUIHE[p]) or "") .. "；交出剩余 " .. (I2S(udg_xingdong_dian[p]) or "") .. " 行动点"
	end
	return ""
end

function HopeSkill_Key(id, level)
	-- All supported rawcodes are A000..A05Z, levels 1..10: exact, no hash collision.
	return (id - 1093677104) * 32 + level
end

function HopeSkill_Invalidate(u, id, currentHandle)
	local level = 1
	local key = 0
	for _ in _loop_() do
		if level > 10 then break end
		key = HopeSkill_Key(id, level)
		RemoveSavedString(HopeSkill_Rendered, GetHandleId(u), key)
		-- Preserve a freshly supplied original description for the NEW ability.
		if LoadInteger(HopeSkill_Base, GetHandleId(u), key) ~= currentHandle then
			RemoveSavedString(HopeSkill_Base, GetHandleId(u), key)
			RemoveSavedInteger(HopeSkill_Base, GetHandleId(u), key)
		end
		level = level + 1
	end
end

function HopeSkill_RefreshOne(u, id, a)
	local level = GetUnitAbilityLevel(u, id)
	local h = GetHandleId(u)
	local key = HopeSkill_Key(id, level)
	local base = ""
	local preview = ""
	local rendered = ""
	if level <= 0 or a == nil then
		return
	end
	preview = HopeSkill_Preview(u, id, level)
	if preview == "" then
		return
	end
	base = HopeSkill_Original(id, level)
	if HopeSkill_IsPotion(id) then
		base = HopeSkill_PotionDescription(u)
	elseif id ~= 1093677653 and id ~= 1093677900 and id ~= 1093678409 and HaveSavedString(HopeSkill_Base, h, key) then
		base = LoadStr(HopeSkill_Base, h, key)
	end
	rendered = (base or "") .. "|r|n|n|cffffd98a当前预估|r|n" .. (preview or "")
	if HopeSkill_IsDamage(id) then
		rendered = (rendered or "") .. "|n局外猎王仅对BOSS、会心训练仅对暴击生效；此预估为普通目标非暴击。"
		if id == 1093678133 then
			rendered = (rendered or "") .. "|n|cffbbbbbb已计自身加成；仅必暴后计入暴击。目标减伤与追击另算。|r"
		else
			rendered = (rendered or "") .. "|n|cffbbbbbb已计自身加成；非暴击、目标减伤前。额外追击另算。|r"
		end
	end
	if LoadStr(HopeSkill_Rendered, h, key) ~= rendered then
		if EXSetAbilityDataString(a, level, 218, rendered) then
			SaveStr(HopeSkill_Rendered, h, key, rendered)
		end
	end
end

function HopeSkill_Refresh()
	local p = 1
	local index = 0
	local slot = 0
	local level = 0
	local abilityHandleId = 0
	local u = nil
	local a = nil
	if HopeSkill_Base == nil or HopeSkill_Rendered == nil then
		return
	end
	-- This entry point MUST be called synchronously, before any local UI gates.
	-- Acquire handles in identical order on all clients, including foreign heroes.
	for _ in _loop_() do
		if p > 6 then break end
		u = udg_hero[p]
		if HopeSkill_LastHero[p] ~= u then
			if HopeSkill_LastHero[p] ~= nil then
				FlushChildHashtable(HopeSkill_Base, GetHandleId(HopeSkill_LastHero[p]))
				FlushChildHashtable(HopeSkill_Rendered, GetHandleId(HopeSkill_LastHero[p]))
			end
			HopeSkill_LastHero[p] = u
			index = 0
			for _ in _loop_() do
				if index >= HopeSkill_Count then break end
				HopeSkill_LastHandle[p * 80 + index] = 0
				HopeSkill_LastLevel[p * 80 + index] = 0
				index = index + 1
			end
		end
		if u ~= nil and GetUnitTypeId(u) ~= 0 then
			index = 0
			for _ in _loop_() do
				if index >= HopeSkill_Count then break end
				slot = p * 80 + index
				level = GetUnitAbilityLevel(u, HopeSkill_Ids[index])
				abilityHandleId = 0
				a = nil
				if level > 0 then
					a = EXGetUnitAbility(u, HopeSkill_Ids[index])
					abilityHandleId = GetHandleId(a)
				end
				if HopeSkill_LastHandle[slot] ~= abilityHandleId or HopeSkill_LastLevel[slot] ~= level then
					HopeSkill_Invalidate(u, HopeSkill_Ids[index], abilityHandleId)
					HopeSkill_LastHandle[slot] = abilityHandleId
					HopeSkill_LastLevel[slot] = level
				end
				if a ~= nil then
					if GetOwningPlayer(u) == GetLocalPlayer() then
						HopeSkill_RefreshOne(u, HopeSkill_Ids[index], a)
					end
				end
				index = index + 1
			end
		end
		p = p + 1
	end
	a = nil
	u = nil
end

function HopeSkill_Init()
	-- Called on every client before any original initialization action.
	HopeSkill_Base = InitHashtable()
	HopeSkill_Rendered = InitHashtable()
	HopeSkill_InitIds()
end

function HopeStatus_Init()
	if HopeStatus_History == nil then
		HopeStatus_History = InitHashtable()
	end
end

function HopeStatus_ClearHistory(u)
	if HopeStatus_History ~= nil and u ~= nil then
		FlushChildHashtable(HopeStatus_History, GetHandleId(u))
	end
end

function HopeStatus_RecordPoison(u, amount)
	if HopeStatus_History ~= nil and u ~= nil and GetUnitTypeId(u) ~= 0 and IsUnitAliveBJ(u) then
		SaveReal(HopeStatus_History, GetHandleId(u), 1, RMaxBJ(0.0, amount))
		SaveInteger(HopeStatus_History, GetHandleId(u), 2, udg_huihe_s)
	end
end

function HopeStatus_Number(value)
	local magnitude = RAbsBJ(value)
	-- Avoid real literals whose integer part exceeds signed-32-bit validation.
	-- Build this unit from safe real operands; never write a trillion literal.
	local trillion = 100000000.0 * 10000.0
	if magnitude >= trillion then
		return (R2SW(value / trillion, 1, 1) or "") .. "万亿"
	elseif magnitude >= 100000000.0 then
		return (R2SW(value / 100000000.0, 1, 1) or "") .. "亿"
	elseif magnitude >= 10000.0 then
		return (R2SW(value / 10000.0, 1, 1) or "") .. "万"
	elseif value == I2R(R2I(value)) then
		return I2S(R2I(value))
	elseif magnitude < 0.001 then
		if value > 0.0 then
			return "<0.001"
		end
		return ">-0.001"
	elseif magnitude < 0.01 then
		return R2SW(value, 1, 3)
	elseif magnitude < 0.1 then
		return R2SW(value, 1, 2)
	end
	return R2SW(value, 1, 1)
end

function HopeStatus_PoisonLastLine(u)
	if HopeStatus_History == nil or u == nil then
		return ""
	end
	if not HaveSavedReal(HopeStatus_History, GetHandleId(u), 1) then
		return ""
	end
	return "上次毒结算净扣血 " .. (HopeStatus_Number(LoadReal(HopeStatus_History, GetHandleId(u), 1)) or "")
end

function HopeStatus_PoisonKey(playerIndex)
	if playerIndex == 0 then
		return -374736685
	elseif playerIndex == 1 then
		return 806467174
	elseif playerIndex == 2 then
		return 370822118
	elseif playerIndex == 3 then
		return 67668322
	elseif playerIndex == 4 then
		return -1058892367
	elseif playerIndex == 5 then
		return 1622058564
	end
	return 0
end

function HopeStatus_PoisonCount(u, playerIndex)
	local count = 0
	if u == nil or playerIndex < 0 or playerIndex >= 6 then
		return 0
	end
	if GetUnitTypeId(u) == 0 or not IsUnitAliveBJ(u) then
		return 0
	end
	count = LoadInteger(YDHT, GetHandleId(u), HopeStatus_PoisonKey(playerIndex))
	if count < 0 then
		return 0
	end
	return count
end

function HopeStatus_PoisonTotal(u)
	local i = 0
	local total = 0
	for _ in _loop_() do
		if i >= 6 then break end
		total = total + HopeStatus_PoisonCount(u, i)
		i = i + 1
	end
	return total
end

function HopeStatus_PoisonSourceBase(u, playerIndex)
	local count = HopeStatus_PoisonCount(u, playerIndex)
	local amount = 0.0
	local source = nil
	if count <= 0 then
		return 0.0
	end
	source = udg_hero[playerIndex + 1]
	if source ~= nil then
		amount = I2R(count) * GetUnitState(source, ConvertUnitState(20)) * 0.3 * I2R(GetUnitAbilityLevel(source, 1093677653))
	end
	source = nil
	if amount <= 0.0 then
		return 0.0
	end
	return amount
end

function HopeStatus_PoisonBase(u)
	local i = 0
	local amount = 0.0
	for _ in _loop_() do
		if i >= 6 then break end
		amount = amount + HopeStatus_PoisonSourceBase(u, i)
		i = i + 1
	end
	return amount
end

function HopeStatus_PoisonSourceReference(u, playerIndex, upper)
	local normal = HopeStatus_PoisonSourceBase(u, playerIndex)
	local critical = 0.0
	local chance = 0
	if normal <= 0.0 then
		return 0.0
	end
	normal = RMaxBJ(0.0, normal * udg_Zuizhong_Dm[playerIndex + 1] * (1.0 - LoadReal(YDHT, GetHandleId(u), 877254238)))
	chance = udg_Baoji_Lv[playerIndex + 1]
	critical = RMaxBJ(0.0, normal * udg_Baoji_Damage[playerIndex + 1] * HopeMeta_Out(playerIndex, false, HopeCoop_IsBoss(u), true))
	normal = normal * HopeMeta_Out(playerIndex, false, HopeCoop_IsBoss(u), false)
	if chance <= 0 then
		return normal
	elseif chance >= 100 then
		return critical
	elseif upper then
		return RMaxBJ(normal, critical)
	end
	return RMinBJ(normal, critical)
end

function HopeStatus_PoisonReference(u, upper)
	local i = 0
	local amount = 0.0
	for _ in _loop_() do
		if i >= 6 then break end
		amount = amount + HopeStatus_PoisonSourceReference(u, i, upper)
		i = i + 1
	end
	return amount
end

function HopeStatus_PoisonRange(u, compact)
	local low = HopeStatus_PoisonReference(u, false)
	local high = HopeStatus_PoisonReference(u, true)
	local left = ""
	local right = ""
	left = HopeStatus_Number(low)
	right = HopeStatus_Number(high)
	if left == right then
		return left
	end
	-- KK fonts may omit the en dash and join both values.
	return (left or "") .. " 至 " .. (right or "")
end

function HopeStatus_PoisonPreviewLine(u)
	if HopeStatus_PoisonTotal(u) <= 0 then
		return ""
	end
	return "本轮毒伤参考 " .. (HopeStatus_PoisonRange(u, false) or "")
end

function HopeStatus_PoisonBaseText(u)
	if HopeStatus_PoisonTotal(u) <= 0 then
		return ""
	end
	return "原始毒伤基值 " .. (HopeStatus_Number(HopeStatus_PoisonBase(u)) or "")
end

function HopeStatus_PoisonCaveat()
	return "已计增伤/魔抗/暴击|n护甲、免疫与追击另计"
end

function HopeStatus_PoisonDetails(u, p)
	local total = HopeStatus_PoisonTotal(u)
	local own = HopeStatus_PoisonCount(u, GetPlayerId(p))
	if total <= 0 then
		return ""
	end
	return "|cff8be28b中毒合计 " .. (I2S(total) or "") .. " 层|r · 你的 " .. (I2S(own) or "") .. " 层"
end

function HopeTurn_CanEnd(p)
	local i = GetPlayerId(p) + 1
	local u = udg_hero[i]
	local result = false
	if i >= 1 and i <= 6 and u ~= nil and HopeMini_Actor[i] == nil and udg_ZhandouZhong then
		result = GetOwningPlayer(u) == p and IsUnitAliveBJ(u) and not IsUnitPaused(u) and IsPlayerInForce(p, udg_WJZ_______weizhunbei) and RectContainsUnit(gg_rct______________000, u) and GetUnitAbilityLevel(u, 1093677105) > 0
	end
	u = nil
	return result
end

function HopeTurn_EndClick()
	local p = DzGetTriggerUIEventPlayer()
	if HopeTurn_CanEnd(p) then
		if not IssueImmediateOrder(udg_hero[GetPlayerId(p) + 1], "stasistrap") then
			DisplayTextToPlayer(p, 0, 0, "暂时无法结束回合，请等当前动作完成后再试，或选中英雄按 G。")
		end
	end
	p = nil
end

function HopeTurn_Waiting()
	local i = 0
	local count = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING and IsPlayerInForce(Player(i), udg_WJZ_______weizhunbei) and IsUnitAliveBJ(udg_hero[i + 1]) and not IsUnitPaused(udg_hero[i + 1]) then
			count = count + 1
		end
		i = i + 1
	end
	return count
end

function HopeReclass_PotionLearn(u)
	local i = GetPlayerId(GetOwningPlayer(u)) + 1
	local rank = GetUnitAbilityLevel(u, 1093677134)
	if i >= 1 and i <= 6 and rank > HopeReclass_PotionRank[i] then
		udg_Yaoshui_shenyu_cs[i] = udg_Yaoshui_shenyu_cs[i] + 1
		HopeReclass_PotionRank[i] = rank
	end
end

function HopeTurn_UpdateUI()
	local p = GetLocalPlayer()
	local i = GetPlayerId(p) + 1
	local j = 0
	local partySize = 0
	local unfinished = 0
	local canEnd = HopeTurn_CanEnd(p)
	local text = ""
	DzFrameShow(HopeTurn_Panel, udg_hero[i] ~= nil and udg_ZhandouZhong and HopeMini_Actor[i] == nil)
	if not udg_ZhandouZhong or HopeMini_Actor[i] ~= nil then
		HopeTurn_IdleTicks = 0
		HopeTurn_Reminded = false
	elseif canEnd then
		for _ in _loop_() do
			if j >= 6 then break end
			if HopeRoute_Active(j) then
				partySize = partySize + 1
				-- Paused teammates are still finishing an action, not already done.
				if IsPlayerInForce(Player(j), udg_WJZ_______weizhunbei) and IsUnitAliveBJ(udg_hero[j + 1]) then
					unfinished = unfinished + 1
				end
			end
			j = j + 1
		end
		if udg_xingdong_dian[i] <= 0 then
			text = "|cffffd060行动点已用完|n请结束回合|r"
		elseif partySize > 1 and unfinished == 1 then
			text = "|cffffd060队友已完成，等待你|n剩余 " .. (I2S(udg_xingdong_dian[i]) or "") .. " 行动点|r"
		else
			text = "|cff80ef90己方第 " .. (I2S(udg_huihe_s) or "") .. " 回合|n剩余 " .. (I2S(udg_xingdong_dian[i]) or "") .. " 行动点|r"
		end
		if HopeTurn_LastRound ~= udg_huihe_s or HopeTurn_LastAP ~= udg_xingdong_dian[i] then
			HopeTurn_IdleTicks = 0
			if HopeTurn_LastRound ~= udg_huihe_s then
				HopeTurn_Reminded = false
			end
		end
		if GetUnitCurrentOrder(udg_hero[i]) == 0 then
			HopeTurn_IdleTicks = HopeTurn_IdleTicks + 1
		else
			HopeTurn_IdleTicks = 0
		end
		if HopeTurn_IdleTicks >= 100 and not HopeTurn_Reminded then
			DisplayTimedTextToPlayer(p, 0, 0, 6.0, "|cffffd060你的回合尚未结束。操作完成后，点击结束回合，或选中英雄按 G。|r")
			HopeTurn_Reminded = true
		end
	else
		HopeTurn_IdleTicks = 0
		if IsUnitAliveBJ(udg_hero[i]) == false then
			text = "角色已倒地|n等待本场结算"
		elseif IsPlayerInForce(p, udg_WJZ_______weizhunbei) and IsUnitPaused(udg_hero[i]) then
			text = "当前动作结算中|n稍后可继续操作"
		elseif HopeTurn_Waiting() > 0 then
			text = "已结束回合|n等待 " .. (I2S(HopeTurn_Waiting()) or "") .. " 位队友"
		else
			text = "|cffffb080敌方行动 / 结算中|n等待下回合|r"
		end
	end
	HopeTurn_LastRound = udg_huihe_s
	HopeTurn_LastAP = udg_xingdong_dian[i]
	DzFrameSetText(HopeTurn_Text, text)
	DzFrameShow(HopeTurn_Button, canEnd)
	if canEnd and udg_xingdong_dian[i] <= 0 then
		DzFrameSetText(HopeTurn_Button, "|cffffd060结束回合 G|r")
	else
		DzFrameSetText(HopeTurn_Button, "|cff80ef90结束回合 G|r")
	end
	p = nil
end

function HopeThird_Resource(u, p)
	local kind = GetUnitTypeId(u)
	local token = HopeChallenge_TurnToken()
	local level = HopeThird_Level(u)
	local count = 0
	local limit = 2
	local mask = 0
	if level <= 0 then
		return ""
	end
	if kind == 1211117636 then
		if HopeThird_Cavalry[p] then
			return "|cff80ef90骑势就绪 · 下次强化|r"
		end
		return "|cffaaaaaa骑势 · 冲锋后蓄势|r"
	elseif kind == 1311781176 then
		if level == 1 then
			limit = 3
		end
		if HopeThird_ComboToken[p] == token then
			if HopeThird_ComboPaid[p] then
				return "|cff80ef90连势 · 本回合已回点|r"
			end
			count = IMinBJ(limit, HopeThird_ComboCount[p])
		end
		return "|cffd2b879连势 " .. (I2S(count) or "") .. "/" .. (I2S(limit) or "") .. " · 满后回点|r"
	elseif kind == 1211117620 then
		if HopeThird_PressureToken[p] == token then
			count = HopeThird_Pressure[p]
		end
		return "|cffd2b879压制 " .. (I2S(count) or "") .. "/3 · 换目标重置|r"
	elseif kind == 1311781189 then
		if HopeThird_FireTarget[p] ~= nil and GetWidgetLife(HopeThird_FireTarget[p]) > 0.405 then
			count = HopeThird_Get(GetHandleId(HopeThird_FireTarget[p]), p)
		end
		return "|cfffe8a0e最近目标火种 " .. (I2S(count) or "") .. "/3|r"
	elseif kind == 1328558134 then
		if HopeThird_HitsToken[p] == token then
			count = HopeThird_Hits[p]
			if HopeThird_HealCount[p] >= 2 then
				return "|cff80ef90连环 · 本回合已回复2次|r"
			end
		end
		return "|cff68b99a连环 " .. (I2S(count) or "") .. "/3 · 满后回复|r"
	elseif kind == 1213870131 then
		if HopeThird_HiddenToken[p] == token then
			mask = HopeThird_HiddenMask[p]
		end
		if mask >= 8 then
			return "|cff80ef90三律 · 本回合已贯通|r"
		end
		if ModuloInteger(mask, 2) == 1 then
			count = count + 1
		end
		if ModuloInteger(mask, 4) >= 2 then
			count = count + 1
		end
		if mask >= 4 then
			count = count + 1
		end
		return "|cff76cdd0三律 " .. (I2S(count) or "") .. "/2 · Q D V任选两式|r"
	end
	return ""
end

function HopeReclass_First(kind)
	return kind == 1311780932 or kind == 1211117619 or kind == 1211117617 or kind == 1311780919 or kind == 1160785976 or kind == 1311780933 or kind == 1328558129 or kind == 1328558131 or kind == 1213870129
end

function HopeReclass_Can(i)
	return i >= 1 and i <= 6 and udg_hero[i] ~= nil and HopeReclass_First(GetUnitTypeId(udg_hero[i])) and not HopeJob_Awakened[i]
end

function HopeReclass_Training(u)
	if GetUnitTypeId(u) == 1213870129 then
		return GetUnitAbilityLevel(u, 1096435792) * 2
	end
	return 0
end

function HopeReclass_Points(u)
	local kind = GetUnitTypeId(u)
	if kind == 1311780932 then
		return GetUnitAbilityLevel(u, 1093677136)
	elseif kind == 1211117619 then
		return GetUnitAbilityLevel(u, 1093677137)
	elseif kind == 1211117617 then
		return GetUnitAbilityLevel(u, 1093677131)
	elseif kind == 1311780919 then
		return GetUnitAbilityLevel(u, 1093677132)
	elseif kind == 1160785976 then
		return GetUnitAbilityLevel(u, 1093677135)
	elseif kind == 1311780933 then
		return GetUnitAbilityLevel(u, 1093677134) + GetUnitAbilityLevel(u, 1093678167)
	elseif kind == 1328558129 then
		return GetUnitAbilityLevel(u, 1093677395)
	elseif kind == 1328558131 then
		return GetUnitAbilityLevel(u, 1093677653)
	elseif kind == 1213870129 then
		return GetUnitAbilityLevel(u, 1096435792)
	end
	return 0
end

function HopeReclass_Blocker(index, p)
	local i = GetPlayerId(p) + 1
	local u = udg_hero[i]
	local deduction = HopeReclass_Training(u)
	local reason = ""
	if p == nil or i < 1 or i > 6 or not HopeReclass_Can(i) then
		reason = "重新转职仅限已一转、尚未二转的英雄。"
	elseif index < 0 or index >= HopeJob_Count or HopeJob_Stage[index] ~= 1 then
		reason = "无效的重转职业。"
	elseif HopeReclass_Busy[i] then
		reason = "正在重新转职，请稍候。"
	elseif not HopeJob_InRoom(p) then
		reason = "请回到原泉水爬塔房间的一转入口。"
	elseif HopeRoute_RewardPending(i - 1) or HopeChoice_PlayerPending[i - 1] > 0 then
		reason = "请先完成待选奖励。"
	elseif udg_Ls_zj_Str[i] ~= 0 or udg_Ls_zj_Agi[i] ~= 0 or udg_Ls_zj_Int[i] ~= 0 or udg_Linshi_Str[i] ~= 0 or HopeMeditation_Active[i] then
		reason = "请等待临时属性效果结束后再重新转职。"
	elseif index ~= 24 and HopeJob_Target[index] == GetUnitTypeId(u) then
		reason = "你已经是该职业，不会扣除积分。"
	elseif GetHeroStr(u, false) - deduction < HopeJob_Str[index] or GetHeroAgi(u, false) - deduction < HopeJob_Agi[index] or GetHeroInt(u, false) - deduction < HopeJob_Int[index] then
		reason = "移除旧职业修炼后的基础属性不足；装备和临时加成不计。"
	elseif not HopeCloud_CanWrite(p) then
		reason = "存档积分尚未就绪，暂时不能重新转职。"
	elseif udg_Wj_jf[i] < 10 then
		reason = "重新转职需要10存档积分，当前 " .. (I2S(udg_Wj_jf[i]) or "") .. "。"
	end
	u = nil
	return reason
end

function HopeThird_StudyBlock(index, owner)
	local p = GetPlayerId(owner) + 1
	if p < 1 or p > 6 or index < 0 or index >= HopeJob_Count then
		return "无效研习。"
	end
	if not HopeJob_Awakened[p] or HopeJob_AwakenOption[p] ~= index or not HopeThird_Passive[index] or udg_hero[p] == nil then
		return "该研习不属于当前三转职业。"
	end
	if not HopeJob_InRoom(owner) then
		return "请回到原泉水房间研习。"
	end
	if HopeRoute_RewardPending(p - 1) then
		return "请先完成待选奖励。"
	end
	if HopeThird_Level(udg_hero[p]) >= 3 then
		return "三转被动已满级（3级）。"
	end
	if HopeThird_Level(udg_hero[p]) < 1 then
		return "尚未获得三转被动。"
	end
	if GetHeroSkillPoints(udg_hero[p]) < 1 then
		return "技能点不足；每次研习消耗1技能点，后续升级可继续获得技能点。"
	end
	return ""
end

function HopeThird_Study(index, owner)
	local p = GetPlayerId(owner) + 1
	local level = 0
	local reason = HopeThird_StudyBlock(index, owner)
	if reason ~= "" then
		DisplayTimedTextToPlayer(owner, 0, 0, 4.0, reason)
		return
	end
	level = HopeThird_Level(udg_hero[p])
	UnitModifySkillPoints(udg_hero[p], -1)
	if SetUnitAbilityLevel(udg_hero[p], HopeThird_Ability[index], level + 1) ~= level + 1 then
		UnitModifySkillPoints(udg_hero[p], 1)
		DisplayTimedTextToPlayer(owner, 0, 0, 4.0, "研习未完成，技能点已退还。")
		return
	end
	DisplayTimedTextToPlayer(owner, 0, 0, 4.0, "三转被动提升至 " .. (I2S(level + 1) or "") .. "/3 级；技能点 -1。")
end

function HopeThird_Unlock(index, p)
	local u = udg_hero[p]
	local aid = HopeThird_Ability[index]
	local old = 1096430385
	for _ in _loop_() do
		if old > 1096430390 then break end
		if old ~= aid then
			UnitRemoveAbility(u, old)
		end
		old = old + 1
	end
	UnitAddAbility(u, aid)
	SetUnitAbilityLevel(u, aid, 1)
	UnitMakeAbilityPermanent(u, true, aid)
	u = nil
end

function HopeReclass_Commit(index, p)
	local i = GetPlayerId(p) + 1
	local reason = HopeReclass_Blocker(index, p)
	local old = udg_hero[i]
	local u = nil
	local oldkind = GetUnitTypeId(old)
	local pick = index
	local target = 0
	local passive = 0
	local passivelevel = 0
	local refund = HopeReclass_Points(old)
	local deduction = HopeReclass_Training(old)
	local slot = 0
	local aid = 0
	local str = 0
	local agi = 0
	local intel = 0
	local oldpoints = GetHeroSkillPoints(old)
	local points = oldpoints + refund
	local life = GetUnitState(old, UNIT_STATE_LIFE)
	local mana = GetUnitState(old, UNIT_STATE_MANA)
	local maximumlife = 0.0
	local maximummana = 0.0
	if reason ~= "" then
		DisplayTimedTextToPlayer(p, 0, 0, 5.0, reason)
		old = nil
		return
	end
	HopeReclass_Busy[i] = true
	-- Query attributes after removing the actual native Aamk effect: do not assume
	-- whether a Warcraft build exposes that modifier through base-stat getters.
	if oldkind == 1311780932 then
		passive = 1093677136
	elseif oldkind == 1160785976 then
		passive = 1093677135
	end
	if passive ~= 0 then
		passivelevel = GetUnitAbilityLevel(old, passive)
		if passivelevel > 0 then
			UnitRemoveAbility(old, passive)
		end
	end
	str = GetHeroStr(old, false) - deduction
	agi = GetHeroAgi(old, false) - deduction
	intel = GetHeroInt(old, false) - deduction
	if str < HopeJob_Str[index] or agi < HopeJob_Agi[index] or intel < HopeJob_Int[index] then
		reason = "移除旧职业修炼后属性不足，未扣积分。"
	else
		if index == 24 then
			if GetRandomInt(1, 100) <= 10 then
				target = 1213870129
			else
				pick = GetRandomInt(0, 7)
				target = HopeJob_Target[pick]
			end
		else
			target = HopeJob_Target[index]
		end
		u = CreateUnit(p, target, GetUnitX(old), GetUnitY(old), GetUnitFacing(old))
		if u == nil then
			reason = "新职业创建失败，未扣积分，请重试。"
		elseif not HopePoints_Spend(p, 10) then
			reason = "积分扣除未通过，原职业保留。"
			RemoveUnit(u)
			u = nil
		end
	end
	if reason ~= "" then
		if passivelevel > 0 then
			UnitAddAbility(old, passive)
			SetUnitAbilityLevel(old, passive, passivelevel)
		end
		UnitModifySkillPoints(old, oldpoints - GetHeroSkillPoints(old))
		SetUnitState(old, UNIT_STATE_LIFE, RMinBJ(life, GetUnitState(old, UNIT_STATE_MAX_LIFE)))
		SetUnitState(old, UNIT_STATE_MANA, RMinBJ(mana, GetUnitState(old, UNIT_STATE_MAX_MANA)))
		HopeReclass_Busy[i] = false
		DisplayTimedTextToPlayer(p, 0, 0, 5.0, reason)
		old = nil
		u = nil
		return
	end
	-- SetHeroXP normally runs the map's HERO_LEVEL trigger. Suppress only that
	-- trigger's action while copying XP, preserving every earned global reward.
	HopeReclass_Replacing = true
	SetHeroXP(u, GetHeroXP(old), false)
	HopeReclass_Replacing = false
	-- Drop on the old hero first, so scripted equipment bonuses are undone once.
	for _ in _loop_() do
		if slot >= 6 then break end
		HopeReclass_Items[i * 6 + slot] = UnitItemInSlot(old, slot)
		if HopeReclass_Items[i * 6 + slot] ~= nil then
			UnitRemoveItem(old, HopeReclass_Items[i * 6 + slot])
		end
		slot = slot + 1
	end
	maximumlife = GetUnitState(old, UNIT_STATE_MAX_LIFE)
	maximummana = GetUnitState(old, UNIT_STATE_MAX_MANA)
	-- Remove the scripted hidden training on the old unit, letting the engine adjust
	-- its capacities before they are copied to the fresh class.
	-- The old hero is removed below; keep it alive while native capacities change.
	if deduction > 0 then
		SetUnitState(old, UNIT_STATE_LIFE, GetUnitState(old, UNIT_STATE_MAX_LIFE))
		SetHeroStr(old, GetHeroStr(old, false) - deduction, true)
		SetHeroAgi(old, GetHeroAgi(old, false) - deduction, true)
		SetHeroInt(old, GetHeroInt(old, false) - deduction, true)
		maximumlife = GetUnitState(old, UNIT_STATE_MAX_LIFE)
		maximummana = GetUnitState(old, UNIT_STATE_MAX_MANA)
	end
	SetHeroStr(u, GetHeroStr(old, false), true)
	SetHeroAgi(u, GetHeroAgi(old, false), true)
	SetHeroInt(u, GetHeroInt(old, false), true)
	SetUnitState(u, UNIT_STATE_MAX_LIFE, maximumlife)
	SetUnitState(u, UNIT_STATE_MAX_MANA, maximummana)
	if oldkind == 1311780932 and passivelevel > 0 then
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] - 1
		udg_xingdong_dian[i] = IMinBJ(udg_xingdong_dian[i], udg_xingdong_dianSx[i])
	end
	if oldkind == 1213870129 then
		udg_cz1Str_up[i] = udg_cz1Str_up[i] - 0.15
		udg_cz2Agi_up[i] = udg_cz2Agi_up[i] - 0.15
		udg_cz3Int_up[i] = udg_cz3Int_up[i] - 0.15
	end
	if target == 1213870129 then
		udg_cz1Str_up[i] = udg_cz1Str_up[i] + 0.15
		udg_cz2Agi_up[i] = udg_cz2Agi_up[i] + 0.15
		udg_cz3Int_up[i] = udg_cz3Int_up[i] + 0.15
	end
	aid = LoadInteger(YDHT, i, 1093503686)
	if aid ~= 0 then
		UnitAddAbility(u, aid)
	end
	aid = LoadInteger(YDHT, i, 1068628448)
	if aid ~= 0 then
		UnitAddAbility(u, aid)
	end
	aid = LoadInteger(YDHT, i, 1494149627)
	if aid ~= 0 then
		UnitAddAbility(u, aid)
	end
	if udg_R_Skill[i] ~= 0 and udg_R_Skill[i] ~= 1093677388 then
		UnitAddAbility(u, udg_R_Skill[i])
	end
	SetUnitState(u, ConvertUnitState(18), GetUnitState(u, ConvertUnitState(18)) + I2R(udg_Gongjili_Jc[i]))
	udg_Minjie_jiaGong[i] = 0
	SetUnitMoveSpeed(u, GetUnitMoveSpeed(old))
	UnitModifySkillPoints(u, points - GetHeroSkillPoints(u))
	if udg_shengji_dian[i] > 0 then
		UnitAddAbility(u, 1098085732)
		AddUnitToStock(u, 1747988550, udg_shengji_dian[i], udg_shengji_dian[i])
	end
	-- Auxiliary spell caster abilities belong to the chosen first profession.
	UnitRemoveAbility(udg_Mj_Danwei[i], 1093677127)
	UnitRemoveAbility(udg_Mj_Danwei[i], 1093677128)
	if target == 1311780919 then
		UnitAddAbility(udg_Mj_Danwei[i], 1093677127)
	elseif target == 1160785976 then
		UnitAddAbility(udg_Mj_Danwei[i], 1093677128)
	end
	udg_hero[i] = u
	slot = 0
	for _ in _loop_() do
		if slot >= 6 then break end
		if HopeReclass_Items[i * 6 + slot] ~= nil then
			UnitAddItem(u, HopeReclass_Items[i * 6 + slot])
			HopeReclass_Items[i * 6 + slot] = nil
		end
		slot = slot + 1
	end
	RemoveUnit(old)
	SetUnitState(u, UNIT_STATE_LIFE, RMinBJ(life, GetUnitState(u, UNIT_STATE_MAX_LIFE)))
	SetUnitState(u, UNIT_STATE_MANA, RMinBJ(mana, GetUnitState(u, UNIT_STATE_MAX_MANA)))
	SelectUnitForPlayerSingle(u, p)
	HopeRoute_Ready[i - 1] = false
	HopeReclass_Busy[i] = false
	DisplayTextToPlayer(p, 0, 0, "重新转职完成：" .. (GetUnitName(u) or "") .. "；消耗10存档积分，返还职业技能点 " .. (I2S(refund) or "") .. "。")
	if p == GetLocalPlayer() then
		HopeJob_Expanded = false
		HopeJob_ShowFrame(HopeJob_Panel, false)
	end
	old = nil
	u = nil
end

function HopeHidden_Stage(u)
	local kind = GetUnitTypeId(u)
	if kind == 1213870129 then
		return 1
	elseif kind == 1213870130 then
		return 2
	elseif kind == 1213870131 then
		return 3
	end
	return 0
end

function HopeHidden_HealAmount(u)
	local maximum = GetUnitState(u, UNIT_STATE_MAX_LIFE)
	local total = I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true))
	return RMaxBJ(0.0, RMinBJ(maximum - GetWidgetLife(u), RMinBJ(maximum * 0.3, 15.0 + total * 0.5)))
end

function HopeHidden_DrainHealing(u, before, after)
	local actual = RMaxBJ(0.0, RMinBJ(before, before - RMaxBJ(0.0, after)))
	local maximum = GetUnitState(u, UNIT_STATE_MAX_LIFE)
	return RMaxBJ(0.0, RMinBJ(maximum - GetWidgetLife(u), RMinBJ(maximum * 0.15, actual * 0.25)))
end

function HopeHidden_Cast(u, aid, target)
	local p = GetOwningPlayer(u)
	local i = GetPlayerId(p) + 1
	local stage = HopeHidden_Stage(u)
	local token = HopeChallenge_TurnToken() + 1
	local amount = 0.0
	local before = 0.0
	if i < 1 or i > 6 or u ~= udg_hero[i] or stage == 0 or GetWidgetLife(u) <= 0.405 or IsUnitPaused(u) or not udg_ZhandouZhong then
		DisplayTimedTextToPlayer(p, 0, 0, 4.0, "隐藏职业技能只能由当前英雄在自己的战斗回合使用。")
		p = nil
		return
	end
	if aid == 1096435794 then
		amount = HopeHidden_HealAmount(u)
		if amount <= 0.0 then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "三相回元：生命已满，不消耗资源。")
		elseif HopeHidden_LastHeal[i] == token then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "三相回元每回合只能使用一次。")
		elseif udg_xingdong_dian[i] < 1 or GetUnitState(u, UNIT_STATE_MANA) < 2.0 then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "三相回元需要1行动点、2魔法。")
		else
			HopeHidden_LastHeal[i] = token
			udg_xingdong_dian[i] = udg_xingdong_dian[i] - 1
			SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) - 2.0)
			SetUnitState(u, UNIT_STATE_LIFE, GetWidgetLife(u) + amount)
			HopeThird_HiddenAction(u, aid)
			DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", u, "origin"))
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "三相回元：恢复 " .. (R2S(amount) or "") .. " 生命。")
		end
	elseif aid == 1096435780 then
		if stage < 2 then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "万象汲取需要完成隐藏二转。")
		elseif target == nil or not IsUnitInGroup(target, udg_Guaiwu_dwz) or not IsUnitEnemy(target, p) or GetWidgetLife(target) <= 0.405 then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "万象汲取：请选择当前战斗中存活的敌人。")
		elseif HopeHidden_LastDrain[i] == token then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "万象汲取每回合只能使用一次。")
		elseif udg_xingdong_dian[i] < 2 or GetUnitState(u, UNIT_STATE_MANA) < 3.0 then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "万象汲取需要2行动点、3魔法。")
		else
			HopeHidden_LastDrain[i] = token
			udg_xingdong_dian[i] = udg_xingdong_dian[i] - 2
			SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) - 3.0)
			before = GetWidgetLife(target)
			amount = I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true)) * 1.75 * udg_Skill_Dm[i] * udg_Fashang_Dm[i]
			-- The original damage callback applies final multiplier, criticals and resistance.
			UnitDamageTarget(u, target, amount, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
			amount = HopeHidden_DrainHealing(u, before, GetWidgetLife(target))
			if GetWidgetLife(u) > 0.405 and amount > 0.0 then
				SetUnitState(u, UNIT_STATE_LIFE, GetWidgetLife(u) + amount)
				HopeThird_HiddenAction(u, aid)
				DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", u, "origin"))
			end
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "万象汲取：实际吸取 " .. (R2S(amount) or "") .. " 生命。")
		end
	end
	p = nil
end

function HopeThird_Cast(u, aid, target)
	local owner = GetOwningPlayer(u)
	local p = GetPlayerId(owner) + 1
	local token = HopeChallenge_TurnToken()
	local ap = 2
	local j = 1
	local bullets = 0
	local amount = 0.0
	local cx = GetUnitX(u)
	local cy = GetUnitY(u)
	local tx = 0.0
	local ty = 0.0
	local dx = 0.0
	local dy = 0.0
	local length = 0.0
	local along = 0.0
	local across = 0.0
	local missing = 0.0
	local g = nil
	local enemy = nil
	if p < 1 or p > 6 or u ~= udg_hero[p] or not HopeJob_Awakened[p] or HopeThird_Ability[HopeJob_AwakenOption[p]] ~= aid or GetUnitAbilityLevel(u, aid) <= 0 or GetWidgetLife(u) <= 0.405 or IsUnitPaused(u) then
		owner = nil
		return
	end
	if aid == 1096036662 then
		ap = 1
	end
	if not udg_ZhandouZhong or udg_xingdong_dian[p] < ap or GetUnitState(u, UNIT_STATE_MANA) < 3.0 or HopeJob_LastCast[p] == token then
		DisplayTimedTextToPlayer(owner, 0, 0, 3.0, "觉醒技能：战斗中每回合一次；行动点或魔法不足，或已经使用。")
		owner = nil
		return
	end
	if aid ~= 1096036403 and not HopeThird_Enemy(target, owner) then
		DisplayTimedTextToPlayer(owner, 0, 0, 3.0, "请选择存活的当前敌人。")
		owner = nil
		return
	end
	if aid == 1096036656 then
		bullets = LoadInteger(YDHT, GetHandleId(u), 812780749)
		if bullets <= 0 then
			DisplayTimedTextToPlayer(owner, 0, 0, 3.0, "子弹不足：请先用Q装填，再使用绝命狙击。")
			owner = nil
			return
		end
	elseif aid == 1096036659 and HopeStatus_PoisonSourceBase(target, p - 1) <= 0.0 then
		DisplayTimedTextToPlayer(owner, 0, 0, 3.0, "目标没有自己的有效毒层，请先用毒矛叠毒。")
		owner = nil
		return
	elseif aid == 1096036408 then
		dx = GetUnitX(target) - cx
		dy = GetUnitY(target) - cy
		length = SquareRoot(dx * dx + dy * dy)
		if length < 1.0 or length > 2000.0 then
			DisplayTimedTextToPlayer(owner, 0, 0, 3.0, "贯城重弩：请选择2000距离内、与自己位置不同的敌人。")
			owner = nil
			return
		end
		dx = dx / length
		dy = dy / length
	end
	udg_xingdong_dian[p] = udg_xingdong_dian[p] - ap
	SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) - 3.0)
	HopeJob_LastCast[p] = token
	if aid == 1096036403 then
		for _ in _loop_() do
			if j > 6 then break end
			enemy = udg_hero[j]
			if enemy ~= nil and GetWidgetLife(enemy) > 0.405 and IsUnitAlly(enemy, owner) then
				amount = GetUnitState(enemy, UNIT_STATE_MAX_LIFE) * 0.25 + I2R(GetHeroInt(u, true)) * 1.5
				missing = RMaxBJ(0.0, GetUnitState(enemy, UNIT_STATE_MAX_LIFE) - GetWidgetLife(enemy))
				HopeThird_Heal(enemy, amount, false)
				SetUnitState(enemy, ConvertUnitState(32), GetUnitState(enemy, ConvertUnitState(32)) + RMinBJ(I2R(GetHeroInt(u, true)) * 0.8, RMaxBJ(0.0, amount - missing) * 0.5))
				SetUnitState(enemy, UNIT_STATE_MANA, RMinBJ(GetUnitState(enemy, UNIT_STATE_MAX_MANA), GetUnitState(enemy, UNIT_STATE_MANA) + 2.0))
				DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", enemy, "origin"))
			end
			j = j + 1
		end
	elseif aid == 1096036406 then
		amount = I2R(GetHeroStr(u, true) + GetHeroAgi(u, true)) * 4.0 * udg_Skill_Dm[p]
		if GetWidgetLife(target) <= GetUnitState(target, UNIT_STATE_MAX_LIFE) * 0.4 then
			amount = amount * 1.5
		end
		UnitDamageTarget(u, target, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
		if GetWidgetLife(target) <= 0.405 then
			HopeThird_Refund(p)
		end
		DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Orc\\CriticalStrike\\CriticalStrike.mdl", target, "origin"))
	elseif aid == 1096036656 then
		SaveInteger(YDHT, GetHandleId(u), 812780749, bullets - 1)
		if LoadTextTagHandle(YDHT, GetHandleId(u), 46981737) ~= nil then
			SetTextTagTextBJ(LoadTextTagHandle(YDHT, GetHandleId(u), 46981737), (I2S(bullets - 1) or "") .. "/" .. (I2S(GetUnitAbilityLevel(u, 1093678161) + 1) or ""), 12.0)
		end
		amount = (GetUnitState(u, ConvertUnitState(20)) * 5.0 + I2R(GetHeroAgi(u, true)) * 3.0) * udg_Skill_Dm[p]
		if LoadBoolean(YDHT, GetHandleId(u), 149034428) then
			amount = amount * udg_jingque_Daji_jiacheng[p]
			SaveBoolean(YDHT, GetHandleId(u), 149034428, false)
		end
		-- Chaos attack matches Q so the original headshot flag is consumed by this hit.
		UnitDamageTarget(u, target, amount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
		DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\Rifle\\RifleImpact.mdl", target, "origin"))
	elseif aid == 1096036659 then
		amount = HopeStatus_PoisonSourceBase(target, p - 1) * udg_Skill_Dm[p]
		UnitDamageTarget(u, target, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
		HopeThird_Heal(u, GetUnitState(u, UNIT_STATE_MAX_LIFE) * 0.1, false)
		DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl", target, "origin"))
	elseif aid == 1096036662 then
		HopeThird_Put(GetHandleId(target), 102, 3)
		DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\HowlOfTerror\\HowlTarget.mdl", target, "origin"))
	elseif aid == 1096036408 or aid == 1096036657 then
		tx = GetUnitX(target)
		ty = GetUnitY(target)
		g = CreateGroup()
		GroupAddGroup(udg_Guaiwu_dwz, g)
		for _ in _loop_() do
			enemy = FirstOfGroup(g)
			if enemy == nil then break end
			GroupRemoveUnit(g, enemy)
			if HopeThird_Enemy(enemy, owner) then
				if aid == 1096036408 then
					along = (GetUnitX(enemy) - cx) * dx + (GetUnitY(enemy) - cy) * dy
					across = RAbsBJ((GetUnitX(enemy) - cx) * dy - (GetUnitY(enemy) - cy) * dx)
					if along >= 0.0 and along <= 2000.0 and across <= 120.0 then
						amount = (GetUnitState(u, ConvertUnitState(20)) * 4.0 + I2R(GetHeroStr(u, true)) * 2.0) * udg_Skill_Dm[p]
						if enemy ~= target then
							amount = amount * 0.7
						end
						UnitDamageTarget(u, enemy, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
						DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\Arrow\\ArrowMissile.mdl", enemy, "origin"))
					end
				else
					along = GetUnitX(enemy) - tx
					across = GetUnitY(enemy) - ty
					if along * along + across * across <= 202500.0 then
						HopeThird_Put(GetHandleId(enemy), 101, 1)
						UnitDamageTarget(u, enemy, I2R(GetHeroInt(u, true)) * 4.0 * udg_Skill_Dm[p] * udg_Fashang_Dm[p], false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
						DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", enemy, "origin"))
					end
				end
			end
		end
		DestroyGroup(g)
	end
	enemy = nil
	g = nil
	owner = nil
end

function HopeThird_Init()
	HopeThird_Data = InitHashtable()
	HopeThird_Ability[26] = 1096036663
	HopeThird_Passive[26] = true
	HopeThird_Ability[27] = 1096036401
	HopeThird_Passive[27] = true
	HopeThird_Ability[28] = 1096036402
	HopeThird_Passive[28] = true
	HopeThird_Ability[29] = 1096036403
	HopeThird_Passive[29] = false
	HopeThird_Ability[30] = 1096430390
	HopeThird_Passive[30] = false
	HopeThird_Ability[31] = 1096036405
	HopeThird_Passive[31] = true
	HopeThird_Ability[32] = 1096036406
	HopeThird_Passive[32] = false
	HopeThird_Ability[33] = 1096036407
	HopeThird_Passive[33] = true
	HopeThird_Ability[34] = 1096036408
	HopeThird_Passive[34] = false
	HopeThird_Ability[35] = 1096036409
	HopeThird_Passive[35] = true
	HopeThird_Ability[36] = 1096036656
	HopeThird_Passive[36] = false
	HopeThird_Ability[37] = 1096036657
	HopeThird_Passive[37] = false
	HopeThird_Ability[38] = 1096036658
	HopeThird_Passive[38] = true
	HopeThird_Ability[39] = 1096036659
	HopeThird_Passive[39] = false
	HopeThird_Ability[40] = 1096036660
	HopeThird_Passive[40] = true
	HopeThird_Ability[41] = 1096036661
	HopeThird_Passive[41] = true
	HopeThird_Ability[42] = 1096036662
	HopeThird_Passive[42] = false
end

end

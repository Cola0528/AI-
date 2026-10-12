-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeRewards_Win(difficulty)
	if difficulty == 1 then
		return 4
	elseif difficulty == 2 then
		return 8
	elseif difficulty == 3 then
		return 12
	elseif difficulty == 4 then
		return 22
	elseif difficulty == 5 then
		return 39
	end
	return 0
end

function HopeRewards_Boss(difficulty, roundIndex)
	if difficulty == 6 then
		return 12 + IMinBJ(28, R2I(2.0 * SquareRoot(I2R(IMaxBJ(0, roundIndex)))))
	elseif difficulty == 1 then
		return 2
	elseif difficulty == 2 then
		return 2
	elseif difficulty == 3 then
		return 3
	elseif difficulty == 4 then
		return 4
	elseif difficulty == 5 then
		return 6
	end
	return 2
end

function HopeMeta_Bit(index)
	local n = 1
	for _ in _loop_() do
		if index <= 0 then break end
		n = n * 2
		index = index - 1
	end
	return n
end

function HopeMeta_Has(mask, index)
	return ModuloInteger(_idiv_(mask, HopeMeta_Bit(index)), 2) == 1
end

function HopeMeta_Count(mask)
	local n = 0
	for _ in _loop_() do
		if mask <= 0 then break end
		n = n + ModuloInteger(mask, 2)
		mask = _idiv_(mask, 2)
	end
	return n
end

function HopeMeta_Level(packed, node)
	return ModuloInteger(_idiv_(packed, HopeMeta_Bit(2 * node)), 4)
end

function HopeMeta_Tal(i, node)
	return HopeMeta_Level(HopeMeta_RunTalent[i * 3 + _idiv_(node, 5)], ModuloInteger(node, 5))
end

function HopeMeta_Learned(i)
	local node = 0
	local count = 0
	for _ in _loop_() do
		if node >= 15 then break end
		if HopeMeta_Level(HopeMeta_Talent[i * 3 + _idiv_(node, 5)], ModuloInteger(node, 5)) > 0 then
			count = count + 1
		end
		node = node + 1
	end
	return count
end

function HopeMeta_Price(node)
	if node == 1 or node == 2 or node == 3 then
		return 30
	elseif node == 4 or node == 5 then
		return 20
	elseif node == 8 or node == 9 then
		return 50
	end
	return 10
end

function HopeMeta_AddXp(i, n)
	if n <= 0 or not HopeMeta_Loaded[i] then
		return
	end
	HopeMeta_Xp[i] = IMinBJ(2000000000, HopeMeta_Xp[i] + IMinBJ(100000, n))
	DzAPI_Map_StoreInteger(Player(i), "xp_v1", HopeMeta_Xp[i])
end

function HopeMeta_Achieve(i, index)
	if i < 0 or i >= 6 or not HopeMeta_Loaded[i] or index < 0 or index >= 24 or HopeMeta_Has(HopeMeta_Ach[i], index) then
		return
	end
	HopeMeta_Ach[i] = HopeMeta_Ach[i] + HopeMeta_Bit(index)
	DzAPI_Map_StoreInteger(Player(i), "ach_v1", HopeMeta_Ach[i])
	-- A small one-off discovery reward; never a repeatable points multiplier.
	udg_Wj_jf[i + 1] = IMinBJ(2000000000, udg_Wj_jf[i + 1] + 5)
	DzAPI_Map_StoreInteger(Player(i), "boss_jf", udg_Wj_jf[i + 1])
	HopeMeta_AddXp(i, 5)
	DisplayTimedTextToPlayer(Player(i), 0, 0, 5.0, "成就解锁：" .. (HopeMeta_AchName[index] or "") .. " · +5存档积分（已提交）")
end

function HopeMeta_Job(i)
	local j = 0
	local kind = GetUnitTypeId(udg_hero[i + 1])
	if HopeJob_Awakened[i + 1] then
		return HopeJob_AwakenOption[i + 1]
	end
	if kind == 1213870129 then
		return 24
	end
	for _ in _loop_() do
		if j >= 26 then break end
		if j ~= 24 and HopeJob_Target[j] == kind then
			return j
		end
		j = j + 1
	end
	return -1
end

function HopeMeta_SaveMastery(i, job)
	local groupId = _idiv_(job, 4)
	local j = groupId * 4
	local value = 0
	local power = 1
	for _ in _loop_() do
		if j >= groupId * 4 + 4 or j >= 43 then break end
		value = value + HopeMeta_Mastery[i * 43 + j] * power
		power = power * 64
		j = j + 1
	end
	DzAPI_Map_StoreInteger(Player(i), "mast_v1_" .. (I2S(groupId) or ""), value)
end

function HopeMeta_Earn(p, points, boss)
	local i = GetPlayerId(p)
	local j = 0
	local soul = 0
	if i < 0 or i >= 6 or not HopeMeta_Loaded[i] then
		return
	end
	HopeMeta_AddXp(i, points)
	if boss then
		HopeMeta_Bosses[i] = HopeMeta_Bosses[i] + 1
		HopeMeta_Achieve(i, 0)
		j = HopeMeta_Job(i)
		if j >= 0 and j < 43 then
			HopeMeta_Mastery[i * 43 + j] = IMinBJ(63, HopeMeta_Mastery[i * 43 + j] + 1)
			HopeMeta_SaveMastery(i, j)
			if HopeMeta_Mastery[i * 43 + j] >= 25 then
				HopeMeta_Achieve(i, 20)
			end
		end
		if udg_Yx_Nd_Dj >= 4 then
			soul = 1
			if udg_Yx_Nd_Dj == 5 then
				soul = 2
			elseif udg_Yx_Nd_Dj == 6 then
				soul = 1 + IMinBJ(5, _idiv_(udg_quanshu, 5))
			end
			HopeMeta_Soul[i] = IMinBJ(2000000000, HopeMeta_Soul[i] + soul)
			DzAPI_Map_StoreInteger(p, "soul_v1", HopeMeta_Soul[i])
		end
		if udg_Yx_Nd_Dj == 6 then
			HopeMeta_Best[i] = IMaxBJ(HopeMeta_Best[i], udg_quanshu + 1)
			DzAPI_Map_StoreInteger(p, "best_v1", HopeMeta_Best[i])
			j = 0
			for _ in _loop_() do
				if j >= 4 then break end
				if HopeMeta_Best[i] >= 5 * HopeMeta_Bit(j) then
					-- Thresholds 5/10/20/30: final threshold handled explicitly.
					if j < 3 or HopeMeta_Best[i] >= 30 then
						HopeMeta_Achieve(i, 6 + j)
					end
				end
				j = j + 1
			end
			if HopeMeta_Best[i] >= 30 then
				HopeMeta_Achieve(i, 9)
			end
		end
		if HopeMeta_Xp[i] >= 1000 then
			HopeMeta_Achieve(i, 22)
		end
		if HopeMeta_Count(HopeMeta_Ach[i]) >= 20 then
			HopeMeta_Achieve(i, 23)
		end
	end
end

function HopeMeta_Catalog(i, index)
	local groupId = _idiv_(index, 22)
	local bit = ModuloInteger(index, 22)
	local count = 0
	if not HopeMeta_Loaded[i] or HopeMeta_Has(HopeMeta_Relic[i * 2 + groupId], bit) then
		return
	end
	HopeMeta_Relic[i * 2 + groupId] = HopeMeta_Relic[i * 2 + groupId] + HopeMeta_Bit(bit)
	DzAPI_Map_StoreInteger(Player(i), "relic_v1_" .. (I2S(groupId) or ""), HopeMeta_Relic[i * 2 + groupId])
	count = HopeMeta_Count(HopeMeta_Relic[i * 2]) + HopeMeta_Count(HopeMeta_Relic[i * 2 + 1])
	HopeMeta_Achieve(i, 16)
	if count >= 10 then
		HopeMeta_Achieve(i, 17)
	end
	if count >= 20 then
		HopeMeta_Achieve(i, 18)
	end
	if count >= 44 then
		HopeMeta_Achieve(i, 19)
	end
end

function HopeMeta_Load(i)
	local p = Player(i)
	local j = 0
	local k = 0
	local value = 0
	local lower = IMaxBJ(0, udg_Wj_jf[i + 1])
	local schema = 0
	if HopeMeta_Loaded[i] or not HopeCloud_CanWrite(p) or udg_Cundang_danwei[i + 1] == nil then
		p = nil
		return
	end
	schema = DzAPI_Map_GetStoredInteger(p, "v19_schema")
	for _ in _loop_() do
		if j >= 10 then break end
		-- Snapshot actual purchased levels: do not reinterpret zero as a purchase.
		value = IMaxBJ(0, GetUnitAbilityLevel(udg_Cundang_danwei[i + 1], 1093677872 + j) - 1)
		HopeMeta_BaseLevel[i * 10 + j] = value
		lower = IMinBJ(2000000000, lower + value * HopeMeta_Price(j))
		j = j + 1
	end
	HopeMeta_Xp[i] = IMaxBJ(lower, DzAPI_Map_GetStoredInteger(p, "xp_v1"))
	HopeMeta_Soul[i] = IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "soul_v1"))
	HopeMeta_Ach[i] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "ach_v1")), 16777216)
	HopeMeta_Abyss[i] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "abyss_v1")), 64)
	HopeMeta_RunAbyss[i] = HopeMeta_Abyss[i]
	HopeMeta_Keystone[i] = IMaxBJ(0, IMinBJ(3, DzAPI_Map_GetStoredInteger(p, "key_v1")))
	HopeMeta_RunKey[i] = HopeMeta_Keystone[i]
	HopeMeta_Best[i] = IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "best_v1"))
	HopeMeta_Relic[i * 2] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "relic_v1_0")), 4194304)
	HopeMeta_Relic[i * 2 + 1] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "relic_v1_1")), 4194304)
	HopeMeta_Talent[i * 3] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "tal_v1_a")), 1024)
	HopeMeta_Talent[i * 3 + 1] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "tal_v1_b")), 1024)
	HopeMeta_Talent[i * 3 + 2] = ModuloInteger(IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "tal_v1_c")), 1024)
	j = 0
	for _ in _loop_() do
		if j >= 3 then break end
		HopeMeta_RunTalent[i * 3 + j] = HopeMeta_Talent[i * 3 + j]
		j = j + 1
	end
	j = 0
	for _ in _loop_() do
		if j >= 11 then break end
		value = IMaxBJ(0, DzAPI_Map_GetStoredInteger(p, "mast_v1_" .. (I2S(j) or "")))
		k = 0
		for _ in _loop_() do
			if k >= 4 or j * 4 + k >= 43 then break end
			HopeMeta_Mastery[i * 43 + j * 4 + k] = ModuloInteger(value, 64)
			HopeMeta_RunMastery[i * 43 + j * 4 + k] = ModuloInteger(value, 64)
			value = _idiv_(value, 64)
			k = k + 1
		end
		j = j + 1
	end
	HopeMeta_LastTurn[i] = -1
	HopeMeta_Loaded[i] = true
	if schema < 1 then
		DzAPI_Map_StoreInteger(p, "xp_v1", HopeMeta_Xp[i])
		DzAPI_Map_StoreInteger(p, "v19_schema", 1)
		DisplayTextToPlayer(p, 0, 0, "v19存档已迁移：旧余额和已购成长保留；累计积分仅记录可追溯下限。")
	end
	p = nil
end

function HopeMeta_CanBuy(p)
	local i = GetPlayerId(p)
	return i >= 0 and i < 6 and HopeMeta_Loaded[i] and HopeCloud_CanWrite(p) and not udg_ZhandouZhong and not HopeRoute_Left[i]
end

function HopeMeta_BuyTalent(p, node)
	local i = GetPlayerId(p)
	local groupId = _idiv_(node, 5)
	local level = 0
	local cost = 0
	local prerequisite = 0
	local key = "tal_v1_a"
	if node < 0 or node >= 15 or not HopeMeta_CanBuy(p) then
		DisplayTextToPlayer(p, 0, 0, "非战斗且云档就绪后，才能购买；下局生效。")
		return
	end
	level = HopeMeta_Level(HopeMeta_Talent[i * 3 + groupId], ModuloInteger(node, 5))
	prerequisite = HopeMeta_NodePrereq[node]
	if level >= 3 or prerequisite >= 0 and HopeMeta_Level(HopeMeta_Talent[i * 3 + groupId], ModuloInteger(prerequisite, 5)) < 1 then
		DisplayTextToPlayer(p, 0, 0, "该节点已满级，或尚未满足前置。")
		return
	end
	cost = HopeMeta_NodeCost[node] * (level + 1)
	if not HopePoints_Spend(p, cost) then
		return
	end
	HopeMeta_Talent[i * 3 + groupId] = HopeMeta_Talent[i * 3 + groupId] + HopeMeta_Bit(2 * ModuloInteger(node, 5))
	if groupId == 1 then
		key = "tal_v1_b"
	elseif groupId == 2 then
		key = "tal_v1_c"
	end
	DzAPI_Map_StoreInteger(p, key, HopeMeta_Talent[i * 3 + groupId])
	if HopeMeta_Learned(i) >= 5 then
		HopeMeta_Achieve(i, 21)
	end
end

function HopeMeta_BuyAbyss(p, node)
	local i = GetPlayerId(p)
	local price = 0
	if node < 0 or node >= 6 or not HopeMeta_CanBuy(p) then
		return
	end
	price = HopeMeta_AbyssCost[node]
	if HopeMeta_Has(HopeMeta_Abyss[i], node) or HopeMeta_Soul[i] < price then
		DisplayTextToPlayer(p, 0, 0, "已解锁或魂晶不足；魂晶仅从极难、炼狱和无限BOSS获取。")
		return
	end
	HopeMeta_Soul[i] = HopeMeta_Soul[i] - price
	HopeMeta_Abyss[i] = HopeMeta_Abyss[i] + HopeMeta_Bit(node)
	DzAPI_Map_StoreInteger(p, "soul_v1", HopeMeta_Soul[i])
	DzAPI_Map_StoreInteger(p, "abyss_v1", HopeMeta_Abyss[i])
end

function HopeMeta_Key(p, key)
	local i = GetPlayerId(p)
	if key < 1 or key > 3 or not HopeMeta_CanBuy(p) or HopeMeta_Keystone[i] ~= 0 then
		DisplayTextToPlayer(p, 0, 0, "基石三选一；已有基石时须先重置天赋。")
		return
	end
	if not HopePoints_Spend(p, 80) then
		return
	end
	HopeMeta_Keystone[i] = key
	DzAPI_Map_StoreInteger(p, "key_v1", key)
end

function HopeMeta_Reset(p)
	local i = GetPlayerId(p)
	local node = 0
	local level = 0
	local refund = 0
	if not HopeMeta_CanBuy(p) then
		return
	end
	if HopeMeta_Keystone[i] > 0 then
		refund = 80
	end
	for _ in _loop_() do
		if node >= 15 then break end
		level = HopeMeta_Level(HopeMeta_Talent[i * 3 + _idiv_(node, 5)], ModuloInteger(node, 5))
		refund = refund + _idiv_(HopeMeta_NodeCost[node] * level * (level + 1), 2)
		node = node + 1
	end
	if refund == 0 or not HopePoints_Spend(p, 10) then
		return
	end
	udg_Wj_jf[i + 1] = IMinBJ(2000000000, udg_Wj_jf[i + 1] + refund)
	HopeMeta_Talent[i * 3] = 0
	HopeMeta_Talent[i * 3 + 1] = 0
	HopeMeta_Talent[i * 3 + 2] = 0
	HopeMeta_Keystone[i] = 0
	DzAPI_Map_StoreInteger(p, "tal_v1_a", 0)
	DzAPI_Map_StoreInteger(p, "tal_v1_b", 0)
	DzAPI_Map_StoreInteger(p, "tal_v1_c", 0)
	DzAPI_Map_StoreInteger(p, "key_v1", 0)
	DzAPI_Map_StoreInteger(p, "boss_jf", udg_Wj_jf[i + 1])
	DisplayTextToPlayer(p, 0, 0, "天赋重置已提交：返还购买积分，收取10积分；本局已载入效果保持，下局换构筑。")
end

function HopeMeta_LegacyRatio(i)
	local u = udg_hero[i + 1]
	local atk = GetUnitState(u, ConvertUnitState(20))
	local hp = GetUnitState(u, UNIT_STATE_MAX_LIFE)
	local stats = I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true))
	local flat = I2R(HopeMeta_BaseLevel[i * 10])
	local attr = I2R(HopeMeta_BaseLevel[i * 10 + 1] + HopeMeta_BaseLevel[i * 10 + 2] + HopeMeta_BaseLevel[i * 10 + 3])
	local off = RMaxBJ(atk / RMaxBJ(1.0, atk - flat - attr), stats / RMaxBJ(1.0, stats - attr))
	local crit = I2R(HopeMeta_BaseLevel[i * 10 + 8]) * 0.01
	local cd = RMaxBJ(0.0, udg_Baoji_Damage[i + 1] - 1.0)
	local skill = 0.01 * I2R(HopeMeta_BaseLevel[i * 10 + 9])
	local life = 10.0 * I2R(HopeMeta_BaseLevel[i * 10 + 4]) + 2.0 * I2R(HopeMeta_BaseLevel[i * 10 + 1])
	off = off * (1.0 + 0.01 * I2R(udg_Baoji_Lv[i + 1]) * cd) / RMaxBJ(1.0, 1.0 + (0.01 * I2R(udg_Baoji_Lv[i + 1]) - crit) * cd)
	off = off * udg_Skill_Dm[i + 1] / RMaxBJ(0.01, udg_Skill_Dm[i + 1] - skill)
	off = off * hp / RMaxBJ(1.0, hp - life)
	u = nil
	return RMaxBJ(1.0, off)
end

function HopeMeta_RawOff(i)
	local j = HopeMeta_Job(i)
	local bonus = 0.01 * I2R(HopeMeta_Tal(i, 0) + HopeMeta_Tal(i, 1) + HopeMeta_Tal(i, 2) + HopeMeta_Tal(i, 3) + HopeMeta_Tal(i, 4))
	if HopeMeta_Has(HopeMeta_RunAbyss[i], 0) then
		bonus = bonus + 0.02
	end
	if j >= 0 and j < 43 then
		bonus = bonus + 0.004 * I2R(IMinBJ(5, _idiv_(HopeMeta_RunMastery[i * 43 + j], 5)))
	end
	return 1.0 + bonus
end

function HopeMeta_RawDef(i)
	local bonus = 0.01 * I2R(HopeMeta_Tal(i, 5) + HopeMeta_Tal(i, 6))
	if HopeMeta_Has(HopeMeta_RunAbyss[i], 1) then
		bonus = bonus + 0.02
	end
	return 1.0 + bonus
end

function HopeMeta_Exponent(i)
	local lo = 0.0
	local hi = 1.0
	local mid = 0.0
	local raw = HopeMeta_RawOff(i) * HopeMeta_RawDef(i)
	local sustain = 0.01 * I2R(HopeMeta_Tal(i, 7) + 2 * HopeMeta_Tal(i, 9))
	local allowance = RMaxBJ(1.0, 1.28 / HopeMeta_LegacyRatio(i))
	local j = 0
	if HopeMeta_RunKey[i] == 1 then
		sustain = sustain + 0.04
	elseif HopeMeta_RunKey[i] == 2 then
		sustain = sustain + 0.02
	end
	if HopeMeta_Has(HopeMeta_RunAbyss[i], 4) then
		sustain = sustain + 0.01
	end
	if HopeMeta_Has(HopeMeta_RunAbyss[i], 5) then
		sustain = sustain + 0.01
	end
	if raw * (1.0 + sustain) <= allowance then
		return 1.0
	end
	for _ in _loop_() do
		if j >= 12 then break end
		mid = (lo + hi) * 0.5
		if Pow(raw, mid) * (1.0 + sustain * mid) <= allowance then
			lo = mid
		else
			hi = mid
		end
		j = j + 1
	end
	return lo
end

function HopeMeta_Out(i, spell, boss, critical)
	local raw = HopeMeta_RawOff(i)
	if i < 0 or i >= 6 or not HopeMeta_Started[i] then
		return 1.0
	end
	if not spell then
		raw = raw - 0.01 * I2R(HopeMeta_Tal(i, 1))
	end
	if not boss then
		raw = raw - 0.01 * I2R(HopeMeta_Tal(i, 2))
	end
	if not critical then
		raw = raw - 0.01 * I2R(HopeMeta_Tal(i, 3))
	end
	if udg_huihe_s ~= 1 then
		raw = raw - 0.01 * I2R(HopeMeta_Tal(i, 4))
	end
	-- Critical training is a bounded expected-damage modifier, not free crit rolls.
	return Pow(RMaxBJ(1.0, raw), HopeMeta_Exponent(i))
end

function HopeMeta_CheckTurn(i)
	local u = udg_hero[i + 1]
	local turn = HopeChallenge_TurnToken()
	local hp = 0.0
	if i < 0 or i >= 6 or not HopeMeta_Started[i] or not udg_ZhandouZhong or u == nil or GetWidgetLife(u) <= 0.405 then
		u = nil
		return
	end
	if HopeMeta_LastTurn[i] ~= turn then
		HopeMeta_LastTurn[i] = turn
		HopeMeta_Hits[i] = 0
		HopeMeta_Shield[i] = 0.0
		if udg_huihe_s == 1 then
			HopeMeta_LowUsed[i] = false
			hp = 0.01 * I2R(HopeMeta_Tal(i, 9))
			if HopeMeta_RunKey[i] == 1 then
				hp = hp + 0.04
			end
			if HopeMeta_Has(HopeMeta_RunAbyss[i], 5) then
				hp = hp + 0.01
			end
			HopeMeta_Shield[i] = GetUnitState(u, UNIT_STATE_MAX_LIFE) * hp * HopeMeta_Exponent(i)
		end
	end
	if not HopeMeta_LowUsed[i] and GetWidgetLife(u) < GetUnitState(u, UNIT_STATE_MAX_LIFE) * 0.25 and HopeMeta_Tal(i, 9) > 0 then
		HopeMeta_LowUsed[i] = true
		HopeMeta_Shield[i] = HopeMeta_Shield[i] + GetUnitState(u, UNIT_STATE_MAX_LIFE) * 0.01 * I2R(HopeMeta_Tal(i, 9)) * HopeMeta_Exponent(i)
	end
	u = nil
end

function HopeMeta_PostRoom()
	local i = 0
	local u = nil
	local heal = 0.0
	for _ in _loop_() do
		if i >= 6 then break end
		u = udg_hero[i + 1]
		if HopeMeta_Started[i] and u ~= nil and GetWidgetLife(u) > 0.405 and not HopeRoute_Left[i] then
			heal = 0.01 * I2R(HopeMeta_Tal(i, 7))
			if HopeMeta_RunKey[i] == 2 then
				heal = heal + 0.02
			end
			if HopeMeta_Has(HopeMeta_RunAbyss[i], 4) then
				heal = heal + 0.01
			end
			SetWidgetLife(u, RMinBJ(GetUnitState(u, UNIT_STATE_MAX_LIFE), GetWidgetLife(u) + GetUnitState(u, UNIT_STATE_MAX_LIFE) * heal * HopeMeta_Exponent(i)))
			SetUnitState(u, UNIT_STATE_MANA, RMinBJ(GetUnitState(u, UNIT_STATE_MAX_MANA), GetUnitState(u, UNIT_STATE_MANA) + I2R(HopeMeta_Tal(i, 8))))
			AdjustPlayerStateBJ(3 * HopeMeta_Tal(i, 14), Player(i), PLAYER_STATE_RESOURCE_GOLD)
		end
		i = i + 1
	end
	u = nil
end

function HopeMeta_Win(players)
	local i = 0
	local bonus = HopeRewards_Win(udg_Yx_Nd_Dj)
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeMeta_Started[i] and not HopeMeta_Finished[i] and not HopeRoute_Left[i] then
			HopeMeta_Finished[i] = true
			udg_Wj_jf[i + 1] = udg_Wj_jf[i + 1] + bonus
			DzAPI_Map_StoreInteger(Player(i), "boss_jf", udg_Wj_jf[i + 1])
			HopeMeta_Earn(Player(i), bonus, false)
			HopeMeta_Achieve(i, udg_Yx_Nd_Dj)
			if players == 1 then
				HopeMeta_Achieve(i, 13)
			end
			if players >= 2 then
				HopeMeta_Achieve(i, 10)
			end
			if players >= 4 then
				HopeMeta_Achieve(i, 11)
			end
			if players >= 6 then
				HopeMeta_Achieve(i, 12)
			end
		end
		i = i + 1
	end
end

function HopeMeta_Tick()
	local i = 0
	local j = 0
	local u = nil
	local hp = 0.0
	local turn = 0
	for _ in _loop_() do
		if i >= 6 then break end
		HopeMeta_Load(i)
		u = udg_hero[i + 1]
		if HopeMeta_Loaded[i] and u ~= nil and GetUnitTypeId(u) ~= 0 and not HopeRoute_Left[i] then
			if not HopeMeta_Started[i] then
				HopeMeta_Started[i] = true
				if HopeMeta_Has(HopeMeta_RunAbyss[i], 3) then
					udg_CZ_czcs[i + 1] = udg_CZ_czcs[i + 1] + 1
				end
				AdjustPlayerStateBJ(10 * HopeMeta_Tal(i, 10), Player(i), PLAYER_STATE_RESOURCE_GOLD)
				AdjustPlayerStateBJ(HopeMeta_Tal(i, 11), Player(i), PLAYER_STATE_RESOURCE_LUMBER)
			end
			j = HopeMeta_Job(i)
			if j >= 0 and j < 43 and HopeJob_Stage[j] >= 1 then
				HopeMeta_Achieve(i, 14)
			end
			if HopeJob_Awakened[i + 1] then
				HopeMeta_Achieve(i, 15)
			end
			HopeMeta_CheckTurn(i)
		end
		i = i + 1
	end
	u = nil
end

function HopeMeta_Damage(source, target, amount, critical)
	local i = GetPlayerId(GetOwningPlayer(source))
	local t = GetPlayerId(GetOwningPlayer(target))
	local damage = amount
	local absorbed = 0.0
	if i >= 0 and i < 6 and GetOwningPlayer(target) == Player(11) and HopeMeta_Started[i] and amount > 0.0 then
		HopeMeta_CheckTurn(i)
		damage = damage * HopeMeta_Out(i, YDWEIsEventAttackType(ATTACK_TYPE_CHAOS) or YDWEIsEventAttackType(ATTACK_TYPE_MAGIC), HopeCoop_IsBoss(target), critical)
		if udg_huihe_s == 1 and HopeMeta_Hits[i] == 0 and HopeMeta_RunKey[i] == 1 then
			SetUnitState(udg_hero[i + 1], UNIT_STATE_MANA, RMinBJ(GetUnitState(udg_hero[i + 1], UNIT_STATE_MAX_MANA), GetUnitState(udg_hero[i + 1], UNIT_STATE_MANA) + 2.0))
		end
		HopeMeta_Hits[i] = HopeMeta_Hits[i] + 1
	end
	if t >= 0 and t < 6 and target == udg_hero[t + 1] and HopeMeta_Started[t] and GetOwningPlayer(source) == Player(11) then
		HopeMeta_CheckTurn(t)
		damage = damage / Pow(HopeMeta_RawDef(t), HopeMeta_Exponent(t))
		absorbed = RMinBJ(damage, HopeMeta_Shield[t])
		HopeMeta_Shield[t] = HopeMeta_Shield[t] - absorbed
		damage = damage - absorbed
	end
	return RMaxBJ(0.0, damage)
end

function HopeMeta_Size(f, w, h)
	if f ~= 0 then
		DzFrameSetSize(f, w, h)
	end
end

function HopeMeta_Texture(f, path, flag)
	if f ~= 0 then
		DzFrameSetTexture(f, path, flag)
	end
end

function HopeMeta_Font(f, path, size, flag)
	if f ~= 0 then
		DzFrameSetFont(f, path, size, flag)
	end
end

function HopeMeta_Config()
	HopeMeta_NodeName[0] = "武器训练"
	HopeMeta_NodeDesc[0] = "基础/技能伤害每级+1%"
	HopeMeta_NodeCost[0] = 30
	HopeMeta_NodePrereq[0] = -1
	HopeMeta_NodeName[1] = "术式训练"
	HopeMeta_NodeDesc[1] = "技能伤害每级+1%；前置武器训练"
	HopeMeta_NodeCost[1] = 35
	HopeMeta_NodePrereq[1] = 0
	HopeMeta_NodeName[2] = "猎王"
	HopeMeta_NodeDesc[2] = "对BOSS伤害每级+1%；前置武器训练"
	HopeMeta_NodeCost[2] = 40
	HopeMeta_NodePrereq[2] = 0
	HopeMeta_NodeName[3] = "会心节奏"
	HopeMeta_NodeDesc[3] = "暴击伤害额外每级+1%；前置术式训练"
	HopeMeta_NodeCost[3] = 40
	HopeMeta_NodePrereq[3] = 1
	HopeMeta_NodeName[4] = "先攻"
	HopeMeta_NodeDesc[4] = "每场首回合伤害每级+1%；前置猎王"
	HopeMeta_NodeCost[4] = 45
	HopeMeta_NodePrereq[4] = 2
	HopeMeta_NodeName[5] = "坚韧"
	HopeMeta_NodeDesc[5] = "等效生命每级+1%（减伤实现）"
	HopeMeta_NodeCost[5] = 30
	HopeMeta_NodePrereq[5] = -1
	HopeMeta_NodeName[6] = "护体"
	HopeMeta_NodeDesc[6] = "等效护甲防护每级+1%；前置坚韧"
	HopeMeta_NodeCost[6] = 35
	HopeMeta_NodePrereq[6] = 5
	HopeMeta_NodeName[7] = "战后休整"
	HopeMeta_NodeDesc[7] = "胜利后回复生命每级1%；前置坚韧"
	HopeMeta_NodeCost[7] = 35
	HopeMeta_NodePrereq[7] = 5
	HopeMeta_NodeName[8] = "冥想"
	HopeMeta_NodeDesc[8] = "战后恢复魔法每级1；前置战后休整"
	HopeMeta_NodeCost[8] = 35
	HopeMeta_NodePrereq[8] = 7
	HopeMeta_NodeName[9] = "应急护盾"
	HopeMeta_NodeDesc[9] = "首回合/每场首次低于25%生命：护盾每级1%；前置护体"
	HopeMeta_NodeCost[9] = 45
	HopeMeta_NodePrereq[9] = 6
	HopeMeta_NodeName[10] = "行囊"
	HopeMeta_NodeDesc[10] = "开局金币每级+10"
	HopeMeta_NodeCost[10] = 25
	HopeMeta_NodePrereq[10] = -1
	HopeMeta_NodeName[11] = "木材储备"
	HopeMeta_NodeDesc[11] = "开局木材每级+1；前置行囊"
	HopeMeta_NodeCost[11] = 35
	HopeMeta_NodePrereq[11] = 10
	HopeMeta_NodeName[12] = "再试一次"
	HopeMeta_NodeDesc[12] = "积分重随费用每级-1（最低2）；前置行囊"
	HopeMeta_NodeCost[12] = 35
	HopeMeta_NodePrereq[12] = 10
	HopeMeta_NodeName[13] = "遗物先机"
	HopeMeta_NodeDesc[13] = "首次正常遗物奖励4选1；2/3级免费重选1/2次；前置木材储备"
	HopeMeta_NodeCost[13] = 50
	HopeMeta_NodePrereq[13] = 11
	HopeMeta_NodeName[14] = "战后补给"
	HopeMeta_NodeDesc[14] = "每场胜利金币每级+3；前置再试一次"
	HopeMeta_NodeCost[14] = 35
	HopeMeta_NodePrereq[14] = 12
	HopeMeta_AbyssName[0] = "深渊锋芒"
	HopeMeta_AbyssDesc[0] = "伤害+2%，计入统一预算"
	HopeMeta_AbyssCost[0] = 30
	HopeMeta_AbyssName[1] = "深渊护身"
	HopeMeta_AbyssDesc[1] = "等效防护+2%，计入统一预算"
	HopeMeta_AbyssCost[1] = 30
	HopeMeta_AbyssName[2] = "遗物先机"
	HopeMeta_AbyssDesc[2] = "首次正常遗物奖励4选1；不额外赠送遗物"
	HopeMeta_AbyssCost[2] = 40
	HopeMeta_AbyssName[3] = "成长试错"
	HopeMeta_AbyssDesc[3] = "每局免费成长重随+1"
	HopeMeta_AbyssCost[3] = 25
	HopeMeta_AbyssName[4] = "静养"
	HopeMeta_AbyssDesc[4] = "战后回血+1%，计入统一预算"
	HopeMeta_AbyssCost[4] = 30
	HopeMeta_AbyssName[5] = "护航"
	HopeMeta_AbyssDesc[5] = "首回合护盾+1%，计入统一预算"
	HopeMeta_AbyssCost[5] = 30
	HopeMeta_AchName[0] = "初见守门人"
	HopeMeta_AchName[1] = "简单通关"
	HopeMeta_AchName[2] = "普通通关"
	HopeMeta_AchName[3] = "困难通关"
	HopeMeta_AchName[4] = "极难通关"
	HopeMeta_AchName[5] = "炼狱通关"
	HopeMeta_AchName[6] = "无限5轮"
	HopeMeta_AchName[7] = "无限10轮"
	HopeMeta_AchName[8] = "无限20轮"
	HopeMeta_AchName[9] = "无限30轮"
	HopeMeta_AchName[10] = "双人同行"
	HopeMeta_AchName[11] = "四人同行"
	HopeMeta_AchName[12] = "六人同行"
	HopeMeta_AchName[13] = "独自登顶"
	HopeMeta_AchName[14] = "初次转职"
	HopeMeta_AchName[15] = "觉醒三转"
	HopeMeta_AchName[16] = "首件遗物"
	HopeMeta_AchName[17] = "图鉴10件"
	HopeMeta_AchName[18] = "图鉴20件"
	HopeMeta_AchName[19] = "图鉴44件"
	HopeMeta_AchName[20] = "职业精通5级"
	HopeMeta_AchName[21] = "五项天赋"
	HopeMeta_AchName[22] = "累计下限1000"
	HopeMeta_AchName[23] = "20成就里程碑"
end

function HopeMeta_ConfigBrief()
	HopeMeta_NodeBrief[0] = "基础/技能伤害每级+1%"
	HopeMeta_NodeBrief[1] = "技能伤害每级+1%"
	HopeMeta_NodeBrief[2] = "对BOSS伤害每级+1%"
	HopeMeta_NodeBrief[3] = "暴击伤害每级额外+1%"
	HopeMeta_NodeBrief[4] = "首回合伤害每级+1%"
	HopeMeta_NodeBrief[5] = "等效生命每级+1%"
	HopeMeta_NodeBrief[6] = "等效护甲防护每级+1%"
	HopeMeta_NodeBrief[7] = "胜利后回血每级1%"
	HopeMeta_NodeBrief[8] = "战后恢复魔法每级1"
	HopeMeta_NodeBrief[9] = "首回合/首次低血护盾每级1%"
	HopeMeta_NodeBrief[10] = "开局金币每级+10"
	HopeMeta_NodeBrief[11] = "开局木材每级+1"
	HopeMeta_NodeBrief[12] = "重随费用每级-1，最低2"
	HopeMeta_NodeBrief[13] = "首遗物4选1；2/3级重选1/2次"
	HopeMeta_NodeBrief[14] = "胜利后金币每级+3"
end

function HopeMeta_Close()
	HopeMeta_Open = false
end

function HopeMeta_Show()
	HopeMeta_Open = true
	HopeLayout_Focus(15)
end

function HopeMeta_Toggle()
	if HopeMeta_Open then
		HopeMeta_Close()
	else
		HopeMeta_Show()
	end
end

function HopeMeta_Prev()
	HopeMeta_Page = IMaxBJ(0, HopeMeta_Page - 1)
end

function HopeMeta_Next()
	HopeMeta_Page = HopeMeta_Page + 1
end

function HopeMeta_ResetClick()
	HopeMeta_Reset(DzGetTriggerUIEventPlayer())
end

function HopeMeta_RelicIndex(itemId)
	local j = 0
	for _ in _loop_() do
		if j >= 44 then break end
		if HopeRelic_Item(j) == itemId then
			return j
		end
		j = j + 1
	end
	return -1
end

function HopeMeta_FillSeed(i, original)
	local slot = 0
	local attempts = 0
	local candidate = -1
	local j = 0
	local itemId = 0
	local limit = IMinBJ(4, 44 - HopeRelic_Total(Player(i)))
	local duplicate = false
	local drawn = nil
	HopeMeta_SeedCount[i] = 0
	for _ in _loop_() do
		if slot >= limit or attempts >= 32 then break end
		attempts = attempts + 1
		if original and attempts <= 3 then
			itemId = HopeMeta_SupplyItem[attempts - 1]
		else
			drawn = PlaceRandomItem(udg_YiwuChi[i + 1], 2706.0, 2100.0)
			if drawn == nil then
				if true then break end
			end
			itemId = GetItemTypeId(drawn)
			RemoveItem(drawn)
			drawn = nil
		end
		candidate = HopeMeta_RelicIndex(itemId)
		duplicate = candidate < 0
		if candidate >= 0 and HopeRelic_Owned(Player(i), candidate) then
			duplicate = true
		end
		j = 0
		for _ in _loop_() do
			if j >= slot then break end
			if HopeMeta_SeedCandidate[i * 4 + j] == candidate then
				duplicate = true
			end
			j = j + 1
		end
		if not duplicate then
			HopeMeta_SeedCandidate[i * 4 + slot] = candidate
			slot = slot + 1
			HopeMeta_SeedCount[i] = slot
		end
	end
	drawn = nil
end

function HopeMeta_OfferRelic()
	local i = HopeMeta_SupplyOwner
	local p = Player(i)
	local j = 0
	local fallback = ""
	if i < 0 or i >= 6 or not HopeMeta_Started[i] or HopeMeta_FirstRelic[i] > 0 or udg_YiwuChi[i + 1] == nil then
		p = nil
		return
	end
	if not HaveSavedInteger(YDHT, GetHandleId(udg_Youxi_xzgq), -74861460) then
		p = nil
		return
	end
	if HopeMeta_Tal(i, 13) <= 0 and HopeMeta_RunKey[i] ~= 3 and not HopeMeta_Has(HopeMeta_RunAbyss[i], 2) then
		p = nil
		return
	end
	HopeMeta_FillSeed(i, true)
	if HopeMeta_SeedCount[i] <= 0 then
		p = nil
		return
	end
	HopeMeta_FirstRelic[i] = 1
	HopeMeta_SeedPending[i] = true
	HopeMeta_SeedCharges[i] = IMaxBJ(0, HopeMeta_Tal(i, 13) - 1)
	if HopeMeta_RunKey[i] == 3 then
		HopeMeta_SeedCharges[i] = HopeMeta_SeedCharges[i] + 1
	end
	-- Consume the original claim token on every peer. This pending picker replaces
	-- its three buttons; it never creates a second independent relic reward.
	SaveBoolean(YDHT, GetHandleId(p), -1422318988, true)
	if p == GetLocalPlayer() then
		if HopeMeta_Panel == 0 then
			for _ in _loop_() do
				if j >= HopeMeta_SeedCount[i] then break end
				fallback = (fallback or "") .. (I2S(j + 1) or "") .. ". " .. (HopeRelic_Name(HopeMeta_SeedCandidate[i * 4 + j]) or "") .. "|n"
				j = j + 1
			end
			DisplayTimedTextToPlayer(p, 0, 0, 30.0, "遗物选择界面未能创建。输入 -relic 1（或其他序号）领取：|n" .. (fallback or ""))
		end
		HopeMeta_Open = true
		HopeMeta_Tab = 6
		HopeMeta_Page = 0
		HopeLayout_Focus(15)
	end
	p = nil
end

function HopeMeta_SeedTake(p, slot)
	local i = GetPlayerId(p)
	local index = 0
	local gift = nil
	if i < 0 or i >= 6 or not HopeMeta_SeedPending[i] or udg_ZhandouZhong or udg_Yiwu_danwei[i + 1] == nil then
		return
	end
	if slot < 0 or slot >= HopeMeta_SeedCount[i] then
		return
	end
	index = HopeMeta_SeedCandidate[i * 4 + slot]
	-- Grant via the original relic holder and pickup handler; all original effects
	-- and permanent discovery mapping use the same path as ordinary relic rewards.
	HopeMeta_SeedPending[i] = false
	gift = UnitAddItemById(udg_Yiwu_danwei[i + 1], HopeRelic_Item(index))
	if gift == nil then
		HopeMeta_SeedPending[i] = true
		DisplayTextToPlayer(p, 0, 0, "遗物未能发放，请清理遗物单位的物品位后重试。")
	else
		DisplayTextToPlayer(p, 0, 0, "遗物先机：" .. (HopeRelic_Name(index) or "") .. "。")
	end
	gift = nil
end

function HopeMeta_SeedChat()
	-- Synchronized recovery path if a client cannot create the choice frames.
	HopeMeta_SeedTake(GetTriggerPlayer(), S2I(SubString(GetEventPlayerChatString(), 7, 8)) - 1)
end

function HopeMeta_SeedReroll()
	local p = DzGetTriggerUIEventPlayer()
	local i = GetPlayerId(p)
	if i >= 0 and i < 6 and HopeMeta_SeedPending[i] and HopeMeta_SeedCharges[i] > 0 and not udg_ZhandouZhong then
		HopeMeta_SeedCharges[i] = HopeMeta_SeedCharges[i] - 1
		HopeMeta_FillSeed(i, false)
	end
	p = nil
end

function HopeMeta_SeedLeave()
	HopeMeta_SeedHover = -1
end

function HopeMeta_Refresh()
	local i = GetPlayerId(GetLocalPlayer())
	local j = 0
	local node = 0
	local level = 0
	local pages = 1
	local count = 0
	local off = 1.0
	local def = 1.0
	local text = ""
	local line = ""
	local flag = ""
	local catalog = 0
	local prereq = 0
	if HopeMeta_Panel == 0 or i < 0 or i >= 6 then
		return
	end
	HopeLayout_Show(HopeMeta_Panel, HopeMeta_Open)
	HopeLayout_Show(HopeMeta_Entry, not HopeMeta_Open)
	HopeLayout_Show(HopeMeta_SeedInfoPanel, HopeMeta_Open and HopeMeta_Tab == 6 and HopeMeta_SeedPending[i])
	if HopeMeta_Open and HopeMeta_Tab == 6 and HopeMeta_SeedPending[i] and HopeMeta_SeedHover >= 0 and HopeMeta_SeedHover < HopeMeta_SeedCount[i] then
		catalog = HopeMeta_SeedCandidate[i * 4 + HopeMeta_SeedHover]
		HopeJob_SetText(HopeMeta_SeedInfoText, "|cffd2b879" .. (HopeRelic_Name(catalog) or "") .. "|r|n|n" .. (HopeRelic_Description(catalog, 0) or "") .. "|n" .. (HopeRelic_Description(catalog, 1) or ""))
	else
		HopeJob_SetText(HopeMeta_SeedInfoText, "将鼠标移到左侧候选，|n这里会显示完整遗物效果。|n|n关闭面板不会领取或丢弃奖励；|n可先查看角色，再回来选择。")
	end
	if not HopeMeta_Open then
		return
	end
	if HopeMeta_Tab == 1 then
		pages = 2
	elseif HopeMeta_Tab == 3 then
		pages = 3
	elseif HopeMeta_Tab == 4 then
		pages = 44
	elseif HopeMeta_Tab == 5 then
		pages = 6
	end
	HopeMeta_Page = IMaxBJ(0, IMinBJ(pages - 1, HopeMeta_Page))
	HopeJob_SetText(HopeMeta_Heading, "|cffd2b879局外成长 · 1.0.4 UI2|r  积分 " .. (I2S(udg_Wj_jf[i + 1]) or "") .. " / 魂晶 " .. (I2S(HopeMeta_Soul[i]) or ""))
	for _ in _loop_() do
		if j >= 24 then break end
		HopeLayout_Show(HopeMeta_BuyButton[j], false)
		j = j + 1
	end
	j = 0
	for _ in _loop_() do
		if j >= 4 then break end
		HopeLayout_Show(HopeMeta_SeedButton[j], false)
		j = j + 1
	end
	j = 0
	for _ in _loop_() do
		if j >= 3 then break end
		HopeLayout_Show(HopeMeta_TreeHeading[j], HopeMeta_Loaded[i] and HopeMeta_Tab == 1 and HopeMeta_Page == 0)
		j = j + 1
	end
	HopeLayout_Show(HopeMeta_ResetButton, HopeMeta_Loaded[i] and HopeMeta_Tab == 1)
	HopeLayout_Show(HopeMeta_SeedRerollButton, HopeMeta_Tab == 6 and HopeMeta_SeedPending[i] and HopeMeta_SeedCharges[i] > 0)
	if HopeMeta_Loaded[i] and HopeMeta_Tab == 6 and HopeMeta_SeedPending[i] then
		HopeMeta_Size(HopeMeta_Body, 0.548, 0.043)
	else
		HopeMeta_Size(HopeMeta_Body, 0.548, 0.263)
	end
	if not HopeMeta_Loaded[i] then
		text = "云档未就绪。请从KK RPG大厅或作者测试大厅启动。|n旧档读取失败时不创建新档、不覆盖旧余额。|n本局仍可进行普通战斗，但永久成长不可购买。|n|n输入 -save 可查看平台载入诊断。"
	elseif HopeMeta_Tab == 0 then
		text = "|cffd2b879爬塔等级 " .. (I2S(1 + R2I(SquareRoot(I2R(HopeMeta_Xp[i]) / 100.0))) or "") .. "|r · 累计已记录积分 " .. (I2S(HopeMeta_Xp[i]) or "") .. "|n|n已购基础成长 · 在原存档页购买|n"
		j = 0
		for _ in _loop_() do
			if j >= 10 then break end
			level = HopeArchive_Count(Player(i), j)
			text = (text or "") .. (GetAbilityName(HopeArchive_Ability(j)) or "") .. " " .. (I2S(level) or "") .. "/5次"
			if ModuloInteger(j, 2) == 0 then
				text = (text or "") .. "    "
			else
				text = (text or "") .. "|n"
			end
			j = j + 1
		end
		catalog = HopeMeta_Count(HopeMeta_Relic[i * 2]) + HopeMeta_Count(HopeMeta_Relic[i * 2 + 1])
		text = (text or "") .. "|n成就 " .. (I2S(HopeMeta_Count(HopeMeta_Ach[i])) or "") .. "/24 · 图鉴 " .. (I2S(catalog) or "") .. "/44 · 无限最高 " .. (I2S(HopeMeta_Best[i]) or "") .. "轮|n"
		if HopeMeta_Started[i] then
			off = HopeMeta_Out(i, true, true, true)
			def = Pow(HopeMeta_RawDef(i), HopeMeta_Exponent(i))
			text = (text or "") .. "本局新增伤害上限 +" .. (I2S(R2I((off - 1.0) * 100.0)) or "") .. "% · 新增防护 +" .. (I2S(R2I((def - 1.0) * 100.0)) or "") .. "%|n"
		end
		text = (text or "") .. "|n天赋 / 基石 / 深渊：购买与重置均在下一局生效。|n旧档余额与购买完整保留；未知历史花费不计入累计。"
	elseif HopeMeta_Tab == 1 then
		if HopeMeta_Page == 0 then
			j = 0
			for _ in _loop_() do
				if j >= 15 then break end
				level = HopeMeta_Level(HopeMeta_Talent[i * 3 + _idiv_(j, 5)], ModuloInteger(j, 5))
				prereq = HopeMeta_NodePrereq[j]
				line = "无需前置"
				if prereq >= 0 then
					line = "前置：" .. (HopeMeta_NodeName[prereq] or "")
					if HopeMeta_Level(HopeMeta_Talent[i * 3 + _idiv_(prereq, 5)], ModuloInteger(prereq, 5)) <= 0 then
						line = "|cffdf9c85" .. (line or "") .. "（未学）|r"
					else
						line = "|cff9ddbaf" .. (line or "") .. "（已学）|r"
					end
				end
				HopeLayout_Show(HopeMeta_BuyButton[j], true)
				if level >= 3 then
					flag = "|cff9ddbaf已满级|r"
				else
					flag = "升级：" .. (I2S(HopeMeta_NodeCost[j] * (level + 1)) or "") .. "积分"
				end
				HopeJob_SetText(HopeMeta_BuyText[j], "|cffd2b879" .. (HopeMeta_NodeName[j] or "") .. " · " .. (I2S(level) or "") .. "/3|r|n" .. (HopeMeta_NodeBrief[j] or "") .. "|n" .. (line or "") .. "|n" .. (flag or ""))
				j = j + 1
			end
		-- The three mutually exclusive keystones appear together on the second page.
		else
			text = "|cffd2b879基石 · 三选一|r|n三者互斥，购买下一局生效；重置天赋会同时返还基石花费。"
			j = 21
			for _ in _loop_() do
				if j >= 24 then break end
				HopeLayout_Show(HopeMeta_BuyButton[j], true)
				if j == 21 then
					line = "先阵|r|n|n每场首回合获得4%生命护盾；|n首个命中回复2魔法。"
				elseif j == 22 then
					line = "休整|r|n|n每场胜利额外回复2%生命。"
				else
					line = "探索|r|n|n首次正常遗物奖励4选1；|n免费重选候选一次。"
				end
				flag = "80积分 · 选择"
				if HopeMeta_Keystone[i] == j - 20 then
					flag = "|cff9ddbaf已选择|r"
				elseif HopeMeta_Keystone[i] > 0 then
					flag = "已选择其他基石"
				end
				HopeJob_SetText(HopeMeta_BuyText[j], "|cffd2b879" .. (line or "") .. "|n|n" .. (flag or ""))
				j = j + 1
			end
		end
		pages = 2
	elseif HopeMeta_Tab == 2 then
		text = "消耗魂晶解锁，下一局生效；已解锁的项目不会重复扣费。"
		j = 0
		for _ in _loop_() do
			if j >= 6 then break end
			flag = "未解锁"
			if HopeMeta_Has(HopeMeta_Abyss[i], j) then
				flag = "已解锁"
			end
			HopeLayout_Show(HopeMeta_BuyButton[15 + j], true)
			HopeJob_SetText(HopeMeta_BuyText[15 + j], "|cffd2b879" .. (HopeMeta_AbyssName[j] or "") .. " · " .. (flag or "") .. "|r|n|n" .. (HopeMeta_AbyssDesc[j] or "") .. "|n|n" .. (I2S(HopeMeta_AbyssCost[j]) or "") .. "魂晶 · 解锁")
			j = j + 1
		end
	elseif HopeMeta_Tab == 3 then
		pages = 3
		j = HopeMeta_Page * 8
		for _ in _loop_() do
			if j >= 24 or j >= (HopeMeta_Page + 1) * 8 then break end
			flag = "未完成"
			if HopeMeta_Has(HopeMeta_Ach[i], j) then
				flag = "|cff9ddbaf已完成|r"
			end
			text = (text or "") .. (I2S(j + 1) or "") .. ". " .. (HopeMeta_AchName[j] or "") .. " · " .. (flag or "") .. "|n|n"
			j = j + 1
		end
		text = (text or "") .. "每项首次完成奖励5积分；20项是里程碑，24项才全收集。"
	elseif HopeMeta_Tab == 4 then
		pages = 44
		j = HopeMeta_Page
		flag = "未发现"
		if HopeMeta_Has(HopeMeta_Relic[i * 2 + _idiv_(j, 22)], ModuloInteger(j, 22)) then
			flag = "|cff9ddbaf已发现|r"
		end
		text = "|cffd2b879" .. (I2S(j + 1) or "") .. ". " .. (HopeRelic_Name(j) or "") .. "|r · " .. (flag or "") .. "|n|n" .. (HopeRelic_Description(j, 0) or "") .. "|n" .. (HopeRelic_Description(j, 1) or "") .. "|n|n首次获得即记录图鉴；本页不代表本局持有。"
	elseif HopeMeta_Tab == 5 then
		pages = 6
		j = HopeMeta_Page * 8
		for _ in _loop_() do
			if j >= 43 or j >= (HopeMeta_Page + 1) * 8 then break end
			level = IMinBJ(5, _idiv_(HopeMeta_Mastery[i * 43 + j], 5))
			text = (text or "") .. (HopeJob_Name[j] or "") .. " · 精通 " .. (I2S(level) or "") .. "/5 · 守门人经验 " .. (I2S(HopeMeta_Mastery[i * 43 + j]) or "") .. "|n|n"
			j = j + 1
		end
		text = (text or "") .. "每5次BOSS结算升1级；当前职业伤害每级+0.4%，满级2%。|n零熟练度无需补刷；三转单独记录；下局载入成长。"
	elseif HopeMeta_Tab == 6 then
		if HopeMeta_SeedPending[i] then
			text = "首次遗物奖励 · " .. (I2S(HopeMeta_SeedCount[i]) or "") .. "选1|n悬停看右侧完整效果；免费重选 " .. (I2S(HopeMeta_SeedCharges[i]) or "") .. "次。"
			count = HopeMeta_SeedCount[i]
			j = 0
			for _ in _loop_() do
				if j >= count then break end
				catalog = HopeMeta_SeedCandidate[i * 4 + j]
				HopeLayout_Show(HopeMeta_SeedButton[j], true)
				HopeMeta_Texture(HopeMeta_SeedIcon[j], HopeRelic_IconPath(catalog), 0)
				HopeJob_SetText(HopeMeta_SeedText[j], "|cffd2b879" .. (HopeRelic_Name(catalog) or "") .. "|r|n悬停查看效果 · 点击领取")
				j = j + 1
			end
		else
			text = "本局没有待选遗物先机。|n资源系先机、探索基石、深渊先机任选一种即可解锁。|n第一次正常遗物奖励3选1变4选1，不会额外赠送遗物。|n资源天赋2/3级额外允许1/2次候选重选。|n其他普通遗物奖励沿用原版选择流程。"
		end
	end
	HopeMeta_Page = IMaxBJ(0, IMinBJ(pages - 1, HopeMeta_Page))
	HopeJob_SetText(HopeMeta_Body, text)
	HopeJob_SetText(HopeMeta_Status, "页 " .. (I2S(HopeMeta_Page + 1) or "") .. "/" .. (I2S(pages) or "") .. " · " .. (HopeCloud_Status(Player(i)) or ""))
end

function HopeMeta_Buy0()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 0)
end

function HopeMeta_Buy1()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 1)
end

function HopeMeta_Buy2()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 2)
end

function HopeMeta_Buy3()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 3)
end

function HopeMeta_Buy4()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 4)
end

function HopeMeta_Buy5()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 5)
end

function HopeMeta_Buy6()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 6)
end

function HopeMeta_Buy7()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 7)
end

function HopeMeta_Buy8()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 8)
end

function HopeMeta_Buy9()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 9)
end

function HopeMeta_Buy10()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 10)
end

function HopeMeta_Buy11()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 11)
end

function HopeMeta_Buy12()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 12)
end

function HopeMeta_Buy13()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 13)
end

function HopeMeta_Buy14()
	HopeMeta_BuyTalent(DzGetTriggerUIEventPlayer(), 14)
end

function HopeMeta_Buy15()
	HopeMeta_BuyAbyss(DzGetTriggerUIEventPlayer(), 0)
end

function HopeMeta_Buy16()
	HopeMeta_BuyAbyss(DzGetTriggerUIEventPlayer(), 1)
end

function HopeMeta_Buy17()
	HopeMeta_BuyAbyss(DzGetTriggerUIEventPlayer(), 2)
end

function HopeMeta_Buy18()
	HopeMeta_BuyAbyss(DzGetTriggerUIEventPlayer(), 3)
end

function HopeMeta_Buy19()
	HopeMeta_BuyAbyss(DzGetTriggerUIEventPlayer(), 4)
end

function HopeMeta_Buy20()
	HopeMeta_BuyAbyss(DzGetTriggerUIEventPlayer(), 5)
end

function HopeMeta_Buy21()
	HopeMeta_Key(DzGetTriggerUIEventPlayer(), 1)
end

function HopeMeta_Buy22()
	HopeMeta_Key(DzGetTriggerUIEventPlayer(), 2)
end

function HopeMeta_Buy23()
	HopeMeta_Key(DzGetTriggerUIEventPlayer(), 3)
end

function HopeMeta_Tab0()
	HopeMeta_Tab = 0
	HopeMeta_Page = 0
end

function HopeMeta_Tab1()
	HopeMeta_Tab = 1
	HopeMeta_Page = 0
end

function HopeMeta_Tab2()
	HopeMeta_Tab = 2
	HopeMeta_Page = 0
end

function HopeMeta_Tab3()
	HopeMeta_Tab = 3
	HopeMeta_Page = 0
end

function HopeMeta_Tab4()
	HopeMeta_Tab = 4
	HopeMeta_Page = 0
end

function HopeMeta_Tab5()
	HopeMeta_Tab = 5
	HopeMeta_Page = 0
end

function HopeMeta_Tab6()
	HopeMeta_Tab = 6
	HopeMeta_Page = 0
end

function HopeMeta_Seed0()
	HopeMeta_SeedTake(DzGetTriggerUIEventPlayer(), 0)
end

function HopeMeta_Seed1()
	HopeMeta_SeedTake(DzGetTriggerUIEventPlayer(), 1)
end

function HopeMeta_Seed2()
	HopeMeta_SeedTake(DzGetTriggerUIEventPlayer(), 2)
end

function HopeMeta_Seed3()
	HopeMeta_SeedTake(DzGetTriggerUIEventPlayer(), 3)
end

function HopeMeta_SeedEnter0()
	HopeMeta_SeedHover = 0
end

function HopeMeta_SeedEnter1()
	HopeMeta_SeedHover = 1
end

function HopeMeta_SeedEnter2()
	HopeMeta_SeedHover = 2
end

function HopeMeta_SeedEnter3()
	HopeMeta_SeedHover = 3
end

function HopeMeta_Create()
	local f = 0
	local i = 0
	local recovery = CreateTrigger()
	HopeMeta_Config()
	HopeMeta_ConfigBrief()
	-- Gameplay progression must continue even if the frame backend fails.
	TimerStart(CreateTimer(), 0.5, true, HopeMeta_Tick)
	DzTriggerRegisterKeyEventByCode(nil, 118, 1, false, HopeMeta_Toggle)
	for _ in _loop_() do
		if i >= 6 then break end
		TriggerRegisterPlayerChatEvent(recovery, Player(i), "-relic ", false)
		i = i + 1
	end
	TriggerAddAction(recovery, HopeMeta_SeedChat)
	recovery = nil
	HopeMeta_Panel = HopeQoL_Surface("HopeMetaPanel", 0.116, 0.54, 0.568, 0.368)
	if HopeMeta_Panel == 0 then
		return
	end
	HopeMeta_Heading = HopeQoL_Label("HopeMetaHeading", HopeMeta_Panel, 0.01, -0.008, 0.49, 0.02, "")
	f = HopeQoL_Button("HopeMetaClose", HopeMeta_Panel, 0.513, -0.007, 0.045, 0.021, "关闭")
	HopeQoL_Bind(f, HopeMeta_Close, false)
	HopeMeta_Body = HopeQoL_Label("HopeMetaBody", HopeMeta_Panel, 0.01, -0.071, 0.548, 0.263, "")
	HopeMeta_Font(HopeMeta_Body, "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeMeta_Status = HopeQoL_Label("HopeMetaStatus", HopeMeta_Panel, 0.01, -0.348, 0.31, 0.016, "")
	HopeMeta_Font(HopeMeta_Status, "Fonts\\ZiTi.ttf", 0.008, 0)
	f = HopeQoL_Button("HopeMetaPrev", HopeMeta_Panel, 0.488, -0.344, 0.03, 0.02, "<")
	HopeQoL_Bind(f, HopeMeta_Prev, false)
	f = HopeQoL_Button("HopeMetaNext", HopeMeta_Panel, 0.528, -0.344, 0.03, 0.02, ">")
	HopeQoL_Bind(f, HopeMeta_Next, false)
	HopeMeta_Entry = HopeQoL_Button("HopeMetaEntry", DzGetGameUI(), 0.16, 0.196, 0.1, 0.021, "局外成长")
	HopeQoL_Bind(HopeMeta_Entry, HopeMeta_Show, false)
	HopeMeta_ArchiveEntry = HopeQoL_Button("HopeMetaArchiveEntry", HopeArchive_Panel, 0.214, -0.007, 0.081, 0.021, "局外成长")
	HopeQoL_Bind(HopeMeta_ArchiveEntry, HopeMeta_Show, false)
	HopeMeta_ResetButton = HopeQoL_Button("HopeMetaReset", HopeMeta_Panel, 0.33, -0.344, 0.145, 0.02, "重置天赋 · 10积分")
	HopeQoL_Bind(HopeMeta_ResetButton, HopeMeta_ResetClick, true)
	HopeMeta_SeedRerollButton = HopeQoL_Button("HopeMetaSeedReroll", HopeMeta_Panel, 0.45, -0.087, 0.1, 0.023, "重选先机")
	HopeQoL_Bind(HopeMeta_SeedRerollButton, HopeMeta_SeedReroll, true)
	HopeMeta_TabButton[0] = HopeQoL_Button("HopeMetaTab0", HopeMeta_Panel, 0.01, -0.034, 0.076, 0.022, "总览")
	HopeQoL_Bind(HopeMeta_TabButton[0], HopeMeta_Tab0, false)
	HopeMeta_TabButton[1] = HopeQoL_Button("HopeMetaTab1", HopeMeta_Panel, 0.088, -0.034, 0.076, 0.022, "天赋")
	HopeQoL_Bind(HopeMeta_TabButton[1], HopeMeta_Tab1, false)
	HopeMeta_TabButton[2] = HopeQoL_Button("HopeMetaTab2", HopeMeta_Panel, 0.166, -0.034, 0.076, 0.022, "深渊")
	HopeQoL_Bind(HopeMeta_TabButton[2], HopeMeta_Tab2, false)
	HopeMeta_TabButton[3] = HopeQoL_Button("HopeMetaTab3", HopeMeta_Panel, 0.244, -0.034, 0.076, 0.022, "成就")
	HopeQoL_Bind(HopeMeta_TabButton[3], HopeMeta_Tab3, false)
	HopeMeta_TabButton[4] = HopeQoL_Button("HopeMetaTab4", HopeMeta_Panel, 0.322, -0.034, 0.076, 0.022, "图鉴")
	HopeQoL_Bind(HopeMeta_TabButton[4], HopeMeta_Tab4, false)
	HopeMeta_TabButton[5] = HopeQoL_Button("HopeMetaTab5", HopeMeta_Panel, 0.4, -0.034, 0.076, 0.022, "熟练度")
	HopeQoL_Bind(HopeMeta_TabButton[5], HopeMeta_Tab5, false)
	HopeMeta_TabButton[6] = HopeQoL_Button("HopeMetaTab6", HopeMeta_Panel, 0.478, -0.034, 0.076, 0.022, "遗物先机")
	HopeQoL_Bind(HopeMeta_TabButton[6], HopeMeta_Tab6, false)
	HopeMeta_TreeHeading[0] = HopeQoL_Label("HopeMetaTree0", HopeMeta_Panel, 0.01, -0.064, 0.174, 0.016, "输出 · 每项3级")
	HopeMeta_TreeHeading[1] = HopeQoL_Label("HopeMetaTree1", HopeMeta_Panel, 0.194, -0.064, 0.174, 0.016, "生存 · 每项3级")
	HopeMeta_TreeHeading[2] = HopeQoL_Label("HopeMetaTree2", HopeMeta_Panel, 0.378, -0.064, 0.174, 0.016, "资源 · 每项3级")
	HopeMeta_BuyButton[0] = HopeQoL_Button("HopeMetaBuy0", HopeMeta_Panel, 0.01, -0.085, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[0], HopeMeta_Buy0, true)
	if HopeMeta_BuyButton[0] ~= 0 then
		HopeMeta_BuyText[0] = HopeQoL_Label("HopeMetaBuyText0", HopeMeta_BuyButton[0], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[0], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[1] = HopeQoL_Button("HopeMetaBuy1", HopeMeta_Panel, 0.01, -0.135, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[1], HopeMeta_Buy1, true)
	if HopeMeta_BuyButton[1] ~= 0 then
		HopeMeta_BuyText[1] = HopeQoL_Label("HopeMetaBuyText1", HopeMeta_BuyButton[1], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[1], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[2] = HopeQoL_Button("HopeMetaBuy2", HopeMeta_Panel, 0.01, -0.185, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[2], HopeMeta_Buy2, true)
	if HopeMeta_BuyButton[2] ~= 0 then
		HopeMeta_BuyText[2] = HopeQoL_Label("HopeMetaBuyText2", HopeMeta_BuyButton[2], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[2], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[3] = HopeQoL_Button("HopeMetaBuy3", HopeMeta_Panel, 0.01, -0.235, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[3], HopeMeta_Buy3, true)
	if HopeMeta_BuyButton[3] ~= 0 then
		HopeMeta_BuyText[3] = HopeQoL_Label("HopeMetaBuyText3", HopeMeta_BuyButton[3], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[3], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[4] = HopeQoL_Button("HopeMetaBuy4", HopeMeta_Panel, 0.01, -0.285, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[4], HopeMeta_Buy4, true)
	if HopeMeta_BuyButton[4] ~= 0 then
		HopeMeta_BuyText[4] = HopeQoL_Label("HopeMetaBuyText4", HopeMeta_BuyButton[4], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[4], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[5] = HopeQoL_Button("HopeMetaBuy5", HopeMeta_Panel, 0.194, -0.085, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[5], HopeMeta_Buy5, true)
	if HopeMeta_BuyButton[5] ~= 0 then
		HopeMeta_BuyText[5] = HopeQoL_Label("HopeMetaBuyText5", HopeMeta_BuyButton[5], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[5], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[6] = HopeQoL_Button("HopeMetaBuy6", HopeMeta_Panel, 0.194, -0.135, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[6], HopeMeta_Buy6, true)
	if HopeMeta_BuyButton[6] ~= 0 then
		HopeMeta_BuyText[6] = HopeQoL_Label("HopeMetaBuyText6", HopeMeta_BuyButton[6], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[6], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[7] = HopeQoL_Button("HopeMetaBuy7", HopeMeta_Panel, 0.194, -0.185, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[7], HopeMeta_Buy7, true)
	if HopeMeta_BuyButton[7] ~= 0 then
		HopeMeta_BuyText[7] = HopeQoL_Label("HopeMetaBuyText7", HopeMeta_BuyButton[7], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[7], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[8] = HopeQoL_Button("HopeMetaBuy8", HopeMeta_Panel, 0.194, -0.235, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[8], HopeMeta_Buy8, true)
	if HopeMeta_BuyButton[8] ~= 0 then
		HopeMeta_BuyText[8] = HopeQoL_Label("HopeMetaBuyText8", HopeMeta_BuyButton[8], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[8], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[9] = HopeQoL_Button("HopeMetaBuy9", HopeMeta_Panel, 0.194, -0.285, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[9], HopeMeta_Buy9, true)
	if HopeMeta_BuyButton[9] ~= 0 then
		HopeMeta_BuyText[9] = HopeQoL_Label("HopeMetaBuyText9", HopeMeta_BuyButton[9], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[9], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[10] = HopeQoL_Button("HopeMetaBuy10", HopeMeta_Panel, 0.378, -0.085, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[10], HopeMeta_Buy10, true)
	if HopeMeta_BuyButton[10] ~= 0 then
		HopeMeta_BuyText[10] = HopeQoL_Label("HopeMetaBuyText10", HopeMeta_BuyButton[10], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[10], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[11] = HopeQoL_Button("HopeMetaBuy11", HopeMeta_Panel, 0.378, -0.135, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[11], HopeMeta_Buy11, true)
	if HopeMeta_BuyButton[11] ~= 0 then
		HopeMeta_BuyText[11] = HopeQoL_Label("HopeMetaBuyText11", HopeMeta_BuyButton[11], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[11], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[12] = HopeQoL_Button("HopeMetaBuy12", HopeMeta_Panel, 0.378, -0.185, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[12], HopeMeta_Buy12, true)
	if HopeMeta_BuyButton[12] ~= 0 then
		HopeMeta_BuyText[12] = HopeQoL_Label("HopeMetaBuyText12", HopeMeta_BuyButton[12], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[12], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[13] = HopeQoL_Button("HopeMetaBuy13", HopeMeta_Panel, 0.378, -0.235, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[13], HopeMeta_Buy13, true)
	if HopeMeta_BuyButton[13] ~= 0 then
		HopeMeta_BuyText[13] = HopeQoL_Label("HopeMetaBuyText13", HopeMeta_BuyButton[13], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[13], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[14] = HopeQoL_Button("HopeMetaBuy14", HopeMeta_Panel, 0.378, -0.285, 0.174, 0.047, "")
	HopeQoL_Bind(HopeMeta_BuyButton[14], HopeMeta_Buy14, true)
	if HopeMeta_BuyButton[14] ~= 0 then
		HopeMeta_BuyText[14] = HopeQoL_Label("HopeMetaBuyText14", HopeMeta_BuyButton[14], 0.005, -0.003, 0.164, 0.041, "")
		HopeMeta_Font(HopeMeta_BuyText[14], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[15] = HopeQoL_Button("HopeMetaBuy15", HopeMeta_Panel, 0.01, -0.095, 0.174, 0.106, "")
	HopeQoL_Bind(HopeMeta_BuyButton[15], HopeMeta_Buy15, true)
	if HopeMeta_BuyButton[15] ~= 0 then
		HopeMeta_BuyText[15] = HopeQoL_Label("HopeMetaBuyText15", HopeMeta_BuyButton[15], 0.005, -0.003, 0.164, 0.1, "")
		HopeMeta_Font(HopeMeta_BuyText[15], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[16] = HopeQoL_Button("HopeMetaBuy16", HopeMeta_Panel, 0.194, -0.095, 0.174, 0.106, "")
	HopeQoL_Bind(HopeMeta_BuyButton[16], HopeMeta_Buy16, true)
	if HopeMeta_BuyButton[16] ~= 0 then
		HopeMeta_BuyText[16] = HopeQoL_Label("HopeMetaBuyText16", HopeMeta_BuyButton[16], 0.005, -0.003, 0.164, 0.1, "")
		HopeMeta_Font(HopeMeta_BuyText[16], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[17] = HopeQoL_Button("HopeMetaBuy17", HopeMeta_Panel, 0.378, -0.095, 0.174, 0.106, "")
	HopeQoL_Bind(HopeMeta_BuyButton[17], HopeMeta_Buy17, true)
	if HopeMeta_BuyButton[17] ~= 0 then
		HopeMeta_BuyText[17] = HopeQoL_Label("HopeMetaBuyText17", HopeMeta_BuyButton[17], 0.005, -0.003, 0.164, 0.1, "")
		HopeMeta_Font(HopeMeta_BuyText[17], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[18] = HopeQoL_Button("HopeMetaBuy18", HopeMeta_Panel, 0.01, -0.212, 0.174, 0.106, "")
	HopeQoL_Bind(HopeMeta_BuyButton[18], HopeMeta_Buy18, true)
	if HopeMeta_BuyButton[18] ~= 0 then
		HopeMeta_BuyText[18] = HopeQoL_Label("HopeMetaBuyText18", HopeMeta_BuyButton[18], 0.005, -0.003, 0.164, 0.1, "")
		HopeMeta_Font(HopeMeta_BuyText[18], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[19] = HopeQoL_Button("HopeMetaBuy19", HopeMeta_Panel, 0.194, -0.212, 0.174, 0.106, "")
	HopeQoL_Bind(HopeMeta_BuyButton[19], HopeMeta_Buy19, true)
	if HopeMeta_BuyButton[19] ~= 0 then
		HopeMeta_BuyText[19] = HopeQoL_Label("HopeMetaBuyText19", HopeMeta_BuyButton[19], 0.005, -0.003, 0.164, 0.1, "")
		HopeMeta_Font(HopeMeta_BuyText[19], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[20] = HopeQoL_Button("HopeMetaBuy20", HopeMeta_Panel, 0.378, -0.212, 0.174, 0.106, "")
	HopeQoL_Bind(HopeMeta_BuyButton[20], HopeMeta_Buy20, true)
	if HopeMeta_BuyButton[20] ~= 0 then
		HopeMeta_BuyText[20] = HopeQoL_Label("HopeMetaBuyText20", HopeMeta_BuyButton[20], 0.005, -0.003, 0.164, 0.1, "")
		HopeMeta_Font(HopeMeta_BuyText[20], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[21] = HopeQoL_Button("HopeMetaBuy21", HopeMeta_Panel, 0.01, -0.112, 0.174, 0.18, "")
	HopeQoL_Bind(HopeMeta_BuyButton[21], HopeMeta_Buy21, true)
	if HopeMeta_BuyButton[21] ~= 0 then
		HopeMeta_BuyText[21] = HopeQoL_Label("HopeMetaBuyText21", HopeMeta_BuyButton[21], 0.005, -0.003, 0.164, 0.174, "")
		HopeMeta_Font(HopeMeta_BuyText[21], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[22] = HopeQoL_Button("HopeMetaBuy22", HopeMeta_Panel, 0.194, -0.112, 0.174, 0.18, "")
	HopeQoL_Bind(HopeMeta_BuyButton[22], HopeMeta_Buy22, true)
	if HopeMeta_BuyButton[22] ~= 0 then
		HopeMeta_BuyText[22] = HopeQoL_Label("HopeMetaBuyText22", HopeMeta_BuyButton[22], 0.005, -0.003, 0.164, 0.174, "")
		HopeMeta_Font(HopeMeta_BuyText[22], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_BuyButton[23] = HopeQoL_Button("HopeMetaBuy23", HopeMeta_Panel, 0.378, -0.112, 0.174, 0.18, "")
	HopeQoL_Bind(HopeMeta_BuyButton[23], HopeMeta_Buy23, true)
	if HopeMeta_BuyButton[23] ~= 0 then
		HopeMeta_BuyText[23] = HopeQoL_Label("HopeMetaBuyText23", HopeMeta_BuyButton[23], 0.005, -0.003, 0.164, 0.174, "")
		HopeMeta_Font(HopeMeta_BuyText[23], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_SeedButton[0] = HopeQoL_Button("HopeMetaSeed0", HopeMeta_Panel, 0.01, -0.124, 0.27, 0.043, "")
	HopeQoL_Bind(HopeMeta_SeedButton[0], HopeMeta_Seed0, true)
	if HopeMeta_SeedButton[0] ~= 0 then
		DzFrameSetScriptByCode(HopeMeta_SeedButton[0], 2, HopeMeta_SeedEnter0, false)
		DzFrameSetScriptByCode(HopeMeta_SeedButton[0], 3, HopeMeta_SeedLeave, false)
	end
	if HopeMeta_SeedButton[0] ~= 0 then
		HopeMeta_SeedIcon[0] = DzCreateFrameByTagName("BACKDROP", "HopeMetaSeedIcon0", HopeMeta_SeedButton[0], "HopePassBackdrop", 0)
		if HopeMeta_SeedIcon[0] ~= 0 and HopeMeta_SeedButton[0] ~= 0 then
			DzFrameSetPoint(HopeMeta_SeedIcon[0], 0, HopeMeta_SeedButton[0], 0, 0.004, -0.004)
		end
		HopeMeta_Size(HopeMeta_SeedIcon[0], 0.027, 0.027)
		HopeMeta_SeedText[0] = HopeQoL_Label("HopeMetaSeedText0", HopeMeta_SeedButton[0], 0.037, -0.002, 0.228, 0.039, "")
		HopeMeta_Font(HopeMeta_SeedText[0], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_SeedButton[1] = HopeQoL_Button("HopeMetaSeed1", HopeMeta_Panel, 0.01, -0.173, 0.27, 0.043, "")
	HopeQoL_Bind(HopeMeta_SeedButton[1], HopeMeta_Seed1, true)
	if HopeMeta_SeedButton[1] ~= 0 then
		DzFrameSetScriptByCode(HopeMeta_SeedButton[1], 2, HopeMeta_SeedEnter1, false)
		DzFrameSetScriptByCode(HopeMeta_SeedButton[1], 3, HopeMeta_SeedLeave, false)
	end
	if HopeMeta_SeedButton[1] ~= 0 then
		HopeMeta_SeedIcon[1] = DzCreateFrameByTagName("BACKDROP", "HopeMetaSeedIcon1", HopeMeta_SeedButton[1], "HopePassBackdrop", 0)
		if HopeMeta_SeedIcon[1] ~= 0 and HopeMeta_SeedButton[1] ~= 0 then
			DzFrameSetPoint(HopeMeta_SeedIcon[1], 0, HopeMeta_SeedButton[1], 0, 0.004, -0.004)
		end
		HopeMeta_Size(HopeMeta_SeedIcon[1], 0.027, 0.027)
		HopeMeta_SeedText[1] = HopeQoL_Label("HopeMetaSeedText1", HopeMeta_SeedButton[1], 0.037, -0.002, 0.228, 0.039, "")
		HopeMeta_Font(HopeMeta_SeedText[1], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_SeedButton[2] = HopeQoL_Button("HopeMetaSeed2", HopeMeta_Panel, 0.01, -0.222, 0.27, 0.043, "")
	HopeQoL_Bind(HopeMeta_SeedButton[2], HopeMeta_Seed2, true)
	if HopeMeta_SeedButton[2] ~= 0 then
		DzFrameSetScriptByCode(HopeMeta_SeedButton[2], 2, HopeMeta_SeedEnter2, false)
		DzFrameSetScriptByCode(HopeMeta_SeedButton[2], 3, HopeMeta_SeedLeave, false)
	end
	if HopeMeta_SeedButton[2] ~= 0 then
		HopeMeta_SeedIcon[2] = DzCreateFrameByTagName("BACKDROP", "HopeMetaSeedIcon2", HopeMeta_SeedButton[2], "HopePassBackdrop", 0)
		if HopeMeta_SeedIcon[2] ~= 0 and HopeMeta_SeedButton[2] ~= 0 then
			DzFrameSetPoint(HopeMeta_SeedIcon[2], 0, HopeMeta_SeedButton[2], 0, 0.004, -0.004)
		end
		HopeMeta_Size(HopeMeta_SeedIcon[2], 0.027, 0.027)
		HopeMeta_SeedText[2] = HopeQoL_Label("HopeMetaSeedText2", HopeMeta_SeedButton[2], 0.037, -0.002, 0.228, 0.039, "")
		HopeMeta_Font(HopeMeta_SeedText[2], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_SeedButton[3] = HopeQoL_Button("HopeMetaSeed3", HopeMeta_Panel, 0.01, -0.271, 0.27, 0.043, "")
	HopeQoL_Bind(HopeMeta_SeedButton[3], HopeMeta_Seed3, true)
	if HopeMeta_SeedButton[3] ~= 0 then
		DzFrameSetScriptByCode(HopeMeta_SeedButton[3], 2, HopeMeta_SeedEnter3, false)
		DzFrameSetScriptByCode(HopeMeta_SeedButton[3], 3, HopeMeta_SeedLeave, false)
	end
	if HopeMeta_SeedButton[3] ~= 0 then
		HopeMeta_SeedIcon[3] = DzCreateFrameByTagName("BACKDROP", "HopeMetaSeedIcon3", HopeMeta_SeedButton[3], "HopePassBackdrop", 0)
		if HopeMeta_SeedIcon[3] ~= 0 and HopeMeta_SeedButton[3] ~= 0 then
			DzFrameSetPoint(HopeMeta_SeedIcon[3], 0, HopeMeta_SeedButton[3], 0, 0.004, -0.004)
		end
		HopeMeta_Size(HopeMeta_SeedIcon[3], 0.027, 0.027)
		HopeMeta_SeedText[3] = HopeQoL_Label("HopeMetaSeedText3", HopeMeta_SeedButton[3], 0.037, -0.002, 0.228, 0.039, "")
		HopeMeta_Font(HopeMeta_SeedText[3], "Fonts\\ZiTi.ttf", 0.008, 0)
	end
	HopeMeta_SeedInfoPanel = HopeQoL_Surface("HopeMetaSeedInfo", 0.41, 0.42, 0.264, 0.21)
	HopeMeta_SeedInfoText = HopeQoL_Label("HopeMetaSeedInfoText", HopeMeta_SeedInfoPanel, 0.009, -0.009, 0.246, 0.192, "")
	HopeMeta_Font(HopeMeta_SeedInfoText, "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeLayout_Show(HopeMeta_SeedInfoPanel, false)
	HopeLayout_Show(HopeMeta_Panel, false)
	HopeMarket_Panel = HopeQoL_Surface("HopeMarketPanel", 0.247, 0.509, 0.306, 0.207)
	f = HopeQoL_Label("HopeMarketHeading", HopeMarket_Panel, 0.01, -0.008, 0.236, 0.018, "能力商城 · 资源")
	f = HopeQoL_Button("HopeMarketClose", HopeMarket_Panel, 0.251, -0.007, 0.045, 0.021, "关闭")
	HopeQoL_Bind(f, HopeMarket_Close, false)
	HopeMarket_Body = HopeQoL_Label("HopeMarketBody", HopeMarket_Panel, 0.01, -0.036, 0.286, 0.059, "")
	HopeMarket_Entry = HopeQoL_Button("HopeMarketEntry", DzGetGameUI(), 0.266, 0.196, 0.1, 0.021, "商店资源")
	HopeQoL_Bind(HopeMarket_Entry, HopeMarket_Show, false)
	HopeLayout_Show(HopeMarket_Entry, false)
	f = HopeQoL_Button("HopeMarketTrade0", HopeMarket_Panel, 0.01, -0.098, 0.14, 0.028, "木材抽奖 · 1木材")
	HopeQoL_Bind(f, HopeMarket_Buy0, true)
	f = HopeQoL_Button("HopeMarketTrade1", HopeMarket_Panel, 0.156, -0.098, 0.14, 0.028, "木材十连 · 10木材")
	HopeQoL_Bind(f, HopeMarket_Buy1, true)
	f = HopeQoL_Button("HopeMarketTrade2", HopeMarket_Panel, 0.01, -0.13, 0.14, 0.028, "77金 → 1木材")
	HopeQoL_Bind(f, HopeMarket_Buy2, true)
	f = HopeQoL_Button("HopeMarketTrade3", HopeMarket_Panel, 0.156, -0.13, 0.14, 0.028, "385金 → 5木材")
	HopeQoL_Bind(f, HopeMarket_Buy3, true)
	f = HopeQoL_Button("HopeMarketTrade4", HopeMarket_Panel, 0.01, -0.162, 0.14, 0.028, "1木材 → 51金")
	HopeQoL_Bind(f, HopeMarket_Buy4, true)
	f = HopeQoL_Button("HopeMarketTrade5", HopeMarket_Panel, 0.156, -0.162, 0.14, 0.028, "5木材 → 255金")
	HopeQoL_Bind(f, HopeMarket_Buy5, true)
	HopeLayout_Show(HopeMarket_Panel, false)

end

end

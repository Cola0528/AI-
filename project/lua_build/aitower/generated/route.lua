-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeDifficulty_Hp(difficulty)
	if difficulty == 2 then
		return 1.1568627451
	elseif difficulty == 3 then
		return 1.1713235294
	elseif difficulty == 4 then
		return 1.5518379121
	elseif difficulty >= 5 then
		return 1.704009434
	end
	return 1.0
end

function HopeDifficulty_Attack(difficulty)
	if difficulty == 2 or difficulty == 3 then
		return 1.02
	elseif difficulty == 4 then
		return 1.04
	elseif difficulty >= 5 then
		return 1.06
	end
	return 1.0
end

function HopeCoop_CountPlayers()
	local i = 0
	local count = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if not HopeRoute_Left[i] and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(Player(i)) == MAP_CONTROL_USER and IsPlayerInForce(Player(i), udg_WJZ) and udg_hero[i + 1] ~= nil and GetUnitTypeId(udg_hero[i + 1]) ~= 0 then
			count = count + 1
		end
		i = i + 1
	end
	return IMaxBJ(1, count)
end

function HopeCoop_MonsterCount(players, rounds)
	local base = 3 + _idiv_(IMinBJ(6, IMaxBJ(1, players)) - 1, 3)
	if udg_Yx_Nd_Dj == 6 then
		base = base + _idiv_(IMaxBJ(0, rounds), 3)
	end
	return IMinBJ(12, base)
end

function HopeCoop_LifeFactor(players, boss)
	-- v19 table (audit/09): mob HP 1.00/1.75/2.40/3.05/3.55/4.10 for 1..6 players;
	-- boss = mob x 1.15 (v18 boss/mob gap widened with players; v19 keeps it fixed).
	local n = IMinBJ(6, IMaxBJ(1, players))
	local f = 1.0
	if n == 2 then
		f = 1.75
	elseif n == 3 then
		f = 2.4
	elseif n == 4 then
		f = 3.05
	elseif n == 5 then
		f = 3.55
	elseif n >= 6 then
		f = 4.1
	end
	if boss and n > 1 then
		f = f * 1.15
	end
	return f
end

function HopeCoop_AttackFactor(players)
	-- v19: gentle attack ramp, 6P capped at 1.25 (was 1.50).
	return 1.0 + 0.05 * I2R(IMinBJ(6, IMaxBJ(1, players)) - 1)
end

function HopeCoop_IsBoss(u)
	local kind = GetUnitTypeId(u)
	return IsUnitType(u, UNIT_TYPE_HERO) or LoadBoolean(YDHT, kind, -74861460) or kind == udg_BOSS_LX_______DA[1] or kind == udg_BOSS_LX[0] or kind == udg_BOSS_LX[1] or kind == udg_BOSS_LX[2]
end

function HopeCoop_BeginRoom()
	local players = HopeCoop_CountPlayers()
	if not HopeCoop_Started then
		-- Capture the actual original single-player setting, including default mode.
		HopeCoop_BaseHandicap = GetPlayerHandicapBJ(Player(11))
		HopeCoop_Started = true
	end
	-- v19: handicap stays at the chosen difficulty; player scaling lives entirely
	-- in HopeCoop_LifeFactor/AttackFactor (no extra handicap stacking).
	SetPlayerHandicapBJ(Player(11), HopeCoop_BaseHandicap)
	udg_Guaiwu_sl = HopeCoop_MonsterCount(players, udg_quanshu)
	if HopeCoop_RoomPlayers ~= players or not HopeCoop_Announced then
		DisplayTimedTextToForce(udg_WJZ, 10.0, "本房按 " .. (I2S(players) or "") .. " 名在场玩家计算：小怪生命最高4.1倍（BOSS再乘1.15）、每多1人攻击力+5%、怪物数量小幅增加。离开人数在下一房重新计算。")
		HopeCoop_Announced = true
	end
	HopeCoop_RoomPlayers = players
end

function HopeCoop_ScaleEnemy(u)
	local h = GetHandleId(u)
	local hp = 0.0
	local attack = 0.0
	if u == nil or GetUnitTypeId(u) == 0 or GetOwningPlayer(u) ~= Player(11) or LoadBoolean(YDHT, h, 1215972098) then
		return
	end
	SaveBoolean(YDHT, h, 1215972098, true)
	if HopeCoop_RoomPlayers <= 1 then
		return
	end
	hp = GetUnitState(u, UNIT_STATE_MAX_LIFE) * HopeCoop_LifeFactor(HopeCoop_RoomPlayers, HopeCoop_IsBoss(u))
	attack = GetUnitState(u, ConvertUnitState(18)) * HopeCoop_AttackFactor(HopeCoop_RoomPlayers)
	if udg_Yx_Nd_Dj >= 5 then
		-- Numeric guards compose with challenge scaling; subsequent boss room bonuses
		-- remain bounded by the capped monster count. No repeated display-time scaling.
		hp = RMinBJ(10000000.0, hp)
		attack = RMinBJ(1000000.0, attack)
	end
	SetUnitState(u, UNIT_STATE_MAX_LIFE, hp)
	SetUnitLifePercentBJ(u, 100.0)
	SetUnitState(u, ConvertUnitState(18), attack)
end

function HopeChallenge_TurnToken()
	if udg_Yx_Nd_Dj >= 5 then
		return HopeChallenge_TurnSerial
	end
	return udg_quanshu * 100000 + udg_boci * 1000 + udg_huihe_s
end

function HopeChallenge_NextTurn()
	local i = 1
	if udg_Yx_Nd_Dj < 5 then
		return
	end
	if HopeChallenge_TurnSerial >= 2000000000 then
		HopeChallenge_TurnSerial = 1
		for _ in _loop_() do
			if i > 6 then break end
			HopeMeditation_LastCast[i] = -1
			HopeHidden_LastHeal[i] = -1
			HopeHidden_LastDrain[i] = -1
			HopeJob_LastCast[i] = -1
			HopeMonk_LastE[i] = 0
			HopeMonk_LastW[i] = 0
			HopeMonk_LastZ[i] = 0
			i = i + 1
		end
	else
		HopeChallenge_TurnSerial = HopeChallenge_TurnSerial + 1
	end
end

function HopeChallenge_Won()
	if udg_Yx_Nd_Dj == 6 then
		return false
	elseif udg_Yx_Nd_Dj == 5 then
		return udg_quanshu >= 5
	elseif udg_Yx_Nd_Dj < 3 then
		return udg_quanshu >= 3
	end
	return udg_quanshu >= 4
end

function HopeChallenge_BossPoints()
	return HopeRewards_Boss(udg_Yx_Nd_Dj, udg_quanshu)
end

function HopeChallenge_EnemyHp(base)
	local q = I2R(IMaxBJ(0, udg_quanshu))
	if udg_Yx_Nd_Dj == 6 then
		return RMinBJ(10000000.0, HopeDifficulty_Hp(6) * (base * (1.0 + 0.18 * q) + 80.0 * q))
	end
	return RMinBJ(10000000.0, HopeDifficulty_Hp(udg_Yx_Nd_Dj) * (base * (1.0 + 0.06 * q) + 20.0 * q))
end

function HopeChallenge_EnemyAttack(base)
	if udg_Yx_Nd_Dj == 6 then
		return RMinBJ(1000000.0, base * HopeDifficulty_Attack(6) * (1.0 + 0.08 * I2R(IMaxBJ(0, udg_quanshu))))
	end
	return RMinBJ(1000000.0, base * HopeDifficulty_Attack(udg_Yx_Nd_Dj))
end

function HopeChallenge_ScaleEnemy(u)
	if LoadBoolean(YDHT, GetHandleId(u), 1215972097) then
		return
	end
	SaveBoolean(YDHT, GetHandleId(u), 1215972097, true)
	SaveReal(YDHT, GetHandleId(u), 877254238, RMinBJ(0.65, RMaxBJ(0.0, LoadReal(YDHT, GetHandleId(u), 877254238))))
	SetUnitState(u, UNIT_STATE_MAX_LIFE, HopeChallenge_EnemyHp(GetUnitState(u, UNIT_STATE_MAX_LIFE)))
	SetUnitLifePercentBJ(u, 100.0)
	SetUnitState(u, ConvertUnitState(18), HopeChallenge_EnemyAttack(GetUnitState(u, ConvertUnitState(18))))
end

function HopeChallenge_NextMonsterCount()
	udg_Guaiwu_sl = HopeCoop_MonsterCount(HopeCoop_CountPlayers(), udg_quanshu)
end

function HopeChallenge_ReleaseNode(u)
	local links = nil
	if udg_Yx_Nd_Dj >= 5 then
		links = LoadGroupHandle(YDHT, GetHandleId(u), -1242853960)
		if links ~= nil then
			DestroyGroup(links)
		end
	end
	links = nil
end

function HopeCoop_SoloBonus()
	local i = GetPlayerId(GetEnumPlayer()) + 1
	udg_xingdong_dianSx[i] = 4
	DisplayTextToPlayer(GetEnumPlayer(), 0, 0, "单人补偿：行动点上限+1。")
end

function HopeChallenge_IsEnemy(id)
	return id == 1851404337 or id == 1851404338 or id == 1851404339 or id == 1851404340 or id == 1431973937 or id == 1431973938
end

function HopeChallenge_PrepareSkill(u)
	if HopeChallenge_IsEnemy(GetUnitTypeId(u)) and GetWidgetLife(u) > 0.405 then
		UnitResetCooldown(u)
		SetUnitManaPercentBJ(u, 100.0)
	end
end

function HopeChallenge_HeroAlive(u)
	return u ~= nil and GetWidgetLife(u) > 0.405 and IsPlayerInForce(GetOwningPlayer(u), udg_WJZ_______cunhuo)
end

function HopeChallenge_Heal(u, amount)
	if u ~= nil and GetWidgetLife(u) > 0.405 and amount > 0.0 then
		SetUnitState(u, UNIT_STATE_LIFE, RMinBJ(GetUnitState(u, UNIT_STATE_MAX_LIFE), GetWidgetLife(u) + amount))
	end
end

function HopeChallenge_Ward(u, amount)
	local baseline = LoadReal(YDHT, GetUnitTypeId(u), 1932103989)
	SetUnitState(u, ConvertUnitState(32), RMaxBJ(GetUnitState(u, ConvertUnitState(32)), baseline + amount))
end

function HopeChallenge_EnemyCast(u)
	local id = GetUnitTypeId(u)
	local i = 1
	local v = nil
	local weakest = nil
	local allies = nil
	local attack = GetUnitState(u, ConvertUnitState(20))
	local ratio = 2.0
	local before = 0.0
	local actual = 0.0
	local amount = 0.0
	if not HopeChallenge_IsEnemy(id) or GetOwningPlayer(u) ~= Player(11) or GetWidgetLife(u) <= 0.405 or not IsUnitInGroup(u, udg_Guaiwu_dwz) then
		return
	end
	-- This dispatcher is called only by the existing A00U enemy skill event.
	if id == 1851404337 or id == 1851404340 then
		allies = CreateGroup()
		GroupAddGroup(udg_Guaiwu_dwz, allies)
		for _ in _loop_() do
			v = FirstOfGroup(allies)
			if v == nil then break end
			GroupRemoveUnit(allies, v)
			if GetWidgetLife(v) > 0.405 then
				if id == 1851404337 then
					HopeChallenge_Ward(v, 10.0 + 2.0 * I2R(udg_quanshu + 1))
					DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl", v, "origin"))
				else
					HopeChallenge_Heal(v, GetUnitState(v, UNIT_STATE_MAX_LIFE) * 0.08 + attack * 0.5)
					DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", v, "origin"))
				end
			end
		end
		DestroyGroup(allies)
	elseif id == 1851404339 then
		for _ in _loop_() do
			if i > 6 then break end
			v = udg_hero[i]
			if HopeChallenge_HeroAlive(v) and GetWidgetLife(v) / RMaxBJ(1.0, GetUnitState(v, UNIT_STATE_MAX_LIFE)) < ratio then
				ratio = GetWidgetLife(v) / RMaxBJ(1.0, GetUnitState(v, UNIT_STATE_MAX_LIFE))
				weakest = v
			end
			i = i + 1
		end
		if weakest ~= nil then
			UnitDamageTarget(u, weakest, attack * 1.65, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
			SetUnitState(weakest, UNIT_STATE_MANA, RMaxBJ(0.0, GetUnitState(weakest, UNIT_STATE_MANA) - 2.0))
			DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl", weakest, "origin"))
		end
	else
		for _ in _loop_() do
			if i > 6 then break end
			v = udg_hero[i]
			if HopeChallenge_HeroAlive(v) then
				if id == 1851404338 then
					UnitDamageTarget(u, v, attack * 0.85 + I2R(udg_quanshu + 1) * 3.0, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
					DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", v, "origin"))
				elseif id == 1431973937 then
					UnitDamageTarget(u, v, attack * 1.15, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
					DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl", v, "origin"))
				elseif id == 1431973938 then
					before = RMaxBJ(0.0, GetWidgetLife(v))
					UnitDamageTarget(u, v, attack * 0.9, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
					actual = actual + RMaxBJ(0.0, before - RMaxBJ(0.0, GetWidgetLife(v)))
					SetUnitState(v, UNIT_STATE_MANA, RMaxBJ(0.0, GetUnitState(v, UNIT_STATE_MANA) - 3.0))
					DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl", v, "origin"))
				end
			end
			i = i + 1
		end
		if id == 1431973937 then
			HopeChallenge_Ward(u, 20.0)
		elseif id == 1431973938 then
			amount = RMinBJ(actual * 0.25, GetUnitState(u, UNIT_STATE_MAX_LIFE) * 0.06)
			HopeChallenge_Heal(u, amount)
		end
	end
	v = nil
	weakest = nil
	allies = nil
end

function HopeRoute_Active(i)
	return i >= 0 and i < 6 and not HopeRoute_Left[i] and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(Player(i)) == MAP_CONTROL_USER and IsPlayerInForce(Player(i), udg_WJZ)
end

function HopeRoute_Host()
	local i = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			return i
		end
		i = i + 1
	end
	return -1
end

function HopeRoute_ClearMarker()
	if HopeRoute_Marker ~= nil then
		DestroyEffect(HopeRoute_Marker)
		HopeRoute_Marker = nil
	end
	if HopeRoute_MarkerText ~= nil then
		SetTextTagVisibility(HopeRoute_MarkerText, false)
	end
end

function HopeRoute_Mark(node)
	HopeRoute_ClearMarker()
	HopeRoute_Marker = AddSpecialEffectTarget("Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl", node, "overhead")
	if HopeRoute_MarkerText == nil then
		HopeRoute_MarkerText = CreateTextTag()
		SetTextTagPermanent(HopeRoute_MarkerText, true)
	end
	SetTextTagText(HopeRoute_MarkerText, "|cffffd060【当前选择】|r", 0.022)
	SetTextTagPosUnit(HopeRoute_MarkerText, node, 180.0)
	SetTextTagVisibility(HopeRoute_MarkerText, true)
end

function HopeRoute_Leader()
	if HopeRoute_Active(HopeRoute_ChosenLeader) then
		return HopeRoute_ChosenLeader
	end
	return HopeRoute_Host()
end

function HopeRoute_RewardPending(i)
	return HopeChoice_PendingForPlayer(i) or HaveSavedBoolean(YDHT, GetHandleId(Player(i)), -1422318988) and not LoadBoolean(YDHT, GetHandleId(Player(i)), -1422318988)
end

function HopeRoute_ClearReady()
	local i = 0
	for _ in _loop_() do
		if i >= 6 then break end
		HopeRoute_Ready[i] = false
		i = i + 1
	end
end

function HopeRoute_Valid()
	return HopeRoute_Node ~= nil and GetUnitTypeId(HopeRoute_Node) ~= 0 and HopeRoute_Depth == udg_boci and HopeRoute_Chapter == udg_quanshu and LoadBoolean(YDHT, GetHandleId(HopeRoute_Node), -1021606187) and LoadInteger(YDHT, GetHandleId(HopeRoute_Node), 1713729479) == udg_boci
end

function HopeRoute_Status()
	local i = 0
	local leader = HopeRoute_Leader()
	local s = ""
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			s = (s or "") .. (GetPlayerName(Player(i)) or "")
			if i == leader then
				s = (s or "") .. "（选路）"
			end
			if HopeRoute_RewardPending(i) then
				s = (s or "") .. "：|cffffc060待完成选择|r|n"
			elseif udg_hero[i + 1] == nil then
				s = (s or "") .. "：等待角色初始化|n"
			elseif HopeRoute_Ready[i] then
				s = (s or "") .. "：|cff80ef90已准备|r|n"
			else
				s = (s or "") .. "：未准备|n"
			end
		end
		i = i + 1
	end
	return s
end

function HopeRoute_AllReady()
	local i = 0
	local count = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			count = count + 1
			if not HopeRoute_Ready[i] or HopeRoute_RewardPending(i) or udg_hero[i + 1] == nil then
				return false
			end
		end
		i = i + 1
	end
	return count > 0
end

function HopeRoute_SetReady(p, ready)
	local i = GetPlayerId(p)
	if not HopeRoute_Active(i) or not HopeRoute_Valid() then
		DisplayTextToPlayer(p, 0, 0, "请先由路线选择者点击一个可达路线节点，提出本次目的地。")
		return
	end
	if ready and (HopeRoute_RewardPending(i) or udg_hero[i + 1] == nil) then
		DisplayTextToPlayer(p, 0, 0, "请先完成待选项与角色初始化，再确认准备。")
		return
	end
	HopeRoute_Ready[i] = ready
	if ready then
		DisplayTextToForce(udg_WJZ, (GetPlayerName(p) or "") .. " 已准备。")
	else
		DisplayTextToForce(udg_WJZ, (GetPlayerName(p) or "") .. " 取消了准备，请等待。")
	end
	if HopeRoute_AllReady() then
		DisplayTextToForce(udg_WJZ, "全员已准备：路线选择者可点击准备面板的【出发】。")
	end
end

function HopeRoute_Select(p, node)
	local leader = HopeRoute_Leader()
	if HopeRoute_Assigning or leader < 0 or GetPlayerId(p) ~= leader then
		DisplayTextToPlayer(p, 0, 0, "请由指定的路线选择者提出目的地；队友可在准备面板确认。")
		return false
	end
	if udg_ZhandouZhong or node == nil or not LoadBoolean(YDHT, GetHandleId(node), -1021606187) or LoadInteger(YDHT, GetHandleId(node), 1713729479) ~= udg_boci then
		return false
	end
	if not HopeRoute_Valid() or HopeRoute_Node ~= node then
		HopeRoute_Node = node
		HopeRoute_Depth = udg_boci
		HopeRoute_Chapter = udg_quanshu
		HopeRoute_ClearReady()
		HopeRoute_Mark(node)
		DisplayTextToForce(udg_WJZ, (GetPlayerName(p) or "") .. " 选择了：" .. (GetUnitName(node) or "") .. "。地图上的金色标识为目的地；全员准备后点击【出发】。")
	end
	HopeRoute_Ready[leader] = not HopeRoute_RewardPending(leader) and udg_hero[leader + 1] ~= nil
	return false
end

function HopeRoute_ReadyClick()
	HopeRoute_SetReady(DzGetTriggerUIEventPlayer(), true)
end

function HopeRoute_WaitClick()
	HopeRoute_SetReady(DzGetTriggerUIEventPlayer(), false)
end

function HopeRoute_Chat()
	if GetEventPlayerChatString() == "-ready" then
		HopeRoute_SetReady(GetTriggerPlayer(), true)
	elseif GetEventPlayerChatString() == "-wait" then
		HopeRoute_SetReady(GetTriggerPlayer(), false)
	elseif HopeRoute_Valid() then
		DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "提议路线：" .. (GetUnitName(HopeRoute_Node) or "") .. "|n" .. (HopeRoute_Status() or ""))
	else
		DisplayTextToPlayer(GetTriggerPlayer(), 0, 0, "还没有有效的路线提议。请由当前路线选择者点击可达节点。")
	end
end

function HopeRoute_Leave()
	local i = GetPlayerId(GetTriggerPlayer())
	HopeRoute_Left[i] = true
	HopeRoute_ClearReady()
	if i == HopeRoute_ChosenLeader then
		HopeRoute_ChosenLeader = HopeRoute_Host()
	end
	if HopeRoute_Valid() then
		DisplayTextToForce(udg_WJZ, (GetPlayerName(GetTriggerPlayer()) or "") .. " 已离开，不再计入路线等待人数。其余玩家请重新确认准备；路线选择者离开时，自动交给编号最小的在线玩家。")
	end
end

function HopeChallenge_SetRoster()
	local cycle = ModuloInteger(udg_quanshu - 4, 3)
	if udg_Yx_Nd_Dj < 5 or udg_quanshu < 4 then
		return
	end
	-- Every accessible troop/elite slot has a defined object, on every later round.
	if cycle == 0 then
		udg_boci_gw_lx[0] = 1851404337
		udg_boci_gw_lx[1] = 1851404338
		udg_boci_gw_lx[2] = 1851404339
		udg_boci_gw_lx[3] = 1851404340
		udg_boci_gw_lx[4] = 1851404338
	elseif cycle == 1 then
		udg_boci_gw_lx[0] = 1851404339
		udg_boci_gw_lx[1] = 1851404340
		udg_boci_gw_lx[2] = 1851404337
		udg_boci_gw_lx[3] = 1851404338
		udg_boci_gw_lx[4] = 1851404339
	else
		udg_boci_gw_lx[0] = 1851404338
		udg_boci_gw_lx[1] = 1851404337
		udg_boci_gw_lx[2] = 1851404340
		udg_boci_gw_lx[3] = 1851404339
		udg_boci_gw_lx[4] = 1851404340
	end
	udg_BOSS_LX[0] = 1431973937
	udg_BOSS_LX[1] = 1431973938
	if ModuloInteger(udg_quanshu, 2) == 0 then
		udg_BOSS_LX[2] = 1431973937
		udg_BOSS_LX_______DA[1] = 1431973937
	else
		udg_BOSS_LX[2] = 1431973938
		udg_BOSS_LX_______DA[1] = 1431973938
	end
	SaveStr(YDHT, 1851404337, 715936045, "铁壁结阵：施法回合为所有存活敌军提供10+当前轮数×2护甲，持续到下次敌方回合开始；同类护盾不叠加。")
	SaveReal(YDHT, 1851404337, 1932103989, 18.0)
	SaveStr(YDHT, 1851404338, 715936045, "焚魂火雨：施法回合对所有存活英雄造成当前攻击×0.85+当前轮数×3的魔法伤害。")
	SaveReal(YDHT, 1851404338, 1932103989, 5.0)
	SaveStr(YDHT, 1851404339, 715936045, "裂魂狙击：施法回合攻击生命比例最低的存活英雄，造成当前攻击×1.65的物理伤害，并削减2点魔法。")
	SaveReal(YDHT, 1851404339, 1932103989, 3.0)
	SaveStr(YDHT, 1851404340, 715936045, "血泉复苏：施法回合为所有存活敌军恢复各自生命上限的8%+祭司当前攻击×0.5；不超过缺失生命。")
	SaveReal(YDHT, 1851404340, 1932103989, 6.0)
	SaveStr(YDHT, 1431973937, 715936045, "熔炉震荡：施法回合对所有存活英雄造成当前攻击×1.15的物理伤害，并获得额外20护甲直到下次敌方回合开始。")
	SaveReal(YDHT, 1431973937, 1932103989, 25.0)
	SaveStr(YDHT, 1431973938, 715936045, "虚空虹吸：施法回合对所有存活英雄造成当前攻击×0.9的魔法伤害，各削减3点魔法；按实际扣血的25%回复自己，单次至多回复生命上限的6%。")
	SaveReal(YDHT, 1431973938, 1932103989, 12.0)
	SaveBoolean(YDHT, 1431973937, -74861460, true)
	SaveBoolean(YDHT, 1431973938, -74861460, true)
	SaveStr(YDHT, 1851404338, -1951079047, "Abilities\\Weapons\\NecromancerMissile\\NecromancerMissile.mdl")
	SaveStr(YDHT, 1851404339, -1951079047, "Abilities\\Weapons\\SkeletalMageMissile\\SkeletalMageMissile.mdl")
	SaveStr(YDHT, 1851404340, -1951079047, "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
	SaveStr(YDHT, 1431973938, -1951079047, "Abilities\\Weapons\\LichMissile\\LichMissile.mdl")
end

function HopeRoute_Depart(p)
	local node = HopeRoute_Node
	if HopeRoute_Assigning or GetPlayerId(p) ~= HopeRoute_Leader() or udg_ZhandouZhong or not HopeRoute_Valid() then
		node = nil
		return false
	end
	if not HopeRoute_AllReady() then
		DisplayTextToPlayer(p, 0, 0, "尚不能出发：|n" .. (HopeRoute_Status() or ""))
		node = nil
		return false
	end
	-- Consume proposal before transition; stale/repeated clicks cannot enter twice.
	HopeMarket_InRoom = false
	HopeRoute_Node = nil
	HopeRoute_ClearMarker()
	HopeRoute_ClearReady()
	SaveBoolean(YDHT, GetHandleId(node), -1021606187, false)
	SetUnitVertexColorBJ(node, 50.0, 0.0, 0.0, 0.0)
	YDWETimerDestroyEffect(2.0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", node, "origin"))
	udg_Youxi_xzgq = node
	GroupAddUnitSimple(node, udg_zouguo_luxian)
	udg_boci = udg_boci + 1
	ConditionalTriggerExecute(gg_trg______________011)
	ForGroupBJ(YDWEGetUnitsOfPlayerAllNull(Player(PLAYER_NEUTRAL_PASSIVE)), Trig______________012Func001Func008A)
	node = nil
	return true
end

function HopeRoute_DepartClick()
	HopeRoute_Depart(DzGetTriggerUIEventPlayer())
end

function HopeRoute_ToggleDetails()
	HopeRoute_Details = not HopeRoute_Details
	if HopeRoute_Details then
		HopeLayout_Focus(9)
	end
	if HopeRoute_Details then
		if HopeGrowth_Pending[GetPlayerId(GetLocalPlayer())] then
			HopeChoice_Hidden = true
		end
		HopeQoL_Expanded = false
		HopeArchive_Expanded = false
		HopeGift_Expanded = false
		HopeRelic_Expanded = false
	end
end

function HopeRoute_CompactStatus()
	local i = 0
	local s = ""
	local name = ""
	local leader = HopeRoute_Leader()
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			name = HopeName_Label(Player(i), 70)
			if i == leader then
				name = (name or "") .. "★"
			end
			if HopeRoute_RewardPending(i) then
				s = (s or "") .. (name or "") .. " |cffffc060待选择|r|n"
			elseif udg_hero[i + 1] == nil then
				s = (s or "") .. (name or "") .. " |cffaaaaaa初始化中|r|n"
			elseif HopeRoute_Ready[i] then
				s = (s or "") .. (name or "") .. " |cff80ef90已准备|r|n"
			else
				s = (s or "") .. (name or "") .. " |cffaaaaaa未准备|r|n"
			end
		end
		i = i + 1
	end
	return s
end

function HopeRoute_Title(node)
	local kind = GetUnitTypeId(node)
	if kind == 1848651849 then
		return "小怪关卡"
	elseif kind == 1848651850 then
		return "精英关卡"
	elseif kind == 1848651851 then
		return "装备商店"
	elseif kind == 1848651852 then
		return "随机关卡"
	elseif kind == 1848651853 then
		return "泉水关卡"
	elseif kind == 1848651854 then
		return "首领关卡"
	elseif kind == 1848651855 then
		return "小游戏关卡"
	end
	return GetUnitName(node)
end

function HopeRoute_Description(node)
	local kind = GetUnitTypeId(node)
	if kind == 1848651849 then
		return "常规回合战斗。|n留意敌人意图，和队友|n分配攻击、防御与专注。"
	elseif kind == 1848651850 then
		return "挑战本区域的精英敌人。|n备好补给，确认队伍|n状态后出发。"
	elseif kind == 1848651851 then
		return "购买装备、技能与属性。|n可付费刷新货物，|n注意金币与背包格子。"
	elseif kind == 1848651852 then
		return "随机候选：商店、随机命运、|n泉水、小游戏，或敌人|n可复活的小怪战。|n入场时决定实际结果。"
	elseif kind == 1848651853 then
		return "恢复 30% 最大生命。|n可转职、购买药水，|n整理下一场的补给。"
	elseif kind == 1848651854 then
		return "挑战本区域首领。|n击败首领后进入下一区域。"
	elseif kind == 1848651855 then
		return "随机挑战：射箭、割草、|n躲烈焰、溜冰。入场自动|n聚焦；F3 重新定位角色。"
	end
	return "完成当前奖励与背包整理，再准备出发。"
end

function HopeRoute_UpdateUI()
	local owner = GetPlayerId(GetLocalPlayer())
	local i = 0
	local count = 0
	local slot = 0
	local rows = 0
	local show = HopeRoute_Valid() and HopeRoute_Active(owner) and not HopeRoute_RewardPending(owner)
	local name = ""
	local state = ""
	local x = 0.007
	local y = -0.08
	local width = 0.12
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			count = count + 1
		end
		HopeLayout_Show(HopeLayout_Member[i], false)
		i = i + 1
	end
	rows = count
	if count > 3 then
		rows = _idiv_(count + 1, 2)
		width = 0.058
	end
	HopeLayout_Show(HopeRoute_Panel, show)
	if show then
		HopeLayout_Place(HopeRoute_Panel, 0, 0.014, 0.375, 0.134, 0.086 + 0.012 * I2R(rows))
		HopeLayout_Show(HopeRoute_Text, false)
		HopeLayout_Show(HopeRoute_ReadyButton, not HopeRoute_Ready[owner])
		HopeLayout_Show(HopeRoute_WaitButton, HopeRoute_Ready[owner])
		HopeLayout_Show(HopeRoute_DepartButton, owner == HopeRoute_Leader())
		if HopeRoute_AllReady() then
			DzFrameSetText(HopeRoute_TitleText, "|cffd2b879" .. (HopeRoute_Title(HopeRoute_Node) or "") .. "|r · |cff80ef90已齐|r")
			DzFrameSetText(HopeRoute_DepartButton, "全员已准备 · 出发")
		else
			DzFrameSetText(HopeRoute_TitleText, "|cffd2b879" .. (HopeRoute_Title(HopeRoute_Node) or "") .. "|r")
			DzFrameSetText(HopeRoute_DepartButton, "等待队友 · 出发")
		end
		i = 0
		for _ in _loop_() do
			if i >= 6 then break end
			if HopeRoute_Active(i) then
				if count > 3 then
					name = HopeName_Label(Player(i), 50)
				else
					name = HopeName_Label(Player(i), 70)
				end
				if i == HopeRoute_Leader() then
					name = (name or "") .. "*"
				end
				if HopeRoute_RewardPending(i) then
					state = "|cffffc060…|r"
				elseif udg_hero[i + 1] == nil then
					state = "|cffaaaaaa…|r"
				elseif HopeRoute_Ready[i] then
					state = "|cff80ef90√|r"
				else
					state = "|cffaaaaaa×|r"
				end
				x = 0.007
				y = -0.08 - 0.012 * I2R(slot)
				if count > 3 then
					x = 0.007 + 0.064 * I2R(ModuloInteger(slot, 2))
					y = -0.08 - 0.012 * I2R(_idiv_(slot, 2))
				end
				HopeLayout_Place(HopeLayout_Member[i], HopeRoute_Panel, x, y, width, 0.011)
				if HopeLayout_Member[i] ~= 0 then
					DzFrameSetText(HopeLayout_Member[i], (YDWEGetPlayerColorString(Player(i), name) or "") .. " " .. (state or ""))
				end
				HopeLayout_Show(HopeLayout_Member[i], true)
				slot = slot + 1
			end
			i = i + 1
		end
		if HopeRoute_LastPreview ~= HopeRoute_Node then
			HopeRoute_Details = false
			HopeRoute_LastPreview = HopeRoute_Node
		end
		if HopeRoute_Details then
			DzFrameSetText(HopeRoute_DescriptionText, (HopeRoute_Description(HopeRoute_Node) or "") .. "|n|n完整队伍状态（*为选路玩家）：|n" .. (HopeRoute_Status() or ""))
		end
	end
	HopeLayout_Show(HopeRoute_InfoPanel, show and HopeRoute_Details)
end

function HopeRoute_Assign(p, chosen)
	if not HopeRoute_Assigning or GetPlayerId(p) ~= HopeRoute_Host() or not HopeRoute_Active(chosen) then
		return false
	end
	HopeRoute_ChosenLeader = chosen
	HopeRoute_Assigning = false
	HopeRoute_ClearReady()
	DisplayTextToForce(udg_WJZ, "本局路线由 " .. (GetPlayerName(Player(chosen)) or "") .. " 选择；全员准备后，由该玩家点击【出发】。")
	return true
end

function HopeRoute_TogglePicker()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeRoute_PickerOpen = not HopeRoute_PickerOpen
		if HopeRoute_PickerOpen then
			HopeLayout_Focus(6)
		end
	end
end

function HopeRoute_ChooseSlot(slot)
	local p = DzGetTriggerUIEventPlayer()
	if slot >= 1 and slot <= HopeRoute_AvailableCount then
		HopeRoute_Select(p, HopeRoute_Available[slot])
	end
	p = nil
end

function HopeRoute_Collect()
	local u = GetEnumUnit()
	local i = HopeRoute_AvailableCount
	if LoadBoolean(YDHT, GetHandleId(u), -1021606187) and LoadInteger(YDHT, GetHandleId(u), 1713729479) == udg_boci and i < 6 then
		-- Stable left-to-right ordering makes two identical room types distinguishable.
		for _ in _loop_() do
			if i <= 0 then break end
			if GetUnitX(HopeRoute_Available[i]) <= GetUnitX(u) then break end
			HopeRoute_Available[i + 1] = HopeRoute_Available[i]
			i = i - 1
		end
		HopeRoute_Available[i + 1] = u
		HopeRoute_AvailableCount = HopeRoute_AvailableCount + 1
	end
	u = nil
end

function HopeRoute_RefreshPicker()
	local i = 1
	local owner = GetPlayerId(GetLocalPlayer())
	local show = false
	local g = CreateGroup()
	HopeRoute_AvailableCount = 0
	GroupEnumUnitsOfPlayer(g, Player(PLAYER_NEUTRAL_PASSIVE), nil)
	ForGroup(g, HopeRoute_Collect)
	DestroyGroup(g)
	g = nil
	if not HopeRoute_Valid() then
		HopeRoute_ClearMarker()
	end
	HopeJob_ShowFrame(HopeRoute_AssignPanel, HopeRoute_Assigning and owner == HopeRoute_Host())
	for _ in _loop_() do
		if i > 6 then break end
		HopeJob_ShowFrame(HopeRoute_AssignButton[i], HopeRoute_Active(i - 1))
		HopeJob_SetText(HopeRoute_AssignButton[i], (I2S(i) or "") .. " · " .. (HopeName_Label(Player(i - 1), 100) or ""))
		i = i + 1
	end
	show = not udg_ZhandouZhong and not HopeRoute_Assigning and HopeRoute_AvailableCount > 0 and HopeRoute_Active(owner)
	HopeJob_ShowFrame(HopeRoute_Picker, show and HopeRoute_PickerOpen and (HopeChoice_Hidden or not HopeChoice_HasPending()))
	HopeJob_SetText(HopeRoute_PickerTitle, "可达路线（从左到右） · 第" .. (I2S(udg_boci) or "") .. "层")
	i = 1
	for _ in _loop_() do
		if i > 6 then break end
		HopeJob_ShowFrame(HopeRoute_NodeButton[i], i <= HopeRoute_AvailableCount)
		if i <= HopeRoute_AvailableCount then
			HopeJob_SetText(HopeRoute_NodeButton[i], (I2S(i) or "") .. ". " .. (HopeRoute_Title(HopeRoute_Available[i]) or ""))
		end
		i = i + 1
	end
end

function HopeRoute_Assign1()
	HopeRoute_Assign(DzGetTriggerUIEventPlayer(), 0)
end

function HopeRoute_Node1()
	HopeRoute_ChooseSlot(1)
end

function HopeRoute_Assign2()
	HopeRoute_Assign(DzGetTriggerUIEventPlayer(), 1)
end

function HopeRoute_Node2()
	HopeRoute_ChooseSlot(2)
end

function HopeRoute_Assign3()
	HopeRoute_Assign(DzGetTriggerUIEventPlayer(), 2)
end

function HopeRoute_Node3()
	HopeRoute_ChooseSlot(3)
end

function HopeRoute_Assign4()
	HopeRoute_Assign(DzGetTriggerUIEventPlayer(), 3)
end

function HopeRoute_Node4()
	HopeRoute_ChooseSlot(4)
end

function HopeRoute_Assign5()
	HopeRoute_Assign(DzGetTriggerUIEventPlayer(), 4)
end

function HopeRoute_Node5()
	HopeRoute_ChooseSlot(5)
end

function HopeRoute_Assign6()
	HopeRoute_Assign(DzGetTriggerUIEventPlayer(), 5)
end

function HopeRoute_Node6()
	HopeRoute_ChooseSlot(6)
end

function HopeRoute_CreateExtra()
	local f = 0
	HopeRoute_DepartButton = HopeQoL_Button("HopeDepart", HopeRoute_Panel, 0.007, -0.052, 0.12, 0.025, "出发")
	HopeQoL_Bind(HopeRoute_DepartButton, HopeRoute_DepartClick, true)
	f = HopeQoL_Button("HopeRoutePickerOpen", DzGetGameUI(), 0.014, 0.409, 0.134, 0.025, "选择 / 查看路线")
	HopeLayout_Route = f
	DzFrameSetAbsolutePoint(f, 0, 0.014, 0.41)
	HopeQoL_Bind(f, HopeRoute_TogglePicker, false)
	HopeRoute_AssignPanel = HopeQoL_Surface("HopeRouteAssign", 0.249, 0.5, 0.302, 0.176)
	f = HopeQoL_Label("HopeRouteAssignTitle", HopeRoute_AssignPanel, 0.012, -0.01, 0.278, 0.044, "本局由谁选择路线？|n主机指定一名在线玩家。")
	HopeRoute_Picker = HopeQoL_Surface("HopeRoutePicker", 0.249, 0.5, 0.302, 0.21)
	HopeRoute_PickerTitle = HopeQoL_Label("HopeRoutePickerTitle", HopeRoute_Picker, 0.012, -0.01, 0.278, 0.03, "")
	f = HopeQoL_Button("HopeRoutePickerClose", HopeRoute_Picker, 0.214, -0.174, 0.076, 0.025, "收起")
	HopeQoL_Bind(f, HopeRoute_TogglePicker, false)
	HopeRoute_AssignButton[1] = HopeQoL_Button("HopeAssign1", HopeRoute_AssignPanel, 0.014, -0.077, 0.314, 0.033, "")
	HopeQoL_Bind(HopeRoute_AssignButton[1], HopeRoute_Assign1, true)
	HopeRoute_NodeButton[1] = HopeQoL_Button("HopeNode1", HopeRoute_Picker, 0.012, -0.049, 0.134, 0.03, "")
	HopeQoL_Bind(HopeRoute_NodeButton[1], HopeRoute_Node1, true)
	HopeRoute_AssignButton[2] = HopeQoL_Button("HopeAssign2", HopeRoute_AssignPanel, 0.014, -0.117, 0.314, 0.033, "")
	HopeQoL_Bind(HopeRoute_AssignButton[2], HopeRoute_Assign2, true)
	HopeRoute_NodeButton[2] = HopeQoL_Button("HopeNode2", HopeRoute_Picker, 0.156, -0.049, 0.134, 0.03, "")
	HopeQoL_Bind(HopeRoute_NodeButton[2], HopeRoute_Node2, true)
	HopeRoute_AssignButton[3] = HopeQoL_Button("HopeAssign3", HopeRoute_AssignPanel, 0.014, -0.157, 0.314, 0.033, "")
	HopeQoL_Bind(HopeRoute_AssignButton[3], HopeRoute_Assign3, true)
	HopeRoute_NodeButton[3] = HopeQoL_Button("HopeNode3", HopeRoute_Picker, 0.012, -0.087, 0.134, 0.03, "")
	HopeQoL_Bind(HopeRoute_NodeButton[3], HopeRoute_Node3, true)
	HopeRoute_AssignButton[4] = HopeQoL_Button("HopeAssign4", HopeRoute_AssignPanel, 0.014, -0.197, 0.314, 0.033, "")
	HopeQoL_Bind(HopeRoute_AssignButton[4], HopeRoute_Assign4, true)
	HopeRoute_NodeButton[4] = HopeQoL_Button("HopeNode4", HopeRoute_Picker, 0.156, -0.087, 0.134, 0.03, "")
	HopeQoL_Bind(HopeRoute_NodeButton[4], HopeRoute_Node4, true)
	HopeRoute_AssignButton[5] = HopeQoL_Button("HopeAssign5", HopeRoute_AssignPanel, 0.014, -0.237, 0.314, 0.033, "")
	HopeQoL_Bind(HopeRoute_AssignButton[5], HopeRoute_Assign5, true)
	HopeRoute_NodeButton[5] = HopeQoL_Button("HopeNode5", HopeRoute_Picker, 0.012, -0.125, 0.134, 0.03, "")
	HopeQoL_Bind(HopeRoute_NodeButton[5], HopeRoute_Node5, true)
	HopeRoute_AssignButton[6] = HopeQoL_Button("HopeAssign6", HopeRoute_AssignPanel, 0.014, -0.277, 0.314, 0.033, "")
	HopeQoL_Bind(HopeRoute_AssignButton[6], HopeRoute_Assign6, true)
	HopeRoute_NodeButton[6] = HopeQoL_Button("HopeNode6", HopeRoute_Picker, 0.156, -0.125, 0.134, 0.03, "")
	HopeQoL_Bind(HopeRoute_NodeButton[6], HopeRoute_Node6, true)
	HopeJob_ShowFrame(HopeRoute_AssignPanel, false)
	HopeJob_ShowFrame(HopeRoute_Picker, false)
end

end

-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeChoice_FindDialog(d)
	local i = 1
	for _ in _loop_() do
		if i > HopeChoice_DialogCount then break end
		if HopeChoice_Dialog[i] == d then
			return i
		end
		i = i + 1
	end
	return 0
end

function HopeChoice_DialogDisplay(p, d, show)
	local i = HopeChoice_FindDialog(d)
	local owner = GetPlayerId(p)
	if show and i == 0 then
		HopeChoice_DialogCount = HopeChoice_DialogCount + 1
		i = HopeChoice_DialogCount
		HopeChoice_Dialog[i] = d
		HopeChoice_Owner[i] = owner
	end
	if i ~= 0 then
		if show then
			-- DialogAddButton creates a handle, so this stays outside GetLocalPlayer.
			if HopeChoice_FoldButton[i] == nil then
			-- Fold is handled by the modern local button.
			end
			if not HopeChoice_DialogPending[i] then
				HopeChoice_DialogPending[i] = true
				HopeChoice_PlayerPending[owner] = HopeChoice_PlayerPending[owner] + 1
			end
			if p == GetLocalPlayer() then
				HopeChoice_Hidden = false
				HopeChoice_NativeVisible = i
			end
		else
			if HopeChoice_DialogPending[i] then
				HopeChoice_DialogPending[i] = false
				HopeChoice_PlayerPending[HopeChoice_Owner[i]] = HopeChoice_PlayerPending[HopeChoice_Owner[i]] - 1
			end
			if p == GetLocalPlayer() and HopeChoice_NativeVisible == i then
				HopeChoice_NativeVisible = 0
			end
		end
	end
	HopeModern_NativeDisplay(p, d, show)
end

function HopeChoice_PickUnique(i, slot)
	local entry = 0
	local duplicate = true
	local start = (i - 1) * 3
	for _ in _loop_() do
		if not duplicate then break end
		entry = GetRandomInt(1, 17)
		duplicate = false
		if slot > 1 and entry == HopeChoice_UniqueEntry[start] then
			duplicate = true
		end
		if slot > 2 and entry == HopeChoice_UniqueEntry[start + 1] then
			duplicate = true
		end
	end
	HopeChoice_UniqueEntry[start + slot - 1] = entry
	return entry
end

function HopeChoice_ValueScore(entryId, value)
	-- v19 value-based rating (audit/08-choice-value-calc.py; unit values need
	-- in-game calibration). Anchor: single stat +3 = 100 = standard B.
	-- Rating is display only: it never changes the entry pick or tier roll.
	local u = 0.0
	if entryId == 1 or entryId == 2 or entryId == 3 or entryId == 6 then
		u = 33.3
	elseif entryId == 4 then
		u = 30.0
	elseif entryId == 5 then
		u = 1.67
	elseif entryId == 7 then
		u = 65.0
	elseif entryId == 8 then
		u = 0.22
	elseif entryId == 9 then
		u = 3.33
	elseif entryId == 10 or entryId == 11 or entryId == 15 then
		u = 1110.0
	elseif entryId == 12 then
		u = 25.0
	elseif entryId == 13 then
		u = 800.0
	elseif entryId == 14 then
		u = 3.33
	elseif entryId == 16 then
		u = 3330.0
	elseif entryId == 17 then
		u = 40.0
	end
	return R2I(u * value + 0.5)
end

function HopeChoice_RateText(text, entryId, value)
	-- v19: color = value-score rating. Thresholds S>135 A111-135 B90-110 C70-89
	-- D<70. C/B keep the v18 look (green/blue); A=purple, S=gold; D uncolored.
	local s = HopeChoice_ValueScore(entryId, value)
	if s > 135 then
		return "|cFFFFFC01[S] " .. (text or "") .. "|r"
	elseif s > 110 then
		return "|cffbf80ef[A] " .. (text or "") .. "|r"
	elseif s > 89 then
		return "|cff0042FF[B] " .. (text or "") .. "|r"
	elseif s > 69 then
		return "|cff20C000[C] " .. (text or "") .. "|r"
	end
	return "[D] " .. (text or "")
end

function HopeChoice_PendingForPlayer(i)
	if i < 0 or i >= 6 then
		return false
	end
	return HopeMeta_SeedPending[i] or HopeChoice_PlayerPending[i] > 0 or HopeChoice_SkillHead[i] < HopeChoice_SkillTail[i]
end

function HopeChoice_LootPending()
	local key = GetHandleId(GetLocalPlayer())
	return HaveSavedBoolean(YDHT, key, -1422318988) and not LoadBoolean(YDHT, key, -1422318988)
end

function HopeChoice_HasPending()
	return HopeChoice_LootPending() or HopeChoice_PendingForPlayer(GetPlayerId(GetLocalPlayer()))
end

function HopeChoice_ApplyVisibility()
	local i = 1
	local newest = 0
	local owner = GetPlayerId(GetLocalPlayer())
	-- Never show the hover outline by itself. The original hover callbacks own it.
	if udg_UI_sg[0] ~= 0 then
		DzFrameShow(udg_UI_sg[0], false)
	end
	if udg_UI_sg[1] ~= 0 then
		DzFrameShow(udg_UI_sg[1], HopeChoice_LootPending() and not HopeChoice_Hidden)
	end
	for _ in _loop_() do
		if i > HopeChoice_DialogCount then break end
		if HopeChoice_DialogPending[i] and HopeChoice_Owner[i] == owner then
			HopeModern_NativeDisplay(GetLocalPlayer(), HopeChoice_Dialog[i], false)
			newest = i
		end
		i = i + 1
	end
	-- Warcraft displays one native dialog at a time. Other pending choices remain
	-- registered and can be reopened after the current one is resolved.
	if not HopeChoice_Hidden and newest ~= 0 then
		HopeModern_NativeDisplay(GetLocalPlayer(), HopeChoice_Dialog[newest], true)
		HopeChoice_NativeVisible = newest
	else
		HopeChoice_NativeVisible = 0
	end
end

function HopeChoice_ToggleLocal()
	if not HopeChoice_HasPending() then
		HopeChoice_Hidden = false
		return
	end
	HopeChoice_Hidden = not HopeChoice_Hidden
	HopeChoice_ApplyVisibility()
end

function HopeChoice_Toggle()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeChoice_ToggleLocal()
	end
end

function HopeChoice_ReopenUpgrade(p, seller, sold)
	local owner = GetPlayerId(p)
	local i = HopeChoice_FindDialog(udg_Wj_sj_xz[owner + 1])
	if i == 0 then
		return false
	end
	if not HopeChoice_DialogPending[i] then
		return false
	end
	-- h00F is a zero-cost invisible selection token. The sell event already took
	-- stock; restore the unspent upgrade credit and remove only this extra token.
	AddUnitToStockBJ(1747988550, seller, udg_shengji_dian[owner + 1], udg_shengji_dian[owner + 1])
	RemoveUnit(sold)
	if p == GetLocalPlayer() then
		HopeChoice_Hidden = false
		HopeChoice_ApplyVisibility()
		HopeModern_NativeDisplay(p, HopeChoice_Dialog[i], true)
		HopeChoice_NativeVisible = i
	end
	return true
end

function HopeChoice_DeferSkill(p, abilityId)
	local owner = GetPlayerId(p)
	local i = HopeChoice_FindDialog(udg_Rskill_shifoutihuan[owner + 1])
	if i == 0 then
		return false
	end
	if not HopeChoice_DialogPending[i] then
		return false
	end
	-- This path runs in the original synchronized pickup action on all clients.
	-- Preserve each purchased skill ID; never overwrite the active dialog's ID.
	if HopeChoice_SkillQueue == nil then
		HopeChoice_SkillQueue = InitHashtable()
	end
	HopeChoice_SkillTail[owner] = HopeChoice_SkillTail[owner] + 1
	SaveInteger(HopeChoice_SkillQueue, owner, HopeChoice_SkillTail[owner], abilityId)
	DisplayTextToPlayer(p, 0, 0, "新的 R 技能已排队；先完成当前选择，随后依次确认。")
	return true
end

function HopeChoice_ShowNextSkill(p)
	local owner = GetPlayerId(p)
	local abilityId = 0
	local d = udg_Rskill_shifoutihuan[owner + 1]
	if HopeChoice_SkillHead[owner] >= HopeChoice_SkillTail[owner] then
		d = nil
		return
	end
	HopeChoice_SkillHead[owner] = HopeChoice_SkillHead[owner] + 1
	abilityId = LoadInteger(HopeChoice_SkillQueue, owner, HopeChoice_SkillHead[owner])
	RemoveSavedInteger(HopeChoice_SkillQueue, owner, HopeChoice_SkillHead[owner])
	if HopeChoice_SkillHead[owner] == HopeChoice_SkillTail[owner] then
		HopeChoice_SkillHead[owner] = 0
		HopeChoice_SkillTail[owner] = 0
	end
	-- Only present the preserved ID. Original R-skill callbacks still apply all
	-- learning/replacement effects, including their class-specific adjustments.
	HopeModern_Message(d, "是否替换当前R技能" .. (GetAbilityName(udg_R_Skill[owner + 1]) or ""))
	SaveInteger(YDHT, GetHandleId(d), -711261722, abilityId)
	HopeModern_Add(d, "是")
	SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 1)
	HopeModern_Add(d, "否（不退还所消耗金钱和木材）")
	SaveInteger(YDHT, GetHandleId(GetLastCreatedButtonBJ()), 54591090, 2)
	HopeChoice_DialogDisplay(p, d, true)
	d = nil
end

function HopeChoice_DialogClear(d)
	local i = HopeChoice_FindDialog(d)
	if i ~= 0 then
		if HopeChoice_DialogPending[i] then
			HopeChoice_DialogPending[i] = false
			HopeChoice_PlayerPending[HopeChoice_Owner[i]] = HopeChoice_PlayerPending[HopeChoice_Owner[i]] - 1
		end
		HopeChoice_FoldButton[i] = nil
		if HopeChoice_Owner[i] == GetPlayerId(GetLocalPlayer()) and HopeChoice_NativeVisible == i then
			HopeChoice_NativeVisible = 0
		end
	end
	HopeModern_Clear(d)
end

function HopeChoice_DialogClicked()
	local i = HopeChoice_FindDialog(HopeModern_GetDialog())
	if i == 0 then
		return false
	end
	if HopeModern_GetButton() == HopeChoice_FoldButton[i] then
		if HopeModern_GetPlayer() == GetLocalPlayer() then
			HopeChoice_Hidden = true
			HopeChoice_ApplyVisibility()
		end
		-- Every client returns from the original callback before random draws,
		-- DialogClear, learning/replacing a skill, or accepting a growth roll.
		return true
	end
	if HopeChoice_DialogPending[i] then
		HopeChoice_DialogPending[i] = false
		HopeChoice_PlayerPending[HopeChoice_Owner[i]] = HopeChoice_PlayerPending[HopeChoice_Owner[i]] - 1
	end
	if HopeModern_GetPlayer() == GetLocalPlayer() and HopeChoice_NativeVisible == i then
		HopeChoice_NativeVisible = 0
	end
	return false
end

function HopeChoice_RewardIssued(p)
	if p == GetLocalPlayer() then
		HopeChoice_Hidden = false
	end
end

function HopeChoice_Refresh()
	local pending = HopeChoice_HasPending()
	if not pending then
		HopeChoice_Hidden = false
	end
	if not HopeChoice_Hidden and HopeChoice_NativeVisible == 0 and HopeChoice_PendingForPlayer(GetPlayerId(GetLocalPlayer())) then
		HopeChoice_ApplyVisibility()
	end
	if udg_UI_sg[1] ~= 0 then
		DzFrameShow(udg_UI_sg[1], HopeChoice_LootPending() and not HopeChoice_Hidden)
	end
	if udg_UI_sg[0] ~= 0 and (HopeChoice_Hidden or not HopeChoice_LootPending()) then
		DzFrameShow(udg_UI_sg[0], false)
	end
	if HopeChoice_Button ~= 0 then
		DzFrameShow(HopeChoice_Button, pending)
		if HopeChoice_Hidden then
			DzFrameSetText(HopeChoice_Button, "展开待选项")
		else
			DzFrameSetText(HopeChoice_Button, "暂时收起选择")
		end
	end
end

function HopeGrowth_Begin(u)
	local p = GetOwningPlayer(u)
	local owner = GetPlayerId(p)
	if u == nil or owner < 0 or owner >= 6 or GetUnitTypeId(u) ~= 1211117616 then
		p = nil
		return
	end
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER or HopeGrowth_Started[owner] then
		p = nil
		return
	end
	HopeGrowth_Started[owner] = true
	HopeGrowth_Pending[owner] = true
	HopeGrowth_Hero[owner] = u
	HopeChoice_PlayerPending[owner] = HopeChoice_PlayerPending[owner] + 1
	if p == GetLocalPlayer() then
		HopeChoice_Hidden = false
		HopeQoL_Expanded = false
		HopeArchive_Expanded = false
		HopeGift_Expanded = false
		HopeRelic_Expanded = false
		HopeRoute_Details = false
		HopeJob_Expanded = false
	end
	p = nil
end

function HopeGrowth_CanAct(p)
	local owner = GetPlayerId(p)
	local u = nil
	if p == nil or owner < 0 or owner >= 6 then
		return false
	end
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER then
		return false
	end
	if not HopeGrowth_Started[owner] or not HopeGrowth_Pending[owner] then
		return false
	end
	u = udg_hero[owner + 1]
	if u == nil or u ~= HopeGrowth_Hero[owner] or GetOwningPlayer(u) ~= p or GetUnitTypeId(u) ~= 1211117616 or GetWidgetLife(u) <= 0.405 then
		u = nil
		return false
	end
	u = nil
	return true
end

function HopeReward_DrawRelic(i)
	local drawn = nil
	local attempts = 0
	local id = 0
	local j = 0
	local duplicate = false
	for _ in _loop_() do
		if attempts >= 32 then break end
		attempts = attempts + 1
		drawn = PlaceRandomItem(udg_YiwuChi[i], 2706.0, 2100.0)
		if drawn == nil then
			if true then break end
		end
		id = GetItemTypeId(drawn)
		duplicate = false
		j = 0
		for _ in _loop_() do
			if j >= HopeReward_DrawCount[i] then break end
			if HopeReward_DrawId[i * 3 + j] == id then
				duplicate = true
			end
			j = j + 1
		end
		if not duplicate then
			if true then break end
		end
		RemoveItem(drawn)
		drawn = nil
	end
	if drawn == nil then
		-- The unique relic pool can be exhausted in infinite mode. Offer ordinary
		-- equipment through the existing claim dispatcher instead of item id zero.
		drawn = CreateItem(udg_wp[GetRandomInt(5, 27)], 2706.0, 2100.0)
	end
	HopeReward_DrawId[i * 3 + HopeReward_DrawCount[i]] = GetItemTypeId(drawn)
	HopeReward_DrawCount[i] = HopeReward_DrawCount[i] + 1
	return drawn
end

function HopeRelic_Item(index)
	if index == 0 then
		return 1227895369
	elseif index == 1 then
		return 1227895609
	elseif index == 2 then
		return 1227895089
	elseif index == 3 then
		return 1227895380
	elseif index == 4 then
		return 1227895370
	elseif index == 5 then
		return 1227895371
	elseif index == 6 then
		return 1227895381
	elseif index == 7 then
		return 1227895372
	elseif index == 8 then
		return 1227895382
	elseif index == 9 then
		return 1227895383
	elseif index == 10 then
		return 1227895384
	elseif index == 11 then
		return 1227895385
	elseif index == 12 then
		return 1227895373
	elseif index == 13 then
		return 1227895374
	elseif index == 14 then
		return 1227895375
	elseif index == 15 then
		return 1227895376
	elseif index == 16 then
		return 1227895377
	elseif index == 17 then
		return 1227895378
	elseif index == 18 then
		return 1227895379
	elseif index == 19 then
		return 1227895386
	elseif index == 20 then
		return 1227895600
	elseif index == 21 then
		return 1227895601
	elseif index == 22 then
		return 1227895602
	elseif index == 23 then
		return 1227895603
	elseif index == 24 then
		return 1227895621
	elseif index == 25 then
		return 1227895624
	elseif index == 26 then
		return 1227895622
	elseif index == 27 then
		return 1227895620
	elseif index == 28 then
		return 1227895623
	elseif index == 29 then
		return 1227895625
	elseif index == 30 then
		return 1227895856
	elseif index == 31 then
		return 1227895857
	elseif index == 32 then
		return 1227895642
	elseif index == 33 then
		return 1227895860
	elseif index == 34 then
		return 1227895859
	elseif index == 35 then
		return 1227895861
	elseif index == 36 then
		return 1227895877
	elseif index == 37 then
		return 1227895878
	elseif index == 38 then
		return 1227895879
	elseif index == 39 then
		return 1227895862
	elseif index == 40 then
		return 1227895882
	elseif index == 41 then
		return 1227895890
	elseif index == 42 then
		return 1227895891
	elseif index == 43 then
		return 1227895892
	end
	return 0
end

function HopeRelic_Ability(index)
	if index == 0 then
		return 1093677620
	elseif index == 1 then
		return 1093677657
	elseif index == 2 then
		return 1093677381
	elseif index == 3 then
		return 1093677643
	elseif index == 4 then
		return 1093677624
	elseif index == 5 then
		return 1093677621
	elseif index == 6 then
		return 1093677640
	elseif index == 7 then
		return 1093677633
	elseif index == 8 then
		return 1093677647
	elseif index == 9 then
		return 1093677644
	elseif index == 10 then
		return 1093677645
	elseif index == 11 then
		return 1093677646
	elseif index == 12 then
		return 1093677636
	elseif index == 13 then
		return 1093677634
	elseif index == 14 then
		return 1093677635
	elseif index == 15 then
		return 1093677638
	elseif index == 16 then
		return 1093677637
	elseif index == 17 then
		return 1093677622
	elseif index == 18 then
		return 1093677625
	elseif index == 19 then
		return 1093677641
	elseif index == 20 then
		return 1093677642
	elseif index == 21 then
		return 1093677648
	elseif index == 22 then
		return 1093677649
	elseif index == 23 then
		return 1093677650
	elseif index == 24 then
		return 1093677366
	elseif index == 25 then
		return 1093677378
	elseif index == 26 then
		return 1093677369
	elseif index == 27 then
		return 1093677367
	elseif index == 28 then
		return 1093677368
	elseif index == 29 then
		return 1093677377
	elseif index == 30 then
		return 1093677907
	elseif index == 31 then
		return 1093677904
	elseif index == 32 then
		return 1093677908
	elseif index == 33 then
		return 1093677910
	elseif index == 34 then
		return 1093677909
	elseif index == 35 then
		return 1093677911
	elseif index == 36 then
		return 1093678137
	elseif index == 37 then
		return 1093678145
	elseif index == 38 then
		return 1093678146
	elseif index == 39 then
		return 1093677382
	elseif index == 40 then
		return 1093678150
	elseif index == 41 then
		return 1093678157
	elseif index == 42 then
		return 1093678158
	elseif index == 43 then
		return 1093678159
	end
	return 0
end

function HopeRelic_Name(index)
	if index == 0 then
		return "傲慢"
	elseif index == 1 then
		return "魔法师"
	elseif index == 2 then
		return "法术大师"
	elseif index == 3 then
		return "爆伤强化"
	elseif index == 4 then
		return "玻璃大炮"
	elseif index == 5 then
		return "沉稳"
	elseif index == 6 then
		return "刺客"
	elseif index == 7 then
		return "聪慧"
	elseif index == 8 then
		return "额外行动"
	elseif index == 9 then
		return "伐木工"
	elseif index == 10 then
		return "富有"
	elseif index == 11 then
		return "黄金律"
	elseif index == 12 then
		return "冷静"
	elseif index == 13 then
		return "灵敏"
	elseif index == 14 then
		return "平平无奇"
	elseif index == 15 then
		return "破釜沉舟"
	elseif index == 16 then
		return "强攻"
	elseif index == 17 then
		return "强壮"
	elseif index == 18 then
		return "食尸鬼"
	elseif index == 19 then
		return "心眼（伪）"
	elseif index == 20 then
		return "心眼（真）"
	elseif index == 21 then
		return "刚硬"
	elseif index == 22 then
		return "贪婪"
	elseif index == 23 then
		return "趁胜恢复"
	elseif index == 24 then
		return "疾风连击"
	elseif index == 25 then
		return "觉醒"
	elseif index == 26 then
		return "慎之又慎"
	elseif index == 27 then
		return "文武双全"
	elseif index == 28 then
		return "指挥官"
	elseif index == 29 then
		return "杀敌攻击"
	elseif index == 30 then
		return "华丽收场"
	elseif index == 31 then
		return "一发648"
	elseif index == 32 then
		return "硬撑"
	elseif index == 33 then
		return "飞侠"
	elseif index == 34 then
		return "神力"
	elseif index == 35 then
		return "天才"
	elseif index == 36 then
		return "高级药水"
	elseif index == 37 then
		return "爆种"
	elseif index == 38 then
		return "法师，只要是法师就行了"
	elseif index == 39 then
		return "大人,时代变了"
	elseif index == 40 then
		return "摸鱼"
	elseif index == 41 then
		return "潜力开发（力量）"
	elseif index == 42 then
		return "潜力开发（敏捷）"
	elseif index == 43 then
		return "潜力开发（智力）"
	end
	return ""
end

function HopeRelic_IconPath(index)
	if index == 0 then
		return "ReplaceableTextures\\PassiveButtons\\PASBTNStormHammer.blp"
	elseif index == 1 then
		return "ReplaceableTextures\\CommandButtons\\BTNBansheeMaster.blp"
	elseif index == 2 then
		return "ReplaceableTextures\\CommandButtons\\BTNNecromancerMaster.blp"
	elseif index == 3 then
		return "ReplaceableTextures\\CommandButtons\\BTNShamanMaster.blp"
	elseif index == 4 then
		return "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpTwo.blp"
	elseif index == 5 then
		return "ReplaceableTextures\\PassiveButtons\\PASBTNHardenedSkin.blp"
	elseif index == 6 then
		return "ReplaceableTextures\\CommandButtons\\BTNAvengingWatcherOn.blp"
	elseif index == 7 then
		return "ReplaceableTextures\\CommandButtons\\BTNAbsorbMagic.blp"
	elseif index == 8 then
		return "ReplaceableTextures\\CommandButtons\\BTNDevourMagic.blp"
	elseif index == 9 then
		return "ReplaceableTextures\\CommandButtons\\BTNReturnGoods.blp"
	elseif index == 10 then
		return "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp"
	elseif index == 11 then
		return "ReplaceableTextures\\CommandButtons\\BTNMGExchange.blp"
	elseif index == 12 then
		return "ReplaceableTextures\\CommandButtons\\BTNFrostArmorOn.blp"
	elseif index == 13 then
		return "ReplaceableTextures\\CommandButtons\\BTNDarkSummoning.blp"
	elseif index == 14 then
		return "ReplaceableTextures\\PassiveButtons\\PASBTNStatUp.blp"
	elseif index == 15 then
		return "ReplaceableTextures\\CommandButtons\\BTNBerserk.blp"
	elseif index == 16 then
		return "ReplaceableTextures\\CommandButtons\\BTNClawsOfAttack.blp"
	elseif index == 17 then
		return "ReplaceableTextures\\CommandButtons\\BTNDeathPact.blp"
	elseif index == 18 then
		return "ReplaceableTextures\\CommandButtons\\BTNCannibalize.blp"
	elseif index == 19 then
		return "BTNXY3 Ico.blp"
	elseif index == 20 then
		return "BTNXY3 Ico.blp"
	elseif index == 21 then
		return "ReplaceableTextures\\CommandButtons\\BTNGolemThunderclap.blp"
	elseif index == 22 then
		return "ReplaceableTextures\\CommandButtons\\BTNLGExchange.blp"
	elseif index == 23 then
		return "ReplaceableTextures\\CommandButtons\\BTNScrollOfTownPortal.blp"
	elseif index == 24 then
		return "ReplaceableTextures\\CommandButtons\\BTNMoonStone.blp"
	elseif index == 25 then
		return "ReplaceableTextures\\CommandButtons\\BTNBarkskin.blp"
	elseif index == 26 then
		return "ReplaceableTextures\\CommandButtons\\BTNBansheeAdept.blp"
	elseif index == 27 then
		return "ReplaceableTextures\\CommandButtons\\BTNSpellShieldAmulet.blp"
	elseif index == 28 then
		return "ReplaceableTextures\\CommandButtons\\BTNHumanCaptureFlag.blp"
	elseif index == 29 then
		return "ReplaceableTextures\\CommandButtons\\BTNImprovedUnholyStrength.blp"
	elseif index == 30 then
		return "ReplaceableTextures\\CommandButtons\\BTNDeathAndDecay.blp"
	elseif index == 31 then
		return "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp"
	elseif index == 32 then
		return "ReplaceableTextures\\PassiveButtons\\PASBTNHardenedSkin.blp"
	elseif index == 33 then
		return "ReplaceableTextures\\CommandButtons\\BTNSlippersOfAgility.blp"
	elseif index == 34 then
		return "ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp"
	elseif index == 35 then
		return "ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp"
	elseif index == 36 then
		return "ReplaceableTextures\\CommandButtons\\BTNPotionGreen.blp"
	elseif index == 37 then
		return "ReplaceableTextures\\CommandButtons\\BTNMetamorphosis.blp"
	elseif index == 38 then
		return "ReplaceableTextures\\CommandButtons\\BTNWitchDoctorAdept.blp"
	elseif index == 39 then
		return "ReplaceableTextures\\CommandButtons\\BTNHumanMissileUpOne.blp"
	elseif index == 40 then
		return "ReplaceableTextures\\CommandButtons\\BTNMY11.blp"
	elseif index == 41 then
		return "ReplaceableTextures\\CommandButtons\\BTNSpy.blp"
	elseif index == 42 then
		return "ReplaceableTextures\\CommandButtons\\BTNSpy.blp"
	elseif index == 43 then
		return "ReplaceableTextures\\CommandButtons\\BTNSpy.blp"
	end
	return ""
end

function HopeRelic_DescriptionPages(index)
	if index == 0 then
		return 1
	elseif index == 1 then
		return 1
	elseif index == 2 then
		return 1
	elseif index == 3 then
		return 1
	elseif index == 4 then
		return 1
	elseif index == 5 then
		return 1
	elseif index == 6 then
		return 1
	elseif index == 7 then
		return 1
	elseif index == 8 then
		return 1
	elseif index == 9 then
		return 1
	elseif index == 10 then
		return 1
	elseif index == 11 then
		return 1
	elseif index == 12 then
		return 1
	elseif index == 13 then
		return 1
	elseif index == 14 then
		return 1
	elseif index == 15 then
		return 1
	elseif index == 16 then
		return 1
	elseif index == 17 then
		return 1
	elseif index == 18 then
		return 1
	elseif index == 19 then
		return 1
	elseif index == 20 then
		return 1
	elseif index == 21 then
		return 1
	elseif index == 22 then
		return 1
	elseif index == 23 then
		return 1
	elseif index == 24 then
		return 1
	elseif index == 25 then
		return 1
	elseif index == 26 then
		return 1
	elseif index == 27 then
		return 1
	elseif index == 28 then
		return 1
	elseif index == 29 then
		return 1
	elseif index == 30 then
		return 2
	elseif index == 31 then
		return 1
	elseif index == 32 then
		return 1
	elseif index == 33 then
		return 1
	elseif index == 34 then
		return 1
	elseif index == 35 then
		return 1
	elseif index == 36 then
		return 1
	elseif index == 37 then
		return 2
	elseif index == 38 then
		return 2
	elseif index == 39 then
		return 1
	elseif index == 40 then
		return 1
	elseif index == 41 then
		return 1
	elseif index == 42 then
		return 1
	elseif index == 43 then
		return 1
	end
	return 1
end

function HopeRelic_Description(index, page)
	if index == 0 then
		if page == 0 then
			return "攻击力+30 血量上限-30"
		end
	elseif index == 1 then
		if page == 0 then
			return "技能伤害+35%"
		end
	elseif index == 2 then
		if page == 0 then
			return "法术伤害+35%"
		end
	elseif index == 3 then
		if page == 0 then
			return "暴击伤害+50%"
		end
	elseif index == 4 then
		if page == 0 then
			return "当前生命上限和生命成长各减少50%；|n回合结束加甲减少10。最终伤害加成+5|n0%。"
		end
	elseif index == 5 then
		if page == 0 then
			return "攻击力-5，回合结束加甲+20。"
		end
	elseif index == 6 then
		if page == 0 then
			return "精确打击伤害+50%"
		end
	elseif index == 7 then
		if page == 0 then
			return "智力+5, 智力成长+0.5"
		end
	elseif index == 8 then
		if page == 0 then
			return "行动力+1"
		end
	elseif index == 9 then
		if page == 0 then
			return "战斗胜利后木材奖励+1"
		end
	elseif index == 10 then
		if page == 0 then
			return "一次性获得800金钱"
		end
	elseif index == 11 then
		if page == 0 then
			return "每过一层获得75金钱"
		end
	elseif index == 12 then
		if page == 0 then
			return "专注上限+5。"
		end
	elseif index == 13 then
		if page == 0 then
			return "敏捷+5, 敏捷成长+0.5"
		end
	elseif index == 14 then
		if page == 0 then
			return "全属性+5"
		end
	elseif index == 15 then
		if page == 0 then
			return "当前HP-50% 暴击率+15%|n英雄药水数归0|n根据减少的药水数增加暴击伤害|n每减少一瓶药水 暴击伤害+25%"
		end
	elseif index == 16 then
		if page == 0 then
			return "攻击力+15 精确打击伤害+15%"
		end
	elseif index == 17 then
		if page == 0 then
			return "力量+5 力量成长+0.5"
		end
	elseif index == 18 then
		if page == 0 then
			return "击杀敌人恢复5点生命值"
		end
	elseif index == 19 then
		if page == 0 then
			return "敏捷-10 暴击率+35% 暴击伤害-30%"
		end
	elseif index == 20 then
		if page == 0 then
			return "暴击率+15% 暴击伤害+100%"
		end
	elseif index == 21 then
		if page == 0 then
			return "当前血量上限+20%"
		end
	elseif index == 22 then
		if page == 0 then
			return "怪物死亡时额外获得10金钱"
		end
	elseif index == 23 then
		if page == 0 then
			return "战斗胜利后恢复10%的生命值"
		end
	elseif index == 24 then
		if page == 0 then
			return "造成伤害时有40%概率追加一次英雄攻|n击力的物理伤害。部分技能伤害不参与|n此次概率判定。"
		end
	elseif index == 25 then
		if page == 0 then
			return "场上仅剩你一位存活英雄，生命不高于|n30%且受到伤害时发动：抵消本次伤害|n，三围各+200，最终伤害+100%。战斗|n结束移除加成；发动后遗物消耗。"
		end
	elseif index == 26 then
		if page == 0 then
			return "造成任意伤害后 行动点均会归0|n最终伤害+60%|n回合结束时防御+30"
		end
	elseif index == 27 then
		if page == 0 then
			return "技能伤害+20% 暴击率+5% 暴击伤害+30|n%"
		end
	elseif index == 28 then
		if page == 0 then
			return "所有玩家最终伤害+10%"
		end
	elseif index == 29 then
		if page == 0 then
			return "杀敌攻击+1"
		end
	elseif index == 30 then
		if page == 0 then
			return "使用结束回合技能时，如果你的剩余行|n动点等于你全属性的个位数|n（例：你全属性为103，则剩余行动点|n为3时触发）|n就对场上所有敌人造成法术伤害  （法|n术伤害，技能）"
		elseif page == 1 then
			return "伤害值：英雄全属性*（剩余行动点+1|n）"
		end
	elseif index == 31 then
		if page == 0 then
			return "取得时若金币不少于648，支付648金币|n进行10次随机抽奖。金币不足则不抽奖|n；本遗物不会返还。"
		end
	elseif index == 32 then
		if page == 0 then
			return "英雄受到任意伤害后增加30点护甲"
		end
	elseif index == 33 then
		if page == 0 then
			return "取得时，敏捷增加10＋基础敏捷的10%|n（向下取整），一次性结算。"
		end
	elseif index == 34 then
		if page == 0 then
			return "取得时，力量增加10＋基础力量的10%|n（向下取整），一次性结算。"
		end
	elseif index == 35 then
		if page == 0 then
			return "取得时，智力增加10＋基础智力的10%|n（向下取整），一次性结算。"
		end
	elseif index == 36 then
		if page == 0 then
			return "让玩家的药水恢复生命效果从30%提高|n到50%"
		end
	elseif index == 37 then
		if page == 0 then
			return "发动条件：持有本遗物，且力量、敏捷、|n智力成长任意一项≥2.8（EX）。|n每场战斗第2回合开始时，最终伤害加成|n+50个百分点，持续到战斗结束。"
		elseif page == 1 then
			return "每场战斗只触发一次，战斗结束时移除。|n（进入战斗时为第0回合）"
		end
	elseif index == 38 then
		if page == 0 then
			return "每次战斗胜利后，智力+3，法术和技能|n伤害加成各+3个百分点。|n触发条件二选一：|n① 初级法师：持有本遗物即可，没有成|n长门槛。"
		elseif page == 1 then
			return "② 法师学徒：智力成长≤1.6、魔力成长|n≤1.6；此分支不要求持有本遗物。|n其他职业不触发。"
		end
	elseif index == 39 then
		if page == 0 then
			return "英雄在第一回合将学会一个每场战斗限|n用一次的特殊技能|n（每次进入战斗为第0回合）"
		end
	elseif index == 40 then
		if page == 0 then
			return "摸鱼一时爽，一直摸鱼一直爽|n每次结束回合时，根据剩余行动点获得|nX点经验和金钱奖励，每场战斗最多获|n得100点经验和100金钱|nX值：行动点*10"
		end
	elseif index == 41 then
		if page == 0 then
			return "仅力量主属性英雄有效：取得时力量增|n加 (4.5－力量成长)²×7，向下取整；|n随后力量成长-0.5。"
		end
	elseif index == 42 then
		if page == 0 then
			return "仅敏捷主属性英雄有效：取得时敏捷增|n加 (4.5－敏捷成长)²×7，向下取整；|n随后敏捷成长-0.5。"
		end
	elseif index == 43 then
		if page == 0 then
			return "仅智力主属性英雄有效：取得时智力增|n加 (4.5－智力成长)²×7，向下取整；|n随后智力成长-0.5。"
		end
	end
	return ""
end

function HopeRelic_Record(p, itemId)
	local owner = GetPlayerId(p)
	local index = 0
	if owner < 0 or owner >= 6 then
		return
	end
	for _ in _loop_() do
		if index >= 44 then break end
		if HopeRelic_Item(index) == itemId then
			HopeRelic_Acquired[owner * 44 + index] = HopeRelic_Acquired[owner * 44 + index] + 1
			HopeMeta_Catalog(owner, index)
			return
		end
		index = index + 1
	end
end

function HopeRelic_Owned(p, index)
	local owner = GetPlayerId(p)
	if owner < 0 or owner >= 6 or index < 0 or index >= 44 then
		return false
	end
	-- The second original unit is only a duplicate display of relics 12 onward.
	-- The primary unit remains authoritative for persistent ability state.
	return HopeRelic_Acquired[owner * 44 + index] > 0 or GetUnitAbilityLevel(udg_Yiwu_danwei[owner + 1], HopeRelic_Ability(index)) > 0
end

function HopeRelic_Total(p)
	local index = 0
	local count = 0
	for _ in _loop_() do
		if index >= 44 then break end
		if HopeRelic_Owned(p, index) then
			count = count + 1
		end
		index = index + 1
	end
	return count
end

function HopeRelic_OpenFor(p)
	if not HopeRelic_UIReady then
		return false
	end
	if p == GetLocalPlayer() then
		if HopeGrowth_Pending[GetPlayerId(p)] then
			HopeChoice_Hidden = true
		end
		HopeRelic_Expanded = not HopeRelic_Expanded
		if HopeRelic_Expanded then
			HopeLayout_Focus(4)
		end
		HopeQoL_Expanded = false
		HopeArchive_Expanded = false
		HopeGift_Expanded = false
		HopeRoute_Details = false
	end
	return true
end

function HopeRelic_Close()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeRelic_Expanded = false
		DzFrameShow(HopeRelic_Panel, false)
	end
end

function HopeRelic_SelectRow(slot)
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() and slot >= 0 and slot < 6 then
		if HopeRelic_RowIndex[slot] >= 0 and HopeRelic_RowIndex[slot] < 44 then
			HopeRelic_Selected = HopeRelic_RowIndex[slot]
			HopeRelic_DetailPage = 0
		end
	end
end

function HopeRelic_Prev()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() and HopeRelic_Page > 0 then
		HopeRelic_Page = HopeRelic_Page - 1
		HopeRelic_Selected = -1
		HopeRelic_DetailPage = 0
	end
end

function HopeRelic_Next()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() and (HopeRelic_Page + 1) * 6 < HopeRelic_Total(GetLocalPlayer()) then
		HopeRelic_Page = HopeRelic_Page + 1
		HopeRelic_Selected = -1
		HopeRelic_DetailPage = 0
	end
end

function HopeRelic_NextDetail()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() and HopeRelic_Selected >= 0 then
		HopeRelic_DetailPage = HopeRelic_DetailPage + 1
		if HopeRelic_DetailPage >= HopeRelic_DescriptionPages(HopeRelic_Selected) then
			HopeRelic_DetailPage = 0
		end
	end
end

function HopeRelic_State(p, index)
	local owner = GetPlayerId(p)
	local count = HopeRelic_Acquired[owner * 44 + index]
	local state = "已获得"
	if count > 0 then
		state = "取得 " .. (I2S(count) or "") .. " 次"
	end
	if HopeRelic_Ability(index) == 1093677378 then
		if GetUnitAbilityLevel(udg_Yiwu_danwei[owner + 1], 1093677378) > 0 then
			return (state or "") .. " · 待发动"
		elseif HaveSavedBoolean(YDHT, GetHandleId(udg_hero[owner + 1]), -364772706) then
			return (state or "") .. " · 本场已发动"
		end
		return (state or "") .. " · 已消耗"
	end
	return state
end

function HopeRelic_Row0()
	HopeRelic_SelectRow(0)
end

function HopeRelic_Row1()
	HopeRelic_SelectRow(1)
end

function HopeRelic_Row2()
	HopeRelic_SelectRow(2)
end

function HopeRelic_Row3()
	HopeRelic_SelectRow(3)
end

function HopeRelic_Row4()
	HopeRelic_SelectRow(4)
end

function HopeRelic_Row5()
	HopeRelic_SelectRow(5)
end

function HopeRelic_Refresh()
	local p = GetLocalPlayer()
	local total = 0
	local pageCount = 1
	local index = 0
	local ordinal = 0
	local row = 0
	local first = -1
	local selectedVisible = false
	local show = false
	local title = ""
	if not HopeRelic_UIReady then
		p = nil
		return
	end
	show = HopeRelic_Expanded and not (HopeChoice_HasPending() and not HopeChoice_Hidden)
	if HopeQoL_Expanded or HopeArchive_Expanded or HopeGift_Expanded or HopeRoute_Details then
		HopeRelic_Expanded = false
		show = false
	end
	DzFrameShow(HopeRelic_Panel, show)
	if not show then
		p = nil
		return
	end
	total = HopeRelic_Total(p)
	pageCount = R2I(I2R(total + 5) / 6.0)
	if pageCount < 1 then
		pageCount = 1
	end
	if HopeRelic_Page >= pageCount then
		HopeRelic_Page = pageCount - 1
	end
	for _ in _loop_() do
		if row >= 6 then break end
		HopeRelic_RowIndex[row] = -1
		DzFrameShow(HopeRelic_RowButton[row], false)
		row = row + 1
	end
	row = 0
	for _ in _loop_() do
		if index >= 44 then break end
		if HopeRelic_Owned(p, index) then
			if ordinal >= HopeRelic_Page * 6 and ordinal < (HopeRelic_Page + 1) * 6 then
				HopeRelic_RowIndex[row] = index
				if first == -1 then
					first = index
				end
				if index == HopeRelic_Selected then
					selectedVisible = true
				end
				row = row + 1
			end
			ordinal = ordinal + 1
		end
		index = index + 1
	end
	if not selectedVisible then
		HopeRelic_Selected = first
		HopeRelic_DetailPage = 0
	end
	row = 0
	for _ in _loop_() do
		if row >= 6 then break end
		index = HopeRelic_RowIndex[row]
		if index >= 0 then
			title = HopeRelic_Name(index)
			if index == HopeRelic_Selected then
				title = "|cffffd27a" .. (title or "") .. "|r"
			else
				title = "|cffdedede" .. (title or "") .. "|r"
			end
			DzFrameSetText(HopeRelic_RowButton[row], title)
			DzFrameShow(HopeRelic_RowButton[row], true)
		end
		row = row + 1
	end
	DzFrameSetText(HopeRelic_Heading, "|cffd2b879本局遗物|r")
	DzFrameSetText(HopeRelic_Summary, "已获得 " .. (I2S(total) or "") .. " 种 · 点击名称查看完整效果")
	DzFrameSetText(HopeRelic_PageText, (I2S(HopeRelic_Page + 1) or "") .. " / " .. (I2S(pageCount) or ""))
	DzFrameShow(HopeRelic_PrevButton, HopeRelic_Page > 0)
	DzFrameShow(HopeRelic_NextButton, (HopeRelic_Page + 1) * 6 < total)
	index = HopeRelic_Selected
	if index < 0 then
		DzFrameShow(HopeRelic_Icon, false)
		DzFrameSetText(HopeRelic_NameText, "尚未获得遗物")
		DzFrameSetText(HopeRelic_StateText, "")
		DzFrameSetText(HopeRelic_DetailText, "在冒险中选择遗物奖励后，可在这里查看名称与完整效果。")
		DzFrameShow(HopeRelic_DetailButton, false)
	else
		DzFrameSetTexture(HopeRelic_Icon, HopeRelic_IconPath(index), 0)
		DzFrameShow(HopeRelic_Icon, true)
		DzFrameSetText(HopeRelic_NameText, "|cffd2b879" .. (HopeRelic_Name(index) or "") .. "|r")
		DzFrameSetText(HopeRelic_StateText, HopeRelic_State(p, index))
		DzFrameSetText(HopeRelic_DetailText, HopeRelic_Description(index, HopeRelic_DetailPage))
		DzFrameShow(HopeRelic_DetailButton, HopeRelic_DescriptionPages(index) > 1)
		DzFrameSetText(HopeRelic_DetailButton, "说明 " .. (I2S(HopeRelic_DetailPage + 1) or "") .. "/" .. (I2S(HopeRelic_DescriptionPages(index)) or "") .. "  >")
	end
	p = nil
end

function HopeRelic_CreateUI()
	local f = 0
	local row = 0
	HopeRelic_Panel = HopeQoL_Surface("HopeRelicPanel", 0.24, 0.53, 0.34, 0.285)
	if HopeRelic_Panel == 0 then
		return
	end
	HopeRelic_Heading = HopeQoL_Label("HopeRelicHeading", HopeRelic_Panel, 0.009, -0.008, 0.245, 0.018, "")
	f = HopeQoL_Button("HopeRelicClose", HopeRelic_Panel, 0.288, -0.007, 0.043, 0.021, "关闭")
	if f == 0 then
		return
	end
	HopeQoL_Bind(f, HopeRelic_Close, false)
	HopeRelic_Summary = HopeQoL_Label("HopeRelicSummary", HopeRelic_Panel, 0.009, -0.033, 0.322, 0.017, "")
	for _ in _loop_() do
		if row >= 6 then break end
		HopeRelic_RowButton[row] = HopeQoL_Button("HopeRelicRow" .. (I2S(row) or ""), HopeRelic_Panel, 0.009, -0.056 - I2R(row) * 0.031, 0.118, 0.029, "")
		HopeRelic_RowIndex[row] = -1
		if HopeRelic_RowButton[row] == 0 then
			return
		end
		row = row + 1
	end
	HopeQoL_Bind(HopeRelic_RowButton[0], HopeRelic_Row0, false)
	HopeQoL_Bind(HopeRelic_RowButton[1], HopeRelic_Row1, false)
	HopeQoL_Bind(HopeRelic_RowButton[2], HopeRelic_Row2, false)
	HopeQoL_Bind(HopeRelic_RowButton[3], HopeRelic_Row3, false)
	HopeQoL_Bind(HopeRelic_RowButton[4], HopeRelic_Row4, false)
	HopeQoL_Bind(HopeRelic_RowButton[5], HopeRelic_Row5, false)
	HopeRelic_Icon = DzCreateFrameByTagName("BACKDROP", "HopeRelicIcon", HopeRelic_Panel, "HopePassBackdrop", 0)
	if HopeRelic_Icon == 0 then
		return
	end
	DzFrameSetPoint(HopeRelic_Icon, 0, HopeRelic_Panel, 0, 0.14, -0.056)
	DzFrameSetSize(HopeRelic_Icon, 0.027, 0.027)
	HopeRelic_NameText = HopeQoL_Label("HopeRelicName", HopeRelic_Panel, 0.174, -0.057, 0.157, 0.03, "")
	HopeRelic_StateText = HopeQoL_Label("HopeRelicState", HopeRelic_Panel, 0.14, -0.091, 0.191, 0.018, "")
	HopeRelic_DetailText = HopeQoL_Label("HopeRelicDetail", HopeRelic_Panel, 0.14, -0.115, 0.191, 0.128, "")
	HopeRelic_PrevButton = HopeQoL_Button("HopeRelicPrev", HopeRelic_Panel, 0.009, -0.253, 0.03, 0.021, "<")
	HopeRelic_PageText = HopeQoL_Label("HopeRelicPage", HopeRelic_Panel, 0.049, -0.255, 0.046, 0.017, "")
	HopeRelic_NextButton = HopeQoL_Button("HopeRelicNext", HopeRelic_Panel, 0.097, -0.253, 0.03, 0.021, ">")
	HopeRelic_DetailButton = HopeQoL_Button("HopeRelicDetailNext", HopeRelic_Panel, 0.226, -0.253, 0.105, 0.021, "")
	HopeQoL_Bind(HopeRelic_PrevButton, HopeRelic_Prev, false)
	HopeQoL_Bind(HopeRelic_NextButton, HopeRelic_Next, false)
	HopeQoL_Bind(HopeRelic_DetailButton, HopeRelic_NextDetail, false)
	HopeRelic_UIReady = HopeRelic_Heading ~= 0 and HopeRelic_Summary ~= 0 and HopeRelic_NameText ~= 0 and HopeRelic_StateText ~= 0 and HopeRelic_DetailText ~= 0 and HopeRelic_PrevButton ~= 0 and HopeRelic_PageText ~= 0 and HopeRelic_NextButton ~= 0 and HopeRelic_DetailButton ~= 0
	DzFrameShow(HopeRelic_Panel, false)
end

function HopeGrowth_Randomize(i)
	local penalty = I2R(udg_ND_sz) * 0.1
	local total = 0.0
	udg_cz1Str_up[i] = GetRandomReal(0.8, 3.5 - penalty)
	udg_cz2Agi_up[i] = GetRandomReal(0.8, 3.5 - penalty)
	udg_cz3Int_up[i] = GetRandomReal(0.8, 3.5 - penalty)
	total = udg_cz1Str_up[i] + udg_cz2Agi_up[i] + udg_cz3Int_up[i]
	if total > 7.0 then
		udg_cz1Str_up[i] = GetRandomReal(0.8, 3.0 - penalty)
		udg_cz2Agi_up[i] = GetRandomReal(0.8, 3.0 - penalty)
		udg_cz3Int_up[i] = GetRandomReal(0.8, 3.0 - penalty)
		total = udg_cz1Str_up[i] + udg_cz2Agi_up[i] + udg_cz3Int_up[i]
		if total > 7.0 then
			udg_cz1Str_up[i] = GetRandomReal(0.8, 3.0 - penalty)
			udg_cz2Agi_up[i] = GetRandomReal(0.8, 3.0 - penalty)
			udg_cz3Int_up[i] = GetRandomReal(0.8, 3.0 - penalty)
			total = udg_cz1Str_up[i] + udg_cz2Agi_up[i] + udg_cz3Int_up[i]
		else
			if total > 7.0 then
				udg_cz1Str_up[i] = GetRandomReal(0.8, 3.0 - penalty)
				udg_cz2Agi_up[i] = GetRandomReal(0.8, 3.0 - penalty)
				udg_cz3Int_up[i] = GetRandomReal(0.8, 3.0 - penalty)
				total = udg_cz1Str_up[i] + udg_cz2Agi_up[i] + udg_cz3Int_up[i]
			else
			end
		end
	else
	end
	udg_cz4Hp_up[i] = GetRandomReal(2.0, 10.0)
	udg_cz5Mp_up[i] = GetRandomReal(0.5, 3.5)
	udg_cz6Dex_up[i] = GetRandomReal(0.5, 3.5)
end

function HopeGrowth_UpdateTooltip(i)
	local abilityId = LoadInteger(YDHT, i, 1093503686)
	local s = "力量成长: " .. (HopeQoL_GradedGrowth(udg_cz1Str_up[i], false) or "")
	s = (s or "") .. "|n敏捷成长: " .. (HopeQoL_GradedGrowth(udg_cz2Agi_up[i], false) or "")
	s = (s or "") .. "|n智力成长: " .. (HopeQoL_GradedGrowth(udg_cz3Int_up[i], false) or "")
	s = (s or "") .. "|n生命成长: " .. (HopeQoL_GradedGrowth(udg_cz4Hp_up[i], true) or "")
	s = (s or "") .. "|n魔力成长: " .. (HopeQoL_GradedGrowth(udg_cz5Mp_up[i], false) or "")
	s = (s or "") .. "|n专注成长: " .. (HopeQoL_GradedGrowth(udg_cz6Dex_up[i], false) or "")
	if udg_hero[i] ~= nil and abilityId ~= 0 then
		YDWESetUnitAbilityDataString(udg_hero[i], abilityId, 1, 218, s)
	end
end

function HopeGrowth_Roll(p, paid)
	local i = GetPlayerId(p) + 1
	if not HopeGrowth_CanAct(p) then
		return false
	end
	if paid then
		if not HopePoints_Spend(p, 5 - IMinBJ(3, HopeMeta_Tal(GetPlayerId(p), 12))) then
			return false
		end
	else
		if udg_CZ_czcs[i] <= 0 then
			DisplayTextToPlayer(p, 0, 0, "免费重置已用完；积分重置费用按当前天赋折扣展示。")
			return false
		end
		udg_CZ_czcs[i] = udg_CZ_czcs[i] - 1
	end
	HopeGrowth_Randomize(i)
	HopeGrowth_UpdateTooltip(i)
	if paid then
		DisplayTextToPlayer(p, 0, 0, "成长已重置：消耗" .. (I2S(5 - IMinBJ(3, HopeMeta_Tal(i - 1, 12))) or "") .. "存档积分，剩余 " .. (I2S(udg_Wj_jf[i]) or "") .. "。")
	else
		DisplayTextToPlayer(p, 0, 0, "成长已重置：剩余免费次数 " .. (I2S(udg_CZ_czcs[i]) or "") .. "。")
	end
	return true
end

function HopeGrowth_Accept(p)
	local owner = GetPlayerId(p)
	if not HopeGrowth_CanAct(p) then
		return false
	end
	HopeGrowth_Pending[owner] = false
	HopeGrowth_Hero[owner] = nil
	HopeChoice_PlayerPending[owner] = IMaxBJ(0, HopeChoice_PlayerPending[owner] - 1)
	HopeGrowth_UpdateTooltip(owner + 1)
	DisplayTextToPlayer(p, 0, 0, "初始成长已确认，可以准备出发。")
	return true
end

function HopeGrowth_FreeClick()
	HopeGrowth_Roll(DzGetTriggerUIEventPlayer(), false)
end

function HopeGrowth_PaidClick()
	HopeGrowth_Roll(DzGetTriggerUIEventPlayer(), true)
end

function HopeGrowth_AcceptClick()
	HopeGrowth_Accept(DzGetTriggerUIEventPlayer())
end

function HopeGrowth_Fold()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeChoice_Hidden = true
		if HopeGrowth_Panel ~= 0 then
			DzFrameShow(HopeGrowth_Panel, false)
		end
		HopeChoice_ApplyVisibility()
	end
end

function HopeGrowth_Refresh()
	local owner = GetPlayerId(GetLocalPlayer())
	local i = owner + 1
	local show = false
	local status = ""
	if not HopeGrowth_UIReady or owner < 0 or owner >= 6 then
		return
	end
	show = HopeGrowth_Pending[owner] and not HopeChoice_Hidden and not HopeRoute_Assigning
	DzFrameShow(HopeGrowth_Panel, show)
	if not show then
		return
	end
	-- Resuming with F6 returns to this choice and closes any intervening panels.
	HopeQoL_Expanded = false
	HopeArchive_Expanded = false
	HopeGift_Expanded = false
	HopeRelic_Expanded = false
	HopeRoute_Details = false
	HopeJob_Expanded = false
	DzFrameSetText(HopeGrowth_Summary, "存档积分  " .. (I2S(udg_Wj_jf[i]) or "") .. "    免费重置  " .. (I2S(udg_CZ_czcs[i]) or "") .. " 次")
	DzFrameSetText(HopeGrowth_ValueText[0], "力量  +" .. (HopeQoL_GradedGrowth(udg_cz1Str_up[i], false) or ""))
	DzFrameSetText(HopeGrowth_ValueText[1], "敏捷  +" .. (HopeQoL_GradedGrowth(udg_cz2Agi_up[i], false) or ""))
	DzFrameSetText(HopeGrowth_ValueText[2], "智力  +" .. (HopeQoL_GradedGrowth(udg_cz3Int_up[i], false) or ""))
	DzFrameSetText(HopeGrowth_ValueText[3], "生命  +" .. (HopeQoL_GradedGrowth(udg_cz4Hp_up[i], true) or ""))
	DzFrameSetText(HopeGrowth_ValueText[4], "魔力  +" .. (HopeQoL_GradedGrowth(udg_cz5Mp_up[i], false) or ""))
	DzFrameSetText(HopeGrowth_ValueText[5], "专注  +" .. (HopeQoL_GradedGrowth(udg_cz6Dex_up[i], false) or ""))
	DzFrameSetText(HopeGrowth_FreeButton, "免费重置 · 剩余" .. (I2S(udg_CZ_czcs[i]) or "") .. "次")
	status = "每次重置全部六项成长；免费与积分次数独立。"
	if not HopeCloud_CanWrite(GetLocalPlayer()) then
		status = "存档积分暂不可用；仍可免费重置或确认成长。"
	elseif udg_Wj_jf[i] < 5 - IMinBJ(3, HopeMeta_Tal(i - 1, 12)) then
		status = "额外重置需要" .. (I2S(5 - IMinBJ(3, HopeMeta_Tal(i - 1, 12))) or "") .. "积分，当前不足。"
	end
	DzFrameSetText(HopeGrowth_Footer, (status or "") .. "|n确认后，本局不能再次重置初始成长。")
	DzFrameSetText(HopeGrowth_PaidButton, "积分重置 · " .. (I2S(5 - IMinBJ(3, HopeMeta_Tal(i - 1, 12))) or "") .. "积分")
end

function HopeGrowth_CreateUI()
	local f = 0
	local index = 0
	local x = 0.014
	local y = -0.074
	DestroyTimer(GetExpiredTimer())
	HopeGrowth_Panel = HopeQoL_Surface("HopeGrowthPanel", 0.229, 0.535, 0.342, 0.323)
	if HopeGrowth_Panel == 0 then
		return
	end
	HopeGrowth_Title = HopeQoL_Label("HopeGrowthTitle", HopeGrowth_Panel, 0.014, -0.01, 0.21, 0.021, "|cffffd060初始成长|r")
	f = HopeQoL_Button("HopeGrowthFold", HopeGrowth_Panel, 0.252, -0.006, 0.076, 0.026, "收起 F6")
	HopeQoL_Bind(f, HopeGrowth_Fold, false)
	HopeGrowth_Summary = HopeQoL_Label("HopeGrowthSummary", HopeGrowth_Panel, 0.014, -0.041, 0.314, 0.02, "")
	HopeGrowth_UIReady = HopeGrowth_Title ~= 0 and HopeGrowth_Summary ~= 0 and f ~= 0
	for _ in _loop_() do
		if index >= 6 then break end
		if index >= 3 then
			x = 0.178
			y = -0.074 - I2R(index - 3) * 0.03
		else
			x = 0.014
			y = -0.074 - I2R(index) * 0.03
		end
		HopeGrowth_ValueText[index] = HopeQoL_Label("HopeGrowthValue" .. (I2S(index) or ""), HopeGrowth_Panel, x, y, 0.15, 0.022, "")
		HopeGrowth_UIReady = HopeGrowth_UIReady and HopeGrowth_ValueText[index] ~= 0
		index = index + 1
	end
	f = HopeQoL_Label("HopeGrowthExplanation", HopeGrowth_Panel, 0.014, -0.167, 0.314, 0.044, "以上为每级成长值；三围小数会累积。|n魔力提升技能伤害，专注提升精确打击伤害。|n额外重置每次基础5积分，资源天赋可降至2积分。")
	HopeGrowth_FreeButton = HopeQoL_Button("HopeGrowthFree", HopeGrowth_Panel, 0.014, -0.218, 0.151, 0.028, "")
	HopeGrowth_PaidButton = HopeQoL_Button("HopeGrowthPaid", HopeGrowth_Panel, 0.177, -0.218, 0.151, 0.028, "积分重置 · 5积分")
	HopeGrowth_AcceptButton = HopeQoL_Button("HopeGrowthAccept", HopeGrowth_Panel, 0.014, -0.253, 0.314, 0.028, "以当前成长开始游戏")
	HopeQoL_Bind(HopeGrowth_FreeButton, HopeGrowth_FreeClick, true)
	HopeQoL_Bind(HopeGrowth_PaidButton, HopeGrowth_PaidClick, true)
	HopeQoL_Bind(HopeGrowth_AcceptButton, HopeGrowth_AcceptClick, true)
	HopeGrowth_Footer = HopeQoL_Label("HopeGrowthFooter", HopeGrowth_Panel, 0.014, -0.288, 0.314, 0.03, "")
	HopeGrowth_UIReady = HopeGrowth_UIReady and f ~= 0 and HopeGrowth_FreeButton ~= 0 and HopeGrowth_PaidButton ~= 0 and HopeGrowth_AcceptButton ~= 0 and HopeGrowth_Footer ~= 0
	DzFrameShow(HopeGrowth_Panel, false)
end

function HopeJob_ShowFrame(frame, visible)
	if frame ~= 0 then
		DzFrameShow(frame, visible)
	end
end

function HopeJob_SetText(frame, value)
	if frame ~= 0 then
		DzFrameSetText(frame, value)
	end
end

function HopeJob_Round()
	return udg_quanshu + 1
end

function HopeJob_AdvancedOpen()
	if udg_quanshu < 2 then
		return false
	end
	if gg_unit_n019_0032 ~= nil and GetUnitTypeId(gg_unit_n019_0032) ~= 0 and not IsUnitHidden(gg_unit_n019_0032) and GetWidgetLife(gg_unit_n019_0032) > 0.405 then
		return true
	end
	return gg_unit_n01C_0003 ~= nil and GetUnitTypeId(gg_unit_n01C_0003) ~= 0 and not IsUnitHidden(gg_unit_n01C_0003) and GetWidgetLife(gg_unit_n01C_0003) > 0.405
end

function HopeJob_InRoom(p)
	local i = GetPlayerId(p) + 1
	local u = udg_hero[i]
	local ok = false
	if i >= 1 and i <= 6 and u ~= nil then
		ok = GetUnitX(u) >= -3328.0 and GetUnitX(u) <= -1800.0 and GetUnitY(u) >= 1800.0 and GetUnitY(u) <= 3072.0 and GetWidgetLife(u) > 0.405 and not udg_ZhandouZhong
	end
	u = nil
	return ok
end

function HopeJob_Visible(index, i)
	if index < 0 or index >= HopeJob_Count or i < 1 or i > 6 then
		return false
	end
	if HopeJob_Stage[index] >= 2 and not HopeJob_AdvancedOpen() then
		return false
	end
	if HopeJob_Stage[index] == 1 and HopeReclass_Can(i) then
		return true
	end
	if HopeJob_Awakened[i] and HopeJob_AwakenOption[i] == index then
		return true
	end
	return udg_hero[i] ~= nil and HopeJob_Source[index] == GetUnitTypeId(udg_hero[i]) and (not HopeJob_Awakened[i] or HopeJob_AwakenOption[i] == index)
end

function HopeJob_InPanel(index, i)
	return HopeJob_Visible(index, i) and (HopeJob_Entry == 1 and HopeJob_Stage[index] == 1 or HopeJob_Entry == 2 and HopeJob_Stage[index] >= 2)
end

function HopeJob_WoodCost(index)
	if index < 0 or index >= HopeJob_Count then
		return 0
	end
	if HopeJob_Stage[index] == 3 then
		return 30
	end
	return 0
end

function HopeJob_GoldCost(index)
	if index >= 0 and index < HopeJob_Count and HopeJob_Stage[index] == 3 then
		return 1000
	end
	return 0
end

function HopeJob_Blocker(index, p)
	local i = GetPlayerId(p) + 1
	local u = udg_hero[i]
	local s = ""
	if i >= 1 and i <= 6 and HopeJob_Awakened[i] and index == HopeJob_AwakenOption[i] and HopeThird_Passive[index] then
		u = nil
		return HopeThird_StudyBlock(index, p)
	end
	if index >= 0 and index < HopeJob_Count and HopeJob_Stage[index] == 1 and HopeReclass_Can(i) then
		u = nil
		return HopeReclass_Blocker(index, p)
	end
	if index < 0 or index >= HopeJob_Count or i < 1 or i > 6 then
		s = "无效的转职选项。"
	elseif HopeJob_Stage[index] >= 2 and not HopeJob_AdvancedOpen() then
		s = "二转建筑尚未开放；第3轮出现后才能办理二转或三转。"
	elseif not HopeJob_Visible(index, i) then
		s = "该进阶不属于你的职业路线。"
	elseif HopeJob_Awakened[i] then
		s = "已完成三转，本局不能再次转职。"
	elseif not HopeJob_InRoom(p) then
		s = "请回到原来的泉水爬塔房间。"
	elseif HopeRoute_RewardPending(i - 1) then
		s = "请先完成待选奖励。"
	elseif HopeJob_Stage[index] == 3 and HopeJob_Round() < 4 then
		s = "三转从第4轮开始解锁；完成前3轮即可，不需要通关第4轮。"
	elseif HopeJob_Stage[index] == 3 and GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) < HopeJob_WoodCost(index) then
		s = "木材不足：三转需要 " .. (I2S(HopeJob_WoodCost(index)) or "") .. " 木材，当前 " .. (I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)) or "") .. "。"
	elseif HopeJob_Stage[index] == 3 and GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) < HopeJob_GoldCost(index) then
		s = "金币不足：三转需要1000金币，当前 " .. (I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)) or "") .. "。"
	elseif GetHeroLevel(u) < HopeJob_Level[index] then
		s = "等级不足，需要等级 " .. (I2S(HopeJob_Level[index]) or "") .. "。"
	elseif GetHeroStr(u, false) < HopeJob_Str[index] or GetHeroAgi(u, false) < HopeJob_Agi[index] or GetHeroInt(u, false) < HopeJob_Int[index] then
		s = "基础属性不足（装备和临时加成不计）。"
	end
	u = nil
	return s
end

function HopeJob_Close()
	HopeJob_Expanded = false
	HopeJob_ShowFrame(HopeJob_Panel, false)
end

function HopeJob_Show(p, entry)
	if GetPlayerId(p) < 0 or GetPlayerId(p) >= 6 or entry ~= 1 and entry ~= 2 or not HopeJob_InRoom(p) then
		return
	end
	if entry == 2 and not HopeJob_AdvancedOpen() then
		return
	end
	if p == GetLocalPlayer() and GetPlayerId(p) < 6 then
		if HopeGrowth_Pending[GetPlayerId(p)] then
			HopeChoice_Hidden = true
		end
		HopeJob_Entry = entry
		HopeJob_Selected = -1
		HopeJob_Page = 0
		HopeJob_DetailPage = 0
		HopeJob_Expanded = true
		if HopeJob_Expanded then
			HopeLayout_Focus(5)
		end
		HopeQoL_Expanded = false
		HopeArchive_Expanded = false
		HopeGift_Expanded = false
		HopeRelic_Expanded = false
		HopeRoute_Details = false
		HopeJob_ShowFrame(HopeJob_Panel, true)
	end
end

function HopeJob_Open()
	local p = DzGetTriggerUIEventPlayer()
	local entry = 2
	if GetUnitTypeId(udg_hero[GetPlayerId(p) + 1]) == 1211117616 or HopeReclass_Can(GetPlayerId(p) + 1) and not HopeJob_AdvancedOpen() then
		entry = 1
	end
	HopeJob_Show(p, entry)
	p = nil
end

function HopeJob_Select(option)
	HopeJob_Selected = option
	HopeJob_Page = 0
	HopeJob_DetailPage = 0
end

function HopeJob_Page0()
	HopeJob_Page = 0
	HopeJob_DetailPage = 0
end

function HopeJob_Page1()
	HopeJob_Page = 1
	HopeJob_DetailPage = 0
end

function HopeJob_Page2()
	HopeJob_Page = 2
	HopeJob_DetailPage = 0
end

function HopeJob_Prev()
	HopeJob_DetailPage = IMaxBJ(0, HopeJob_DetailPage - 1)
end

function HopeJob_Next()
	local count = 0
	if HopeJob_Selected < 0 then
		return
	end
	if HopeJob_Page == 1 then
		count = HopeJob_SkillCount[HopeJob_Selected]
	elseif HopeJob_Page == 2 then
		count = HopeJob_PassiveCount[HopeJob_Selected]
	end
	HopeJob_DetailPage = IMinBJ(IMaxBJ(0, count - 1), HopeJob_DetailPage + 1)
end

function HopeJob_ReplaceHidden(p, kind)
	local i = GetPlayerId(p) + 1
	local old = udg_hero[i]
	local u = CreateUnit(p, kind, GetUnitX(old), GetUnitY(old), GetUnitFacing(old))
	local slot = 0
	local it = nil
	local aid = 0
	local training = GetUnitAbilityLevel(old, 1096435792)
	if GetUnitTypeId(old) == 1211117616 then
		SetHeroXP(u, 0, false)
	else
		SetHeroXP(u, GetHeroXP(old), false)
	end
	SetHeroStr(u, GetHeroStr(old, false) - udg_Ls_zj_Str[i], true)
	SetHeroAgi(u, GetHeroAgi(old, false) - udg_Ls_zj_Agi[i], true)
	SetHeroInt(u, GetHeroInt(old, false) - udg_Ls_zj_Int[i], true)
	udg_Ls_zj_Str[i] = 0
	udg_Ls_zj_Agi[i] = 0
	udg_Ls_zj_Int[i] = 0
	SetUnitState(u, UNIT_STATE_MAX_LIFE, GetUnitState(old, UNIT_STATE_MAX_LIFE))
	SetUnitState(u, UNIT_STATE_MAX_MANA, GetUnitState(old, UNIT_STATE_MAX_MANA))
	for _ in _loop_() do
		if slot >= 6 then break end
		it = UnitItemInSlot(old, slot)
		if it ~= nil then
			UnitRemoveItem(old, it)
			UnitAddItem(u, it)
		end
		slot = slot + 1
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
	if GetUnitTypeId(old) ~= 1211117616 then
		if training > 0 then
			UnitAddAbility(u, 1096435792)
			SetUnitAbilityLevel(u, 1096435792, training)
			UnitMakeAbilityPermanent(u, true, 1096435792)
		end
		UnitModifySkillPoints(u, GetHeroSkillPoints(old) - GetHeroSkillPoints(u))
	end
	udg_hero[i] = u
	RemoveUnit(old)
	SetUnitState(u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE))
	SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA))
	SelectUnitForPlayerSingle(u, p)
	old = nil
	u = nil
	it = nil
end

function HopeJob_AddStats(i, strength, agility, intelligence)
	SetHeroStr(udg_hero[i], GetHeroStr(udg_hero[i], false) + strength, true)
	SetHeroAgi(udg_hero[i], GetHeroAgi(udg_hero[i], false) + agility, true)
	SetHeroInt(udg_hero[i], GetHeroInt(udg_hero[i], false) + intelligence, true)
end

function HopeJob_Awaken(index, i)
	local u = udg_hero[i]
	local kind = 0
	if index == 26 then
		HopeJob_ReplaceHidden(Player(i - 1), 1213870131)
		u = udg_hero[i]
		HopeJob_AddStats(i, 5, 5, 5)
		udg_Skill_Dm[i] = udg_Skill_Dm[i] + 0.15
		kind = 5
	elseif index == 27 then
		HopeJob_AddStats(i, 10, 0, 0)
		kind = 1
		SetUnitState(u, UNIT_STATE_MAX_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE) + 100.0)
		udg_Defend_fangyu[i] = udg_Defend_fangyu[i] + 8
	elseif index == 28 then
		HopeJob_AddStats(i, 8, 8, 0)
		kind = 1
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
	elseif index == 29 then
		HopeJob_AddStats(i, 0, 0, 12)
		kind = 4
		SetUnitState(u, UNIT_STATE_MAX_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA) + 8.0)
		udg_huihe_huilan[i] = udg_huihe_huilan[i] + 2
	elseif index == 30 then
		HopeJob_AddStats(i, 8, 8, 8)
		kind = 6
		udg_Defend_fangyu[i] = udg_Defend_fangyu[i] + 6
		SetUnitState(u, UNIT_STATE_MAX_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE) + 60.0)
	elseif index == 31 then
		HopeJob_AddStats(i, 0, 12, 0)
		kind = 2
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
		udg_Baoji_Damage[i] = udg_Baoji_Damage[i] + 0.25
	elseif index == 32 then
		HopeJob_AddStats(i, 0, 10, 0)
		kind = 2
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
		udg_DEX[i] = udg_DEX[i] + 3
		udg_jingque_Daji_jiacheng[i] = udg_jingque_Daji_jiacheng[i] + 0.2
	elseif index == 33 then
		HopeJob_AddStats(i, 0, 14, 0)
		kind = 2
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
		udg_DEX[i] = udg_DEX[i] + 2
	elseif index == 34 then
		HopeJob_AddStats(i, 12, 10, 0)
		kind = 2
		udg_Zuizhong_Dm[i] = udg_Zuizhong_Dm[i] + 0.1
	elseif index == 35 then
		HopeJob_AddStats(i, 0, 10, 0)
		kind = 2
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
		udg_Skill_Dm[i] = udg_Skill_Dm[i] + 0.15
	elseif index == 36 then
		HopeJob_AddStats(i, 0, 16, 0)
		kind = 2
		udg_jingque_Daji_jiacheng[i] = udg_jingque_Daji_jiacheng[i] + 0.3
		udg_Baoji_Damage[i] = udg_Baoji_Damage[i] + 0.25
	elseif index == 37 then
		HopeJob_AddStats(i, 0, 0, 12)
		kind = 3
		SetUnitState(u, UNIT_STATE_MAX_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA) + 12.0)
		udg_huihe_huilan[i] = udg_huihe_huilan[i] + 2
		udg_Skill_Dm[i] = udg_Skill_Dm[i] + 0.15
	elseif index == 38 then
		HopeJob_AddStats(i, 0, 0, 14)
		kind = 3
		udg_Fashang_Dm[i] = udg_Fashang_Dm[i] + 0.2
		udg_Baoji_Lv[i] = udg_Baoji_Lv[i] + 10
	elseif index == 39 then
		HopeJob_AddStats(i, 12, 0, 0)
		kind = 1
		SetUnitState(u, UNIT_STATE_MAX_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE) + 80.0)
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
	elseif index == 40 then
		HopeJob_AddStats(i, 10, 10, 0)
		kind = 1
		SetUnitState(u, UNIT_STATE_MAX_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE) + 80.0)
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
	elseif index == 41 then
		HopeJob_AddStats(i, 18, 0, 0)
		kind = 1
		udg_Baoji_Lv[i] = udg_Baoji_Lv[i] + 15
		udg_Baoji_Damage[i] = udg_Baoji_Damage[i] + 0.35
	elseif index == 42 then
		HopeJob_AddStats(i, 10, 10, 0)
		kind = 1
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
		udg_Skill_Dm[i] = udg_Skill_Dm[i] + 0.15
	end
	HopeJob_Awakened[i] = true
	HopeJob_AwakenOption[i] = index
	HopeJob_UltimateKind[i] = kind
	HopeJob_LastCast[i] = -1
	HopeThird_Unlock(index, i)
	SetUnitState(u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE))
	SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA))
	udg_xingdong_dian[i] = udg_xingdong_dianSx[i]
	u = nil
end

function HopeJob_Commit(index)
	local p = DzGetTriggerUIEventPlayer()
	local i = GetPlayerId(p) + 1
	local blocker = HopeJob_Blocker(index, p)
	local pick = index
	local it = nil
	if index >= 0 and index < HopeJob_Count and HopeJob_Stage[index] == 1 and HopeReclass_Can(i) then
		HopeReclass_Commit(index, p)
		p = nil
		return
	end
	if blocker ~= "" then
		DisplayTimedTextToPlayer(p, 0, 0, 5.0, blocker)
		p = nil
		return
	end
	if HopeJob_Awakened[i] and HopeJob_AwakenOption[i] == index and HopeThird_Passive[index] then
		HopeThird_Study(index, p)
		p = nil
		return
	end
	if index == 24 then
		-- Gameplay RNG runs only in this synchronized callback, never during preview/refresh.
		if GetRandomInt(1, 100) <= 10 then
			HopeJob_ReplaceHidden(p, 1213870129)
			udg_cz1Str_up[i] = udg_cz1Str_up[i] + 0.15
			udg_cz2Agi_up[i] = udg_cz2Agi_up[i] + 0.15
			udg_cz3Int_up[i] = udg_cz3Int_up[i] + 0.15
			DisplayTextToPlayer(p, 0, 0, "|cffffd36a随机转职：万象行者（隐藏职业）！|r")
		else
			pick = GetRandomInt(0, 7)
			HopeJob_RandomPromotion = true
			it = CreateItem(HopeJob_Item[pick], GetUnitX(udg_hero[i]), GetUnitY(udg_hero[i]))
			UnitAddItem(udg_hero[i], it)
			RemoveItem(it)
			HopeJob_RandomPromotion = false
			DisplayTextToPlayer(p, 0, 0, "随机转职：" .. (HopeJob_Name[pick] or ""))
		end
	elseif index == 25 then
		HopeJob_ReplaceHidden(p, 1213870130)
		HopeJob_AddStats(i, 3, 3, 3)
		udg_xingdong_dianSx[i] = udg_xingdong_dianSx[i] + 1
		udg_xingdong_dian[i] = udg_xingdong_dianSx[i]
		DisplayTextToPlayer(p, 0, 0, "已进阶为隐藏二转：万象织法者。")
	elseif HopeJob_Stage[index] == 3 then
		-- Eligibility and the current balance were checked in this synchronized callback.
		SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) - HopeJob_WoodCost(index))
		SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) - HopeJob_GoldCost(index))
		HopeJob_Awaken(index, i)
		if HopeThird_Passive[index] then
			DisplayTextToPlayer(p, 0, 0, "|cffffd36a三转完成：" .. (HopeJob_Name[index] or "") .. "；消耗30木材+1000金币。已获得1级专属被动，在转职窗口花技能点研习。|r")
		else
			DisplayTextToPlayer(p, 0, 0, "|cffffd36a三转完成：" .. (HopeJob_Name[index] or "") .. "；消耗30木材+1000金币。按Z使用专属觉醒技能。|r")
		end
	else
		it = CreateItem(HopeJob_Item[index], GetUnitX(udg_hero[i]), GetUnitY(udg_hero[i]))
		UnitAddItem(udg_hero[i], it)
		RemoveItem(it)
		SelectUnitForPlayerSingle(udg_hero[i], p)
		if GetUnitTypeId(udg_hero[i]) == HopeJob_Target[index] then
			DisplayTextToPlayer(p, 0, 0, "已转职为：" .. (HopeJob_Name[index] or ""))
		else
			DisplayTextToPlayer(p, 0, 0, "转职未完成，请检查原职业条件。")
		end
	end
	HopeRoute_Ready[i - 1] = false
	if p == GetLocalPlayer() then
		HopeJob_Expanded = false
		HopeJob_ShowFrame(HopeJob_Panel, false)
	end
	it = nil
	p = nil
end

function HopeJob_Select0()
	HopeJob_Select(0)
end

function HopeJob_Commit0()
	HopeJob_Commit(0)
end

function HopeJob_Select1()
	HopeJob_Select(1)
end

function HopeJob_Commit1()
	HopeJob_Commit(1)
end

function HopeJob_Select2()
	HopeJob_Select(2)
end

function HopeJob_Commit2()
	HopeJob_Commit(2)
end

function HopeJob_Select3()
	HopeJob_Select(3)
end

function HopeJob_Commit3()
	HopeJob_Commit(3)
end

function HopeJob_Select4()
	HopeJob_Select(4)
end

function HopeJob_Commit4()
	HopeJob_Commit(4)
end

function HopeJob_Select5()
	HopeJob_Select(5)
end

function HopeJob_Commit5()
	HopeJob_Commit(5)
end

function HopeJob_Select6()
	HopeJob_Select(6)
end

function HopeJob_Commit6()
	HopeJob_Commit(6)
end

function HopeJob_Select7()
	HopeJob_Select(7)
end

function HopeJob_Commit7()
	HopeJob_Commit(7)
end

function HopeJob_Select8()
	HopeJob_Select(8)
end

function HopeJob_Commit8()
	HopeJob_Commit(8)
end

function HopeJob_Select9()
	HopeJob_Select(9)
end

function HopeJob_Commit9()
	HopeJob_Commit(9)
end

function HopeJob_Select10()
	HopeJob_Select(10)
end

function HopeJob_Commit10()
	HopeJob_Commit(10)
end

function HopeJob_Select11()
	HopeJob_Select(11)
end

function HopeJob_Commit11()
	HopeJob_Commit(11)
end

function HopeJob_Select12()
	HopeJob_Select(12)
end

function HopeJob_Commit12()
	HopeJob_Commit(12)
end

function HopeJob_Select13()
	HopeJob_Select(13)
end

function HopeJob_Commit13()
	HopeJob_Commit(13)
end

function HopeJob_Select14()
	HopeJob_Select(14)
end

function HopeJob_Commit14()
	HopeJob_Commit(14)
end

function HopeJob_Select15()
	HopeJob_Select(15)
end

function HopeJob_Commit15()
	HopeJob_Commit(15)
end

function HopeJob_Select16()
	HopeJob_Select(16)
end

function HopeJob_Commit16()
	HopeJob_Commit(16)
end

function HopeJob_Select17()
	HopeJob_Select(17)
end

function HopeJob_Commit17()
	HopeJob_Commit(17)
end

function HopeJob_Select18()
	HopeJob_Select(18)
end

function HopeJob_Commit18()
	HopeJob_Commit(18)
end

function HopeJob_Select19()
	HopeJob_Select(19)
end

function HopeJob_Commit19()
	HopeJob_Commit(19)
end

function HopeJob_Select20()
	HopeJob_Select(20)
end

function HopeJob_Commit20()
	HopeJob_Commit(20)
end

function HopeJob_Select21()
	HopeJob_Select(21)
end

function HopeJob_Commit21()
	HopeJob_Commit(21)
end

function HopeJob_Select22()
	HopeJob_Select(22)
end

function HopeJob_Commit22()
	HopeJob_Commit(22)
end

function HopeJob_Select23()
	HopeJob_Select(23)
end

function HopeJob_Commit23()
	HopeJob_Commit(23)
end

function HopeJob_Select24()
	HopeJob_Select(24)
end

function HopeJob_Commit24()
	HopeJob_Commit(24)
end

function HopeJob_Select25()
	HopeJob_Select(25)
end

function HopeJob_Commit25()
	HopeJob_Commit(25)
end

function HopeJob_Select26()
	HopeJob_Select(26)
end

function HopeJob_Commit26()
	HopeJob_Commit(26)
end

function HopeJob_Select27()
	HopeJob_Select(27)
end

function HopeJob_Commit27()
	HopeJob_Commit(27)
end

function HopeJob_Select28()
	HopeJob_Select(28)
end

function HopeJob_Commit28()
	HopeJob_Commit(28)
end

function HopeJob_Select29()
	HopeJob_Select(29)
end

function HopeJob_Commit29()
	HopeJob_Commit(29)
end

function HopeJob_Select30()
	HopeJob_Select(30)
end

function HopeJob_Commit30()
	HopeJob_Commit(30)
end

function HopeJob_Select31()
	HopeJob_Select(31)
end

function HopeJob_Commit31()
	HopeJob_Commit(31)
end

function HopeJob_Select32()
	HopeJob_Select(32)
end

function HopeJob_Commit32()
	HopeJob_Commit(32)
end

function HopeJob_Select33()
	HopeJob_Select(33)
end

function HopeJob_Commit33()
	HopeJob_Commit(33)
end

function HopeJob_Select34()
	HopeJob_Select(34)
end

function HopeJob_Commit34()
	HopeJob_Commit(34)
end

function HopeJob_Select35()
	HopeJob_Select(35)
end

function HopeJob_Commit35()
	HopeJob_Commit(35)
end

function HopeJob_Select36()
	HopeJob_Select(36)
end

function HopeJob_Commit36()
	HopeJob_Commit(36)
end

function HopeJob_Select37()
	HopeJob_Select(37)
end

function HopeJob_Commit37()
	HopeJob_Commit(37)
end

function HopeJob_Select38()
	HopeJob_Select(38)
end

function HopeJob_Commit38()
	HopeJob_Commit(38)
end

function HopeJob_Select39()
	HopeJob_Select(39)
end

function HopeJob_Commit39()
	HopeJob_Commit(39)
end

function HopeJob_Select40()
	HopeJob_Select(40)
end

function HopeJob_Commit40()
	HopeJob_Commit(40)
end

function HopeJob_Select41()
	HopeJob_Select(41)
end

function HopeJob_Commit41()
	HopeJob_Commit(41)
end

function HopeJob_Select42()
	HopeJob_Select(42)
end

function HopeJob_Commit42()
	HopeJob_Commit(42)
end

function HopeJob_OnSelect()
	local kind = GetUnitTypeId(GetTriggerUnit())
	if IsUnitHidden(GetTriggerUnit()) or GetWidgetLife(GetTriggerUnit()) <= 0.405 then
		return
	end
	if kind == 1848651832 then
		HopeJob_Show(GetTriggerPlayer(), 1)
	elseif kind == 1848652089 or kind == 1848652099 then
		HopeJob_Show(GetTriggerPlayer(), 2)
	end
	if kind == 1848651832 or kind == 1848652089 or kind == 1848652099 then
		if GetTriggerPlayer() == GetLocalPlayer() and udg_hero[GetPlayerId(GetTriggerPlayer()) + 1] ~= nil then
			SelectUnitForPlayerSingle(udg_hero[GetPlayerId(GetTriggerPlayer()) + 1], GetTriggerPlayer())
		end
	end
end

function HopeJob_RemoveStock()
	local u = GetEnumUnit()
	local kind = GetUnitTypeId(u)
	local index = 0
	if kind == 1848651832 or kind == 1848652089 or kind == 1848652099 then
		for _ in _loop_() do
			if index >= 24 then break end
			RemoveItemFromStock(u, HopeJob_Item[index])
			index = index + 1
		end
		RemoveUnitFromStock(u, 1211117616)
	end
	u = nil
end

function HopeJob_RefreshContent()
	local p = GetLocalPlayer()
	local i = GetPlayerId(p) + 1
	local index = 0
	local row = 0
	local typ = GetUnitTypeId(udg_hero[i])
	local chosen = HopeJob_Selected
	local room = HopeJob_InRoom(p)
	local available = room and (typ == 1211117616 or HopeReclass_Can(i) or HopeJob_AdvancedOpen())
	local picking = HopeChoice_HasPending() and not HopeChoice_Hidden
	local detail = ""
	local block = ""
	local level = ""
	local current = GetUnitName(udg_hero[i])
	local count = 0
	if HopeJob_Panel == 0 then
		p = nil
		return
	end
	HopeJob_ShowFrame(HopeJob_OpenButton, available and not picking)
	-- Entering the fountain only reveals the manual entry button.
	if not room or HopeJob_Entry == 2 and not HopeJob_AdvancedOpen() then
		HopeJob_Expanded = false
	end
	if HopeQoL_Expanded or HopeArchive_Expanded or HopeGift_Expanded or HopeRelic_Expanded or HopeRoute_Details then
		HopeJob_Expanded = false
	end
	HopeJob_ShowFrame(HopeJob_Panel, HopeJob_Expanded and not picking)
	if not HopeJob_Expanded or i > 6 then
		p = nil
		return
	end
	if HopeJob_LastType ~= typ then
		chosen = -1
		HopeJob_Selected = -1
		HopeJob_Page = 0
		HopeJob_DetailPage = 0
		HopeJob_LastType = typ
	end
	if chosen >= 0 and not HopeJob_InPanel(chosen, i) then
		chosen = -1
		HopeJob_Selected = -1
		HopeJob_Page = 0
		HopeJob_DetailPage = 0
	end
	for _ in _loop_() do
		if index >= HopeJob_Count then break end
		HopeJob_ShowFrame(HopeJob_Row[index], HopeJob_InPanel(index, i))
		HopeJob_ShowFrame(HopeJob_Confirm[index], false)
		if HopeJob_InPanel(index, i) then
			if HopeJob_Row[index] ~= 0 then
				DzFrameSetPoint(HopeJob_Row[index], 0, HopeJob_Panel, 0, 0.012, -0.078 - 0.03 * I2R(row))
			end
			if chosen == -1 then
				chosen = index
				HopeJob_Selected = index
			end
			row = row + 1
		end
		index = index + 1
	end
	if HopeJob_Awakened[i] then
		current = HopeJob_Name[HopeJob_AwakenOption[i]]
	end
	if HopeJob_Entry == 1 then
		if HopeReclass_Can(i) then
			HopeJob_SetText(HopeJob_Title, "|cffd2b879重新转职 · 10存档积分|r · " .. (current or ""))
		else
			HopeJob_SetText(HopeJob_Title, "|cffd2b879一转职业|r · " .. (current or ""))
		end
	else
		HopeJob_SetText(HopeJob_Title, "|cffd2b879二转 / 三转|r · " .. (current or ""))
	end
	HopeJob_SetText(HopeJob_Status, "当前第 " .. (I2S(HopeJob_Round()) or "") .. " 轮 · 二转第3轮 · 三转第4轮 / 30木+1000金")
	if chosen >= 0 then
		block = HopeJob_Blocker(chosen, p)
		if HopeJob_Page == 0 then
			level = "等级 " .. (I2S(HopeJob_Level[chosen]) or "") .. "；基础力量 " .. (I2S(HopeJob_Str[chosen]) or "") .. " / 敏捷 " .. (I2S(HopeJob_Agi[chosen]) or "") .. " / 智力 " .. (I2S(HopeJob_Int[chosen]) or "")
			if HopeJob_Stage[chosen] == 3 then
				level = "已完成二转；进入第4轮；在原二转建筑办理。|n三转费用：" .. (I2S(HopeJob_WoodCost(chosen)) or "") .. " 木材+1000金币；当前木材：" .. (I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)) or "") .. "。"
			elseif HopeJob_Stage[chosen] == 2 then
				level = (level or "") .. "；第3轮二转建筑出现后开放。"
			end
			detail = "|cffd2b879" .. (HopeJob_Name[chosen] or "") .. " · " .. (I2S(HopeJob_Stage[chosen]) or "") .. "转|r|n|n" .. (HopeJob_Role[chosen] or "") .. "|n|n|cffd2b879转职条件|r|n" .. (level or "") .. "|n|n属性门槛按基础值判断，装备与临时加成不计。|n一转沿用原规则；二转保留英雄等级。|n三转保留二转技能、修炼、装备和本局成长。"
			if HopeJob_Entry == 1 and HopeReclass_Can(i) then
				detail = "|cffd2b879重新转职：" .. (HopeJob_Name[chosen] or "") .. "|r|n费用：10存档积分；当前 " .. (I2S(udg_Wj_jf[i]) or "") .. "。|n仅一转可用，二转后关闭。|n|n所需基础力量 " .. (I2S(HopeJob_Str[chosen]) or "") .. " / 敏捷 " .. (I2S(HopeJob_Agi[chosen]) or "") .. " / 智力 " .. (I2S(HopeJob_Int[chosen]) or "") .. "。|n扣费前移除旧修炼复核，属性不足不扣费。|n保留等级、既得升级收益与装备；旧职业被动移除，返还职业技能点。|n牧师同级赠药不重复领取。|n随机10%隐藏；抽到同职业也消耗积分。"
			end
		elseif HopeJob_Page == 1 then
			count = HopeJob_SkillCount[chosen]
			detail = HopeJob_DetailText[chosen * 16 + HopeJob_DetailPage]
		else
			count = HopeJob_PassiveCount[chosen]
			detail = HopeJob_DetailText[chosen * 16 + 8 + HopeJob_DetailPage]
		end
		HopeJob_ShowFrame(HopeJob_PrevButton, count > 1 and HopeJob_DetailPage > 0)
		HopeJob_ShowFrame(HopeJob_NextButton, count > 1 and HopeJob_DetailPage + 1 < count)
		HopeJob_ShowFrame(HopeJob_PageLabel, count > 1)
		HopeJob_SetText(HopeJob_PageLabel, (I2S(HopeJob_DetailPage + 1) or "") .. " / " .. (I2S(count) or ""))
		if HopeJob_Page == 0 and HopeJob_Awakened[i] and chosen == HopeJob_AwakenOption[i] then
			detail = "|cffd2b879" .. (HopeJob_Name[chosen] or "") .. " · 已完成三转|r|n|n" .. (HopeJob_Role[chosen] or "")
			if HopeThird_Passive[chosen] then
				detail = (detail or "") .. "|n|n|cffd2b879专属被动研习|r|n当前 " .. (I2S(HopeThird_Level(udg_hero[i])) or "") .. "/3级；可用技能点 " .. (I2S(GetHeroSkillPoints(udg_hero[i])) or "") .. "。|n|n每提升1级消耗1技能点，不再消耗木材或金币。|n原有及后续升级获得的技能点均可使用。|n请在泉水房间点击下方研习按钮。|n技能页可查看各级效果。"
			else
				detail = (detail or "") .. "|n|n专属觉醒技能已获得；按Z使用。|n查看技能页了解效果与行动点消耗。|n三转奖励已发放，无需再次支付转职费用。"
			end
		end
		HopeJob_SetText(HopeJob_Detail, detail)
		HopeJob_ShowFrame(HopeJob_Confirm[chosen], true)
		if block == "" then
			if HopeJob_Entry == 1 and HopeReclass_Can(i) then
				HopeJob_SetText(HopeJob_Confirm[chosen], "确认重转：" .. (HopeJob_Name[chosen] or "") .. "（10存档积分）")
			elseif HopeJob_Stage[chosen] == 3 then
				HopeJob_SetText(HopeJob_Confirm[chosen], "确认：" .. (HopeJob_Name[chosen] or "") .. "（30木+1000金）")
			else
				HopeJob_SetText(HopeJob_Confirm[chosen], "确认：" .. (HopeJob_Name[chosen] or ""))
			end
			if HopeJob_Entry == 1 and HopeReclass_Can(i) then
				block = "确认即扣10积分并换职业；二转后不能重新转职。"
			elseif HopeJob_Stage[chosen] == 1 then
				block = "首次转职免费；一转期间可花10积分重新转职。"
			else
				block = "条件已满足。转职确认后本局不可撤销。"
			end
		else
			if HopeJob_Stage[chosen] == 3 then
				HopeJob_SetText(HopeJob_Confirm[chosen], "需30木材+1000金币")
			else
				HopeJob_SetText(HopeJob_Confirm[chosen], "暂不可转职：查看下方条件")
			end
		end
		if HopeJob_Awakened[i] and chosen == HopeJob_AwakenOption[i] then
			if HopeThird_Passive[chosen] then
				HopeJob_SetText(HopeJob_Status, "专属被动 " .. (I2S(HopeThird_Level(udg_hero[i])) or "") .. "/3级 · 技能点 " .. (I2S(GetHeroSkillPoints(udg_hero[i])) or ""))
				if HopeThird_Level(udg_hero[i]) < 3 then
					HopeJob_SetText(HopeJob_Confirm[chosen], "研习至 " .. (I2S(HopeThird_Level(udg_hero[i]) + 1) or "") .. " 级（1技能点）")
				else
					HopeJob_SetText(HopeJob_Confirm[chosen], "专属被动已满级")
				end
				block = HopeThird_StudyBlock(chosen, p)
				if block == "" then
					block = "每次仅消耗1技能点；后续升级获得的技能点也可研习。"
				end
			else
				HopeJob_SetText(HopeJob_Confirm[chosen], "已完成三转")
				block = "专属觉醒技能已获得；查看技能页了解用法。"
			end
		end
		HopeJob_SetText(HopeJob_Footer, block)
	else
		HopeJob_ShowFrame(HopeJob_PrevButton, false)
		HopeJob_ShowFrame(HopeJob_NextButton, false)
		HopeJob_ShowFrame(HopeJob_PageLabel, false)
		HopeJob_SetText(HopeJob_Footer, "")
		if HopeJob_Entry == 1 and typ ~= 1211117616 then
			HopeJob_SetText(HopeJob_Detail, "你已完成一转。请在二转建筑出现后，前往该建筑继续二转或三转。")
		elseif HopeJob_Entry == 2 and typ == 1211117616 then
			HopeJob_SetText(HopeJob_Detail, "请先在一转建筑完成一转，再来选择本职业的二转路线。")
		else
			HopeJob_SetText(HopeJob_Detail, "当前没有可用的进阶路线。")
		end
	end
	p = nil
end

function HopeJob_Refresh()
	HopeJob_RefreshContent()
	HopeLayout_Apply()
end

function HopeJob_CreateUI()
	local index = 0
	local f = 0
	DestroyTimer(GetExpiredTimer())
	HopeJob_Panel = HopeQoL_Surface("HopeJobPanel", 0.17, 0.56, 0.47, 0.38)
	if HopeJob_Panel == 0 then
		return
	end
	HopeJob_Title = HopeQoL_Label("HopeJobTitle", HopeJob_Panel, 0.012, -0.01, 0.405, 0.022, "")
	HopeJob_Status = HopeQoL_Label("HopeJobStatus", HopeJob_Panel, 0.012, -0.037, 0.446, 0.022, "")
	f = HopeQoL_Button("HopeJobClose", HopeJob_Panel, 0.421, -0.009, 0.037, 0.022, "关闭")
	HopeQoL_Bind(f, HopeJob_Close, false)
	f = HopeQoL_Button("HopeJobOverview", HopeJob_Panel, 0.165, -0.066, 0.087, 0.022, "定位 / 条件")
	HopeQoL_Bind(f, HopeJob_Page0, false)
	f = HopeQoL_Button("HopeJobSkills", HopeJob_Panel, 0.259, -0.066, 0.087, 0.022, "战斗技能")
	HopeQoL_Bind(f, HopeJob_Page1, false)
	f = HopeQoL_Button("HopeJobPassive", HopeJob_Panel, 0.353, -0.066, 0.099, 0.022, "被动 / 收益")
	HopeQoL_Bind(f, HopeJob_Page2, false)
	HopeJob_Detail = HopeQoL_Label("HopeJobDetail", HopeJob_Panel, 0.165, -0.101, 0.29, 0.174, "")
	HopeJob_PrevButton = HopeQoL_Button("HopeJobPrev", HopeJob_Panel, 0.165, -0.285, 0.083, 0.02, "上一项")
	HopeQoL_Bind(HopeJob_PrevButton, HopeJob_Prev, false)
	HopeJob_NextButton = HopeQoL_Button("HopeJobNext", HopeJob_Panel, 0.37, -0.285, 0.083, 0.02, "下一项")
	HopeQoL_Bind(HopeJob_NextButton, HopeJob_Next, false)
	HopeJob_PageLabel = HopeQoL_Label("HopeJobPage", HopeJob_Panel, 0.278, -0.286, 0.07, 0.018, "")
	HopeJob_Footer = HopeQoL_Label("HopeJobFooter", HopeJob_Panel, 0.012, -0.349, 0.446, 0.023, "")
	HopeJob_OpenButton = HopeQoL_Button("HopeJobOpen", DzGetGameUI(), 0.014, 0.218, 0.134, 0.024, "转职 / 三转觉醒")
	HopeQoL_Bind(HopeJob_OpenButton, HopeJob_Open, false)
	HopeJob_Row[0] = HopeQoL_Button("HopeJobRow0", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "盗贼")
	HopeQoL_Bind(HopeJob_Row[0], HopeJob_Select0, false)
	HopeJob_Confirm[0] = HopeQoL_Button("HopeJobConfirm0", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[0] or ""))
	HopeQoL_Bind(HopeJob_Confirm[0], HopeJob_Commit0, true)
	HopeJob_ShowFrame(HopeJob_Confirm[0], false)
	HopeJob_Row[1] = HopeQoL_Button("HopeJobRow1", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "矮人火枪手")
	HopeQoL_Bind(HopeJob_Row[1], HopeJob_Select1, false)
	HopeJob_Confirm[1] = HopeQoL_Button("HopeJobConfirm1", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[1] or ""))
	HopeQoL_Bind(HopeJob_Confirm[1], HopeJob_Commit1, true)
	HopeJob_ShowFrame(HopeJob_Confirm[1], false)
	HopeJob_Row[2] = HopeQoL_Button("HopeJobRow2", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "步兵")
	HopeQoL_Bind(HopeJob_Row[2], HopeJob_Select2, false)
	HopeJob_Confirm[2] = HopeQoL_Button("HopeJobConfirm2", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[2] or ""))
	HopeQoL_Bind(HopeJob_Confirm[2], HopeJob_Commit2, true)
	HopeJob_ShowFrame(HopeJob_Confirm[2], false)
	HopeJob_Row[3] = HopeQoL_Button("HopeJobRow3", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "法师学徒")
	HopeQoL_Bind(HopeJob_Row[3], HopeJob_Select3, false)
	HopeJob_Confirm[3] = HopeQoL_Button("HopeJobConfirm3", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[3] or ""))
	HopeQoL_Bind(HopeJob_Confirm[3], HopeJob_Commit3, true)
	HopeJob_ShowFrame(HopeJob_Confirm[3], false)
	HopeJob_Row[4] = HopeQoL_Button("HopeJobRow4", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "人类弩手")
	HopeQoL_Bind(HopeJob_Row[4], HopeJob_Select4, false)
	HopeJob_Confirm[4] = HopeQoL_Button("HopeJobConfirm4", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[4] or ""))
	HopeQoL_Bind(HopeJob_Confirm[4], HopeJob_Commit4, true)
	HopeJob_ShowFrame(HopeJob_Confirm[4], false)
	HopeJob_Row[5] = HopeQoL_Button("HopeJobRow5", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "见习牧师")
	HopeQoL_Bind(HopeJob_Row[5], HopeJob_Select5, false)
	HopeJob_Confirm[5] = HopeQoL_Button("HopeJobConfirm5", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[5] or ""))
	HopeQoL_Bind(HopeJob_Confirm[5], HopeJob_Commit5, true)
	HopeJob_ShowFrame(HopeJob_Confirm[5], false)
	HopeJob_Row[6] = HopeQoL_Button("HopeJobRow6", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "兽族步兵")
	HopeQoL_Bind(HopeJob_Row[6], HopeJob_Select6, false)
	HopeJob_Confirm[6] = HopeQoL_Button("HopeJobConfirm6", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[6] or ""))
	HopeQoL_Bind(HopeJob_Confirm[6], HopeJob_Commit6, true)
	HopeJob_ShowFrame(HopeJob_Confirm[6], false)
	HopeJob_Row[7] = HopeQoL_Button("HopeJobRow7", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "巨魔投手")
	HopeQoL_Bind(HopeJob_Row[7], HopeJob_Select7, false)
	HopeJob_Confirm[7] = HopeQoL_Button("HopeJobConfirm7", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[7] or ""))
	HopeQoL_Bind(HopeJob_Confirm[7], HopeJob_Commit7, true)
	HopeJob_ShowFrame(HopeJob_Confirm[7], false)
	HopeJob_Row[8] = HopeQoL_Button("HopeJobRow8", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "重装步兵")
	HopeQoL_Bind(HopeJob_Row[8], HopeJob_Select8, false)
	HopeJob_Confirm[8] = HopeQoL_Button("HopeJobConfirm8", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[8] or ""))
	HopeQoL_Bind(HopeJob_Confirm[8], HopeJob_Commit8, true)
	HopeJob_ShowFrame(HopeJob_Confirm[8], false)
	HopeJob_Row[9] = HopeQoL_Button("HopeJobRow9", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "骑兵")
	HopeQoL_Bind(HopeJob_Row[9], HopeJob_Select9, false)
	HopeJob_Confirm[9] = HopeQoL_Button("HopeJobConfirm9", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[9] or ""))
	HopeQoL_Bind(HopeJob_Confirm[9], HopeJob_Commit9, true)
	HopeJob_ShowFrame(HopeJob_Confirm[9], false)
	HopeJob_Row[10] = HopeQoL_Button("HopeJobRow10", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "神圣牧师")
	HopeQoL_Bind(HopeJob_Row[10], HopeJob_Select10, false)
	HopeJob_Confirm[10] = HopeQoL_Button("HopeJobConfirm10", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[10] or ""))
	HopeQoL_Bind(HopeJob_Confirm[10], HopeJob_Commit10, true)
	HopeJob_ShowFrame(HopeJob_Confirm[10], false)
	HopeJob_Row[11] = HopeQoL_Button("HopeJobRow11", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "僧侣")
	HopeQoL_Bind(HopeJob_Row[11], HopeJob_Select11, false)
	HopeJob_Confirm[11] = HopeQoL_Button("HopeJobConfirm11", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[11] or ""))
	HopeQoL_Bind(HopeJob_Confirm[11], HopeJob_Commit11, true)
	HopeJob_ShowFrame(HopeJob_Confirm[11], false)
	HopeJob_Row[12] = HopeQoL_Button("HopeJobRow12", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "强盗")
	HopeQoL_Bind(HopeJob_Row[12], HopeJob_Select12, false)
	HopeJob_Confirm[12] = HopeQoL_Button("HopeJobConfirm12", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[12] or ""))
	HopeQoL_Bind(HopeJob_Confirm[12], HopeJob_Commit12, true)
	HopeJob_ShowFrame(HopeJob_Confirm[12], false)
	HopeJob_Row[13] = HopeQoL_Button("HopeJobRow13", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "刺客")
	HopeQoL_Bind(HopeJob_Row[13], HopeJob_Select13, false)
	HopeJob_Confirm[13] = HopeQoL_Button("HopeJobConfirm13", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[13] or ""))
	HopeQoL_Bind(HopeJob_Confirm[13], HopeJob_Commit13, true)
	HopeJob_ShowFrame(HopeJob_Confirm[13], false)
	HopeJob_Row[14] = HopeQoL_Button("HopeJobRow14", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "精英弩手")
	HopeQoL_Bind(HopeJob_Row[14], HopeJob_Select14, false)
	HopeJob_Confirm[14] = HopeQoL_Button("HopeJobConfirm14", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[14] or ""))
	HopeQoL_Bind(HopeJob_Confirm[14], HopeJob_Commit14, true)
	HopeJob_ShowFrame(HopeJob_Confirm[14], false)
	HopeJob_Row[15] = HopeQoL_Button("HopeJobRow15", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "重弩手")
	HopeQoL_Bind(HopeJob_Row[15], HopeJob_Select15, false)
	HopeJob_Confirm[15] = HopeQoL_Button("HopeJobConfirm15", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[15] or ""))
	HopeQoL_Bind(HopeJob_Confirm[15], HopeJob_Commit15, true)
	HopeJob_ShowFrame(HopeJob_Confirm[15], false)
	HopeJob_Row[16] = HopeQoL_Button("HopeJobRow16", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "机枪兵")
	HopeQoL_Bind(HopeJob_Row[16], HopeJob_Select16, false)
	HopeJob_Confirm[16] = HopeQoL_Button("HopeJobConfirm16", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[16] or ""))
	HopeQoL_Bind(HopeJob_Confirm[16], HopeJob_Commit16, true)
	HopeJob_ShowFrame(HopeJob_Confirm[16], false)
	HopeJob_Row[17] = HopeQoL_Button("HopeJobRow17", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "矮人狙击手")
	HopeQoL_Bind(HopeJob_Row[17], HopeJob_Select17, false)
	HopeJob_Confirm[17] = HopeQoL_Button("HopeJobConfirm17", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[17] or ""))
	HopeQoL_Bind(HopeJob_Confirm[17], HopeJob_Commit17, true)
	HopeJob_ShowFrame(HopeJob_Confirm[17], false)
	HopeJob_Row[18] = HopeQoL_Button("HopeJobRow18", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "初级法师")
	HopeQoL_Bind(HopeJob_Row[18], HopeJob_Select18, false)
	HopeJob_Confirm[18] = HopeQoL_Button("HopeJobConfirm18", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[18] or ""))
	HopeQoL_Bind(HopeJob_Confirm[18], HopeJob_Commit18, true)
	HopeJob_ShowFrame(HopeJob_Confirm[18], false)
	HopeJob_Row[19] = HopeQoL_Button("HopeJobRow19", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "初级火焰法师")
	HopeQoL_Bind(HopeJob_Row[19], HopeJob_Select19, false)
	HopeJob_Confirm[19] = HopeQoL_Button("HopeJobConfirm19", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[19] or ""))
	HopeQoL_Bind(HopeJob_Confirm[19], HopeJob_Commit19, true)
	HopeJob_ShowFrame(HopeJob_Confirm[19], false)
	HopeJob_Row[20] = HopeQoL_Button("HopeJobRow20", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "巨魔狂战士")
	HopeQoL_Bind(HopeJob_Row[20], HopeJob_Select20, false)
	HopeJob_Confirm[20] = HopeQoL_Button("HopeJobConfirm20", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[20] or ""))
	HopeQoL_Bind(HopeJob_Confirm[20], HopeJob_Commit20, true)
	HopeJob_ShowFrame(HopeJob_Confirm[20], false)
	HopeJob_Row[21] = HopeQoL_Button("HopeJobRow21", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "巨魔战将")
	HopeQoL_Bind(HopeJob_Row[21], HopeJob_Select21, false)
	HopeJob_Confirm[21] = HopeQoL_Button("HopeJobConfirm21", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[21] or ""))
	HopeQoL_Bind(HopeJob_Confirm[21], HopeJob_Commit21, true)
	HopeJob_ShowFrame(HopeJob_Confirm[21], false)
	HopeJob_Row[22] = HopeQoL_Button("HopeJobRow22", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "兽族狂暴步兵")
	HopeQoL_Bind(HopeJob_Row[22], HopeJob_Select22, false)
	HopeJob_Confirm[22] = HopeQoL_Button("HopeJobConfirm22", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[22] or ""))
	HopeQoL_Bind(HopeJob_Confirm[22], HopeJob_Commit22, true)
	HopeJob_ShowFrame(HopeJob_Confirm[22], false)
	HopeJob_Row[23] = HopeQoL_Button("HopeJobRow23", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "狼骑兵")
	HopeQoL_Bind(HopeJob_Row[23], HopeJob_Select23, false)
	HopeJob_Confirm[23] = HopeQoL_Button("HopeJobConfirm23", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[23] or ""))
	HopeQoL_Bind(HopeJob_Confirm[23], HopeJob_Commit23, true)
	HopeJob_ShowFrame(HopeJob_Confirm[23], false)
	HopeJob_Row[24] = HopeQoL_Button("HopeJobRow24", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "随机转职")
	HopeQoL_Bind(HopeJob_Row[24], HopeJob_Select24, false)
	HopeJob_Confirm[24] = HopeQoL_Button("HopeJobConfirm24", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[24] or ""))
	HopeQoL_Bind(HopeJob_Confirm[24], HopeJob_Commit24, true)
	HopeJob_ShowFrame(HopeJob_Confirm[24], false)
	HopeJob_Row[25] = HopeQoL_Button("HopeJobRow25", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "万象织法者")
	HopeQoL_Bind(HopeJob_Row[25], HopeJob_Select25, false)
	HopeJob_Confirm[25] = HopeQoL_Button("HopeJobConfirm25", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[25] or ""))
	HopeQoL_Bind(HopeJob_Confirm[25], HopeJob_Commit25, true)
	HopeJob_ShowFrame(HopeJob_Confirm[25], false)
	HopeJob_Row[26] = HopeQoL_Button("HopeJobRow26", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "万象天枢")
	HopeQoL_Bind(HopeJob_Row[26], HopeJob_Select26, false)
	HopeJob_Confirm[26] = HopeQoL_Button("HopeJobConfirm26", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[26] or ""))
	HopeQoL_Bind(HopeJob_Confirm[26], HopeJob_Commit26, true)
	HopeJob_ShowFrame(HopeJob_Confirm[26], false)
	HopeJob_Row[27] = HopeQoL_Button("HopeJobRow27", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "钢铁统帅")
	HopeQoL_Bind(HopeJob_Row[27], HopeJob_Select27, false)
	HopeJob_Confirm[27] = HopeQoL_Button("HopeJobConfirm27", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[27] or ""))
	HopeQoL_Bind(HopeJob_Confirm[27], HopeJob_Commit27, true)
	HopeJob_ShowFrame(HopeJob_Confirm[27], false)
	HopeJob_Row[28] = HopeQoL_Button("HopeJobRow28", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "圣锋骑士")
	HopeQoL_Bind(HopeJob_Row[28], HopeJob_Select28, false)
	HopeJob_Confirm[28] = HopeQoL_Button("HopeJobConfirm28", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[28] or ""))
	HopeQoL_Bind(HopeJob_Confirm[28], HopeJob_Commit28, true)
	HopeJob_ShowFrame(HopeJob_Confirm[28], false)
	HopeJob_Row[29] = HopeQoL_Button("HopeJobRow29", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "圣光主教")
	HopeQoL_Bind(HopeJob_Row[29], HopeJob_Select29, false)
	HopeJob_Confirm[29] = HopeQoL_Button("HopeJobConfirm29", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[29] or ""))
	HopeQoL_Bind(HopeJob_Confirm[29], HopeJob_Commit29, true)
	HopeJob_ShowFrame(HopeJob_Confirm[29], false)
	HopeJob_Row[30] = HopeQoL_Button("HopeJobRow30", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "金刚禅师")
	HopeQoL_Bind(HopeJob_Row[30], HopeJob_Select30, false)
	HopeJob_Confirm[30] = HopeQoL_Button("HopeJobConfirm30", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[30] or ""))
	HopeQoL_Bind(HopeJob_Confirm[30], HopeJob_Commit30, true)
	HopeJob_ShowFrame(HopeJob_Confirm[30], false)
	HopeJob_Row[31] = HopeQoL_Button("HopeJobRow31", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "影刃宗师")
	HopeQoL_Bind(HopeJob_Row[31], HopeJob_Select31, false)
	HopeJob_Confirm[31] = HopeQoL_Button("HopeJobConfirm31", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[31] or ""))
	HopeQoL_Bind(HopeJob_Confirm[31], HopeJob_Commit31, true)
	HopeJob_ShowFrame(HopeJob_Confirm[31], false)
	HopeJob_Row[32] = HopeQoL_Button("HopeJobRow32", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "幻影刺皇")
	HopeQoL_Bind(HopeJob_Row[32], HopeJob_Select32, false)
	HopeJob_Confirm[32] = HopeQoL_Button("HopeJobConfirm32", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[32] or ""))
	HopeQoL_Bind(HopeJob_Confirm[32], HopeJob_Commit32, true)
	HopeJob_ShowFrame(HopeJob_Confirm[32], false)
	HopeJob_Row[33] = HopeQoL_Button("HopeJobRow33", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "风暴箭圣")
	HopeQoL_Bind(HopeJob_Row[33], HopeJob_Select33, false)
	HopeJob_Confirm[33] = HopeQoL_Button("HopeJobConfirm33", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[33] or ""))
	HopeQoL_Bind(HopeJob_Confirm[33], HopeJob_Commit33, true)
	HopeJob_ShowFrame(HopeJob_Confirm[33], false)
	HopeJob_Row[34] = HopeQoL_Button("HopeJobRow34", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "破城弩王")
	HopeQoL_Bind(HopeJob_Row[34], HopeJob_Select34, false)
	HopeJob_Confirm[34] = HopeQoL_Button("HopeJobConfirm34", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[34] or ""))
	HopeQoL_Bind(HopeJob_Confirm[34], HopeJob_Commit34, true)
	HopeJob_ShowFrame(HopeJob_Confirm[34], false)
	HopeJob_Row[35] = HopeQoL_Button("HopeJobRow35", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "弹幕指挥官")
	HopeQoL_Bind(HopeJob_Row[35], HopeJob_Select35, false)
	HopeJob_Confirm[35] = HopeQoL_Button("HopeJobConfirm35", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[35] or ""))
	HopeQoL_Bind(HopeJob_Confirm[35], HopeJob_Commit35, true)
	HopeJob_ShowFrame(HopeJob_Confirm[35], false)
	HopeJob_Row[36] = HopeQoL_Button("HopeJobRow36", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "鹰眼神射")
	HopeQoL_Bind(HopeJob_Row[36], HopeJob_Select36, false)
	HopeJob_Confirm[36] = HopeQoL_Button("HopeJobConfirm36", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[36] or ""))
	HopeQoL_Bind(HopeJob_Confirm[36], HopeJob_Commit36, true)
	HopeJob_ShowFrame(HopeJob_Confirm[36], false)
	HopeJob_Row[37] = HopeQoL_Button("HopeJobRow37", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "奥术贤者")
	HopeQoL_Bind(HopeJob_Row[37], HopeJob_Select37, false)
	HopeJob_Confirm[37] = HopeQoL_Button("HopeJobConfirm37", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[37] or ""))
	HopeQoL_Bind(HopeJob_Confirm[37], HopeJob_Commit37, true)
	HopeJob_ShowFrame(HopeJob_Confirm[37], false)
	HopeJob_Row[38] = HopeQoL_Button("HopeJobRow38", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "炽焰领主")
	HopeQoL_Bind(HopeJob_Row[38], HopeJob_Select38, false)
	HopeJob_Confirm[38] = HopeQoL_Button("HopeJobConfirm38", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[38] or ""))
	HopeQoL_Bind(HopeJob_Confirm[38], HopeJob_Commit38, true)
	HopeJob_ShowFrame(HopeJob_Confirm[38], false)
	HopeJob_Row[39] = HopeQoL_Button("HopeJobRow39", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "血矛战神")
	HopeQoL_Bind(HopeJob_Row[39], HopeJob_Select39, false)
	HopeJob_Confirm[39] = HopeQoL_Button("HopeJobConfirm39", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[39] or ""))
	HopeQoL_Bind(HopeJob_Confirm[39], HopeJob_Commit39, true)
	HopeJob_ShowFrame(HopeJob_Confirm[39], false)
	HopeJob_Row[40] = HopeQoL_Button("HopeJobRow40", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "巨魔战皇")
	HopeQoL_Bind(HopeJob_Row[40], HopeJob_Select40, false)
	HopeJob_Confirm[40] = HopeQoL_Button("HopeJobConfirm40", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[40] or ""))
	HopeQoL_Bind(HopeJob_Confirm[40], HopeJob_Commit40, true)
	HopeJob_ShowFrame(HopeJob_Confirm[40], false)
	HopeJob_Row[41] = HopeQoL_Button("HopeJobRow41", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "狂怒战神")
	HopeQoL_Bind(HopeJob_Row[41], HopeJob_Select41, false)
	HopeJob_Confirm[41] = HopeQoL_Button("HopeJobConfirm41", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[41] or ""))
	HopeQoL_Bind(HopeJob_Confirm[41], HopeJob_Commit41, true)
	HopeJob_ShowFrame(HopeJob_Confirm[41], false)
	HopeJob_Row[42] = HopeQoL_Button("HopeJobRow42", HopeJob_Panel, 0.012, -0.078, 0.143, 0.025, "荒原狼王")
	HopeQoL_Bind(HopeJob_Row[42], HopeJob_Select42, false)
	HopeJob_Confirm[42] = HopeQoL_Button("HopeJobConfirm42", HopeJob_Panel, 0.165, -0.317, 0.29, 0.024, "确认：" .. (HopeJob_Name[42] or ""))
	HopeQoL_Bind(HopeJob_Confirm[42], HopeJob_Commit42, true)
	HopeJob_ShowFrame(HopeJob_Confirm[42], false)
	HopeJob_ShowFrame(HopeJob_OpenButton, false)
	HopeJob_ShowFrame(HopeJob_Panel, false)
	TimerStart(CreateTimer(), 0.2, true, HopeJob_Refresh)
end

function HopeJob_Cast()
	local aid = GetSpellAbilityId()
	local u = GetTriggerUnit()
	local p = GetOwningPlayer(u)
	local i = GetPlayerId(p) + 1
	local kind = 0
	local stage = 0
	local token = HopeChallenge_TurnToken()
	local j = 1
	local amount = 0.0
	local factor = 1.0
	local target = GetSpellTargetUnit()
	local g = nil
	if i < 1 or i > 6 or u ~= udg_hero[i] or GetWidgetLife(u) <= 0.405 or IsUnitPaused(u) then
		u = nil
		target = nil
		p = nil
		return
	end
	if aid == 1096036403 or aid == 1096036406 or aid == 1096036408 or aid == 1096036656 or aid == 1096036657 or aid == 1096036659 or aid == 1096036662 then
		HopeThird_Cast(u, aid, target)
	elseif aid == 1096430390 then
		HopeMonk_Cast(u, aid, target)
	elseif aid == 1096435794 or aid == 1096435780 then
		HopeHidden_Cast(u, aid, target)
	elseif aid == 1096435777 or aid == 1096435762 or aid == 1096435763 then
		if GetUnitTypeId(u) == 1213870129 then
			amount = GetUnitState(u, ConvertUnitState(20)) * 0.6 + I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true)) * 0.45
		elseif GetUnitTypeId(u) == 1213870130 then
			amount = GetUnitState(u, ConvertUnitState(20)) * 0.65 + I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true)) * 0.65
		elseif GetUnitTypeId(u) == 1213870131 then
			amount = GetUnitState(u, ConvertUnitState(20)) * 0.7 + I2R(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true)) * 0.8
		else
			u = nil
			target = nil
			p = nil
			return
		end
		if not udg_ZhandouZhong or udg_xingdong_dian[i] < 1 or target == nil or not IsUnitInGroup(target, udg_Guaiwu_dwz) or GetWidgetLife(target) <= 0.405 then
			DisplayTimedTextToPlayer(p, 0, 0, 4.0, "三相打击：需要战斗中、1行动点和存活的当前敌人。")
		else
			udg_xingdong_dian[i] = udg_xingdong_dian[i] - 1
			HopeThird_HiddenAction(u, aid)
			UnitDamageTarget(u, target, amount * udg_Skill_Dm[i], true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
			DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl", target, "origin"))
		end
	end
	g = nil
	target = nil
	u = nil
	p = nil
end

function HopeJob_Learn()
	local u = GetTriggerUnit()
	local i = GetPlayerId(GetOwningPlayer(u)) + 1
	local kind = GetUnitTypeId(u)
	if i >= 1 and i <= 6 and u == udg_hero[i] and GetLearnedSkill() == 1096435792 and (kind == 1213870129 or kind == 1213870130 or kind == 1213870131) then
		HopeJob_AddStats(i, 2, 2, 2)
	end
	u = nil
end

function HopeJob_Init()
	local i = 0
	local selected = CreateTrigger()
	local spells = CreateTrigger()
	local learning = CreateTrigger()
	local shops = CreateGroup()
	DestroyTimer(GetExpiredTimer())
	HopeJob_SkillCount[0] = 1
	HopeJob_DetailText[0] = "|cffd2b879连斩|r|n攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）"
	HopeJob_PassiveCount[0] = 1
	HopeJob_DetailText[8] = "|cffd2b879敏捷修炼|r|n学习后行动点+1 （一次）|n每级敏捷+5 连击追加的伤害每级增加20%*敏捷"
	HopeJob_Source[0] = 1211117616
	HopeJob_Target[0] = 1311780932
	HopeJob_Item[0] = 1227894849
	HopeJob_Stage[0] = 1
	HopeJob_Level[0] = 5
	HopeJob_Str[0] = 8
	HopeJob_Agi[0] = 8
	HopeJob_Int[0] = 0
	HopeJob_Name[0] = "盗贼"
	HopeJob_Role[0] = "敏捷近战 · 连击追伤 · 行动点成长"
	HopeJob_Skills[0] = "|cffd2b879连斩|r|n攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）"
	HopeJob_Passive[0] = "|cffd2b879敏捷修炼|r|n学习后行动点+1 （一次）|n每级敏捷+5 连击追加的伤害每级增加20%*敏捷"
	HopeJob_SkillCount[1] = 2
	HopeJob_DetailText[16] = "|cffd2b879开火|r|n开枪攻击敌人|n基础伤害值：攻击力*1.2|n浮动数值30%~200%|n|c00fffc01行动点消耗:1|r"
	HopeJob_DetailText[17] = "|cffd2b879乱射|r|n对最多3个敌人发动攻击，造成攻击力*（1+技能等级）的魔法伤害|n|c00fffc01行动点消耗:2|r|n每回合只能释放一次"
	HopeJob_PassiveCount[1] = 1
	HopeJob_DetailText[24] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_Source[1] = 1211117616
	HopeJob_Target[1] = 1211117619
	HopeJob_Item[1] = 1227894839
	HopeJob_Stage[1] = 1
	HopeJob_Level[1] = 5
	HopeJob_Str[1] = 0
	HopeJob_Agi[1] = 10
	HopeJob_Int[1] = 0
	HopeJob_Name[1] = "矮人火枪手"
	HopeJob_Role[1] = "敏捷远程 · 高浮动火力 · 多目标输出"
	HopeJob_Skills[1] = "|cffd2b879开火|r|n开枪攻击敌人|n基础伤害值：攻击力*1.2|n浮动数值30%~200%|n|c00fffc01行动点消耗:1|r|n|n|cffd2b879乱射|r|n对最多3个敌人发动攻击，造成攻击力*（1+技能等级）的魔法伤害|n|c00fffc01行动点消耗:2|r|n每回合只能释放一次"
	HopeJob_Passive[1] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_SkillCount[2] = 2
	HopeJob_DetailText[32] = "|cffd2b879盾防嘲讽|r|n使用盾牌格挡并嘲讽敌人|n增加英雄护甲，并且将敌人的攻击目标变为自己|n增加护甲值：10+额外护甲值*3|n|c00fffc01行动点消耗:1|r|n每回合限定使用1次"
	HopeJob_DetailText[33] = "|cffd2b879雷霆一击|r|n冲向敌人使用雷霆一击，对目标周围400范围内所有敌人造成力量*（1+0.5*技能等级）的范围伤害，并且如果敌人行动为攻击则减少其30%的伤害值|n（多个雷霆减伤效果不叠加）|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_PassiveCount[2] = 1
	HopeJob_DetailText[40] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_Source[2] = 1211117616
	HopeJob_Target[2] = 1211117617
	HopeJob_Item[2] = 1227894836
	HopeJob_Stage[2] = 1
	HopeJob_Level[2] = 5
	HopeJob_Str[2] = 10
	HopeJob_Agi[2] = 0
	HopeJob_Int[2] = 0
	HopeJob_Name[2] = "步兵"
	HopeJob_Role[2] = "力量近战 · 盾防嘲讽 · 团队承伤"
	HopeJob_Skills[2] = "|cffd2b879盾防嘲讽|r|n使用盾牌格挡并嘲讽敌人|n增加英雄护甲，并且将敌人的攻击目标变为自己|n增加护甲值：10+额外护甲值*3|n|c00fffc01行动点消耗:1|r|n每回合限定使用1次|n|n|cffd2b879雷霆一击|r|n冲向敌人使用雷霆一击，对目标周围400范围内所有敌人造成力量*（1+0.5*技能等级）的范围伤害，并且如果敌人行动为攻击则减少其30%的伤害值|n（多个雷霆减伤效果不叠加）|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_Passive[2] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_SkillCount[3] = 2
	HopeJob_DetailText[48] = "|cffd2b879火球|r|n发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术"
	HopeJob_DetailText[49] = "|cffd2b879暴风雪|r|n冰片攻击，对目标区域内的单位造成智力*(2+1*技能等级)的法术伤害|n|c00fffc01行动点消耗:2|r"
	HopeJob_PassiveCount[3] = 1
	HopeJob_DetailText[56] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_Source[3] = 1211117616
	HopeJob_Target[3] = 1311780919
	HopeJob_Item[3] = 1227894838
	HopeJob_Stage[3] = 1
	HopeJob_Level[3] = 5
	HopeJob_Str[3] = 0
	HopeJob_Agi[3] = 0
	HopeJob_Int[3] = 10
	HopeJob_Name[3] = "法师学徒"
	HopeJob_Role[3] = "智力远程 · 火球与暴风雪 · 法术输出"
	HopeJob_Skills[3] = "|cffd2b879火球|r|n发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术|n|n|cffd2b879暴风雪|r|n冰片攻击，对目标区域内的单位造成智力*(2+1*技能等级)的法术伤害|n|c00fffc01行动点消耗:2|r"
	HopeJob_Passive[3] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_SkillCount[4] = 1
	HopeJob_DetailText[64] = "|cffd2b879射箭|r|n射出一支箭矢攻击敌人|n基础伤害值：攻击力*1.3|n浮动数值65%~110%|n|c00fffc01行动点消耗:1|r"
	HopeJob_PassiveCount[4] = 1
	HopeJob_DetailText[72] = "|cffd2b879精准射击|r|n射击的更为精准,同时有更大的威力|n每级额外让射箭的上下限提高10%,|n每级敏捷额外+3"
	HopeJob_Source[4] = 1211117616
	HopeJob_Target[4] = 1160785976
	HopeJob_Item[4] = 1227894837
	HopeJob_Stage[4] = 1
	HopeJob_Level[4] = 5
	HopeJob_Str[4] = 0
	HopeJob_Agi[4] = 10
	HopeJob_Int[4] = 0
	HopeJob_Name[4] = "人类弩手"
	HopeJob_Role[4] = "敏捷远程 · 稳定射击 · 精准成长"
	HopeJob_Skills[4] = "|cffd2b879射箭|r|n射出一支箭矢攻击敌人|n基础伤害值：攻击力*1.3|n浮动数值65%~110%|n|c00fffc01行动点消耗:1|r"
	HopeJob_Passive[4] = "|cffd2b879精准射击|r|n射击的更为精准,同时有更大的威力|n每级额外让射箭的上下限提高10%,|n每级敏捷额外+3"
	HopeJob_SkillCount[5] = 4
	HopeJob_DetailText[80] = "|cffd2b879群体防御符文|r|n增加所有友军 0.3*智力值的 防御|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_DetailText[81] = "|cffd2b879群体恢复|r|n|c00fffc01注意!该技能需要消耗一瓶血瓶来释放|r|n治疗所有存活队友各自最大生命值的25%|n同时追加英雄智力值的恢复量|n每回合只能释放一次"
	HopeJob_DetailText[82] = "每学习一次该技能，英雄会获得一瓶药水"
	HopeJob_DetailText[83] = "|cffd2b879审判之光|r|n除固定魔法费用外，再消耗最大魔法值的20%打击一名敌人|n2级额外打击1个目标；3级最多额外打击3个目标|n基础伤害：(扣固定费用后当前魔法值×20%+智力)×0.8|n主目标和次目标对亡灵的伤害均提高25%。|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_PassiveCount[5] = 1
	HopeJob_DetailText[88] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_Source[5] = 1211117616
	HopeJob_Target[5] = 1311780933
	HopeJob_Item[5] = 1227894856
	HopeJob_Stage[5] = 1
	HopeJob_Level[5] = 5
	HopeJob_Str[5] = 0
	HopeJob_Agi[5] = 0
	HopeJob_Int[5] = 10
	HopeJob_Name[5] = "见习牧师"
	HopeJob_Role[5] = "智力辅助 · 群体护甲 · 治疗与审判"
	HopeJob_Skills[5] = "|cffd2b879群体防御符文|r|n增加所有友军 0.3*智力值的 防御|n|c00fffc01行动点消耗:1|r|n每回合限用一次|n|n|cffd2b879群体恢复|r|n|c00fffc01注意!该技能需要消耗一瓶血瓶来释放|r|n治疗所有存活队友各自最大生命值的25%|n同时追加英雄智力值的恢复量|n每回合只能释放一次|n|n每学习一次该技能，英雄会获得一瓶药水|n|n|cffd2b879审判之光|r|n除固定魔法费用外，再消耗最大魔法值的20%打击一名敌人|n2级额外打击1个目标；3级最多额外打击3个目标|n基础伤害：(扣固定费用后当前魔法值×20%+智力)×0.8|n主目标和次目标对亡灵的伤害均提高25%。|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_Passive[5] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_SkillCount[6] = 2
	HopeJob_DetailText[96] = "|cffd2b879重砍|r|n重砍敌人|n基础伤害值：攻击力*1+力量*0.5|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r"
	HopeJob_DetailText[97] = "|cffd2b879狂暴力量|r|n力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	HopeJob_PassiveCount[6] = 1
	HopeJob_DetailText[104] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_Source[6] = 1211117616
	HopeJob_Target[6] = 1328558129
	HopeJob_Item[6] = 1227895365
	HopeJob_Stage[6] = 1
	HopeJob_Level[6] = 5
	HopeJob_Str[6] = 12
	HopeJob_Agi[6] = 0
	HopeJob_Int[6] = 0
	HopeJob_Name[6] = "兽族步兵"
	HopeJob_Role[6] = "力量近战 · 重砍爆发 · 狂暴换伤"
	HopeJob_Skills[6] = "|cffd2b879重砍|r|n重砍敌人|n基础伤害值：攻击力*1+力量*0.5|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r|n|n|cffd2b879狂暴力量|r|n力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	HopeJob_Passive[6] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_SkillCount[7] = 1
	HopeJob_DetailText[112] = "|cffd2b879投矛|r|n丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+力量*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	HopeJob_PassiveCount[7] = 1
	HopeJob_DetailText[120] = "|cffd2b879毒矛|r|n投矛命中时，为目标叠加自己来源的2层毒；已有30层或以上时改为1层。|n敌方回合结算：当前攻击力×30%×毒层数×毒矛等级。|n这是结算前基值；最终伤害、暴击和目标减伤按战斗规则另算。|n结算后毒层数减少1；不同玩家的毒独立计算。"
	HopeJob_Source[7] = 1211117616
	HopeJob_Target[7] = 1328558131
	HopeJob_Item[7] = 1227895605
	HopeJob_Stage[7] = 1
	HopeJob_Level[7] = 5
	HopeJob_Str[7] = 10
	HopeJob_Agi[7] = 0
	HopeJob_Int[7] = 0
	HopeJob_Name[7] = "巨魔投手"
	HopeJob_Role[7] = "力量远程 · 投矛叠毒 · 持续输出"
	HopeJob_Skills[7] = "|cffd2b879投矛|r|n丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+力量*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	HopeJob_Passive[7] = "|cffd2b879毒矛|r|n投矛命中时，为目标叠加自己来源的2层毒；已有30层或以上时改为1层。|n敌方回合结算：当前攻击力×30%×毒层数×毒矛等级。|n这是结算前基值；最终伤害、暴击和目标减伤按战斗规则另算。|n结算后毒层数减少1；不同玩家的毒独立计算。"
	HopeJob_SkillCount[8] = 3
	HopeJob_DetailText[128] = "|cffd2b879盾防嘲讽|r|n使用盾牌格挡并嘲讽敌人|n增加英雄护甲，并且将敌人的攻击目标变为自己|n增加护甲值：10+额外护甲值*3|n|c00fffc01行动点消耗:1|r|n每回合限定使用1次"
	HopeJob_DetailText[129] = "|cffd2b879剑盾猛攻|r|n同时使用剑盾猛攻敌人|n基础伤害值：攻击力*1+防御值*1|n基础浮动50%~150%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r"
	HopeJob_DetailText[130] = "|n|cffd2b879雷霆一击|r|n冲向敌人使用雷霆一击，对目标周围400范围内所有敌人造成力量*（1+0.5*技能等级）的范围伤害，并且如果敌人行动为攻击则减少其30%的伤害值|n（多个雷霆减伤效果不叠加）|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_PassiveCount[8] = 2
	HopeJob_DetailText[136] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[137] = "|cffd2b879重步兵修炼|r|n每级增加英雄5点额外防御值，5点回合防御值，力量+5"
	HopeJob_Source[8] = 1211117617
	HopeJob_Target[8] = 1211117624
	HopeJob_Item[8] = 1227895629
	HopeJob_Stage[8] = 2
	HopeJob_Level[8] = 15
	HopeJob_Str[8] = 25
	HopeJob_Agi[8] = 0
	HopeJob_Int[8] = 0
	HopeJob_Name[8] = "重装步兵"
	HopeJob_Role[8] = "力量坦克 · 嘲讽护甲 · 剑盾输出"
	HopeJob_Skills[8] = "|cffd2b879盾防嘲讽|r|n使用盾牌格挡并嘲讽敌人|n增加英雄护甲，并且将敌人的攻击目标变为自己|n增加护甲值：10+额外护甲值*3|n|c00fffc01行动点消耗:1|r|n每回合限定使用1次|n|n|cffd2b879剑盾猛攻|r|n同时使用剑盾猛攻敌人|n基础伤害值：攻击力*1+防御值*1|n基础浮动50%~150%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n|n|n|cffd2b879雷霆一击|r|n冲向敌人使用雷霆一击，对目标周围400范围内所有敌人造成力量*（1+0.5*技能等级）的范围伤害，并且如果敌人行动为攻击则减少其30%的伤害值|n（多个雷霆减伤效果不叠加）|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_Passive[8] = "转职奖励：行动点上限 +1。|n|n|cffd2b879重步兵修炼|r|n每级增加英雄5点额外防御值，5点回合防御值，力量+5"
	HopeJob_SkillCount[9] = 1
	HopeJob_DetailText[144] = "|cffd2b879骑兵冲锋|r|n骑兵冲锋，对路径上敌人造成力量*速度*技能等级*0.5的伤害|n使用时骑兵速度会逐渐加快，撞到一个敌人速度-1；同一目标只命中一次|n速度上限为8|n|c00fffc01行动点消耗:1|r"
	HopeJob_PassiveCount[9] = 2
	HopeJob_DetailText[152] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[153] = "|cffd2b879骑兵修炼|r|n速度属性同时加成平砍|n使用冲锋结束后的速度会加成下一次平砍的伤害|n每点速度增加20%的平砍伤害"
	HopeJob_Source[9] = 1211117617
	HopeJob_Target[9] = 1211117636
	HopeJob_Item[9] = 1227895886
	HopeJob_Stage[9] = 2
	HopeJob_Level[9] = 15
	HopeJob_Str[9] = 25
	HopeJob_Agi[9] = 0
	HopeJob_Int[9] = 0
	HopeJob_Name[9] = "骑兵"
	HopeJob_Role[9] = "力量机动 · 冲锋速度 · 单次爆发"
	HopeJob_Skills[9] = "|cffd2b879骑兵冲锋|r|n骑兵冲锋，对路径上敌人造成力量*速度*技能等级*0.5的伤害|n使用时骑兵速度会逐渐加快，撞到一个敌人速度-1；同一目标只命中一次|n速度上限为8|n|c00fffc01行动点消耗:1|r"
	HopeJob_Passive[9] = "转职奖励：行动点上限 +1。|n|n|cffd2b879骑兵修炼|r|n速度属性同时加成平砍|n使用冲锋结束后的速度会加成下一次平砍的伤害|n每点速度增加20%的平砍伤害"
	HopeJob_SkillCount[10] = 5
	HopeJob_DetailText[160] = "|cffd2b879圣光球|r|n发射圣光球攻击敌人。|n基础伤害值：智力×0.8；对亡灵目标伤害提高25%。|n基础浮动75%~120%，另计敏捷下限、力量上限与精准打击。|n|c00fffc01行动点消耗:1|r|n该攻击属于法术"
	HopeJob_DetailText[161] = "|cffd2b879群体防御符文|r|n增加所有友军 0.3*智力值的 防御|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_DetailText[162] = "|cffd2b879审判之光|r|n除固定魔法费用外，再消耗最大魔法值的20%打击一名敌人|n2级额外打击1个目标；3级最多额外打击3个目标|n基础伤害：(扣固定费用后当前魔法值×20%+智力)×0.8|n主目标和次目标对亡灵的伤害均提高25%。|n|c00fffc01行动点消耗:1|r|n每回合限用一次"
	HopeJob_DetailText[163] = "|cffd2b879群体恢复|r|n|c00fffc01注意!该技能需要消耗一瓶血瓶来释放|r|n治疗所有存活队友各自最大生命值的25%|n同时追加英雄智力值的恢复量|n每回合只能释放一次"
	HopeJob_DetailText[164] = "每学习一次该技能，英雄会获得一瓶药水"
	HopeJob_PassiveCount[10] = 2
	HopeJob_DetailText[168] = "转职奖励：技能伤害 +30%。"
	HopeJob_DetailText[169] = "|cffd2b879牧师修炼|r|n每级增加英雄5点智力 和5点每回合回蓝"
	HopeJob_Source[10] = 1311780933
	HopeJob_Target[10] = 1311781175
	HopeJob_Item[10] = 1227895634
	HopeJob_Stage[10] = 2
	HopeJob_Level[10] = 15
	HopeJob_Str[10] = 0
	HopeJob_Agi[10] = 0
	HopeJob_Int[10] = 30
	HopeJob_Name[10] = "神圣牧师"
	HopeJob_Role[10] = "智力辅助 · 治疗回蓝 · 圣光输出"
	HopeJob_Skills[10] = "|cffd2b879圣光球|r|n发射圣光球攻击敌人。|n基础伤害值：智力×0.8；对亡灵目标伤害提高25%。|n基础浮动75%~120%，另计敏捷下限、力量上限与精准打击。|n|c00fffc01行动点消耗:1|r|n该攻击属于法术|n|n|cffd2b879群体防御符文|r|n增加所有友军 0.3*智力值的 防御|n|c00fffc01行动点消耗:1|r|n每回合限用一次|n|n|cffd2b879审判之光|r|n除固定魔法费用外，再消耗最大魔法值的20%打击一名敌人|n2级额外打击1个目标；3级最多额外打击3个目标|n基础伤害：(扣固定费用后当前魔法值×20%+智力)×0.8|n主目标和次目标对亡灵的伤害均提高25%。|n|c00fffc01行动点消耗:1|r|n每回合限用一次|n|n|cffd2b879群体恢复|r|n|c00fffc01注意!该技能需要消耗一瓶血瓶来释放|r|n治疗所有存活队友各自最大生命值的25%|n同时追加英雄智力值的恢复量|n每回合只能释放一次|n|n每学习一次该技能，英雄会获得一瓶药水"
	HopeJob_Passive[10] = "转职奖励：技能伤害 +30%。|n|n|cffd2b879牧师修炼|r|n每级增加英雄5点智力 和5点每回合回蓝"
	HopeJob_SkillCount[11] = 3
	HopeJob_DetailText[176] = "|cffd2b879三才掌|r|n三才掌：单体物理伤害基值=攻击力×0.8+三围总和×0.9。|n命中当前敌人获得1气，最多3气；战斗开始清零。|n消耗1行动点、0魔法。三围含装备加成。|n无额外50%翻倍；技能倍率、暴击、最终伤害和减伤按原规则结算。"
	HopeJob_DetailText[177] = "|cffd2b879渡厄击|r|n渡厄击：消耗全部气，打击一名当前敌人并救助队友。|n法术伤害基值=三围总和×(0.8+技能等级×0.4)×(1+气×0.15)。|n治疗生命比例最低的存活队友（可含自己）：三围总和×(0.25+气×0.15)，不超过缺失生命。|n0气也可使用；消耗1行动点、3魔法，每回合一次。"
	HopeJob_DetailText[178] = "|cffd2b879护心诀|r|n护心诀：消耗全部气，为所有存活队友增加护甲。|n每人获得护甲=三围总和×(0.10+气×0.03)+施法者额外护甲。|n0气也可使用；消耗1行动点、2魔法，每回合一次。|n护甲沿用原图吸收伤害与回合清理规则；没有嘲讽。"
	HopeJob_PassiveCount[11] = 2
	HopeJob_DetailText[184] = "转职奖励：技能伤害 +30%。"
	HopeJob_DetailText[185] = "|cffd2b879僧侣修炼|r|n每级增加英雄30点魔法值上限和5点全属性"
	HopeJob_Source[11] = 1311780933
	HopeJob_Target[11] = 1311781191
	HopeJob_Item[11] = 1227895898
	HopeJob_Stage[11] = 2
	HopeJob_Level[11] = 15
	HopeJob_Str[11] = 0
	HopeJob_Agi[11] = 0
	HopeJob_Int[11] = 30
	HopeJob_Name[11] = "僧侣"
	HopeJob_Role[11] = "全属性战斗辅助 · 攻击蓄气 · 救人或护队"
	HopeJob_Skills[11] = "|cffd2b879三才掌|r|n三才掌：单体物理伤害基值=攻击力×0.8+三围总和×0.9。|n命中当前敌人获得1气，最多3气；战斗开始清零。|n消耗1行动点、0魔法。三围含装备加成。|n无额外50%翻倍；技能倍率、暴击、最终伤害和减伤按原规则结算。|n|n|cffd2b879渡厄击|r|n渡厄击：消耗全部气，打击一名当前敌人并救助队友。|n法术伤害基值=三围总和×(0.8+技能等级×0.4)×(1+气×0.15)。|n治疗生命比例最低的存活队友（可含自己）：三围总和×(0.25+气×0.15)，不超过缺失生命。|n0气也可使用；消耗1行动点、3魔法，每回合一次。|n|n|cffd2b879护心诀|r|n护心诀：消耗全部气，为所有存活队友增加护甲。|n每人获得护甲=三围总和×(0.10+气×0.03)+施法者额外护甲。|n0气也可使用；消耗1行动点、2魔法，每回合一次。|n护甲沿用原图吸收伤害与回合清理规则；没有嘲讽。"
	HopeJob_Passive[11] = "转职奖励：技能伤害 +30%。|n|n|cffd2b879僧侣修炼|r|n每级增加英雄30点魔法值上限和5点全属性"
	HopeJob_SkillCount[12] = 2
	HopeJob_DetailText[192] = "|cffd2b879连斩|r|n攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）"
	HopeJob_DetailText[193] = "|cffd2b879潜袭打击|r|n连续闪烁打击随机敌人，随机攻击4~7次|n每次攻击造成物理伤害|n每次打击伤害值:(攻击力+敏捷)*0.55|n|c00fffc01行动点消耗:2|r|n每回合最多使用一次|n英雄每点敏捷增加该伤害0.5%"
	HopeJob_PassiveCount[12] = 2
	HopeJob_DetailText[200] = "转职奖励：暴击率 +20%。"
	HopeJob_DetailText[201] = "|cffd2b879敏捷修炼|r|n学习后行动点+1 （一次）|n每级敏捷+5 连击追加的伤害每级增加20%*敏捷"
	HopeJob_Source[12] = 1311780932
	HopeJob_Target[12] = 1311781176
	HopeJob_Item[12] = 1227895631
	HopeJob_Stage[12] = 2
	HopeJob_Level[12] = 15
	HopeJob_Str[12] = 15
	HopeJob_Agi[12] = 20
	HopeJob_Int[12] = 0
	HopeJob_Name[12] = "强盗"
	HopeJob_Role[12] = "敏捷连击 · 潜袭多段 · 暴击爆发"
	HopeJob_Skills[12] = "|cffd2b879连斩|r|n攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）|n|n|cffd2b879潜袭打击|r|n连续闪烁打击随机敌人，随机攻击4~7次|n每次攻击造成物理伤害|n每次打击伤害值:(攻击力+敏捷)*0.55|n|c00fffc01行动点消耗:2|r|n每回合最多使用一次|n英雄每点敏捷增加该伤害0.5%"
	HopeJob_Passive[12] = "转职奖励：暴击率 +20%。|n|n|cffd2b879敏捷修炼|r|n学习后行动点+1 （一次）|n每级敏捷+5 连击追加的伤害每级增加20%*敏捷"
	HopeJob_SkillCount[13] = 2
	HopeJob_DetailText[208] = "|cffd2b879投矛|r|n丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+敏捷*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	HopeJob_DetailText[209] = "蓄力投掷：物理伤害=(力量+敏捷)×(2+技能等级)，同时降低目标(2+技能等级)点护甲。消耗1行动点、5魔法，每回合一次；目标为投射路径上的敌人，增伤/暴击另计。"
	HopeJob_PassiveCount[13] = 2
	HopeJob_DetailText[216] = "转职奖励：暴击率 +20%。"
	HopeJob_DetailText[217] = "|cffd2b879刺客修炼|r|n每级精确打击伤害+20% 专注上限+3|n每级敏捷+5 力量+5"
	HopeJob_Source[13] = 1311780932
	HopeJob_Target[13] = 1311781190
	HopeJob_Item[13] = 1227895897
	HopeJob_Stage[13] = 2
	HopeJob_Level[13] = 15
	HopeJob_Str[13] = 15
	HopeJob_Agi[13] = 20
	HopeJob_Int[13] = 0
	HopeJob_Name[13] = "刺客"
	HopeJob_Role[13] = "力敏投矛 · 精确打击 · 蓄力破甲"
	HopeJob_Skills[13] = "|cffd2b879投矛|r|n丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+敏捷*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r|n|n蓄力投掷：伤害=(力量+敏捷)×(2+技能等级)，破甲(2+技能等级)。1行动点、5魔法，每回合一次。"
	HopeJob_Passive[13] = "转职奖励：暴击率 +20%。|n|n|cffd2b879刺客修炼|r|n每级精确打击伤害+20% 专注上限+3|n每级敏捷+5 力量+5"
	HopeJob_SkillCount[14] = 1
	HopeJob_DetailText[224] = "|cffd2b879射箭|r|n射出一支箭矢攻击敌人|n基础伤害值：攻击力*1.3|n浮动数值65%~110%|n|c00fffc01行动点消耗:1|r"
	HopeJob_PassiveCount[14] = 3
	HopeJob_DetailText[232] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[233] = "|cffd2b879弩手修炼|r|n学习后让弩手在平A时同时攻击2个敌人|n每级敏捷+5"
	HopeJob_DetailText[234] = "|cffd2b879精准射击|r|n射击的更为精准,同时有更大的威力|n每级额外让射箭的上下限提高10%,|n每级敏捷额外+3"
	HopeJob_Source[14] = 1160785976
	HopeJob_Target[14] = 1160786003
	HopeJob_Item[14] = 1227895630
	HopeJob_Stage[14] = 2
	HopeJob_Level[14] = 15
	HopeJob_Str[14] = 0
	HopeJob_Agi[14] = 25
	HopeJob_Int[14] = 0
	HopeJob_Name[14] = "精英弩手"
	HopeJob_Role[14] = "敏捷远程 · 多目标射击 · 稳定输出"
	HopeJob_Skills[14] = "|cffd2b879射箭|r|n射出一支箭矢攻击敌人|n基础伤害值：攻击力*1.3|n浮动数值65%~110%|n|c00fffc01行动点消耗:1|r"
	HopeJob_Passive[14] = "转职奖励：行动点上限 +1。|n|n|cffd2b879弩手修炼|r|n学习后让弩手在平A时同时攻击2个敌人|n每级敏捷+5|n|n|cffd2b879精准射击|r|n射击的更为精准,同时有更大的威力|n每级额外让射箭的上下限提高10%,|n每级敏捷额外+3"
	HopeJob_SkillCount[15] = 1
	HopeJob_DetailText[240] = "|cffd2b879发射弩箭|r|n可以发射重型弩箭攻击并穿透敌人|n基础伤害值：攻击力*3.5|n浮动数值100%~150%|n|c00fffc01行动点消耗:2|r"
	HopeJob_PassiveCount[15] = 2
	HopeJob_DetailText[248] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[249] = "|cffd2b879精准射击|r|n射击的更为精准,同时有更大的威力|n每级额外让射箭的上下限提高10%,|n每级敏捷额外+3"
	HopeJob_Source[15] = 1160785976
	HopeJob_Target[15] = 1160786224
	HopeJob_Item[15] = 1227895887
	HopeJob_Stage[15] = 2
	HopeJob_Level[15] = 15
	HopeJob_Str[15] = 15
	HopeJob_Agi[15] = 15
	HopeJob_Int[15] = 0
	HopeJob_Name[15] = "重弩手"
	HopeJob_Role[15] = "力敏远程 · 穿透弩箭 · 高单次伤害"
	HopeJob_Skills[15] = "|cffd2b879发射弩箭|r|n可以发射重型弩箭攻击并穿透敌人|n基础伤害值：攻击力*3.5|n浮动数值100%~150%|n|c00fffc01行动点消耗:2|r"
	HopeJob_Passive[15] = "转职奖励：行动点上限 +1。|n|n|cffd2b879精准射击|r|n射击的更为精准,同时有更大的威力|n每级额外让射箭的上下限提高10%,|n每级敏捷额外+3"
	HopeJob_SkillCount[16] = 2
	HopeJob_DetailText[256] = "|cffd2b879机枪连射|r|n开枪攻击敌人|n基础伤害值：攻击力*0.8|n浮动数值30%~200%|n|c00fffc01行动点消耗:1|r|n该次攻击可以造成3次伤害"
	HopeJob_DetailText[257] = "|cffd2b879乱射|r|n对最多3个敌人发动攻击，造成攻击力*（1+技能等级）的魔法伤害|n|c00fffc01行动点消耗:2|r|n每回合只能释放一次"
	HopeJob_PassiveCount[16] = 2
	HopeJob_DetailText[264] = "转职奖励：力量 +10，敏捷 +20。"
	HopeJob_DetailText[265] = "没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_Source[16] = 1211117619
	HopeJob_Target[16] = 1211117620
	HopeJob_Item[16] = 1227895633
	HopeJob_Stage[16] = 2
	HopeJob_Level[16] = 15
	HopeJob_Str[16] = 0
	HopeJob_Agi[16] = 30
	HopeJob_Int[16] = 0
	HopeJob_Name[16] = "机枪兵"
	HopeJob_Role[16] = "敏捷远程 · 三段连射 · 群体乱射"
	HopeJob_Skills[16] = "|cffd2b879机枪连射|r|n开枪攻击敌人|n基础伤害值：攻击力*0.8|n浮动数值30%~200%|n|c00fffc01行动点消耗:1|r|n该次攻击可以造成3次伤害|n|n|cffd2b879乱射|r|n对最多3个敌人发动攻击，造成攻击力*（1+技能等级）的魔法伤害|n|c00fffc01行动点消耗:2|r|n每回合只能释放一次"
	HopeJob_Passive[16] = "转职奖励：力量 +10，敏捷 +20。|n|n没有独立修炼被动；本职优势来自上方战斗技能。"
	HopeJob_SkillCount[17] = 2
	HopeJob_DetailText[272] = "|cffd2b879狙击|r|n狙击敌人，造成巨量伤害|n基础伤害值：攻击力*3  |n浮动数值125%~200%  （命中率：70%）|n|c00fffc01行动点消耗:1|r|n每次子弹用完后都需要装弹才可以攻击（子弹用完时使用该技能装弹）|n初始子弹数：1"
	HopeJob_DetailText[273] = "|cffd2b879爆头|r|n英雄下一次造成伤害必定暴击|n|c00fffc01行动点消耗:1|r|n每回合只能释放一次"
	HopeJob_PassiveCount[17] = 2
	HopeJob_DetailText[280] = "转职奖励：力量 +10，敏捷 +20。"
	HopeJob_DetailText[281] = "|cffd2b879连狙改造|r|n每级增加子弹数1点 攻击力10点"
	HopeJob_Source[17] = 1211117619
	HopeJob_Target[17] = 1211117637
	HopeJob_Item[17] = 1227895893
	HopeJob_Stage[17] = 2
	HopeJob_Level[17] = 15
	HopeJob_Str[17] = 0
	HopeJob_Agi[17] = 25
	HopeJob_Int[17] = 0
	HopeJob_Name[17] = "矮人狙击手"
	HopeJob_Role[17] = "敏捷狙击 · 必暴爆头 · 弹匣管理"
	HopeJob_Skills[17] = "|cffd2b879狙击|r|n狙击敌人，造成巨量伤害|n基础伤害值：攻击力*3  |n浮动数值125%~200%  （命中率：70%）|n|c00fffc01行动点消耗:1|r|n每次子弹用完后都需要装弹才可以攻击（子弹用完时使用该技能装弹）|n初始子弹数：1|n|n|cffd2b879爆头|r|n英雄下一次造成伤害必定暴击|n|c00fffc01行动点消耗:1|r|n每回合只能释放一次"
	HopeJob_Passive[17] = "转职奖励：力量 +10，敏捷 +20。|n|n|cffd2b879连狙改造|r|n每级增加子弹数1点 攻击力10点"
	HopeJob_SkillCount[18] = 2
	HopeJob_DetailText[288] = "|cffd2b879火球|r|n发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术"
	HopeJob_DetailText[289] = "|cffd2b879暴风雪|r|n冰片攻击，对目标区域内的单位造成智力*(2+1*技能等级)的法术伤害|n|c00fffc01行动点消耗:2|r"
	HopeJob_PassiveCount[18] = 2
	HopeJob_DetailText[296] = "转职奖励：技能伤害 +30%。"
	HopeJob_DetailText[297] = "|cffd2b879法师修炼|r|n每级增加英雄10%的法术伤害 和20%的暴风雪伤害|n5点智力"
	HopeJob_Source[18] = 1311780919
	HopeJob_Target[18] = 1311781174
	HopeJob_Item[18] = 1227895632
	HopeJob_Stage[18] = 2
	HopeJob_Level[18] = 15
	HopeJob_Str[18] = 0
	HopeJob_Agi[18] = 0
	HopeJob_Int[18] = 30
	HopeJob_Name[18] = "初级法师"
	HopeJob_Role[18] = "智力法系 · 暴风雪 · 法伤成长"
	HopeJob_Skills[18] = "|cffd2b879火球|r|n发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术|n|n|cffd2b879暴风雪|r|n冰片攻击，对目标区域内的单位造成智力*(2+1*技能等级)的法术伤害|n|c00fffc01行动点消耗:2|r"
	HopeJob_Passive[18] = "转职奖励：技能伤害 +30%。|n|n|cffd2b879法师修炼|r|n每级增加英雄10%的法术伤害 和20%的暴风雪伤害|n5点智力"
	HopeJob_SkillCount[19] = 2
	HopeJob_DetailText[304] = "|cffd2b879火球|r|n发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术"
	HopeJob_DetailText[305] = "|cffd2b879炎爆术|r|n发射一发巨大的火球攻击敌人|n对目标敌人造成智力*3倍的伤害，并且对300范围内敌人造成一半伤害|n|c00fffc01行动点消耗:3|r|n造成法术伤害 （该法术可以暴击）|n每回合限用一次"
	HopeJob_PassiveCount[19] = 2
	HopeJob_DetailText[312] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[313] = "|cffd2b879火法修炼|r|n每级增加英雄10%的火球伤害|n每级增加英雄5%的暴击率"
	HopeJob_Source[19] = 1311780919
	HopeJob_Target[19] = 1311781189
	HopeJob_Item[19] = 1227895895
	HopeJob_Stage[19] = 2
	HopeJob_Level[19] = 15
	HopeJob_Str[19] = 0
	HopeJob_Agi[19] = 0
	HopeJob_Int[19] = 30
	HopeJob_Name[19] = "初级火焰法师"
	HopeJob_Role[19] = "智力法系 · 炎爆范围伤害 · 火球暴击"
	HopeJob_Skills[19] = "|cffd2b879火球|r|n发射火球攻击敌人|n基础伤害值：攻击力*0.5+智力*1|n浮动数值75%~120%|n|c00fffc01行动点消耗:1|r|n该攻击属于法术|n|n|cffd2b879炎爆术|r|n发射一发巨大的火球攻击敌人|n对目标敌人造成智力*3倍的伤害，并且对300范围内敌人造成一半伤害|n|c00fffc01行动点消耗:3|r|n造成法术伤害 （该法术可以暴击）|n每回合限用一次"
	HopeJob_Passive[19] = "转职奖励：行动点上限 +1。|n|n|cffd2b879火法修炼|r|n每级增加英雄10%的火球伤害|n每级增加英雄5%的暴击率"
	HopeJob_SkillCount[20] = 1
	HopeJob_DetailText[320] = "|cffd2b879投矛|r|n丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+力量*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	HopeJob_PassiveCount[20] = 3
	HopeJob_DetailText[328] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[329] = "|cffd2b879毒矛|r|n投矛命中时，为目标叠加自己来源的2层毒；已有30层或以上时改为1层。|n敌方回合结算：当前攻击力×30%×毒层数×毒矛等级。|n这是结算前基值；最终伤害、暴击和目标减伤按战斗规则另算。|n结算后毒层数减少1；不同玩家的毒独立计算。"
	HopeJob_DetailText[330] = "|cffd2b879巨魔天赋|r|n每回合开始时，如果英雄血量低于50%，则增加英雄50%敏捷值的防御|n战斗结束后恢复5%的生命最大值 敏捷永久+1"
	HopeJob_Source[20] = 1328558131
	HopeJob_Target[20] = 1328558132
	HopeJob_Item[20] = 1227895635
	HopeJob_Stage[20] = 2
	HopeJob_Level[20] = 15
	HopeJob_Str[20] = 20
	HopeJob_Agi[20] = 0
	HopeJob_Int[20] = 0
	HopeJob_Name[20] = "巨魔狂战士"
	HopeJob_Role[20] = "力量毒矛 · 低血防御 · 战后成长"
	HopeJob_Skills[20] = "|cffd2b879投矛|r|n丢出一支长矛攻击敌人|n基础伤害值：攻击力*0.8+力量*0.8|n浮动数值80%~100%|n|c00fffc01行动点消耗:1|r"
	HopeJob_Passive[20] = "转职奖励：行动点上限 +1。|n|n|cffd2b879毒矛|r|n投矛命中时，为目标叠加自己来源的2层毒；已有30层或以上时改为1层。|n敌方回合结算：当前攻击力×30%×毒层数×毒矛等级。|n这是结算前基值；最终伤害、暴击和目标减伤按战斗规则另算。|n结算后毒层数减少1；不同玩家的毒独立计算。|n|n|cffd2b879巨魔天赋|r|n每回合开始时，如果英雄血量低于50%，则增加英雄50%敏捷值的防御|n战斗结束后恢复5%的生命最大值 敏捷永久+1"
	HopeJob_SkillCount[21] = 2
	HopeJob_DetailText[336] = "|cffd2b879连斩|r|n攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）"
	HopeJob_DetailText[337] = "|cffd2b879乱斩|r|n连续打击目标敌人5次|n每次攻击造成物理伤害，同时英雄暴击率+10%，打击结束暴击率加成归0|n每次打击伤害值:(攻击力+敏捷)*0.55|n|c00fffc01行动点消耗:2|r|n每回合最多使用一次|n每点敏捷增加该伤害0.5%"
	HopeJob_PassiveCount[21] = 2
	HopeJob_DetailText[344] = "转职奖励：行动点上限 +1。"
	HopeJob_DetailText[345] = "|cffd2b879巨魔天赋|r|n每回合开始时，如果英雄血量低于50%，则增加英雄50%敏捷值的防御|n战斗结束后恢复5%的生命最大值 敏捷永久+1"
	HopeJob_Source[21] = 1328558131
	HopeJob_Target[21] = 1328558134
	HopeJob_Item[21] = 1227896116
	HopeJob_Stage[21] = 2
	HopeJob_Level[21] = 15
	HopeJob_Str[21] = 20
	HopeJob_Agi[21] = 20
	HopeJob_Int[21] = 0
	HopeJob_Name[21] = "巨魔战将"
	HopeJob_Role[21] = "力敏连击 · 五连斩 · 持续成长"
	HopeJob_Skills[21] = "|cffd2b879连斩|r|n攻击敌人|n基础伤害值：攻击力*1|n基础浮动90%~120%；另计敏捷下限与力量上限|n|c00fffc01行动点消耗:1|r|n追加段结算时英雄魔法值大于0.8时，会消耗1点魔法值|n追加一次伤害，伤害值为敏捷×（1+连斩修炼等级×20%）|n|n|cffd2b879乱斩|r|n连续打击目标敌人5次|n每次攻击造成物理伤害，同时英雄暴击率+10%，打击结束暴击率加成归0|n每次打击伤害值:(攻击力+敏捷)*0.55|n|c00fffc01行动点消耗:2|r|n每回合最多使用一次|n每点敏捷增加该伤害0.5%"
	HopeJob_Passive[21] = "转职奖励：行动点上限 +1。|n|n|cffd2b879巨魔天赋|r|n每回合开始时，如果英雄血量低于50%，则增加英雄50%敏捷值的防御|n战斗结束后恢复5%的生命最大值 敏捷永久+1"
	HopeJob_SkillCount[22] = 2
	HopeJob_DetailText[352] = "|cffd2b879重砍|r|n重砍敌人|n基础伤害值：攻击力*1+力量*0.5|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r"
	HopeJob_DetailText[353] = "|cffd2b879狂暴力量|r|n力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	HopeJob_PassiveCount[22] = 2
	HopeJob_DetailText[360] = "转职奖励：暴击伤害 +50%。"
	HopeJob_DetailText[361] = "|cffd2b879蓄力重砍|r|n每级增加重砍15%的伤害|n每重砍20次，英雄力量永久+1"
	HopeJob_Source[22] = 1328558129
	HopeJob_Target[22] = 1311781185
	HopeJob_Item[22] = 1227895636
	HopeJob_Stage[22] = 2
	HopeJob_Level[22] = 15
	HopeJob_Str[22] = 30
	HopeJob_Agi[22] = 0
	HopeJob_Int[22] = 0
	HopeJob_Name[22] = "兽族狂暴步兵"
	HopeJob_Role[22] = "力量爆发 · 重砍修炼 · 狂暴换伤"
	HopeJob_Skills[22] = "|cffd2b879重砍|r|n重砍敌人|n基础伤害值：攻击力*1+力量*0.5|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r|n|n|cffd2b879狂暴力量|r|n力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	HopeJob_Passive[22] = "转职奖励：暴击伤害 +50%。|n|n|cffd2b879蓄力重砍|r|n每级增加重砍15%的伤害|n每重砍20次，英雄力量永久+1"
	HopeJob_SkillCount[23] = 2
	HopeJob_DetailText[368] = "|cffd2b879狼骑重砍|r|n重砍敌人|n基础伤害值：攻击力*1.2+力量*1|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r"
	HopeJob_DetailText[369] = "|cffd2b879狂暴力量|r|n力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	HopeJob_PassiveCount[23] = 2
	HopeJob_DetailText[376] = "转职奖励：暴击伤害 +50%。"
	HopeJob_DetailText[377] = "|cffd2b879掠夺|r|n学习后英雄对敌人造成伤害能获得金钱|n获得量为伤害值的1%（每次上限为10*技能等级）|n每级增加英雄5点力量和5点敏捷"
	HopeJob_Source[23] = 1328558129
	HopeJob_Target[23] = 1328558133
	HopeJob_Item[23] = 1227896115
	HopeJob_Stage[23] = 2
	HopeJob_Level[23] = 15
	HopeJob_Str[23] = 30
	HopeJob_Agi[23] = 0
	HopeJob_Int[23] = 0
	HopeJob_Name[23] = "狼骑兵"
	HopeJob_Role[23] = "力敏近战 · 狼骑重砍 · 掠夺经济"
	HopeJob_Skills[23] = "|cffd2b879狼骑重砍|r|n重砍敌人|n基础伤害值：攻击力*1.2+力量*1|n浮动数值50%~150%|n|c00fffc01行动点消耗:1|r|n|n|cffd2b879狂暴力量|r|n力量增加20%*技能等级 持续15秒|n护甲减少10点，持续1回合|n每回合限用一次"
	HopeJob_Passive[23] = "转职奖励：暴击伤害 +50%。|n|n|cffd2b879掠夺|r|n学习后英雄对敌人造成伤害能获得金钱|n获得量为伤害值的1%（每次上限为10*技能等级）|n每级增加英雄5点力量和5点敏捷"
	HopeJob_SkillCount[24] = 3
	HopeJob_DetailText[384] = "抽取范围：8种普通一转职业等概率；隐藏职业总概率10%。|n首次抽取免费；一转期间可花10存档积分重新转职。|n隐藏一转「万象行者」拥有以下技能："
	HopeJob_DetailText[385] = "|cffd2b879三相打击（Q）|r|n消耗1行动点，0魔法。|n单体物理伤害基值：攻击力*0.60 + 三围总和*0.45。|n三围=当前力量+敏捷+智力。|n技能、最终倍率、暴击与减伤按原图规则结算。"
	HopeJob_DetailText[386] = "|cffd2b879三相回元（D）|r|n恢复自身15+三围总和*0.5点生命，最多为生命上限的30%，不超过缺失生命。|n消耗1行动点、2魔法；战斗中每回合一次。|n满血时不消耗资源和使用次数。"
	HopeJob_PassiveCount[24] = 2
	HopeJob_DetailText[392] = "隐藏天赋「均衡修炼」：每级力量、敏捷、智力成长各 +0.15。"
	HopeJob_DetailText[393] = "可学习「三相修炼」：每级基础三围各 +2，最多3级。|n一转不附送行动点；回元需要行动点和魔法，兼顾输出与续航。|n未抽中隐藏职业时，隐藏进阶不会出现在二转、三转面板。"
	HopeJob_Source[24] = 1211117616
	HopeJob_Target[24] = 1211117616
	HopeJob_Item[24] = 0
	HopeJob_Stage[24] = 1
	HopeJob_Level[24] = 5
	HopeJob_Str[24] = 10
	HopeJob_Agi[24] = 10
	HopeJob_Int[24] = 10
	HopeJob_Name[24] = "随机转职"
	HopeJob_Role[24] = "全属性门槛 · 90% 普通职业 / 10% 隐藏职业"
	HopeJob_Skills[24] = "抽取范围：8种普通一转职业等概率；隐藏职业总概率10%。|n首次抽取免费；一转期间可花10存档积分重新转职。|n隐藏一转「万象行者」拥有以下技能：|n|n|cffd2b879三相打击（Q）|r|n消耗1行动点，0魔法。|n单体物理伤害基值：攻击力*0.60 + 三围总和*0.45。|n三围=当前力量+敏捷+智力。|n技能、最终倍率、暴击与减伤按原图规则结算。|n|n|cffd2b879三相回元（D）|r|n恢复自身15+三围总和*0.5点生命，最多为生命上限的30%，不超过缺失生命。|n消耗1行动点、2魔法；战斗中每回合一次。|n满血时不消耗资源和使用次数。"
	HopeJob_Passive[24] = "隐藏天赋「均衡修炼」：每级力量、敏捷、智力成长各 +0.15。|n|n可学习「三相修炼」：每级基础三围各 +2，最多3级。|n一转不附送行动点；回元需要行动点和魔法，兼顾输出与续航。|n未抽中隐藏职业时，隐藏进阶不会出现在二转、三转面板。"
	HopeJob_SkillCount[25] = 3
	HopeJob_DetailText[400] = "|cffd2b879三相打击（Q）|r|n消耗1行动点，0魔法。|n单体物理伤害基值：攻击力*0.65 + 三围总和*0.65。|n三围=当前力量+敏捷+智力。|n技能、最终倍率、暴击与减伤按原图规则结算。"
	HopeJob_DetailText[401] = "|cffd2b879三相回元（D）|r|n恢复自身15+三围总和*0.5点生命，最多为生命上限的30%，不超过缺失生命。|n消耗1行动点、2魔法；战斗中每回合一次。|n满血时不消耗资源和使用次数。"
	HopeJob_DetailText[402] = "|cffd2b879万象汲取（V）|r|n对当前敌人造成三围总和*1.75的法术伤害。|n按目标实际损失生命的25%恢复自身，最多恢复自身生命上限的15%。|n消耗2行动点、3魔法；战斗中每回合一次。|n技能、法伤、最终倍率、暴击与减伤按原图规则结算。"
	HopeJob_PassiveCount[25] = 1
	HopeJob_DetailText[408] = "|cffd2b879三相融汇|r|n力量、敏捷、智力各 +3；行动点上限 +1。|n保留一转均衡修炼与三相修炼等级，不再次叠加成长或已学属性。"
	HopeJob_Source[25] = 1213870129
	HopeJob_Target[25] = 1213870130
	HopeJob_Item[25] = 0
	HopeJob_Stage[25] = 2
	HopeJob_Level[25] = 15
	HopeJob_Str[25] = 20
	HopeJob_Agi[25] = 20
	HopeJob_Int[25] = 20
	HopeJob_Name[25] = "万象织法者"
	HopeJob_Role[25] = "隐藏二转 · 全属性输出 · 均衡积累"
	HopeJob_Skills[25] = "|cffd2b879三相打击（Q）|r|n消耗1行动点，0魔法。|n单体物理伤害基值：攻击力*0.65 + 三围总和*0.65。|n三围=当前力量+敏捷+智力。|n技能、最终倍率、暴击与减伤按原图规则结算。|n|n|cffd2b879三相回元（D）|r|n恢复自身15+三围总和*0.5点生命，最多为生命上限的30%，不超过缺失生命。|n消耗1行动点、2魔法；战斗中每回合一次。|n满血时不消耗资源和使用次数。|n|n|cffd2b879万象汲取（V）|r|n对当前敌人造成三围总和*1.75的法术伤害。|n按目标实际损失生命的25%恢复自身，最多恢复自身生命上限的15%。|n消耗2行动点、3魔法；战斗中每回合一次。|n技能、法伤、最终倍率、暴击与减伤按原图规则结算。"
	HopeJob_Passive[25] = "|cffd2b879三相融汇|r|n力量、敏捷、智力各 +3；行动点上限 +1。|n保留一转均衡修炼与三相修炼等级，不再次叠加成长或已学属性。"
	HopeJob_SkillCount[26] = 2
	HopeJob_DetailText[416] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[417] = "|cffd2b879万象三律（可升级被动）|r|n同一回合成功使用三相打击Q、三相回元D、万象汲取V中任意两种后，返还1行动点并恢复三围总和×10%/15%/20%的生命。|n技能顺序不限，同一种技能不会重复计数；每回合只触发一次。|n满血无法施放回元时不计数；恢复不超过生命上限。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[26] = 2
	HopeJob_DetailText[424] = "三转专属奖励：力量 +5，敏捷 +5，智力 +5，技能伤害 +15%。"
	HopeJob_DetailText[425] = "觉醒被动：万象三律。|n同一回合成功使用三相打击Q、三相回元D、万象汲取V中任意两种后，返还1行动点并恢复三围总和×10%/15%/20%的生命。|n技能顺序不限，同一种技能不会重复计数；每回合只触发一次。|n满血无法施放回元时不计数；恢复不超过生命上限。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[26] = 1213870130
	HopeJob_Target[26] = 1213870131
	HopeJob_Item[26] = 0
	HopeJob_Stage[26] = 3
	HopeJob_Level[26] = 0
	HopeJob_Str[26] = 0
	HopeJob_Agi[26] = 0
	HopeJob_Int[26] = 0
	HopeJob_Name[26] = "万象天枢"
	HopeJob_Role[26] = "全属性轮转 · 三式贯通"
	HopeJob_Skills[26] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879万象三律（可升级被动）|r|n同一回合成功使用三相打击Q、三相回元D、万象汲取V中任意两种后，返还1行动点并恢复三围总和×10%/15%/20%的生命。|n技能顺序不限，同一种技能不会重复计数；每回合只触发一次。|n满血无法施放回元时不计数；恢复不超过生命上限。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[26] = "三转专属奖励：力量 +5，敏捷 +5，智力 +5，技能伤害 +15%。|n|n觉醒被动：万象三律。|n同一回合成功使用三相打击Q、三相回元D、万象汲取V中任意两种后，返还1行动点并恢复三围总和×10%/15%/20%的生命。|n技能顺序不限，同一种技能不会重复计数；每回合只触发一次。|n满血无法施放回元时不计数；恢复不超过生命上限。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[27] = 2
	HopeJob_DetailText[432] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[433] = "|cffd2b879铁壁反攻（可升级被动）|r|n使用盾防嘲讽，额外获得力量×50%/75%/100%的护甲。|n剑盾猛攻的基础伤害额外加上当前护甲×50%/75%/100%。|n鼓励先护队蓄甲，再用盾击进攻；不额外消耗行动点。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[27] = 2
	HopeJob_DetailText[440] = "三转专属奖励：力量 +10，生命上限 +100，防御动作额外护甲 +8。"
	HopeJob_DetailText[441] = "觉醒被动：铁壁反攻。|n使用盾防嘲讽，额外获得力量×50%/75%/100%的护甲。|n剑盾猛攻的基础伤害额外加上当前护甲×50%/75%/100%。|n鼓励先护队蓄甲，再用盾击进攻；不额外消耗行动点。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[27] = 1211117624
	HopeJob_Target[27] = 1211117624
	HopeJob_Item[27] = 0
	HopeJob_Stage[27] = 3
	HopeJob_Level[27] = 0
	HopeJob_Str[27] = 0
	HopeJob_Agi[27] = 0
	HopeJob_Int[27] = 0
	HopeJob_Name[27] = "钢铁统帅"
	HopeJob_Role[27] = "盾防蓄甲 · 护甲转盾击"
	HopeJob_Skills[27] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879铁壁反攻（可升级被动）|r|n使用盾防嘲讽，额外获得力量×50%/75%/100%的护甲。|n剑盾猛攻的基础伤害额外加上当前护甲×50%/75%/100%。|n鼓励先护队蓄甲，再用盾击进攻；不额外消耗行动点。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[27] = "三转专属奖励：力量 +10，生命上限 +100，防御动作额外护甲 +8。|n|n觉醒被动：铁壁反攻。|n使用盾防嘲讽，额外获得力量×50%/75%/100%的护甲。|n剑盾猛攻的基础伤害额外加上当前护甲×50%/75%/100%。|n鼓励先护队蓄甲，再用盾击进攻；不额外消耗行动点。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[28] = 2
	HopeJob_DetailText[448] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[449] = "|cffd2b879骑势蓄锋（可升级被动）|r|n每次成功使用骑兵冲锋后蓄势，下一次平砍基础伤害提高50%/75%/100%。|n蓄势不叠加，发动下一次平砍时消耗；原冲锋速度加成继续生效。|n每场战斗开始清除蓄势。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[28] = 2
	HopeJob_DetailText[456] = "三转专属奖励：力量 +8，敏捷 +8，行动点上限 +1。"
	HopeJob_DetailText[457] = "觉醒被动：骑势蓄锋。|n每次成功使用骑兵冲锋后蓄势，下一次平砍基础伤害提高50%/75%/100%。|n蓄势不叠加，发动下一次平砍时消耗；原冲锋速度加成继续生效。|n每场战斗开始清除蓄势。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[28] = 1211117636
	HopeJob_Target[28] = 1211117636
	HopeJob_Item[28] = 0
	HopeJob_Stage[28] = 3
	HopeJob_Level[28] = 0
	HopeJob_Str[28] = 0
	HopeJob_Agi[28] = 0
	HopeJob_Int[28] = 0
	HopeJob_Name[28] = "圣锋骑士"
	HopeJob_Role[28] = "冲锋蓄势 · 接续重击"
	HopeJob_Skills[28] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879骑势蓄锋（可升级被动）|r|n每次成功使用骑兵冲锋后蓄势，下一次平砍基础伤害提高50%/75%/100%。|n蓄势不叠加，发动下一次平砍时消耗；原冲锋速度加成继续生效。|n每场战斗开始清除蓄势。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[28] = "三转专属奖励：力量 +8，敏捷 +8，行动点上限 +1。|n|n觉醒被动：骑势蓄锋。|n每次成功使用骑兵冲锋后蓄势，下一次平砍基础伤害提高50%/75%/100%。|n蓄势不叠加，发动下一次平砍时消耗；原冲锋速度加成继续生效。|n每场战斗开始清除蓄势。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[29] = 2
	HopeJob_DetailText[464] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[465] = "|cffd2b879圣域回响（Z）|r|n全体存活队友恢复自身生命上限25%+施法者智力×1.5。|n溢出治疗的50%转为护甲，每人最多获得施法者智力×80%护甲。|n每位队友实际恢复2点魔法，不超过上限。|n消耗2行动点、3魔法；战斗中每回合一次。"
	HopeJob_PassiveCount[29] = 2
	HopeJob_DetailText[472] = "三转专属奖励：智力 +12，魔法上限 +8，每回合回蓝 +2。"
	HopeJob_DetailText[473] = "专属主动：圣域回响，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[29] = 1311781175
	HopeJob_Target[29] = 1311781175
	HopeJob_Item[29] = 0
	HopeJob_Stage[29] = 3
	HopeJob_Level[29] = 0
	HopeJob_Str[29] = 0
	HopeJob_Agi[29] = 0
	HopeJob_Int[29] = 0
	HopeJob_Name[29] = "圣光主教"
	HopeJob_Role[29] = "群体救治 · 溢疗护甲 · 魔力支援"
	HopeJob_Skills[29] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879圣域回响（Z）|r|n全体存活队友恢复自身生命上限25%+施法者智力×1.5。|n溢出治疗的50%转为护甲，每人最多获得施法者智力×80%护甲。|n每位队友实际恢复2点魔法，不超过上限。|n消耗2行动点、3魔法；战斗中每回合一次。"
	HopeJob_Passive[29] = "三转专属奖励：智力 +12，魔法上限 +8，每回合回蓝 +2。|n|n专属主动：圣域回响，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[30] = 2
	HopeJob_DetailText[480] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[481] = "|cffd2b879万法归一（Z）|r|n对当前全体敌人造成三围总和×1.1的法术伤害。|n全体存活队友恢复三围总和×0.25生命，并获得三围总和×0.10护甲。|n自身气补至3层，可继续用渡厄击救助或护心诀护队。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_PassiveCount[30] = 2
	HopeJob_DetailText[488] = "三转专属奖励：力量 +8，敏捷 +8，智力 +8，防御动作额外护甲 +6，生命上限 +60。"
	HopeJob_DetailText[489] = "专属主动：万法归一，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[30] = 1311781191
	HopeJob_Target[30] = 1311781191
	HopeJob_Item[30] = 0
	HopeJob_Stage[30] = 3
	HopeJob_Level[30] = 0
	HopeJob_Str[30] = 0
	HopeJob_Agi[30] = 0
	HopeJob_Int[30] = 0
	HopeJob_Name[30] = "金刚禅师"
	HopeJob_Role[30] = "全属性战辅 · 全队护持 · 补满气"
	HopeJob_Skills[30] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879万法归一（Z）|r|n对当前全体敌人造成三围总和×1.1的法术伤害。|n全体存活队友恢复三围总和×0.25生命，并获得三围总和×0.10护甲。|n自身气补至3层，可继续用渡厄击救助或护心诀护队。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_Passive[30] = "三转专属奖励：力量 +8，敏捷 +8，智力 +8，防御动作额外护甲 +6，生命上限 +60。|n|n专属主动：万法归一，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[31] = 2
	HopeJob_DetailText[496] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[497] = "|cffd2b879影舞续刃（可升级被动）|r|n每回合成功使用连斩累计3/2/2次时，返还1行动点；每回合只返还一次。|n3级同时恢复2点魔法，不超过上限，为连斩追加段续航。|n只统计消耗了行动点的连斩，潜袭多段不会重复触发。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[31] = 2
	HopeJob_DetailText[504] = "三转专属奖励：敏捷 +12，行动点上限 +1，暴击伤害 +25%。"
	HopeJob_DetailText[505] = "觉醒被动：影舞续刃。|n每回合成功使用连斩累计3/2/2次时，返还1行动点；每回合只返还一次。|n3级同时恢复2点魔法，不超过上限，为连斩追加段续航。|n只统计消耗了行动点的连斩，潜袭多段不会重复触发。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[31] = 1311781176
	HopeJob_Target[31] = 1311781176
	HopeJob_Item[31] = 0
	HopeJob_Stage[31] = 3
	HopeJob_Level[31] = 0
	HopeJob_Str[31] = 0
	HopeJob_Agi[31] = 0
	HopeJob_Int[31] = 0
	HopeJob_Name[31] = "影刃宗师"
	HopeJob_Role[31] = "连斩续航 · 行动回收"
	HopeJob_Skills[31] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879影舞续刃（可升级被动）|r|n每回合成功使用连斩累计3/2/2次时，返还1行动点；每回合只返还一次。|n3级同时恢复2点魔法，不超过上限，为连斩追加段续航。|n只统计消耗了行动点的连斩，潜袭多段不会重复触发。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[31] = "三转专属奖励：敏捷 +12，行动点上限 +1，暴击伤害 +25%。|n|n觉醒被动：影舞续刃。|n每回合成功使用连斩累计3/2/2次时，返还1行动点；每回合只返还一次。|n3级同时恢复2点魔法，不超过上限，为连斩追加段续航。|n只统计消耗了行动点的连斩，潜袭多段不会重复触发。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[32] = 2
	HopeJob_DetailText[512] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[513] = "|cffd2b879破绽处决（Z）|r|n选择一名当前敌人，造成（力量+敏捷）×4的物理伤害。|n目标当前生命不高于40%时，伤害提高50%。|n本次击杀目标后返还1行动点，不超过行动点上限。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_PassiveCount[32] = 2
	HopeJob_DetailText[520] = "三转专属奖励：敏捷 +10，行动点上限 +1，专注上限 +3，精确打击加成 +20%。"
	HopeJob_DetailText[521] = "专属主动：破绽处决，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[32] = 1311781190
	HopeJob_Target[32] = 1311781190
	HopeJob_Item[32] = 0
	HopeJob_Stage[32] = 3
	HopeJob_Level[32] = 0
	HopeJob_Str[32] = 0
	HopeJob_Agi[32] = 0
	HopeJob_Int[32] = 0
	HopeJob_Name[32] = "幻影刺皇"
	HopeJob_Role[32] = "单点斩杀 · 击杀回点 · 精准投掷"
	HopeJob_Skills[32] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879破绽处决（Z）|r|n选择一名当前敌人，造成（力量+敏捷）×4的物理伤害。|n目标当前生命不高于40%时，伤害提高50%。|n本次击杀目标后返还1行动点，不超过行动点上限。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_Passive[32] = "三转专属奖励：敏捷 +10，行动点上限 +1，专注上限 +3，精确打击加成 +20%。|n|n专属主动：破绽处决，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[33] = 2
	HopeJob_DetailText[528] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[529] = "|cffd2b879游击齐射（可升级被动）|r|n成功使用射箭时，向主目标以外最多1/2/2名当前敌人各追加一支副箭。|n每支副箭基础伤害=敏捷×1.2/1.2/1.6，属于物理技能伤害。|n副箭不触发更多副箭，原弩手多目标效果保留。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[33] = 2
	HopeJob_DetailText[536] = "三转专属奖励：敏捷 +14，行动点上限 +1，专注上限 +2。"
	HopeJob_DetailText[537] = "觉醒被动：游击齐射。|n成功使用射箭时，向主目标以外最多1/2/2名当前敌人各追加一支副箭。|n每支副箭基础伤害=敏捷×1.2/1.2/1.6，属于物理技能伤害。|n副箭不触发更多副箭，原弩手多目标效果保留。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[33] = 1160786003
	HopeJob_Target[33] = 1160786003
	HopeJob_Item[33] = 0
	HopeJob_Stage[33] = 3
	HopeJob_Level[33] = 0
	HopeJob_Str[33] = 0
	HopeJob_Agi[33] = 0
	HopeJob_Int[33] = 0
	HopeJob_Name[33] = "风暴箭圣"
	HopeJob_Role[33] = "多目标箭雨 · 副箭追击"
	HopeJob_Skills[33] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879游击齐射（可升级被动）|r|n成功使用射箭时，向主目标以外最多1/2/2名当前敌人各追加一支副箭。|n每支副箭基础伤害=敏捷×1.2/1.2/1.6，属于物理技能伤害。|n副箭不触发更多副箭，原弩手多目标效果保留。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[33] = "三转专属奖励：敏捷 +14，行动点上限 +1，专注上限 +2。|n|n觉醒被动：游击齐射。|n成功使用射箭时，向主目标以外最多1/2/2名当前敌人各追加一支副箭。|n每支副箭基础伤害=敏捷×1.2/1.2/1.6，属于物理技能伤害。|n副箭不触发更多副箭，原弩手多目标效果保留。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[34] = 2
	HopeJob_DetailText[544] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[545] = "|cffd2b879贯城重弩（Z）|r|n以所选敌人为方向，射出长2000、宽240的贯穿重弩。|n主目标基础物理伤害=攻击力×4+力量×2；射线内其他敌人各受主伤害的70%。|n只打击当前敌人，每个敌人仅命中一次，不命中射线外或身后的敌人。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_PassiveCount[34] = 2
	HopeJob_DetailText[552] = "三转专属奖励：力量 +12，敏捷 +10，最终伤害 +10%。"
	HopeJob_DetailText[553] = "专属主动：贯城重弩，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[34] = 1160786224
	HopeJob_Target[34] = 1160786224
	HopeJob_Item[34] = 0
	HopeJob_Stage[34] = 3
	HopeJob_Level[34] = 0
	HopeJob_Str[34] = 0
	HopeJob_Agi[34] = 0
	HopeJob_Int[34] = 0
	HopeJob_Name[34] = "破城弩王"
	HopeJob_Role[34] = "直线贯穿 · 主箭重创 · 站位取舍"
	HopeJob_Skills[34] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879贯城重弩（Z）|r|n以所选敌人为方向，射出长2000、宽240的贯穿重弩。|n主目标基础物理伤害=攻击力×4+力量×2；射线内其他敌人各受主伤害的70%。|n只打击当前敌人，每个敌人仅命中一次，不命中射线外或身后的敌人。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_Passive[34] = "三转专属奖励：力量 +12，敏捷 +10，最终伤害 +10%。|n|n专属主动：贯城重弩，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[35] = 2
	HopeJob_DetailText[560] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[561] = "|cffd2b879持续压制（可升级被动）|r|n同一回合连续对同一个当前敌人造成伤害时，从第二次起逐次增加8%/12%/16%伤害，最多叠3层。|n更换目标或进入新回合后重新累计；三段连射可逐段叠加。|n伤害未生效不叠层，额外段不生成新的攻击。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[35] = 2
	HopeJob_DetailText[568] = "三转专属奖励：敏捷 +10，行动点上限 +1，技能伤害 +15%。"
	HopeJob_DetailText[569] = "觉醒被动：持续压制。|n同一回合连续对同一个当前敌人造成伤害时，从第二次起逐次增加8%/12%/16%伤害，最多叠3层。|n更换目标或进入新回合后重新累计；三段连射可逐段叠加。|n伤害未生效不叠层，额外段不生成新的攻击。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[35] = 1211117620
	HopeJob_Target[35] = 1211117620
	HopeJob_Item[35] = 0
	HopeJob_Stage[35] = 3
	HopeJob_Level[35] = 0
	HopeJob_Str[35] = 0
	HopeJob_Agi[35] = 0
	HopeJob_Int[35] = 0
	HopeJob_Name[35] = "弹幕指挥官"
	HopeJob_Role[35] = "三段连射 · 连续命中递增"
	HopeJob_Skills[35] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879持续压制（可升级被动）|r|n同一回合连续对同一个当前敌人造成伤害时，从第二次起逐次增加8%/12%/16%伤害，最多叠3层。|n更换目标或进入新回合后重新累计；三段连射可逐段叠加。|n伤害未生效不叠层，额外段不生成新的攻击。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[35] = "三转专属奖励：敏捷 +10，行动点上限 +1，技能伤害 +15%。|n|n觉醒被动：持续压制。|n同一回合连续对同一个当前敌人造成伤害时，从第二次起逐次增加8%/12%/16%伤害，最多叠3层。|n更换目标或进入新回合后重新累计；三段连射可逐段叠加。|n伤害未生效不叠层，额外段不生成新的攻击。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[36] = 2
	HopeJob_DetailText[576] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[577] = "|cffd2b879绝命狙击（Z）|r|n消耗1发现有子弹，对一名当前敌人造成攻击力×5+敏捷×3的物理伤害。|n没有普通狙击的30%落空；不附带群伤。|n已有精确打击时消耗它并乘以精确打击倍率；爆头的必暴效果可正常作用于本次射击。|n空弹时不能施放，请用Q装填。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_PassiveCount[36] = 2
	HopeJob_DetailText[584] = "三转专属奖励：敏捷 +16，精确打击加成 +30%，暴击伤害 +25%。"
	HopeJob_DetailText[585] = "专属主动：绝命狙击，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[36] = 1211117637
	HopeJob_Target[36] = 1211117637
	HopeJob_Item[36] = 0
	HopeJob_Stage[36] = 3
	HopeJob_Level[36] = 0
	HopeJob_Str[36] = 0
	HopeJob_Agi[36] = 0
	HopeJob_Int[36] = 0
	HopeJob_Name[36] = "鹰眼神射"
	HopeJob_Role[36] = "弹匣管理 · 必中重狙 · 单体爆发"
	HopeJob_Skills[36] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879绝命狙击（Z）|r|n消耗1发现有子弹，对一名当前敌人造成攻击力×5+敏捷×3的物理伤害。|n没有普通狙击的30%落空；不附带群伤。|n已有精确打击时消耗它并乘以精确打击倍率；爆头的必暴效果可正常作用于本次射击。|n空弹时不能施放，请用Q装填。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_Passive[36] = "三转专属奖励：敏捷 +16，精确打击加成 +30%，暴击伤害 +25%。|n|n专属主动：绝命狙击，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[37] = 2
	HopeJob_DetailText[592] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[593] = "|cffd2b879寒霜封界（Z）|r|n对所选敌人周围450范围内当前敌人造成智力×4的法术伤害，并施加冰封。|n每名被冰封敌人下一次对英雄造成的伤害降低50%，随后解除。|n冰封不叠加，重复施放只刷新；下一场战斗开始清除旧标记。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_PassiveCount[37] = 2
	HopeJob_DetailText[600] = "三转专属奖励：智力 +12，魔法上限 +12，每回合回蓝 +2，技能伤害 +15%。"
	HopeJob_DetailText[601] = "专属主动：寒霜封界，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[37] = 1311781174
	HopeJob_Target[37] = 1311781174
	HopeJob_Item[37] = 0
	HopeJob_Stage[37] = 3
	HopeJob_Level[37] = 0
	HopeJob_Str[37] = 0
	HopeJob_Agi[37] = 0
	HopeJob_Int[37] = 0
	HopeJob_Name[37] = "奥术贤者"
	HopeJob_Role[37] = "区域冰封 · 削弱敌人下一击"
	HopeJob_Skills[37] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879寒霜封界（Z）|r|n对所选敌人周围450范围内当前敌人造成智力×4的法术伤害，并施加冰封。|n每名被冰封敌人下一次对英雄造成的伤害降低50%，随后解除。|n冰封不叠加，重复施放只刷新；下一场战斗开始清除旧标记。|n消耗2行动点、3魔法；战斗中每回合一次。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_Passive[37] = "三转专属奖励：智力 +12，魔法上限 +12，每回合回蓝 +2，技能伤害 +15%。|n|n专属主动：寒霜封界，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[38] = 2
	HopeJob_DetailText[608] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[609] = "|cffd2b879余烬引爆（可升级被动）|r|n每次成功施放火球，为该目标叠加自己来源的1层火种，最多3层。|n炎爆术消耗主目标自己的全部火种，基础伤害每层额外增加智力×0.8/1.2/1.6。|n增强伤害沿用炎爆的主伤害和半伤范围规则；队友火种互不消耗。|n每场战斗开始清除旧火种。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[38] = 2
	HopeJob_DetailText[616] = "三转专属奖励：智力 +14，法术伤害 +20%，暴击率 +10%。"
	HopeJob_DetailText[617] = "觉醒被动：余烬引爆。|n每次成功施放火球，为该目标叠加自己来源的1层火种，最多3层。|n炎爆术消耗主目标自己的全部火种，基础伤害每层额外增加智力×0.8/1.2/1.6。|n增强伤害沿用炎爆的主伤害和半伤范围规则；队友火种互不消耗。|n每场战斗开始清除旧火种。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[38] = 1311781189
	HopeJob_Target[38] = 1311781189
	HopeJob_Item[38] = 0
	HopeJob_Stage[38] = 3
	HopeJob_Level[38] = 0
	HopeJob_Str[38] = 0
	HopeJob_Agi[38] = 0
	HopeJob_Int[38] = 0
	HopeJob_Name[38] = "炽焰领主"
	HopeJob_Role[38] = "火球蓄种 · 炎爆引燃"
	HopeJob_Skills[38] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879余烬引爆（可升级被动）|r|n每次成功施放火球，为该目标叠加自己来源的1层火种，最多3层。|n炎爆术消耗主目标自己的全部火种，基础伤害每层额外增加智力×0.8/1.2/1.6。|n增强伤害沿用炎爆的主伤害和半伤范围规则；队友火种互不消耗。|n每场战斗开始清除旧火种。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[38] = "三转专属奖励：智力 +14，法术伤害 +20%，暴击率 +10%。|n|n觉醒被动：余烬引爆。|n每次成功施放火球，为该目标叠加自己来源的1层火种，最多3层。|n炎爆术消耗主目标自己的全部火种，基础伤害每层额外增加智力×0.8/1.2/1.6。|n增强伤害沿用炎爆的主伤害和半伤范围规则；队友火种互不消耗。|n每场战斗开始清除旧火种。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[39] = 2
	HopeJob_DetailText[624] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[625] = "|cffd2b879血毒沸腾（Z）|r|n选择中了自己毒矛的当前敌人，立即结算相当于自身1次毒伤基值的伤害。|n基值=当前攻击力×30%×自身毒层数×毒矛等级。|n不消耗毒层，不触发额外叠毒或推进敌方回合；自身恢复生命上限10%。|n消耗2行动点、3魔法；战斗中每回合一次，无自己的毒层不能施放。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_PassiveCount[39] = 2
	HopeJob_DetailText[632] = "三转专属奖励：力量 +12，生命上限 +80，行动点上限 +1。"
	HopeJob_DetailText[633] = "专属主动：血毒沸腾，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[39] = 1328558132
	HopeJob_Target[39] = 1328558132
	HopeJob_Item[39] = 0
	HopeJob_Stage[39] = 3
	HopeJob_Level[39] = 0
	HopeJob_Str[39] = 0
	HopeJob_Agi[39] = 0
	HopeJob_Int[39] = 0
	HopeJob_Name[39] = "血矛战神"
	HopeJob_Role[39] = "自身毒层引爆 · 血战恢复"
	HopeJob_Skills[39] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879血毒沸腾（Z）|r|n选择中了自己毒矛的当前敌人，立即结算相当于自身1次毒伤基值的伤害。|n基值=当前攻击力×30%×自身毒层数×毒矛等级。|n不消耗毒层，不触发额外叠毒或推进敌方回合；自身恢复生命上限10%。|n消耗2行动点、3魔法；战斗中每回合一次，无自己的毒层不能施放。|n伤害按技能倍率结算；法术另计法伤，暴击、最终伤害和目标减伤按原战斗规则结算。"
	HopeJob_Passive[39] = "三转专属奖励：力量 +12，生命上限 +80，行动点上限 +1。|n|n专属主动：血毒沸腾，按Z使用。|n三转奖励只发放一次。"
	HopeJob_SkillCount[40] = 2
	HopeJob_DetailText[640] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[641] = "|cffd2b879战意连环（可升级被动）|r|n每回合累计对当前敌人造成3次有效伤害，恢复自身（力量+敏捷）×20%/30%/40%的生命。|n超过缺失生命的部分转为等额护甲；每回合最多触发2次。|n连斩追加段和乱斩各段分别累计；回复不会生成新的伤害。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[40] = 2
	HopeJob_DetailText[648] = "三转专属奖励：力量 +10，敏捷 +10，生命上限 +80，行动点上限 +1。"
	HopeJob_DetailText[649] = "觉醒被动：战意连环。|n每回合累计对当前敌人造成3次有效伤害，恢复自身（力量+敏捷）×20%/30%/40%的生命。|n超过缺失生命的部分转为等额护甲；每回合最多触发2次。|n连斩追加段和乱斩各段分别累计；回复不会生成新的伤害。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[40] = 1328558134
	HopeJob_Target[40] = 1328558134
	HopeJob_Item[40] = 0
	HopeJob_Stage[40] = 3
	HopeJob_Level[40] = 0
	HopeJob_Str[40] = 0
	HopeJob_Agi[40] = 0
	HopeJob_Int[40] = 0
	HopeJob_Name[40] = "巨魔战皇"
	HopeJob_Role[40] = "多段连斩 · 连击转续航"
	HopeJob_Skills[40] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879战意连环（可升级被动）|r|n每回合累计对当前敌人造成3次有效伤害，恢复自身（力量+敏捷）×20%/30%/40%的生命。|n超过缺失生命的部分转为等额护甲；每回合最多触发2次。|n连斩追加段和乱斩各段分别累计；回复不会生成新的伤害。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[40] = "三转专属奖励：力量 +10，敏捷 +10，生命上限 +80，行动点上限 +1。|n|n觉醒被动：战意连环。|n每回合累计对当前敌人造成3次有效伤害，恢复自身（力量+敏捷）×20%/30%/40%的生命。|n超过缺失生命的部分转为等额护甲；每回合最多触发2次。|n连斩追加段和乱斩各段分别累计；回复不会生成新的伤害。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[41] = 2
	HopeJob_DetailText[656] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[657] = "|cffd2b879背水狂怒（可升级被动）|r|n重砍基础伤害额外提高：已损失生命比例×40%/60%/80%。|n血量越低重砍越强，满血时没有此项增幅。|n保留狂暴力量、重砍修炼和原伤害浮动；不主动扣除自己的生命。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_PassiveCount[41] = 2
	HopeJob_DetailText[664] = "三转专属奖励：力量 +18，暴击率 +15%，暴击伤害 +35%。"
	HopeJob_DetailText[665] = "觉醒被动：背水狂怒。|n重砍基础伤害额外提高：已损失生命比例×40%/60%/80%。|n血量越低重砍越强，满血时没有此项增幅。|n保留狂暴力量、重砍修炼和原伤害浮动；不主动扣除自己的生命。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_Source[41] = 1311781185
	HopeJob_Target[41] = 1311781185
	HopeJob_Item[41] = 0
	HopeJob_Stage[41] = 3
	HopeJob_Level[41] = 0
	HopeJob_Str[41] = 0
	HopeJob_Agi[41] = 0
	HopeJob_Int[41] = 0
	HopeJob_Name[41] = "狂怒战神"
	HopeJob_Role[41] = "低血强攻 · 狂暴重砍"
	HopeJob_Skills[41] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879背水狂怒（可升级被动）|r|n重砍基础伤害额外提高：已损失生命比例×40%/60%/80%。|n血量越低重砍越强，满血时没有此项增幅。|n保留狂暴力量、重砍修炼和原伤害浮动；不主动扣除自己的生命。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。"
	HopeJob_Passive[41] = "三转专属奖励：力量 +18，暴击率 +15%，暴击伤害 +35%。|n|n觉醒被动：背水狂怒。|n重砍基础伤害额外提高：已损失生命比例×40%/60%/80%。|n血量越低重砍越强，满血时没有此项增幅。|n保留狂暴力量、重砍修炼和原伤害浮动；不主动扣除自己的生命。|n初始1级，可在泉水转职窗口研习至3级，每次消耗1技能点；使用原有及后续升级获得的技能点。|n三转奖励只发放一次。"
	HopeJob_SkillCount[42] = 2
	HopeJob_DetailText[672] = "保留二转战斗技能与已学修炼。"
	HopeJob_DetailText[673] = "|cffd2b879围猎号令（Z）|r|n标记一名当前敌人，其后受到我方英雄的3次有效伤害提高25%。|n每次消耗标记时，造成伤害的玩家获得10金币；同一次伤害只结算一次悬赏。|n标记不能叠层，重复施放刷新至3次；下一场战斗开始清除。|n消耗1行动点、3魔法；战斗中每回合一次。"
	HopeJob_PassiveCount[42] = 2
	HopeJob_DetailText[680] = "三转专属奖励：力量 +10，敏捷 +10，行动点上限 +1，技能伤害 +15%。"
	HopeJob_DetailText[681] = "专属主动：围猎号令，按Z使用。|n三转奖励只发放一次。"
	HopeJob_Source[42] = 1328558133
	HopeJob_Target[42] = 1328558133
	HopeJob_Item[42] = 0
	HopeJob_Stage[42] = 3
	HopeJob_Level[42] = 0
	HopeJob_Str[42] = 0
	HopeJob_Agi[42] = 0
	HopeJob_Int[42] = 0
	HopeJob_Name[42] = "荒原狼王"
	HopeJob_Role[42] = "全队集火 · 悬赏掠夺"
	HopeJob_Skills[42] = "保留二转战斗技能与已学修炼。|n|n|cffd2b879围猎号令（Z）|r|n标记一名当前敌人，其后受到我方英雄的3次有效伤害提高25%。|n每次消耗标记时，造成伤害的玩家获得10金币；同一次伤害只结算一次悬赏。|n标记不能叠层，重复施放刷新至3次；下一场战斗开始清除。|n消耗1行动点、3魔法；战斗中每回合一次。"
	HopeJob_Passive[42] = "三转专属奖励：力量 +10，敏捷 +10，行动点上限 +1，技能伤害 +15%。|n|n专属主动：围猎号令，按Z使用。|n三转奖励只发放一次。"
	for _ in _loop_() do
		if i >= 6 then break end
		TriggerRegisterPlayerUnitEvent(selected, Player(i), EVENT_PLAYER_UNIT_SELECTED, nil)
		i = i + 1
	end
	TriggerAddAction(selected, HopeJob_OnSelect)
	TriggerRegisterAnyUnitEventBJ(spells, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddAction(spells, HopeJob_Cast)
	TriggerRegisterAnyUnitEventBJ(learning, EVENT_PLAYER_HERO_SKILL)
	TriggerAddAction(learning, HopeJob_Learn)
	HopeThird_Init()
	GroupEnumUnitsOfPlayer(shops, Player(PLAYER_NEUTRAL_PASSIVE), nil)
	ForGroup(shops, HopeJob_RemoveStock)
	DestroyGroup(shops)
	DzTriggerRegisterKeyEventByCode(nil, 27, 1, false, HopeJob_Close)
	TimerStart(CreateTimer(), 0.1, false, HopeJob_CreateUI)
	selected = nil
	spells = nil
	learning = nil
	shops = nil
end

end

-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeDraw_Quality(result)
	local color = ""
	if result == "谢谢惠顾（未获得奖励）" then
		color = "|cff9aa0a6"
	elseif result == "力量 +1" or result == "敏捷 +1" or result == "智力 +1" then
		color = "|cff959697"
	elseif result == "全属性 +3" then
		color = "|cffe4e5e4"
	elseif result == "技能伤害 +10% / 法术伤害 +10%" then
		color = "|cff719fff"
	elseif result == "暴击率 +5% / 暴击伤害 +10%" then
		color = "|cffbf80ef"
	elseif result == "最终伤害 +10%" then
		color = "|cfffe8a0e"
	elseif result == "圣剑（英雄满包转入助手；都满才落地）" then
		color = "|cfffffc01"
	end
	if color == "" then
		return result
	end
	return (color or "") .. (result or "") .. "|r"
end

function HopeDraw_Reward(p)
	local i = GetPlayerId(p) + 1
	local u = udg_hero[i]
	local result = ""
	-- Preserve every branch and probability from the original ten-draw table.
	if GetRandomInt(1, 10) >= 6 then
		if GetRandomInt(1, 3) == 1 then
			ModifyHeroStat(bj_HEROSTAT_STR, u, bj_MODIFYMETHOD_ADD, 1)
			result = "力量 +1"
		elseif GetRandomInt(1, 2) == 1 then
			ModifyHeroStat(bj_HEROSTAT_AGI, u, bj_MODIFYMETHOD_ADD, 1)
			result = "敏捷 +1"
		else
			ModifyHeroStat(bj_HEROSTAT_INT, u, bj_MODIFYMETHOD_ADD, 1)
			result = "智力 +1"
		end
	elseif GetRandomInt(1, 5) >= 3 then
		ModifyHeroStat(bj_HEROSTAT_STR, u, bj_MODIFYMETHOD_ADD, 3)
		ModifyHeroStat(bj_HEROSTAT_AGI, u, bj_MODIFYMETHOD_ADD, 3)
		ModifyHeroStat(bj_HEROSTAT_INT, u, bj_MODIFYMETHOD_ADD, 3)
		result = "全属性 +3"
	elseif GetRandomInt(1, 5) >= 2 then
		if GetRandomInt(1, 3) == 1 then
			udg_Skill_Dm[i] = udg_Skill_Dm[i] + 0.1
			udg_Fashang_Dm[i] = udg_Fashang_Dm[i] + 0.1
			result = "技能伤害 +10% / 法术伤害 +10%"
		elseif GetRandomInt(1, 2) == 1 then
			udg_Baoji_Damage[i] = udg_Baoji_Damage[i] + 0.1
			udg_Baoji_Lv[i] = udg_Baoji_Lv[i] + 5
			result = "暴击率 +5% / 暴击伤害 +10%"
		else
			udg_Zuizhong_Dm[i] = udg_Zuizhong_Dm[i] + 0.1
			result = "最终伤害 +10%"
		end
	else
		HopeInventory_Give(1227895894, u)
		result = "圣剑（英雄满包转入助手；都满才落地）"
	end
	u = nil
	return HopeDraw_Quality(result)
end

function HopeDraw_SaveRecord(p, title, text, reveal)
	local i = GetPlayerId(p)
	local page = 0
	HopeDraw_Count[i] = HopeDraw_Count[i] + 1
	page = ModuloInteger(HopeDraw_Count[i], 64) * 2
	SaveStr(HopeDraw_History, i, page, title)
	SaveStr(HopeDraw_History, i, page + 1, text)
	HopeDraw_Serial = HopeDraw_Serial + 1
	SaveInteger(HopeDraw_History, i, 1000 + page, HopeDraw_Serial)
	SaveStr(HopeDraw_History, i, 2000 + page, HopeName_Clean(GetPlayerName(p)))
	if p == GetLocalPlayer() then
		HopeDraw_Page = HopeDraw_Count[i]
		if reveal then
			HopeDraw_Team = false
			HopeLog_Cached = -1
			HopeDraw_Open = true
			HopeLayout_Focus(7)
			HopeChoice_Hidden = true
		end
	end
end

function HopeDraw_Record(p, title, text)
	HopeDraw_SaveRecord(p, title, text, true)
end

function HopeDraw_Ten(p)
	local i = GetPlayerId(p)
	local n = 1
	local text = ""
	if i < 0 or i >= 6 or HopeDraw_Busy[i] or udg_hero[i + 1] == nil or GetUnitTypeId(udg_hero[i + 1]) == 0 then
		return false
	end
	if GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) < 648 then
		DisplayTextToPlayer(p, 0, 0, "十连抽需要648金币，当前金币不足。")
		return false
	end
	HopeDraw_Busy[i] = true
	SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) - 648)
	for _ in _loop_() do
		if n > 10 then break end
		text = (text or "") .. (I2S(n) or "") .. ". " .. (HopeDraw_Reward(p) or "") .. "|n"
		n = n + 1
	end
	HopeDraw_Record(p, "十连抽结果 · 消耗648金币", text)
	HopeDraw_Busy[i] = false
	return true
end

function HopeGift_Name(index)
	if index == 0 then
		return "内测礼包"
	elseif index == 1 then
		return "金币礼包"
	elseif index == 2 then
		return "木材礼包"
	elseif index == 3 then
		return "预约礼包"
	elseif index == 4 then
		return "首充礼包"
	elseif index == 5 then
		return "重随礼包"
	end
	return ""
end

function HopeGift_Effect(index)
	if index == 0 then
		return "开局金币 +50|n力量 / 敏捷 / 智力各 +1"
	elseif index == 1 then
		return "开局金币 +50"
	elseif index == 2 then
		return "开局木材 +1"
	elseif index == 3 then
		return "开局木材 +1|n力量 / 敏捷 / 智力各 +1"
	elseif index == 4 then
		return "开局金币 +100|n力量 / 敏捷 / 智力各 +1"
	elseif index == 5 then
		return "开局成长重随次数 +3"
	end
	return ""
end

function HopeGift_DrawCost()
	return 5
end

function HopeGift_Chance(index)
	if index == 0 or index == 3 then
		return 4
	elseif index == 1 then
		return 12
	elseif index == 2 then
		return 15
	elseif index == 4 then
		return 2
	elseif index == 5 then
		return 8
	end
	return 0
end

function HopeGift_DrawIndex(roll)
	if roll < 1 or roll > 100 or roll <= 55 then
		return -1
	elseif roll <= 70 then
		return 2
	elseif roll <= 82 then
		return 1
	elseif roll <= 90 then
		return 5
	elseif roll <= 94 then
		return 0
	elseif roll <= 98 then
		return 3
	end
	return 4
end

function HopeGift_Key(index)
	if index < 0 or index >= 6 then
		return ""
	end
	return "gift_v1_" .. (I2S(index) or "")
end

function HopeGift_Owned(p, index)
	local i = -1
	if p == nil or index < 0 or index >= 6 then
		return false
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 then
		return false
	end
	return HopeGift_Applied[i * 6 + index] or HopeGift_PointOwned[i * 6 + index] or HopeGift_PlatformOwned[i * 6 + index]
end

function HopeGift_OwnedCount(p)
	local index = 0
	local count = 0
	for _ in _loop_() do
		if index >= 6 then break end
		if HopeGift_Owned(p, index) then
			count = count + 1
		end
		index = index + 1
	end
	return count
end

function HopeGift_PlatformEntitled(p, index)
	local i = -1
	if p == nil or index < 0 or index >= 6 then
		return false
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 then
		return false
	end
	if index == 0 then
		return DzAPI_Map_GetServerValue(p, "maptest2020") == "1"
	elseif index == 1 then
		return DzAPI_Map_HasMallItem(p, "JINBI")
	elseif index == 2 then
		return DzAPI_Map_HasMallItem(p, "MUCAI")
	elseif index == 3 then
		return DzAPI_Map_GetServerValue(p, "prebook2023") == "1"
	elseif index == 4 then
		return DzAPI_Map_HasMallItem(p, "SHOUCHONG")
	end
	return DzAPI_Map_HasMallItem(p, "CHONGSUI")
end

function HopeGift_GrantLoaded(p, index)
	local i = -1
	local u = nil
	if p == nil or index < 0 or index >= 6 then
		return
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 then
		return
	end
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER then
		return
	end
	if not HopeGift_Owned(p, index) or HopeGift_Applied[i * 6 + index] then
		return
	end
	HopeGift_Applied[i * 6 + index] = true
	SetPlayerTechResearched(p, 1378889776 + index, 1)
	if index == 0 or index == 1 then
		AdjustPlayerStateBJ(50, p, PLAYER_STATE_RESOURCE_GOLD)
	elseif index == 4 then
		AdjustPlayerStateBJ(100, p, PLAYER_STATE_RESOURCE_GOLD)
	elseif index == 2 or index == 3 then
		AdjustPlayerStateBJ(1, p, PLAYER_STATE_RESOURCE_LUMBER)
	elseif index == 5 then
		udg_CZ_czcs[i + 1] = udg_CZ_czcs[i + 1] + 3
	end
	if index == 0 or index == 3 or index == 4 then
		udg_STR_cs[i + 1] = udg_STR_cs[i + 1] + 1
		udg_AGI_cs[i + 1] = udg_AGI_cs[i + 1] + 1
		udg_INT_cs[i + 1] = udg_INT_cs[i + 1] + 1
		-- Normally no hero exists at .2 seconds.  If startup order changes, apply
		-- the loaded bonus to the existing hero instead of leaving it unapplied.
		u = udg_hero[i + 1]
		if u ~= nil and GetUnitTypeId(u) ~= 0 then
			ModifyHeroStat(bj_HEROSTAT_STR, u, bj_MODIFYMETHOD_ADD, 1)
			ModifyHeroStat(bj_HEROSTAT_AGI, u, bj_MODIFYMETHOD_ADD, 1)
			ModifyHeroStat(bj_HEROSTAT_INT, u, bj_MODIFYMETHOD_ADD, 1)
		end
	end
	u = nil
end

function HopeGift_LoadPoints()
	local i = 0
	local index = 0
	local p = nil
	for _ in _loop_() do
		if i >= 6 then break end
		p = Player(i)
		if not HopeGift_Loaded[i] and HopeGift_Checked[i] and HopeCloud_CanWrite(p) then
			index = 0
			for _ in _loop_() do
				if index >= 6 then break end
				HopeGift_PlatformOwned[i * 6 + index] = HopeGift_Applied[i * 6 + index] or HopeGift_PlatformEntitled(p, index)
				HopeGift_PointOwned[i * 6 + index] = DzAPI_Map_GetStoredInteger(p, HopeGift_Key(index)) > 0
				HopeGift_GrantLoaded(p, index)
				index = index + 1
			end
			HopeGift_Loaded[i] = true
		end
		i = i + 1
	end
	p = nil
end

function HopeGift_Draw(p)
	local i = -1
	local index = -1
	if p == nil then
		return false
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 then
		return false
	end
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER then
		return false
	end
	if HopeGift_Busy[i] then
		return false
	end
	if not HopeCloud_CanWrite(p) then
		HopeCloud_Report(p)
		return false
	end
	if not HopeGift_Checked[i] or not HopeGift_Loaded[i] then
		DisplayTextToPlayer(p, 0, 0, "礼包权益尚未载入，未扣除积分。")
		return false
	end
	if HopeGift_OwnedCount(p) >= 6 then
		DisplayTextToPlayer(p, 0, 0, "六项礼包已全部拥有，停止抽奖，不扣积分。")
		return false
	end
	HopeGift_Busy[i] = true
	if not HopePoints_Spend(p, HopeGift_DrawCost()) then
		HopeGift_Busy[i] = false
		return false
	end
	index = HopeGift_DrawIndex(GetRandomInt(1, 100))
	if index < 0 then
		HopeGift_LastResult[i] = "谢谢惠顾 · 本次未中奖"
	elseif HopeGift_Owned(p, index) then
		HopeGift_LastResult[i] = "重复：" .. (HopeGift_Name(index) or "") .. "|n无新增权益，不重抽"
	else
		-- Spend submitted boss_jf first.  Never refund/retry from the API return bit:
		-- it is not a durable-save acknowledgement.  New ownership applies next run.
		HopeGift_PointOwned[i * 6 + index] = true
		DzAPI_Map_StoreInteger(p, HopeGift_Key(index), 1)
		HopeGift_LastResult[i] = "抽中：" .. (HopeGift_Name(index) or "") .. "|n已提交，结算后下局生效"
	end
	HopeGift_Busy[i] = false
	DisplayTextToPlayer(p, 0, 0, "本次消耗5积分：" .. (HopeGift_LastResult[i] or "") .. "。剩余积分 " .. (I2S(udg_Wj_jf[i + 1]) or "") .. "。")
	return true
end

function HopeGift_AppliedCount(p)
	local i = GetPlayerId(p)
	local index = 0
	local count = 0
	if p == nil or i < 0 or i >= 6 then
		return 0
	end
	for _ in _loop_() do
		if index >= 6 then break end
		if HopeGift_Applied[i * 6 + index] then
			count = count + 1
		end
		index = index + 1
	end
	return count
end

function HopeGift_State(p, index)
	local i = -1
	if p == nil or index < 0 or index >= 6 then
		return "|cffaaaaaa不可用|r"
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 then
		return "|cffaaaaaa不可用|r"
	end
	if HopeGift_Applied[i * 6 + index] then
		if udg_hero[i + 1] == nil and (index == 0 or index == 3 or index == 4) then
			return "|cffd2b879已拥有 · 待角色初始化|r"
		end
		return "|cff9ddbaf已拥有 · 本局已生效|r"
	end
	if HopeGift_PointOwned[i * 6 + index] then
		return "|cffd2b879已提交 · 结算后下局生效|r"
	end
	if HopeGift_PlatformOwned[i * 6 + index] then
		return "|cff9ddbaf平台已拥有|r"
	end
	if not HopeGift_Checked[i] or not HopeCloud_Checked[i] then
		return "|cffaaaaaa待载入|r"
	end
	if not HopeCloud_Ready[i] then
		return "|cffffb878云档未就绪 · 暂不可抽奖|r"
	end
	if not HopeGift_Loaded[i] then
		return "|cffaaaaaa礼包权益待载入|r"
	end
	return "|cffaaaaaa未拥有 · 可通过抽奖获得|r"
end

function HopeGift_OpenFor(p)
	local i = GetPlayerId(p)
	if not HopeGift_UIReady or p == nil or i < 0 or i >= 6 then
		return false
	end
	if p == GetLocalPlayer() then
		if HopeGrowth_Pending[GetPlayerId(p)] then
			HopeChoice_Hidden = true
		end
		HopeGift_Expanded = not HopeGift_Expanded
		if HopeGift_Expanded then
			HopeLayout_Focus(3)
		end
		HopeQoL_Expanded = false
		HopeRoute_Details = false
		HopeArchive_Expanded = false
		HopeRelic_Expanded = false
	end
	return true
end

function HopeGift_Toggle()
	local p = DzGetTriggerUIEventPlayer()
	local i = GetPlayerId(p)
	if not HopeGift_OpenFor(p) and p == GetLocalPlayer() and i >= 0 and i < 6 then
		if udg_Cundang_danwei[i + 1] ~= nil then
			SelectUnitForPlayerSingle(udg_Cundang_danwei[i + 1], p)
		end
	end
	p = nil
end

function HopeGift_Close()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeGift_Expanded = false
		DzFrameShow(HopeGift_Panel, false)
	end
end

function HopeGift_DrawClick()
	HopeGift_Draw(DzGetTriggerUIEventPlayer())
end

function HopeGift_Refresh()
	local p = GetLocalPlayer()
	local i = GetPlayerId(p)
	local index = 0
	local available = false
	if not HopeGift_UIReady then
		p = nil
		return
	end
	DzFrameShow(HopeGift_Panel, HopeGift_Expanded and not (HopeChoice_HasPending() and not HopeChoice_Hidden))
	if not HopeGift_Expanded or i < 0 or i >= 6 then
		p = nil
		return
	end
	if HopeQoL_Expanded or HopeRoute_Details or HopeArchive_Expanded or HopeRelic_Expanded then
		HopeGift_Expanded = false
		DzFrameShow(HopeGift_Panel, false)
		p = nil
		return
	end
	available = HopeGift_Loaded[i] and HopeGift_Checked[i] and HopeCloud_CanWrite(p)
	DzFrameSetText(HopeGift_Heading, "|cffd2b879礼包抽奖|r  ·  积分 " .. (I2S(udg_Wj_jf[i + 1]) or ""))
	DzFrameSetText(HopeGift_Summary, "每抽5积分 · 谢谢惠顾55%|n以下礼包概率固定，已拥有的结果仍可能抽中。")
	for _ in _loop_() do
		if index >= 6 then break end
		DzFrameSetText(HopeGift_StateText[index], HopeGift_State(p, index))
		index = index + 1
	end
	if not available then
		DzFrameSetText(HopeGift_DrawButton, "|cff999999云档未就绪|r")
	elseif HopeGift_OwnedCount(p) >= 6 then
		DzFrameSetText(HopeGift_DrawButton, "|cff999999已集齐 · 停止抽奖|r")
	elseif udg_Wj_jf[i + 1] < HopeGift_DrawCost() then
		DzFrameSetText(HopeGift_DrawButton, "|cffbb99885 积分 · 不足|r")
	else
		DzFrameSetText(HopeGift_DrawButton, "|cffffd27a抽奖 · 5积分|r")
	end
	if HopeGift_LastResult[i] == nil or HopeGift_LastResult[i] == "" then
		DzFrameSetText(HopeGift_ResultText, "|cffaaaaaa最近结果：本局尚未抽奖|r")
	else
		DzFrameSetText(HopeGift_ResultText, HopeGift_LastResult[i])
	end
	p = nil
end

function HopeGift_CreateUI()
	local f = 0
	local index = 0
	local x = 0.009
	local y = -0.079
	HopeGift_Panel = HopeQoL_Surface("HopeGiftPanel", 0.23, 0.57, 0.34, 0.39)
	if HopeGift_Panel == 0 then
		return
	end
	HopeGift_Heading = HopeQoL_Label("HopeGiftHeading", HopeGift_Panel, 0.009, -0.008, 0.285, 0.018, "")
	f = HopeQoL_Button("HopeGiftClose", HopeGift_Panel, 0.3, -0.007, 0.031, 0.021, "关闭")
	if f == 0 then
		return
	end
	HopeQoL_Bind(f, HopeGift_Close, false)
	HopeGift_Summary = HopeQoL_Label("HopeGiftSummary", HopeGift_Panel, 0.009, -0.034, 0.322, 0.036, "")
	for _ in _loop_() do
		if index >= 6 then break end
		if index == 3 then
			x = 0.175
			y = -0.079
		end
		HopeGift_NameText[index] = HopeQoL_Label("HopeGiftName" .. (I2S(index) or ""), HopeGift_Panel, x, y, 0.155, 0.014, "|cffd2b879" .. (HopeGift_Name(index) or "") .. " · " .. (I2S(HopeGift_Chance(index)) or "") .. "%|r")
		HopeGift_EffectText[index] = HopeQoL_Label("HopeGiftEffect" .. (I2S(index) or ""), HopeGift_Panel, x, y - 0.017, 0.155, 0.027, "|cffdedede" .. (HopeGift_Effect(index) or "") .. "|r")
		HopeGift_StateText[index] = HopeQoL_Label("HopeGiftState" .. (I2S(index) or ""), HopeGift_Panel, x, y - 0.046, 0.155, 0.018, "")
		if HopeGift_NameText[index] == 0 or HopeGift_EffectText[index] == 0 or HopeGift_StateText[index] == 0 then
			return
		end
		y = y - 0.077
		index = index + 1
	end
	HopeGift_DrawButton = HopeQoL_Button("HopeGiftDraw", HopeGift_Panel, 0.009, -0.307, 0.125, 0.026, "")
	HopeQoL_Bind(HopeGift_DrawButton, HopeGift_DrawClick, true)
	HopeGift_ResultText = HopeQoL_Label("HopeGiftResult", HopeGift_Panel, 0.143, -0.307, 0.188, 0.029, "")
	HopeGift_Footer = HopeQoL_Label("HopeGiftFooter", HopeGift_Panel, 0.009, -0.342, 0.322, 0.043, "空签或重复均消耗5积分，不重抽、不叠加、不返还。|n新礼包永久解锁，提交平台结算后下局生效。|n原平台权益保留；六项全拥有时停止抽奖。")
	HopeGift_UIReady = HopeGift_Heading ~= 0 and HopeGift_Summary ~= 0 and HopeGift_Footer ~= 0 and HopeGift_DrawButton ~= 0 and HopeGift_ResultText ~= 0
	DzFrameShow(HopeGift_Panel, false)
end

function HopeDraw_Close()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeDraw_Open = false
	end
end

function HopeDraw_OpenHistory()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeDraw_Open = not HopeDraw_Open
		if HopeDraw_Open then
			HopeLayout_Focus(7)
		end
		if HopeDraw_Page <= 0 then
			HopeDraw_Page = HopeDraw_Count[GetPlayerId(GetLocalPlayer())]
		end
		if HopeDraw_Open then
			HopeChoice_Hidden = true
		end
	end
end

function HopeDraw_Mine()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeDraw_Team = false
		HopeLog_Cached = -1
		HopeLog_Offset = 0
	end
end

function HopeDraw_Teammates()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeDraw_Team = true
		HopeLog_Cached = -1
		HopeLog_Offset = 0
	end
end

function HopeDraw_BuildTeam(owner)
	local p = 0
	local n = 0
	local best = 0
	local serial = 0
	local winner = -1
	local slot = 0
	local name = ""
	for _ in _loop_() do
		if p >= 6 then break end
		HopeTeam_Cursor[p] = HopeDraw_Count[p]
		p = p + 1
	end
	for _ in _loop_() do
		if n >= 64 then break end
		p = 0
		best = 0
		winner = -1
		for _ in _loop_() do
			if p >= 6 then break end
			if p ~= owner and HopeTeam_Cursor[p] >= IMaxBJ(1, HopeDraw_Count[p] - 63) then
				slot = ModuloInteger(HopeTeam_Cursor[p], 64) * 2
				serial = LoadInteger(HopeDraw_History, p, 1000 + slot)
				if serial > best then
					best = serial
					winner = p
				end
			end
			p = p + 1
		end
		if winner < 0 then break end
		slot = ModuloInteger(HopeTeam_Cursor[winner], 64) * 2
		name = LoadStr(HopeDraw_History, winner, 2000 + slot)
		if name == "" then
			name = HopeName_Label(Player(winner), 100)
		else
			name = HopeName_Clip(name, 100)
		end
		HopeScroll_Add(1, HopeUI_PlayerText(Player(winner), (name or "") .. " · #" .. (I2S(best) or "")))
		HopeScroll_Add(1, "|cffd2b879" .. (LoadStr(HopeDraw_History, winner, slot) or "") .. "|r")
		HopeScroll_Add(1, LoadStr(HopeDraw_History, winner, slot + 1))
		HopeTeam_Cursor[winner] = HopeTeam_Cursor[winner] - 1
		n = n + 1
	end
end

function HopeDraw_Refresh()
	local owner = GetPlayerId(GetLocalPlayer())
	local record = HopeDraw_Count[owner]
	local slot = 0
	local drawStamp = HopeDraw_Count[owner]
	local last = IMaxBJ(1, record - 63)
	local show = HopeDraw_Open and not (HopeChoice_HasPending() and not HopeChoice_Hidden) and not HopeRoute_Assigning
	HopeLog_Visible = show
	HopeJob_ShowFrame(HopeDraw_Panel, show)
	if not show then
		return
	end
	if HopeDraw_Team then
		drawStamp = HopeDraw_Serial - HopeDraw_Count[owner]
	end
	if HopeLog_Cached ~= drawStamp then
		HopeLog_Count = 0
		HopeLog_Offset = 0
		HopeLog_Cached = drawStamp
		if HopeDraw_Team then
			HopeDraw_BuildTeam(owner)
		else
			for _ in _loop_() do
				if record < last then break end
				slot = ModuloInteger(record, 64) * 2
				HopeScroll_Add(1, "|cffd2b879#" .. (I2S(record) or "") .. " " .. (LoadStr(HopeDraw_History, owner, slot) or "") .. "|r")
				HopeScroll_Add(1, LoadStr(HopeDraw_History, owner, slot + 1))
				record = record - 1
			end
		end
	end
	HopeJob_SetText(HopeDraw_Title, "抽取记录")
	if HopeDraw_Team then
		HopeJob_SetText(HopeDraw_MyTab, "我的")
		HopeJob_SetText(HopeDraw_TeamTab, "|cffffd060队友|r")
	else
		HopeJob_SetText(HopeDraw_MyTab, "|cffffd060我的|r")
		HopeJob_SetText(HopeDraw_TeamTab, "队友")
	end
	if HopeLog_Count == 0 then
		if HopeDraw_Team then
			HopeJob_SetText(HopeDraw_Text, "暂无队友抽奖记录。|n队友的木材抽奖和十连结果将按时间列出。")
		else
			HopeJob_SetText(HopeDraw_Text, "暂无记录。|n十连与木材抽奖的结果将连续列在这里。")
		end
		HopeJob_SetText(HopeLog_Status, "滚轮查看 · 保留64次")
	else
		HopeJob_SetText(HopeDraw_Text, HopeScroll_View(1, HopeLog_Offset, 13))
		HopeJob_SetText(HopeLog_Status, (I2S(HopeLog_Offset + 1) or "") .. "-" .. (I2S(IMinBJ(HopeLog_Count, HopeLog_Offset + 13)) or "") .. " / " .. (I2S(HopeLog_Count) or "") .. " 行 · 滚轮查看")
	end
end

function HopeDraw_Create()
	local f = 0
	local viewport = 0
	HopeDraw_Panel = HopeQoL_Surface("HopeDrawResults", 0.26, 0.5, 0.28, 0.226)
	HopeDraw_Title = HopeQoL_Label("HopeDrawTitle", HopeDraw_Panel, 0.01, -0.009, 0.09, 0.018, "")
	f = HopeQoL_Button("HopeDrawClose", HopeDraw_Panel, 0.23, -0.006, 0.04, 0.022, "关闭")
	HopeQoL_Bind(f, HopeDraw_Close, false)
	HopeDraw_MyTab = HopeQoL_Button("HopeDrawMineTab", HopeDraw_Panel, 0.11, -0.006, 0.044, 0.022, "我的")
	HopeQoL_Bind(HopeDraw_MyTab, HopeDraw_Mine, false)
	HopeDraw_TeamTab = HopeQoL_Button("HopeDrawTeamTab", HopeDraw_Panel, 0.162, -0.006, 0.044, 0.022, "队友")
	HopeQoL_Bind(HopeDraw_TeamTab, HopeDraw_Teammates, false)
	viewport = HopeQoL_Button("HopeLogViewport", HopeDraw_Panel, 0.01, -0.034, 0.26, 0.155, "")
	DzFrameSetScriptByCode(viewport, 2, HopeScroll_EnterLog, false)
	DzFrameSetScriptByCode(viewport, 3, HopeScroll_Leave, false)
	HopeDraw_Text = HopeQoL_Label("HopeDrawText", viewport, 0.006, -0.005, 0.248, 0.145, "")
	DzFrameSetFont(HopeDraw_Text, "Fonts\\ZiTi.ttf", 0.0085, 0)
	f = HopeQoL_Button("HopeLogUp", HopeDraw_Panel, 0.01, -0.197, 0.028, 0.02, "上")
	HopeQoL_Bind(f, HopeScroll_LogUp, false)
	f = HopeQoL_Button("HopeLogDown", HopeDraw_Panel, 0.043, -0.197, 0.028, 0.02, "下")
	HopeQoL_Bind(f, HopeScroll_LogDown, false)
	HopeLog_Status = HopeQoL_Label("HopeLogStatus", HopeDraw_Panel, 0.077, -0.199, 0.14, 0.016, "")
	DzFrameSetFont(HopeLog_Status, "Fonts\\ZiTi.ttf", 0.008, 0)
	f = HopeQoL_Button("HopeLogLatest", HopeDraw_Panel, 0.224, -0.197, 0.046, 0.02, "最新")
	HopeQoL_Bind(f, HopeScroll_Latest, false)
	f = HopeQoL_Button("HopeDrawHistory", DzGetGameUI(), 0.0, 0.0, 0.064, 0.021, "抽取记录")
	HopeLayout_History = f
	DzFrameSetAbsolutePoint(f, 0, 0.084, 0.196)
	HopeQoL_Bind(f, HopeDraw_OpenHistory, false)
	HopeJob_ShowFrame(HopeDraw_Panel, false)
end

function HopeWood_Allowed(shop, buyer)
	local p = GetOwningPlayer(buyer)
	local i = GetPlayerId(p)
	local allowed = false
	if buyer ~= nil and shop == gg_unit_n00Q_0028 and GetUnitTypeId(shop) == 1848651857 and i >= 0 and i < 6 then
		allowed = HopeMarket_InRoom and GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER and not udg_ZhandouZhong and not HopeDraw_Busy[i] and udg_hero[i + 1] ~= nil and GetWidgetLife(udg_hero[i + 1]) > 0.405
	end
	p = nil
	return allowed
end

function HopeMarket_Trade(p, kind)
	local i = GetPlayerId(p)
	local quantity = 1
	local n = 0
	local gold = 0
	local wood = 0
	local price = 0
	local text = ""
	local result = ""
	if i < 0 or i >= 6 or kind < 0 or kind >= 6 or not HopeWood_Allowed(gg_unit_n00Q_0028, udg_hero[i + 1]) then
		DisplayTextToPlayer(p, 0, 0, "请沿路线进入能力商店关卡后交易；战斗中或角色阵亡时不可使用。")
		return
	end
	-- Availability follows synchronized room entry, never a local UI selection.
	gold = GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)
	wood = GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)
	if kind == 1 then
		quantity = 10
	elseif kind == 3 or kind == 5 then
		quantity = 5
	end
	if kind <= 1 then
		if wood < quantity then
			DisplayTextToPlayer(p, 0, 0, "木材不足。")
			return
		end
		HopeDraw_Busy[i] = true
		SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, wood - quantity)
		for _ in _loop_() do
			if n >= quantity then break end
			result = "谢谢惠顾"
			if GetRandomInt(1, 100) > 50 then
				result = HopeDraw_Reward(p)
			end
			text = (text or "") .. (I2S(n + 1) or "") .. ". " .. (result or "") .. "|n"
			n = n + 1
		end
		HopeDraw_SaveRecord(p, "木材抽奖 · 消耗" .. (I2S(quantity) or "") .. "木材", text, true)
		HopeDraw_Busy[i] = false
	elseif kind <= 3 then
		price = HopeMarket_GoldCost * quantity
		if gold < price or wood > 2000000000 - quantity then
			DisplayTextToPlayer(p, 0, 0, "金币不足或木材已达安全上限。")
			return
		end
		SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, gold - price)
		SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, wood + quantity)
		DisplayTextToPlayer(p, 0, 0, "兑换完成：消耗" .. (I2S(price) or "") .. "金币，获得" .. (I2S(quantity) or "") .. "木材。")
	else
		price = HopeMarket_GoldReward * quantity
		if wood < quantity or gold > 2000000000 - price then
			DisplayTextToPlayer(p, 0, 0, "木材不足或金币已达安全上限。")
			return
		end
		SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, wood - quantity)
		SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, gold + price)
		DisplayTextToPlayer(p, 0, 0, "兑换完成：消耗" .. (I2S(quantity) or "") .. "木材，获得" .. (I2S(price) or "") .. "金币。")
	end
end

function HopeMarket_Close()
	HopeMarket_Open = false
end

function HopeMarket_Show()
	local p = GetLocalPlayer()
	local i = GetPlayerId(p)
	if i < 0 or i >= 6 then
		p = nil
		return
	end
	if not HopeWood_Allowed(gg_unit_n00Q_0028, udg_hero[i + 1]) then
		HopeMarket_Open = false
		DisplayTextToPlayer(p, 0, 0, "能力商店只在沿路线进入商店关卡后开放。")
		p = nil
		return
	end
	HopeMarket_Open = true
	HopeLayout_Focus(16)
	p = nil
end

function HopeMarket_Refresh()
	local p = GetLocalPlayer()
	local i = GetPlayerId(p)
	local available = false
	if i >= 0 and i < 6 then
		available = HopeWood_Allowed(gg_unit_n00Q_0028, udg_hero[i + 1])
	end
	HopeLayout_Show(HopeMarket_Entry, available and not HopeMeta_Open)
	if not available then
		HopeMarket_Open = false
	end
	if HopeMarket_Panel == 0 then
		p = nil
		return
	end
	HopeLayout_Show(HopeMarket_Panel, HopeMarket_Open)
	if HopeMarket_Open then
		HopeJob_SetText(HopeMarket_Body, "金币 " .. (I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)) or "") .. " · 木材 " .. (I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)) or "") .. "|n木材单抽/十连：每次独立50%空签，保留原奖池。|n购1木材 " .. (I2S(HopeMarket_GoldCost) or "") .. "金；售1木材 " .. (I2S(HopeMarket_GoldReward) or "") .. "金；每轮兑换损失26金。")
	end
	p = nil
end

function HopeMarket_Buy0()
	HopeMarket_Trade(DzGetTriggerUIEventPlayer(), 0)
end

function HopeMarket_Buy1()
	HopeMarket_Trade(DzGetTriggerUIEventPlayer(), 1)
end

function HopeMarket_Buy2()
	HopeMarket_Trade(DzGetTriggerUIEventPlayer(), 2)
end

function HopeMarket_Buy3()
	HopeMarket_Trade(DzGetTriggerUIEventPlayer(), 3)
end

function HopeMarket_Buy4()
	HopeMarket_Trade(DzGetTriggerUIEventPlayer(), 4)
end

function HopeMarket_Buy5()
	HopeMarket_Trade(DzGetTriggerUIEventPlayer(), 5)
end

function HopeWood_Sold()
	local sold = GetSoldItem()
	local kind = GetItemTypeId(sold)
	local shop = GetSellingUnit()
	local buyer = GetBuyingUnit()
	local p = GetOwningPlayer(buyer)
	local i = GetPlayerId(p)
	local count = 1
	local n = 1
	local result = ""
	local text = ""
	if kind ~= 1230657348 and kind ~= 1230657364 then
		sold = nil
		shop = nil
		buyer = nil
		p = nil
		return
	end
	if kind == 1230657364 then
		count = 10
	end
	-- The native shop already charged count wood; script never charges again.
	RemoveItem(sold)
	if shop == gg_unit_n00Q_0028 then
		RemoveItemFromStock(shop, kind)
		AddItemToStock(shop, kind, 1, 1)
	end
	if HopeWood_Allowed(shop, buyer) then
		HopeDraw_Busy[i] = true
		for _ in _loop_() do
			if n > count then break end
			result = HopeDraw_Quality("谢谢惠顾（未获得奖励）")
			if GetRandomInt(1, 100) > 50 then
				result = HopeDraw_Reward(p)
			end
			if count > 1 then
				text = (text or "") .. (I2S(n) or "") .. ". " .. (result or "") .. "|n"
			else
				text = result
			end
			n = n + 1
		end
		if count == 10 then
			HopeDraw_SaveRecord(p, "木材十连结果 · 消耗10木材", (text or "") .. "|n每次独立50%谢谢惠顾；其余沿用原奖池。", true)
		else
			HopeDraw_SaveRecord(p, "木材抽取结果 · 消耗1木材", (text or "") .. "|n|n木材抽取50%谢谢惠顾；未抽空时沿用十连奖池。", false)
			DisplayTimedTextToPlayer(p, 0, 0, 5.0, "木材抽奖（1木材）：" .. (result or "") .. "。可在抽取记录中回看。")
		end
		HopeDraw_Busy[i] = false
	elseif buyer ~= nil then
		SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) + count)
		DisplayTextToPlayer(p, 0, 0, "当前不能进行木材抽奖，已退回" .. (I2S(count) or "") .. "木材。请在非战斗时由能力商人购买。")
	end
	sold = nil
	shop = nil
	buyer = nil
	p = nil
end

function HopeWood_Init()
	local t = CreateTrigger()
	-- These two items are dynamic stock only, never also in static Sellitems.
	RemoveItemFromStock(gg_unit_n00Q_0028, 1230657348)
	RemoveItemFromStock(gg_unit_n00Q_0028, 1230657364)
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SELL_ITEM)
	TriggerAddAction(t, HopeWood_Sold)
	t = nil
end

function HopeExchange_GoldToWoodCost()
	return HopeMarket_GoldCost
end

function HopeExchange_WoodToGoldReward()
	return HopeMarket_GoldReward
end

function HopeExchange_Sold()
	local sold = GetSoldItem()
	local kind = GetItemTypeId(sold)
	local shop = GetSellingUnit()
	local buyer = GetBuyingUnit()
	local p = GetOwningPlayer(buyer)
	local wood = 0
	local gold = 0
	if kind == 1230657365 then
		wood = 1
		gold =  - HopeExchange_GoldToWoodCost()
	elseif kind == 1230657366 then
		wood = 5
		gold =  - (HopeExchange_GoldToWoodCost() * 5)
	elseif kind == 1230657367 then
		wood = -1
		gold = HopeExchange_WoodToGoldReward()
	elseif kind == 1230657368 then
		wood = -5
		gold = HopeExchange_WoodToGoldReward() * 5
	else
		sold = nil
		shop = nil
		buyer = nil
		p = nil
		return
	end
	-- The native shop already charged gold or wood per ItemData cost; script never charges again.
	RemoveItem(sold)
	if shop == gg_unit_n00Q_0028 then
		RemoveItemFromStock(shop, kind)
		AddItemToStock(shop, kind, 1, 1)
	end
	if HopeWood_Allowed(shop, buyer) then
		if wood > 0 then
			SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) + wood)
			DisplayTimedTextToPlayer(p, 0, 0, 5.0, "兑换成功：支付" .. (I2S( - gold) or "") .. "金币，获得" .. (I2S(wood) or "") .. "木材。")
		else
			SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + gold)
			DisplayTimedTextToPlayer(p, 0, 0, 5.0, "兑换成功：交出" .. (I2S( - wood) or "") .. "木材，获得" .. (I2S(gold) or "") .. "金币。")
		end
	elseif buyer ~= nil then
		if gold < 0 then
			SetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) - gold)
			DisplayTextToPlayer(p, 0, 0, "当前不能兑换，已退回" .. (I2S( - gold) or "") .. "金币。请在非战斗时于能力商人处操作。")
		else
			SetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER) - wood)
			DisplayTextToPlayer(p, 0, 0, "当前不能兑换，已退回" .. (I2S( - wood) or "") .. "木材。请在非战斗时于能力商人处操作。")
		end
	end
	sold = nil
	shop = nil
	buyer = nil
	p = nil
end

function HopeExchange_Init()
	local t = CreateTrigger()
	-- Exchange items are dynamic stock only, never also in static Sellitems.
	RemoveItemFromStock(gg_unit_n00Q_0028, 1230657365)
	RemoveItemFromStock(gg_unit_n00Q_0028, 1230657366)
	RemoveItemFromStock(gg_unit_n00Q_0028, 1230657367)
	RemoveItemFromStock(gg_unit_n00Q_0028, 1230657368)
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SELL_ITEM)
	TriggerAddAction(t, HopeExchange_Sold)
	t = nil
end

end

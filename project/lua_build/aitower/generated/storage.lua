-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeCloud_CheckLoad(p)
	local i = GetPlayerId(p)
	if i < 0 or i > 5 then
		return
	end
	if HopeCloud_Checked[i] then
		return
	end
	HopeCloud_Checked[i] = true
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER then
		return
	end
	HopeCloud_Lobby[i] = RequestExtraBooleanData(10, nil, nil, nil, false, 0, 0, 0)
	HopeCloud_Test[i] = RequestExtraBooleanData(74, nil, nil, nil, false, 0, 0, 0)
	if not HopeCloud_Lobby[i] and not HopeCloud_Test[i] then
		return
	end
	HopeCloud_LoadError[i] = DzAPI_Map_GetServerValueErrorCode(p)
	HopeCloud_Ready[i] = HopeCloud_LoadError[i] == 0
end

function HopeCloud_CanWrite(p)
	local i = GetPlayerId(p)
	if i < 0 or i > 5 then
		return false
	end
	return HopeCloud_Checked[i] and HopeCloud_Ready[i] and GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(p) == MAP_CONTROL_USER
end

function HopeCloud_Status(p)
	local i = GetPlayerId(p)
	if i < 0 or i > 5 or not HopeCloud_Checked[i] then
		return "|cffffd36a云存档：尚未读取|r"
	end
	if not HopeCloud_Lobby[i] and not HopeCloud_Test[i] then
		return "|cffffd36a云存档：本地自定义局，仅本局进度|r"
	end
	if not HopeCloud_Ready[i] then
		return "|cffff8080云存档载入失败：" .. (I2S(HopeCloud_LoadError[i]) or "") .. "；本局禁止永久写入|r"
	end
	if HopeCloud_Submissions[i] > 0 then
		return "|cff80ef90云档已载入|r · 已提交 " .. (I2S(HopeCloud_Submissions[i]) or "") .. " 次（结算以平台为准）"
	end
	return "|cff80ef90云档已载入|r · 尚无进度提交"
end

function HopeCloud_Report(p)
	local i = GetPlayerId(p)
	if i < 0 or i > 5 then
		return
	end
	DisplayTimedTextToPlayer(p, 0, 0, 15.0, HopeCloud_Status(p))
	if not HopeCloud_Checked[i] then
		return
	end
	if not HopeCloud_Lobby[i] and not HopeCloud_Test[i] then
		DisplayTimedTextToPlayer(p, 0, 0, 15.0, "请从 KK 已上传地图的 RPG 大厅或测试大厅启动；自定义房选择本地文件无法使用此地图的云存档。")
	elseif not HopeCloud_Ready[i] then
		DisplayTimedTextToPlayer(p, 0, 0, 15.0, "平台未能加载该玩家云档。请退出并重开一局，避免空档覆盖旧档；本局积分不能兑换永久升级。")
	else
		if HopeCloud_Test[i] then
			DisplayTimedTextToPlayer(p, 0, 0, 15.0, "环境：KK 地图测试服。载入积分：" .. (I2S(HopeCloud_LoadedPoints[i]) or "") .. "；本局积分：" .. (I2S(udg_Wj_jf[i + 1]) or "") .. "。")
		else
			DisplayTimedTextToPlayer(p, 0, 0, 15.0, "环境：KK RPG 大厅。载入积分：" .. (I2S(HopeCloud_LoadedPoints[i]) or "") .. "；本局积分：" .. (I2S(udg_Wj_jf[i + 1]) or "") .. "。")
		end
		if HopeCloud_Submissions[i] > 0 then
			DisplayTimedTextToPlayer(p, 0, 0, 15.0, "最后提交：" .. (HopeCloud_LastKey[i] or "") .. " = " .. (I2S(HopeCloud_LastValue[i]) or "") .. "。接口提交不代表落库成功；若平台提示失败，请记录其完整错误码并在作者后台检查。")
		else
			DisplayTimedTextToPlayer(p, 0, 0, 15.0, "尚未触发积分奖励或升级兑换；此命令只查询状态，不写入、不刷分。")
		end
	end
end

function HopeCloud_Chat()
	HopeCloud_Report(GetTriggerPlayer())
end

function HopeCloud_Announce()
	local i = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(Player(i)) == MAP_CONTROL_USER then
			DisplayTimedTextToPlayer(Player(i), 0, 0, 12.0, (HopeCloud_Status(Player(i)) or "") .. "。输入 -save 查看存档诊断。")
		end
		i = i + 1
	end
	DestroyTimer(GetExpiredTimer())
end

function HopeCloud_Init()
	local t = CreateTrigger()
	local i = 0
	for _ in _loop_() do
		if i >= 6 then break end
		TriggerRegisterPlayerChatEvent(t, Player(i), "-save", true)
		TriggerRegisterPlayerChatEvent(t, Player(i), "-存档", true)
		i = i + 1
	end
	TriggerAddAction(t, HopeCloud_Chat)
	TimerStart(CreateTimer(), 3.5, false, HopeCloud_Announce)
	t = nil
end

function DzAPI_Map_StoreInteger(whichPlayer, key, value)
	local i = GetPlayerId(whichPlayer)
	if not HopeCloud_CanWrite(whichPlayer) then
		return
	end
	key = "I" .. (key or "")
	DzAPI_Map_SaveServerValue(whichPlayer, key, I2S(value))
	HopeCloud_Submissions[i] = HopeCloud_Submissions[i] + 1
	HopeCloud_LastKey[i] = key
	HopeCloud_LastValue[i] = value
	key = nil
	whichPlayer = nil
end

function DzAPI_Map_GetStoredInteger(whichPlayer, key)
	local value
	HopeCloud_CheckLoad(whichPlayer)
	if not HopeCloud_CanWrite(whichPlayer) then
		return 0
	end
	key = "I" .. (key or "")
	value = S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
	if key == "Iboss_jf" then
		HopeCloud_LoadedPoints[GetPlayerId(whichPlayer)] = value
	end
	key = nil
	whichPlayer = nil
	return value
end

function HopePoints_Spend(p, price)
	local i = -1
	if p == nil then
		return false
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 or price <= 0 then
		return false
	end
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER then
		return false
	end
	if HopePoints_Busy[i] or HopeArchive_Busy[i] then
		return false
	end
	if not HopeCloud_CanWrite(p) then
		HopeCloud_Report(p)
		return false
	end
	if udg_Wj_jf[i + 1] < price then
		DisplayTextToPlayer(p, 0, 0, "存档积分不足：需要 " .. (I2S(price) or "") .. "，当前 " .. (I2S(udg_Wj_jf[i + 1]) or "") .. "。")
		return false
	end
	HopePoints_Busy[i] = true
	udg_Wj_jf[i + 1] = udg_Wj_jf[i + 1] - price
	DzAPI_Map_StoreInteger(p, "boss_jf", udg_Wj_jf[i + 1])
	HopePoints_Busy[i] = false
	return true
end

function HopeArchive_Ability(index)
	if index < 0 or index > 9 then
		return 0
	end
	return 1093677872 + index
end

function HopeArchive_Price(abilityId)
	if abilityId == 1093677872 or abilityId == 1093677878 or abilityId == 1093677879 then
		return 10
	elseif abilityId == 1093677873 or abilityId == 1093677874 or abilityId == 1093677875 then
		return 30
	elseif abilityId == 1093677876 or abilityId == 1093677877 then
		return 20
	elseif abilityId == 1093677880 or abilityId == 1093677881 then
		return 50
	end
	return 0
end

function HopeArchive_Count(p, index)
	local i = GetPlayerId(p)
	local level = 0
	if i < 0 or i >= 6 or index < 0 or index > 9 or udg_Cundang_danwei[i + 1] == nil then
		return 0
	end
	level = GetUnitAbilityLevel(udg_Cundang_danwei[i + 1], HopeArchive_Ability(index))
	if level < 1 or level > 6 then
		return 0
	end
	return level - 1
end

function HopeArchive_Total(p)
	local index = 0
	local count = 0
	for _ in _loop_() do
		if index >= 10 then break end
		count = count + HopeArchive_Count(p, index)
		index = index + 1
	end
	return count
end

function HopeArchive_NewCount(p)
	local i = GetPlayerId(p)
	local index = 0
	local count = 0
	if i < 0 or i >= 6 or not HopeArchive_Captured[i] then
		return 0
	end
	for _ in _loop_() do
		if index >= 10 then break end
		count = count + HopeArchive_Count(p, index) - HopeArchive_AtLoadCounts[i * 10 + index]
		index = index + 1
	end
	return count
end

function HopeArchive_CaptureAll()
	local i = 0
	local index = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if not HopeArchive_Captured[i] and udg_Cundang_danwei[i + 1] ~= nil then
			index = 0
			for _ in _loop_() do
				if index >= 10 then break end
				HopeArchive_AtLoadCounts[i * 10 + index] = HopeArchive_Count(Player(i), index)
				index = index + 1
			end
			HopeArchive_Captured[i] = true
		end
		i = i + 1
	end
end

function HopeArchive_Purchase(p, shop, abilityId)
	local i = -1
	local price = HopeArchive_Price(abilityId)
	local level = 0
	if p == nil then
		return false
	end
	i = GetPlayerId(p)
	if i < 0 or i >= 6 or price == 0 then
		return false
	end
	if GetPlayerSlotState(p) ~= PLAYER_SLOT_STATE_PLAYING or GetPlayerController(p) ~= MAP_CONTROL_USER then
		return false
	end
	if shop == nil or shop ~= udg_Cundang_danwei[i + 1] or GetOwningPlayer(shop) ~= p or GetUnitTypeId(shop) ~= 1747988535 then
		return false
	end
	if HopeArchive_Busy[i] then
		return false
	end
	if not HopeCloud_CanWrite(p) then
		HopeCloud_Report(p)
		return false
	end
	if not HaveSavedInteger(YDHT, abilityId, -237385485) or LoadInteger(YDHT, abilityId, -237385485) ~= price then
		DisplayTextToPlayer(p, 0, 0, "存档商品尚未初始化，稍后再试。")
		return false
	end
	level = GetUnitAbilityLevel(shop, abilityId)
	if level < 1 or level > 6 then
		DisplayTextToPlayer(p, 0, 0, "该存档商品不可用，未扣除积分。")
		return false
	end
	if level == 6 then
		DisplayTextToPlayer(p, 0, 0, "该项已购买5次，达到上限。")
		return false
	end
	if udg_Wj_jf[i + 1] < price then
		DisplayTextToPlayer(p, 0, 0, "积分不足：需要 " .. (I2S(price) or "") .. "，当前 " .. (I2S(udg_Wj_jf[i + 1]) or "") .. "。")
		return false
	end
	HopeArchive_Busy[i] = true
	IncUnitAbilityLevelSwapped(abilityId, shop)
	if GetUnitAbilityLevel(shop, abilityId) ~= level + 1 then
		HopeArchive_Busy[i] = false
		DisplayTextToPlayer(p, 0, 0, "升级未生效，未扣除积分。")
		return false
	end
	udg_Wj_jf[i + 1] = udg_Wj_jf[i + 1] - price
	-- Keep the original two writes and keys. Never retry from the native return bit.
	DzAPI_Map_StoreInteger(p, "boss_jf", udg_Wj_jf[i + 1])
	DzAPI_Map_StoreInteger(p, GetAbilityName(abilityId), GetUnitAbilityLevel(shop, abilityId))
	HopeArchive_Busy[i] = false
	DisplayTextToPlayer(p, 0, 0, (GetAbilityName(abilityId) or "") .. "已购买 " .. (I2S(level) or "") .. "/5 次；升级已提交平台，下局生效。剩余积分 " .. (I2S(udg_Wj_jf[i + 1]) or "") .. "。")
	return true
end

function HopeArchive_BuyIndex(p, index)
	local i = GetPlayerId(p)
	if i >= 0 and i < 6 then
		HopeArchive_Purchase(p, udg_Cundang_danwei[i + 1], HopeArchive_Ability(index))
	end
end

function HopeArchive_OpenFor(p)
	if not HopeArchive_UIReady then
		return false
	end
	if p == GetLocalPlayer() then
		if HopeGrowth_Pending[GetPlayerId(p)] then
			HopeChoice_Hidden = true
		end
		HopeArchive_Expanded = not HopeArchive_Expanded
		if HopeArchive_Expanded then
			HopeLayout_Focus(2)
		end
		HopeQoL_Expanded = false
		HopeRoute_Details = false
		HopeGift_Expanded = false
		HopeRelic_Expanded = false
	end
	return true
end

function HopeArchive_Toggle()
	HopeArchive_OpenFor(DzGetTriggerUIEventPlayer())
end

function HopeArchive_Close()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeArchive_Expanded = false
		DzFrameShow(HopeArchive_Panel, false)
	end
end

function HopeArchive_Legacy()
	local p = DzGetTriggerUIEventPlayer()
	local i = GetPlayerId(p)
	if HopeGift_OpenFor(p) then
		p = nil
		return
	end
	if p == GetLocalPlayer() and i >= 0 and i < 6 then
		HopeArchive_Expanded = false
		DzFrameShow(HopeArchive_Panel, false)
		SelectUnitForPlayerSingle(udg_Cundang_danwei[i + 1], p)
	end
	p = nil
end

function HopeArchive_Buy0()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 0)
end

function HopeArchive_Buy1()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 1)
end

function HopeArchive_Buy2()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 2)
end

function HopeArchive_Buy3()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 3)
end

function HopeArchive_Buy4()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 4)
end

function HopeArchive_Buy5()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 5)
end

function HopeArchive_Buy6()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 6)
end

function HopeArchive_Buy7()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 7)
end

function HopeArchive_Buy8()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 8)
end

function HopeArchive_Buy9()
	HopeArchive_BuyIndex(DzGetTriggerUIEventPlayer(), 9)
end

function HopeArchive_Effect(index, count)
	if index == 4 then
		return "生命 +" .. (I2S(count * 10) or "")
	elseif index == 5 then
		return "魔法 +" .. (I2S(count) or "")
	elseif index == 6 then
		return "开局金币 +" .. (I2S(count * 20) or "")
	elseif index == 7 then
		return "开局木材 +" .. (I2S(count) or "")
	elseif index == 8 then
		return "暴击率 +" .. (I2S(count) or "") .. "%"
	elseif index == 9 then
		return "技能伤害 +" .. (I2S(count) or "") .. "%"
	elseif index == 0 then
		return "攻击 +" .. (I2S(count) or "")
	elseif index == 1 then
		return "力量 +" .. (I2S(count) or "")
	elseif index == 2 then
		return "敏捷 +" .. (I2S(count) or "")
	end
	return "智力 +" .. (I2S(count) or "")
end

function HopeArchive_Refresh()
	local p = GetLocalPlayer()
	local i = GetPlayerId(p)
	local index = 0
	local count = 0
	local price = 0
	local available = false
	local status = ""
	if not HopeArchive_UIReady then
		p = nil
		return
	end
	DzFrameShow(HopeArchive_Panel, HopeArchive_Expanded and not (HopeChoice_HasPending() and not HopeChoice_Hidden))
	if not HopeArchive_Expanded or i < 0 or i >= 6 then
		p = nil
		return
	end
	-- When another major panel opens, respect the newer action instead of covering it.
	if HopeQoL_Expanded or HopeRoute_Details or HopeGift_Expanded or HopeRelic_Expanded then
		HopeArchive_Expanded = false
		DzFrameShow(HopeArchive_Panel, false)
		p = nil
		return
	end
	available = HopeCloud_CanWrite(p) and udg_Cundang_danwei[i + 1] ~= nil
	if available then
		DzFrameSetText(HopeArchive_Heading, "|cffd2b879存档成长|r  ·  积分 " .. (I2S(udg_Wj_jf[i + 1]) or ""))
		status = "累计兑换 " .. (I2S(HopeArchive_Total(p)) or "") .. " / 50 次 · 以下为购买合计加成"
	else
		DzFrameSetText(HopeArchive_Heading, "|cffd2b879存档成长|r  ·  本局积分 " .. (I2S(udg_Wj_jf[i + 1]) or ""))
		status = "|cffffb878云档未就绪，暂不可兑换；数据以平台载入为准|r"
	end
	DzFrameSetText(HopeArchive_Status, status)
	for _ in _loop_() do
		if index >= 10 then break end
		count = HopeArchive_Count(p, index)
		price = HopeArchive_Price(HopeArchive_Ability(index))
		if not available then
			DzFrameSetText(HopeArchive_ProductText[index], "|cffaaaaaa" .. (GetAbilityName(HopeArchive_Ability(index)) or "") .. "  —|r")
			DzFrameSetText(HopeArchive_CountText[index], "待载入 / —")
			DzFrameSetText(HopeArchive_BuyButton[index], "|cff999999未载入|r")
		else
			DzFrameSetText(HopeArchive_ProductText[index], "|cffdedede" .. (HopeArchive_Effect(index, count) or "") .. "|r")
			DzFrameSetText(HopeArchive_CountText[index], "已购 " .. (I2S(count) or "") .. " / 5")
			if count >= 5 then
				DzFrameSetText(HopeArchive_BuyButton[index], "|cff999999已满|r")
			elseif udg_Wj_jf[i + 1] < price then
				DzFrameSetText(HopeArchive_BuyButton[index], "|cffbb9988" .. (I2S(price) or "") .. " · 不足|r")
			else
				DzFrameSetText(HopeArchive_BuyButton[index], "|cffffd27a" .. (I2S(price) or "") .. " 积分|r")
			end
		end
		index = index + 1
	end
	if available then
		DzFrameSetText(HopeArchive_Footer, "本局新购 " .. (I2S(HopeArchive_NewCount(p)) or "") .. " 次；平台结算后下局生效。|n原图基础生命 +10 / 魔法 +1 不计购买。")
	else
		DzFrameSetText(HopeArchive_Footer, "永久数据未载入，当前不显示购买次数和加成。|n礼包抽奖可从上方入口查看；输入 -save 查看存档状态。")
	end
	p = nil
end

function HopeArchive_CreateUI()
	local f = 0
	local index = 0
	local x = 0.009
	local y = -0.06
	HopeArchive_Panel = HopeQoL_Surface("HopeArchivePanel", 0.24, 0.53, 0.34, 0.285)
	if HopeArchive_Panel == 0 then
		return
	end
	HopeArchive_Heading = HopeQoL_Label("HopeArchiveHeading", HopeArchive_Panel, 0.009, -0.008, 0.198, 0.018, "")

	f = HopeQoL_Button("HopeArchiveClose", HopeArchive_Panel, 0.3, -0.007, 0.031, 0.021, "关闭")
	HopeQoL_Bind(f, HopeArchive_Close, false)
	HopeArchive_Status = HopeQoL_Label("HopeArchiveStatus", HopeArchive_Panel, 0.009, -0.034, 0.322, 0.019, "")
	for _ in _loop_() do
		if index >= 10 then break end
		if index == 5 then
			x = 0.175
			y = -0.06
		end
		HopeArchive_ProductText[index] = HopeQoL_Label("HopeArchiveProduct" .. (I2S(index) or ""), HopeArchive_Panel, x, y, 0.155, 0.014, "")
		HopeArchive_CountText[index] = HopeQoL_Label("HopeArchiveCount" .. (I2S(index) or ""), HopeArchive_Panel, x, y - 0.017, 0.073, 0.014, "")
		HopeArchive_BuyButton[index] = HopeQoL_Button("HopeArchiveBuy" .. (I2S(index) or ""), HopeArchive_Panel, x + 0.095, y - 0.014, 0.06, 0.02, "")
		if HopeArchive_ProductText[index] == 0 or HopeArchive_CountText[index] == 0 or HopeArchive_BuyButton[index] == 0 then
			return
		end
		y = y - 0.038
		index = index + 1
	end
	HopeQoL_Bind(HopeArchive_BuyButton[0], HopeArchive_Buy0, true)
	HopeQoL_Bind(HopeArchive_BuyButton[1], HopeArchive_Buy1, true)
	HopeQoL_Bind(HopeArchive_BuyButton[2], HopeArchive_Buy2, true)
	HopeQoL_Bind(HopeArchive_BuyButton[3], HopeArchive_Buy3, true)
	HopeQoL_Bind(HopeArchive_BuyButton[4], HopeArchive_Buy4, true)
	HopeQoL_Bind(HopeArchive_BuyButton[5], HopeArchive_Buy5, true)
	HopeQoL_Bind(HopeArchive_BuyButton[6], HopeArchive_Buy6, true)
	HopeQoL_Bind(HopeArchive_BuyButton[7], HopeArchive_Buy7, true)
	HopeQoL_Bind(HopeArchive_BuyButton[8], HopeArchive_Buy8, true)
	HopeQoL_Bind(HopeArchive_BuyButton[9], HopeArchive_Buy9, true)
	HopeArchive_Footer = HopeQoL_Label("HopeArchiveFooter", HopeArchive_Panel, 0.009, -0.252, 0.322, 0.026, "")
	HopeArchive_UIReady = HopeArchive_Heading ~= 0 and HopeArchive_Status ~= 0 and HopeArchive_Footer ~= 0
	DzFrameShow(HopeArchive_Panel, false)
end

end

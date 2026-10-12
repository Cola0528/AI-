-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeName_Step(s, at)
	local h = StringHash(SubString(s, at, at + 1))
	local n = StringLength(s) - at
	local step = 1
	-- Newer engines normalize incomplete UTF-8 slices; widen only up to one character.
	if h == 1843378377 then
		for _ in _loop_() do
			if step >= 4 or step >= n then break end
			step = step + 1
			if StringHash(SubString(s, at, at + step)) ~= h then break end
		end
		return step
	end
	-- Classic engine hashes byte slices directly. No non-BMP source literals.
	if h == -643770102 or h == 1697315672 or h == 152013319 or h == -1048766234 or h == 1817785734 or h == 1772290269 or h == 224611159 or h == -941949360 or h == -1964233184 or h == -1853905496 or h == -2147421637 or h == -1324312884 or h == -576610362 or h == 1790768057 or h == -2099350373 or h == -1266365587 then
		return IMinBJ(3, n)
	end
	if h == -821046842 or h == 1965576605 or h == 159638553 or h == 1976614787 or h == 172358365 or h == -1487094743 or h == 852857962 or h == -1499360152 or h == 388578373 or h == -466619119 or h == -580057007 or h == -443785825 or h == -635169143 or h == -1421069964 or h == -1232080964 or h == -1195283317 or h == -1145431583 or h == 1065729488 or h == 2057488321 or h == -42326540 or h == 2092530722 or h == 701044297 or h == -2016087502 or h == 50775334 or h == -1236243595 or h == 379765120 or h == 1483819556 or h == 154860577 or h == -1222483548 or h == 847928083 then
		return IMinBJ(2, n)
	end
	if h == 1663769127 or h == 1316854887 or h == -2027516833 or h == 1910426181 or h == 760701047 then
		return IMinBJ(4, n)
	end
	return 1
end

function HopeName_Clean(s)
	local result = ""
	local c = ""
	local n = StringLength(s)
	local at = 0
	local step = 1
	for _ in _loop_() do
		if at >= n then break end
		if SubString(s, at, at + 2) == "|c" and at + 10 <= n then
			at = at + 10
		elseif SubString(s, at, at + 2) == "|r" then
			at = at + 2
		elseif SubString(s, at, at + 2) == "|n" then
			result = (result or "") .. " "
			at = at + 2
		else
			step = HopeName_Step(s, at)
			c = SubString(s, at, at + step)
			result = (result or "") .. (c or "")
			at = at + step
		end
	end
	return result
end

function HopeName_CharWidth(c)
	if StringLength(c) > 1 or c == "W" or c == "M" or c == "w" or c == "m" or c == "@" or c == "%" then
		return 10
	end
	return 7
end

function HopeName_Width(s)
	local at = 0
	local step = 1
	local width = 0
	for _ in _loop_() do
		if at >= StringLength(s) then break end
		step = HopeName_Step(s, at)
		width = width + HopeName_CharWidth(SubString(s, at, at + step))
		at = at + step
	end
	return width
end

function HopeName_Clip(s, limit)
	local at = 0
	local step = 1
	local width = 0
	local next = 0
	if HopeName_Width(s) <= limit then
		return s
	end
	for _ in _loop_() do
		if at >= StringLength(s) then break end
		step = HopeName_Step(s, at)
		next = width + HopeName_CharWidth(SubString(s, at, at + step))
		if next > limit - 10 then break end
		width = next
		at = at + step
	end
	return (SubString(s, 0, at) or "") .. "…"
end

function HopeName_Refresh()
	local i = 0
	local raw = ""
	local active = false
	for _ in _loop_() do
		if i >= 6 then break end
		raw = GetPlayerName(Player(i))
		active = GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING
		if raw ~= HopeName_Raw[i] or active ~= HopeName_Active[i] then
			HopeName_Raw[i] = raw
			HopeName_Plain[i] = HopeName_Clean(raw)
			HopeName_Active[i] = active
			HopeName_Version = HopeName_Version + 1
		end
		i = i + 1
	end
end

function HopeName_Label(p, limit)
	local i = GetPlayerId(p)
	local j = 0
	local key = 0
	local name = ""
	local result = ""
	local suffix = ""
	if i < 0 or i >= 6 then
		return GetPlayerName(p)
	end
	limit = IMaxBJ(36, IMinBJ(120, limit))
	key = i * 128 + limit
	HopeName_Refresh()
	if HopeName_Stamp[key] == HopeName_Version then
		return HopeName_Cached[key]
	end
	name = HopeName_Plain[i]
	if name == "" then
		result = "玩家" .. (I2S(i + 1) or "")
	else
		result = HopeName_Clip(name, limit)
		for _ in _loop_() do
			if j >= 6 then break end
			if j ~= i and HopeName_Active[j] and HopeName_Clip(HopeName_Plain[j], limit) == result then
				suffix = "#" .. (I2S(i + 1) or "")
				if true then break end
			end
			j = j + 1
		end
		if suffix ~= "" then
			result = (HopeName_Clip(name, limit - HopeName_Width(suffix)) or "") .. (suffix or "")
		end
	end
	HopeName_Cached[key] = result
	HopeName_Stamp[key] = HopeName_Version
	return result
end

function HopeEvent_Add(text)
	local a = 0
	local b = 0
	local n = StringLength(text)
	for _ in _loop_() do
		if b > n then break end
		if b == n or SubString(text, b, b + 2) == "|n" then
			if b > a then
				HopeEvent_Line[ModuloInteger(HopeEvent_Count, 512)] = SubString(text, a, b)
				HopeEvent_Count = HopeEvent_Count + 1
			end
			b = b + 2
			a = b
		else
			b = b + 1
		end
	end
end

function HopeEvent_Begin()
	HopeEvent_Sequence = HopeEvent_Sequence + 1
	HopeEvent_Start = HopeEvent_Count
	HopeEvent_Add("|cffd2b879问号事件 #" .. (I2S(HopeEvent_Sequence) or "") .. " · 全队可见|r")
end

function HopeLayout_Place(frame, parent, x, y, w, h)
	if frame == 0 then
		return
	end
	DzFrameClearAllPoints(frame)
	if parent == 0 then
		DzFrameSetAbsolutePoint(frame, 0, x, y)
	else
		DzFrameSetPoint(frame, 0, parent, 0, x, y)
	end
	DzFrameSetSize(frame, w, h)
end

function HopeLayout_Show(frame, show)
	if frame ~= 0 then
		DzFrameShow(frame, show)
	end
end

function HopeLayout_Focus(view)
	if view ~= 1 then
		HopeQoL_Expanded = false
	end
	if view ~= 2 then
		HopeArchive_Expanded = false
	end
	if view ~= 3 then
		HopeGift_Expanded = false
	end
	if view ~= 4 then
		HopeRelic_Expanded = false
	end
	if view ~= 5 then
		HopeJob_Expanded = false
	end
	if view ~= 6 then
		HopeRoute_PickerOpen = false
	end
	if view ~= 7 then
		HopeDraw_Open = false
	end
	if view ~= 9 then
		HopeRoute_Details = false
	end
	if view ~= 14 then
		HopeEvent_Open = false
	end
	if view ~= 15 then
		HopeMeta_Open = false
	end
	if view ~= 16 then
		HopeMarket_Open = false
	end
	HopeChoice_Hidden = true
end

function HopeEvent_Write(p, text, colored)
	local at = 0
	local step = 1
	local width = 0
	local next = 0
	local line = ""
	local c = ""
	for _ in _loop_() do
		if at >= StringLength(text) then break end
		step = HopeName_Step(text, at)
		c = SubString(text, at, at + step)
		next = width + HopeName_CharWidth(c)
		if next > 260 and line ~= "" then
			if colored then
				HopeEvent_Add(HopeUI_PlayerText(p, line))
			else
				HopeEvent_Add(line)
			end
			line = ""
			width = 0
		end
		line = (line or "") .. (c or "")
		width = width + HopeName_CharWidth(c)
		at = at + step
	end
	if line ~= "" then
		if colored then
			HopeEvent_Add(HopeUI_PlayerText(p, line))
		else
			HopeEvent_Add(line)
		end
	end
end

function HopeEvent_Result(p, result)
	HopeEvent_Write(p, (HopeName_Clean(GetPlayerName(p)) or "") .. "：" .. (result or ""), true)
end

function HopeIntent_SetPhase(u, phase)
	if HopeStatus_History ~= nil and u ~= nil and GetUnitTypeId(u) ~= 0 and IsUnitAliveBJ(u) and GetOwningPlayer(u) == Player(11) then
		SaveInteger(HopeStatus_History, GetHandleId(u), 4, phase)
	end
end

function HopeIntent_Number(value)
	if RAbsBJ(value) < 1000000000.0 then
		return I2S(R2I(value))
	end
	return R2SW(value, 1, 0)
end

function HopeIntent_SignedNumber(value)
	if value < 0.0 then
		return HopeIntent_Number(value)
	end
	return "+" .. (HopeIntent_Number(value) or "")
end

function HopeIntent_PlayerLabel(p)
	return HopeName_Label(p, 70)
end

function HopeIntent_Headline(u)
	local kind = LoadStr(YDHT, GetHandleId(u), -1661751302)
	local phase = LoadInteger(HopeStatus_History, GetHandleId(u), 4)
	local target = nil
	local owner = nil
	local name = "未定"
	local text = "|cffb9bec7待定|r"
	local poison = HopeStatus_PoisonTotal(u)
	local fallen = false
	if kind == "1" then
		text = "|cff9dd4b0打断|r"
	elseif phase == 2 then
		-- The original callback is one second after dispatch; delayed spells may remain.
		text = "|cffb9bec7已出手|r"
	elseif kind == "attack" then
		target = LoadUnitHandle(YDHT, GetHandleId(u), -272485038)
		if target ~= nil and GetUnitTypeId(target) ~= 0 then
			owner = GetOwningPlayer(target)
			if owner == GetLocalPlayer() then
				name = "你"
			else
				name = HopeIntent_PlayerLabel(owner)
			end
			fallen = not IsUnitAliveBJ(target)
			name = YDWEGetPlayerColorString(owner, name)
		end
		text = "|cffffce93攻击|r" .. (name or "") .. "|cffffce93(" .. (HopeIntent_Number(RMaxBJ(0.0, LoadReal(YDHT, GetHandleId(u), -1820993401))) or "") .. ")|r"
		if fallen then
			text = (text or "") .. "|cffb9bec7·倒下|r"
		end
	elseif kind == "skill" then
		if phase == 1 then
			text = "|cffe2b6ff施放中|r"
		else
			text = "|cffe2b6ff施法|r"
		end
	elseif kind == "defend" then
		text = "|cff9cdbff防御(DEF" .. (HopeIntent_SignedNumber(LoadReal(YDHT, GetHandleId(u), -1559201479)) or "") .. ")|r"
	elseif kind == "buff" then
		text = "|cffffdc87强化(ATK" .. (HopeIntent_SignedNumber(LoadReal(YDHT, GetHandleId(u), 400320547)) or "") .. ")|r"
	end
	if poison > 0 then
		text = (text or "") .. " · |cff99e5a0毒" .. (I2S(poison) or "") .. "|r"
	end
	target = nil
	owner = nil
	return text
end

function HopeIntent_Release(index)
	if HopeIntent_Tags[index] ~= nil then
		DestroyTextTag(HopeIntent_Tags[index])
	end
	HopeIntent_Tags[index] = nil
	HopeIntent_Units[index] = nil
	HopeIntent_LastText[index] = ""
end

function HopeIntent_Collect()
	local u = GetEnumUnit()
	local i = 1
	local slot = 0
	local tag = nil
	if u ~= nil and GetUnitTypeId(u) ~= 0 and IsUnitAliveBJ(u) and GetOwningPlayer(u) == Player(11) then
		for _ in _loop_() do
			if i > HopeIntent_Count or slot < 0 then break end
			if HopeIntent_Units[i] == u then
				slot =  - i
			elseif HopeIntent_Units[i] == nil and slot == 0 then
				slot = i
			end
			i = i + 1
		end
		if slot < 0 then
			slot =  - slot
		elseif slot == 0 then
			HopeIntent_Count = HopeIntent_Count + 1
			slot = HopeIntent_Count
		end
		HopeIntent_Units[slot] = u
		-- Retry a failed engine allocation on subsequent synchronized ticks.
		if HopeIntent_Tags[slot] == nil then
			tag = CreateTextTag()
			HopeIntent_Tags[slot] = tag
			if tag ~= nil then
				SetTextTagPermanent(tag, true)
				SetTextTagVelocity(tag, 0.0, 0.0)
				SetTextTagVisibility(tag, false)
				SetTextTagColor(tag, 255, 255, 255, 255)
				DzTextTagSetShadowColor(tag, 0)
				HopeIntent_LastText[slot] = ""
			end
		end
	end
	tag = nil
	u = nil
end

function HopeIntent_Place(index)
	local u = HopeIntent_Units[index]
	local tag = HopeIntent_Tags[index]
	local text = ""
	local x = GetUnitX(u)
	local y = GetUnitY(u)
	local dx = 0.0
	local dy = 0.0
	local j = 1
	local lane = 0
	local used0 = false
	local used1 = false
	local used2 = false
	local visible = IsUnitVisible(u, GetLocalPlayer()) and HopeMini_Actor[GetPlayerId(GetLocalPlayer()) + 1] == nil
	HopeIntent_Placed[index] = false
	if tag == nil then
		u = nil
		return
	end
	SetTextTagVisibility(tag, visible)
	if not visible then
		u = nil
		tag = nil
		return
	end
	text = HopeIntent_Headline(u)
	if text ~= HopeIntent_LastText[index] then
		SetTextTagTextBJ(tag, text, 7.0)
		HopeIntent_LastText[index] = text
	end
	-- Only immediate world-space neighbors can reserve a lane. The tag remains
	-- attached even for a very dense summon pile; extra units reuse these lanes.
	for _ in _loop_() do
		if j >= index then break end
		if HopeIntent_Placed[j] then
			dx = x - HopeIntent_X[j]
			dy = y - HopeIntent_Y[j]
			if dx * dx + dy * dy <= 57600.0 then
				if HopeIntent_Lane[j] == 0 then
					used0 = true
				elseif HopeIntent_Lane[j] == 1 then
					used1 = true
				else
					used2 = true
				end
			end
		end
		j = j + 1
	end
	if not used0 then
		lane = 0
	elseif not used1 then
		lane = 1
	elseif not used2 then
		lane = 2
	else
		lane = ModuloInteger(index - 1, 3)
	end
	HopeIntent_X[index] = x
	HopeIntent_Y[index] = y
	HopeIntent_Lane[index] = lane
	HopeIntent_Placed[index] = true
	SetTextTagPosUnit(tag, u, 70.0 + 24.0 * I2R(lane))
	tag = nil
	u = nil
end

function HopeIntent_RefreshAll()
	local i = 1
	local combat = udg_ZhandouZhong and udg_Guaiwu_dwz ~= nil
	-- Everything through collection is synchronized, including hidden enemies.
	for _ in _loop_() do
		if i > HopeIntent_Count then break end
		if HopeIntent_Units[i] ~= nil then
			if not combat or GetUnitTypeId(HopeIntent_Units[i]) == 0 or not IsUnitAliveBJ(HopeIntent_Units[i]) or GetOwningPlayer(HopeIntent_Units[i]) ~= Player(11) or not IsUnitInGroup(HopeIntent_Units[i], udg_Guaiwu_dwz) then
				HopeIntent_Release(i)
			end
		end
		HopeIntent_Placed[i] = false
		i = i + 1
	end
	if combat then
		ForGroup(udg_Guaiwu_dwz, HopeIntent_Collect)
	end
	for _ in _loop_() do
		if HopeIntent_Count <= 0 or HopeIntent_Units[HopeIntent_Count] ~= nil then break end
		HopeIntent_Count = HopeIntent_Count - 1
	end
	i = 1
	for _ in _loop_() do
		if i > HopeIntent_Count then break end
		if HopeIntent_Units[i] ~= nil then
			HopeIntent_Place(i)
		end
		i = i + 1
	end
end

function HopeIntent_Select(p, u)
	if p == GetLocalPlayer() then
		HopeIntent_Selected = u
	end
end

function HopeIntent_Description(u)
	local kind = LoadStr(YDHT, GetHandleId(u), -1661751302)
	local target = nil
	local text = "下次行动尚未公布"
	if kind == "1" then
		text = "|cff80ef90行动已被打断|r"
	elseif LoadInteger(HopeStatus_History, GetHandleId(u), 4) == 2 then
		text = "行动已发出，等待下一轮预告"
	elseif kind == "attack" then
		target = LoadUnitHandle(YDHT, GetHandleId(u), -272485038)
		text = "|cffffb080攻击|r"
		if target ~= nil and GetUnitTypeId(target) ~= 0 then
			if GetOwningPlayer(target) == GetLocalPlayer() then
				text = (text or "") .. " → 你"
			else
				text = (text or "") .. " → " .. (HopeIntent_PlayerLabel(GetOwningPlayer(target)) or "")
			end
		else
			text = (text or "") .. " → 目标未定"
		end
		text = (text or "") .. "|n基础伤害 " .. (HopeIntent_Number(RMaxBJ(0.0, LoadReal(YDHT, GetHandleId(u), -1820993401))) or "") .. " · 减伤前"
	elseif kind == "defend" then
		text = "|cff80caff防御|r · 护甲 DEF" .. (HopeIntent_SignedNumber(LoadReal(YDHT, GetHandleId(u), -1559201479)) or "")
	elseif kind == "buff" then
		text = "|cffffd060强化|r · 攻击 ATK" .. (HopeIntent_SignedNumber(LoadReal(YDHT, GetHandleId(u), 400320547)) or "")
	elseif kind == "skill" then
		text = "|cffdbadff施法|r · " .. (LoadStr(YDHT, GetUnitTypeId(u), 715936045) or "")
	end
	target = nil
	return text
end

function HopeModern_Message(d, text)
	SaveStr(HopeModern_Data, GetHandleId(d), 100, text)
end

function HopeModern_Add(d, text)
	local h = GetHandleId(d)
	local n = LoadInteger(HopeModern_Data, h, 0) + 1
	bj_lastCreatedButton = DialogAddButton(d, text, 0)
	SaveInteger(HopeModern_Data, h, 0, n)
	SaveButtonHandle(HopeModern_Data, h, 200 + n, bj_lastCreatedButton)
	SaveStr(HopeModern_Data, h, n, text)
end

function HopeModern_Clear(d)
	FlushChildHashtable(HopeModern_Data, GetHandleId(d))
	DialogClear(d)
end

function HopeModern_NativeDisplay(p, d, show)
-- No native modal is displayed. Shared lifecycle remains in HopeChoice.
end

function HopeModern_GetPlayer()
	if HopeModern_Dispatching then
		return HopeModern_Player
	end
	return GetTriggerPlayer()
end

function HopeModern_GetDialog()
	if HopeModern_Dispatching then
		return HopeModern_Dialog
	end
	return GetClickedDialogBJ()
end

function HopeModern_GetButton()
	if HopeModern_Dispatching then
		return HopeModern_Button
	end
	return GetClickedButtonBJ()
end

function HopeQoL_Button(name, parent, x, y, w, h, value)
	local f = 0
	local textFrame = 0
	local art = 0
	local custom = true
	if parent == 0 then
		return 0
	end
	HopeQoL_ButtonIndex = HopeQoL_ButtonIndex + 1
	-- Instantiate the complete blueprint: inherited-by-tag creation can lose
	-- functional child names, so it cannot verify or configure the button's art.
	f = DzCreateFrame("HopeActionButton", parent, HopeQoL_ButtonIndex)
	if f == 0 then
		custom = false
		-- The fallback also avoids direct blueprint creation. Its generic frame can
		-- still carry text and the existing synchronized action if templates fail.
		f = DzCreateFrameByTagName("GLUETEXTBUTTON", name, parent, "ScriptDialogButton", HopeQoL_ButtonIndex)
		HopeQoL_UIFallbacks = HopeQoL_UIFallbacks + 1
	end
	if f == 0 then
		return 0
	end
	if parent == DzGetGameUI() then
		DzFrameSetAbsolutePoint(f, 0, x, y)
	else
		DzFrameSetPoint(f, 0, parent, 0, x, y)
	end
	DzFrameSetSize(f, w, h)
	DzFrameSetFont(f, "Fonts\\ZiTi.ttf", 0.009, 0)
	DzFrameSetText(f, value)
	textFrame = DzFrameFindByName("HopeActionButtonText", HopeQoL_ButtonIndex)
	if not custom then
		textFrame = DzFrameFindByName("ScriptDialogButtonText", HopeQoL_ButtonIndex)
	end
	if textFrame ~= 0 then
		DzFrameSetFont(textFrame, "Fonts\\ZiTi.ttf", 0.009, 0)
	end
	if custom then
		art = DzFrameFindByName("HopeActionButtonNormal", HopeQoL_ButtonIndex)
		if art ~= 0 then
			DzFrameSetTexture(art, "HopeUI\\button-normal.blp", 0)
		end
		art = DzFrameFindByName("HopeActionButtonDown", HopeQoL_ButtonIndex)
		if art ~= 0 then
			DzFrameSetTexture(art, "HopeUI\\button-down.blp", 0)
		end
		art = DzFrameFindByName("HopeActionButtonDisabled", HopeQoL_ButtonIndex)
		if art ~= 0 then
			DzFrameSetTexture(art, "HopeUI\\button-disabled.blp", 0)
		end
		art = DzFrameFindByName("HopeActionButtonDisabledDown", HopeQoL_ButtonIndex)
		if art ~= 0 then
			DzFrameSetTexture(art, "HopeUI\\button-disabled.blp", 0)
		end
	end
	DzFrameShow(f, true)
	return f
end

function HopeQoL_SelectHero()
	local u = udg_hero[GetPlayerId(GetLocalPlayer()) + 1]
	if HopeMini_Actor[GetPlayerId(GetLocalPlayer()) + 1] ~= nil then
		HopeMini_Focus(GetLocalPlayer())
		u = nil
		return
	end
	if u ~= nil then
		HopeCamera_FocusUnit(GetLocalPlayer(), u, LoadBoolean(YDHT, GetHandleId(u), 2039566794))
	end
	u = nil
end

function HopeQoL_SelectBag()
	local u = udg_Bei_bao_danwei[GetPlayerId(GetLocalPlayer()) + 1]
	if u ~= nil then
		HopeCamera_FocusUnit(GetLocalPlayer(), u, false)
	end
	u = nil
end

function HopeQoL_ToggleStats()
	if not HopeQoL_UIReady then
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 8.0, "属性窗体尚未就绪；稍后按 F4 重试，输入 -ui 查看状态。")
		return
	end
	HopeQoL_Expanded = not HopeQoL_Expanded
	if HopeQoL_Expanded then
		HopeLayout_Focus(1)
	end
	if HopeGrowth_Pending[GetPlayerId(GetLocalPlayer())] then
		HopeChoice_Hidden = true
	end
	HopeArchive_Expanded = false
	HopeGift_Expanded = false
	HopeRelic_Expanded = false
	HopeRoute_Details = false
end

function HopeQoL_CloseStats()
	HopeQoL_Expanded = false
end

function HopeQoL_ToggleHud()
	HopeQoL_Visible = not HopeQoL_Visible
end

function HopeIntent_Close()
	HopeIntent_Selected = nil
end

function HopeQoL_Slots(u)
	local i = 0
	local n = 0
	if u == nil then
		return 0
	end
	for _ in _loop_() do
		if i >= 6 then break end
		if UnitItemInSlot(u, i) ~= nil then
			n = n + 1
		end
		i = i + 1
	end
	return n
end

function HopeQoL_Number(r)
	return R2SW(r, 1, 1)
end

function HopeQoL_Growth(r)
	return R2SW(r, 1, 2)
end

function HopeQoL_GrowthGrade(r, life)
	if life and r <= 3.0 or not life and r <= 0.9 then
		return "|cffaaaaaaE|r"
	elseif life and r <= 4.0 or not life and r <= 1.2 then
		return "|cfff1f1f1D|r"
	elseif life and r <= 5.0 or not life and r <= 1.6 then
		return "|cff80ef90C|r"
	elseif life and r <= 6.0 or not life and r <= 2.0 then
		return "|cff89c8ffB|r"
	elseif life and r <= 7.0 or not life and r <= 2.4 then
		return "|cffff9696A|r"
	elseif life and r <= 9.0 or not life and r <= 2.8 then
		return "|cffffc060S|r"
	end
	return "|cffffe066EX|r"
end

function HopeQoL_GradedGrowth(r, life)
	return (HopeQoL_Growth(r) or "") .. " " .. (HopeQoL_GrowthGrade(r, life) or "")
end

function HopeQoL_CompactNumber(r)
	if r == I2R(R2I(r)) then
		return I2S(R2I(r))
	end
	return HopeQoL_Number(r)
end

function HopeQoL_RefreshLegacyAP()
	local p = GetPlayerId(GetLocalPlayer()) + 1
	if p >= 1 and p <= 6 and udg_xingdongdian_xs[p] ~= 0 then
		DzFrameSetText(udg_xingdongdian_xs[p], "行动点：" .. (I2S(udg_xingdong_dian[p]) or "") .. "/" .. (I2S(udg_xingdong_dianSx[p]) or ""))
		DzFrameShow(udg_xingdongdian_xs[p], not HopeQoL_UIReady)
	end
end

function HopeTeam_UpdateAP()
	local i = 1
	local u = nil
	local s = ""
	local show = false
	for _ in _loop_() do
		if i > 6 then break end
		u = udg_hero[i]
		show = udg_ZhandouZhong and HopeRoute_Active(i - 1) and Player(i - 1) ~= GetLocalPlayer() and u ~= nil and IsUnitAliveBJ(u) and IsUnitVisible(u, GetLocalPlayer()) and HopeMini_Actor[i] == nil
		SetTextTagVisibility(HopeTeam_APTag[i], show)
		if show then
			if IsPlayerInForce(Player(i - 1), udg_WJZ_______weizhunbei) then
				s = "行动 " .. (I2S(udg_xingdong_dian[i]) or "") .. "/" .. (I2S(udg_xingdong_dianSx[i]) or "")
				if IsUnitPaused(u) then
					s = (s or "") .. " · 进行中"
				end
				if udg_xingdong_dian[i] > 0 then
					SetTextTagColor(HopeTeam_APTag[i], 140, 240, 155, 255)
				else
					SetTextTagColor(HopeTeam_APTag[i], 255, 210, 105, 255)
				end
			elseif HopeTurn_Waiting() > 0 then
				s = "已结束"
				SetTextTagColor(HopeTeam_APTag[i], 180, 180, 180, 255)
			else
				s = "等待下回合"
				SetTextTagColor(HopeTeam_APTag[i], 180, 180, 180, 255)
			end
			SetTextTagTextBJ(HopeTeam_APTag[i], (HopeIntent_PlayerLabel(Player(i - 1)) or "") .. " · " .. (s or ""), 5.5)
			SetTextTagPosUnit(HopeTeam_APTag[i], u, 105.0)
		end
		i = i + 1
	end
	u = nil
end

function HopeIntent_UpdateUI()
	local u = HopeIntent_Selected
	local show = udg_ZhandouZhong and not HopeQoL_Expanded and not HopeArchive_Expanded and not HopeGift_Expanded and not HopeRelic_Expanded and HopeMini_Actor[GetPlayerId(GetLocalPlayer()) + 1] == nil and u ~= nil and IsUnitAliveBJ(u) and IsUnitVisible(u, GetLocalPlayer()) and IsUnitSelected(u, GetLocalPlayer())
	local status = ""
	local line = ""
	local lines = 0
	if HopeIntent_Panel == 0 then
		u = nil
		return
	end
	DzFrameShow(HopeIntent_Panel, show)
	if show then
		if HopeIntent_Title ~= 0 then
			if LoadInteger(HopeStatus_History, GetHandleId(u), 4) == 0 then
				DzFrameSetText(HopeIntent_Title, "|cffd2b879" .. (GetUnitName(u) or "") .. " · 下次行动|r")
			else
				DzFrameSetText(HopeIntent_Title, "|cffd2b879" .. (GetUnitName(u) or "") .. " · 当前行动|r")
			end
		end
		if HopeIntent_Text ~= 0 then
			DzFrameSetText(HopeIntent_Text, HopeIntent_Description(u))
		end
		if HopeIntent_Status ~= 0 then
			status = HopeStatus_PoisonDetails(u, GetLocalPlayer())
			if status ~= "" then
				lines = 1
			end
			line = HopeStatus_PoisonPreviewLine(u)
			if line ~= "" then
				if lines > 0 then
					status = (status or "") .. "|n"
				end
				status = (status or "") .. (line or "")
				lines = lines + 1
			end
			line = HopeStatus_PoisonLastLine(u)
			if line ~= "" then
				if lines > 0 then
					status = (status or "") .. "|n"
				end
				status = (status or "") .. (line or "")
				lines = lines + 1
			end
			line = HopeDebuff_Details(u)
			if line ~= "" then
				if lines > 0 then
					status = (status or "") .. "|n"
				end
				status = (status or "") .. (line or "")
				lines = lines + HopeDebuff_Lines(u)
			end
			DzFrameShow(HopeIntent_Status, lines > 0)
			if lines > 0 then
				DzFrameSetText(HopeIntent_Status, status)
				DzFrameSetSize(HopeIntent_Status, 0.208, 0.0128 * I2R(lines))
				DzFrameSetSize(HopeIntent_Panel, 0.224, 0.056 + 0.0128 * I2R(lines))
			else
				DzFrameSetSize(HopeIntent_Panel, 0.224, 0.052)
			end
		end
	end
	u = nil
end

function HopeQoL_BarValue(fill, current, maximum)
	local ratio = 0.0
	if fill == 0 then
		return
	end
	if maximum > 0.0 then
		ratio = RMaxBJ(0.0, RMinBJ(1.0, current / maximum))
	end
	DzFrameShow(fill, ratio > 0.0)
	DzFrameSetSize(fill, 0.12 * RMaxBJ(0.001, ratio), 0.003)
end

function HopeQoL_Label(name, parent, x, y, w, h, value)
	local f = 0
	if parent == 0 then
		return 0
	end
	f = DzCreateFrameByTagName("TEXT", name, parent, "HopePassText", 0)
	if f == 0 then
		return 0
	end
	-- No template-only creation: text remains independent of a loaded blueprint.
	DzFrameSetPoint(f, 0, parent, 0, x, y)
	DzFrameSetSize(f, w, h)
	DzFrameSetFont(f, "Fonts\\ZiTi.ttf", 0.0095, 0)
	DzFrameSetText(f, value)
	DzFrameShow(f, true)
	return f
end

function HopeQoL_Edge(name, parent, first, second, horizontal)
	local f = DzCreateFrameByTagName("BACKDROP", name, parent, "HopePassBackdrop", 0)
	if f == 0 then
		return
	end
	DzFrameSetTexture(f, "HopeUI\\focus-fill.blp", 0)
	DzFrameSetAlpha(f, 115)
	DzFrameSetPoint(f, first, parent, first, 0.0, 0.0)
	DzFrameSetPoint(f, second, parent, second, 0.0, 0.0)
	if horizontal then
		DzFrameSetSize(f, 0.0, 0.00055)
	else
		DzFrameSetSize(f, 0.00055, 0.0)
	end
end

function HopeQoL_Surface(name, x, y, w, h)
	local parent = 0
	local background = 0
	-- Critical parents must not depend on DzLoadToc or blueprint lookup success.
	parent = DzCreateFrameByTagName("FRAME", name, DzGetGameUI(), "HopePassFrame", 0)
	if parent == 0 then
		return 0
	end
	background = DzCreateFrameByTagName("BACKDROP", (name or "") .. "Background", parent, "HopePassBackdrop", 0)
	DzFrameSetAbsolutePoint(parent, 0, x, y)
	DzFrameSetSize(parent, w, h)
	if background ~= 0 then
		DzFrameSetAllPoints(background, parent)
		-- This exact built-in texture is used by the reference map's actual console.
		-- Avoid the old custom JPEG's YCbCr/BGRA color interpretation entirely.
		DzFrameSetTexture(background, "Textures\\Black32.blp", 0)
		DzFrameSetAlpha(background, 220)
		DzFrameShow(background, true)
	end
	HopeQoL_Edge((name or "") .. "Top", parent, 0, 2, true)
	HopeQoL_Edge((name or "") .. "Bottom", parent, 6, 8, true)
	HopeQoL_Edge((name or "") .. "Left", parent, 0, 6, false)
	HopeQoL_Edge((name or "") .. "Right", parent, 2, 8, false)
	-- A partially constructed UI must never leave an empty blocker over the map.
	-- The state refresh shows each completed panel only when it is needed.
	DzFrameShow(parent, false)
	return parent
end

function HopeQoL_Fill(name, parent, x, y, texture)
	local track = 0
	local fill = 0
	if parent == 0 then
		return 0
	end
	track = DzCreateFrameByTagName("BACKDROP", (name or "") .. "Track", parent, "HopePassBackdrop", 0)
	fill = DzCreateFrameByTagName("BACKDROP", name, parent, "HopePassBackdrop", 0)
	if track ~= 0 then
		DzFrameSetPoint(track, 0, parent, 0, x, y)
		DzFrameSetSize(track, 0.12, 0.003)
		DzFrameSetTexture(track, "HopeUI\\bar-track.blp", 0)
	end
	if fill ~= 0 then
		DzFrameSetPoint(fill, 0, parent, 0, x, y)
		DzFrameSetSize(fill, 0.12, 0.003)
		DzFrameSetTexture(fill, texture, 0)
	end
	return fill
end

function HopeQoL_Bind(frame, action, sync)
	if frame ~= 0 then
		DzFrameSetScriptByCode(frame, 1, action, sync)
	end
end

function HopeEvent_Refresh()
	local text = ""
	local j = 0
	if HopeEvent_Panel == 0 then
		return
	end
	if HopeEvent_Seen ~= HopeEvent_Sequence then
		HopeEvent_Seen = HopeEvent_Sequence
		HopeEvent_Offset = HopeEvent_Start
		HopeEvent_Open = true
		HopeLayout_Focus(14)
	end
	j = IMaxBJ(IMaxBJ(0, HopeEvent_Count - 512), HopeEvent_Offset)
	for _ in _loop_() do
		if j >= HopeEvent_Count or j >= HopeEvent_Offset + 13 then break end
		if text ~= "" then
			text = (text or "") .. "|n"
		end
		text = (text or "") .. (HopeEvent_Line[ModuloInteger(j, 512)] or "")
		j = j + 1
	end
	DzFrameSetText(HopeEvent_Body, text)
	DzFrameSetText(HopeEvent_Status, "各自关闭 · " .. (I2S(HopeEvent_Offset + 1) or "") .. "-" .. (I2S(j) or "") .. "/" .. (I2S(HopeEvent_Count) or "") .. "行")
end

function HopeLayout_Mode()
	local owner = GetPlayerId(GetLocalPlayer())
	local i = 1
	if HopeMeta_Open then
		return 15
	end
	if HopeMarket_Open then
		return 16
	end
	if HopeRoute_Assigning then
		return 10
	end
	if not HopeChoice_Hidden then
		if HopeGrowth_Pending[owner] then
			return 11
		end
		if HopeChoice_LootPending() then
			return 12
		end
		for _ in _loop_() do
			if i > HopeChoice_DialogCount then break end
			if HopeChoice_DialogPending[i] and HopeChoice_Owner[i] == owner then
				return 13
			end
			i = i + 1
		end
	end
	if HopeEvent_Open then
		return 14
	end
	if HopeQoL_Expanded then
		return 1
	elseif HopeArchive_Expanded then
		return 2
	elseif HopeGift_Expanded then
		return 3
	elseif HopeRelic_Expanded then
		return 4
	elseif HopeJob_Expanded then
		return 5
	elseif HopeRoute_PickerOpen and not udg_ZhandouZhong and HopeRoute_AvailableCount > 0 then
		return 6
	elseif HopeDraw_Open then
		return 7
	elseif HopeRoute_Details and HopeRoute_Valid() then
		return 9
	end
	return 0
end

function HopeLayout_Apply()
	local mode = 0
	local owner = GetPlayerId(GetLocalPlayer())
	local i = 1
	local newest = 0
	local active = owner >= 0 and owner < 6 and udg_hero[owner + 1] ~= nil
	local dock = active and mode < 10
	HopeEvent_Refresh()
	mode = HopeLayout_Mode()
	dock = active and mode < 10
	HopeLayout_Show(HopeEvent_Panel, mode == 14)
	HopeLayout_Show(HopeEvent_Button, dock and HopeEvent_Count > 0)
	HopeLayout_Show(HopeQoL_StatsButton, dock)
	HopeLayout_Show(HopeLayout_Save, dock)
	HopeLayout_Show(HopeLayout_Relic, dock)
	HopeLayout_Show(HopeGift_OpenButton, dock)
	HopeLayout_Show(HopeLayout_History, dock)
	HopeLayout_Show(HopeLayout_Route, dock and not udg_ZhandouZhong)
	HopeLayout_Show(HopeQoL_Panel, mode == 1 and active)
	HopeLayout_Show(HopeArchive_Panel, mode == 2 and HopeArchive_UIReady)
	HopeLayout_Show(HopeGift_Panel, mode == 3 and HopeGift_UIReady)
	HopeLayout_Show(HopeRelic_Panel, mode == 4 and HopeRelic_UIReady)
	HopeLayout_Show(HopeJob_Panel, mode == 5)
	HopeLayout_Show(HopeRoute_Picker, mode == 6)
	HopeLayout_Show(HopeDraw_Panel, mode == 7)
	HopeLayout_Show(HopeRoute_InfoPanel, mode == 9)
	HopeLayout_Show(HopeRoute_AssignPanel, mode == 10 and owner == HopeRoute_Host())
	HopeLayout_Show(HopeGrowth_Panel, mode == 11 and HopeGrowth_UIReady)
	HopeLayout_Show(udg_UI_sg[1], mode == 12)
	for _ in _loop_() do
		if i > HopeChoice_DialogCount then break end
		if HopeChoice_DialogPending[i] and HopeChoice_Owner[i] == owner then
			newest = i
		end
		i = i + 1
	end
	i = 1
	for _ in _loop_() do
		if i > 13 then break end
		HopeLayout_Show(HopeModern_Panel[i], mode == 13 and i == newest)
		i = i + 1
	end
	-- Passive readouts yield to overlays, rather than covering their content.
	HopeLayout_Show(HopeDamage_Panel, mode == 0 and active)
	if mode ~= 0 then
		HopeLayout_Show(HopeIntent_Panel, false)
		HopeLayout_Show(HopeTurn_Panel, false)
		HopeLayout_Show(HopeJob_OpenButton, false)
	end
end

function HopeQoL_RefreshContent()
	local p = GetPlayerId(GetLocalPlayer()) + 1
	local u = udg_hero[p]
	local armor = 0.0
	local lo = 0
	local hi = 0
	local focus = ""
	local detail = ""
	local reduction = ""
	local active = u ~= nil and p <= 6
	local picking = HopeChoice_HasPending() and not HopeChoice_Hidden
	local actor = u
	HopeQoL_RefreshLegacyAP()
	HopeTeam_UpdateAP()
	HopeIntent_RefreshAll()
	HopeSkill_Refresh()
	HopeChoice_Refresh()
	HopeGrowth_Refresh()
	HopeArchive_Refresh()
	HopeGift_Refresh()
	HopeRelic_Refresh()
	if not HopeQoL_UIReady then
		u = nil
		actor = nil
		return
	end
	HopeRoute_UpdateUI()
	HopeTurn_UpdateUI()
	HopeIntent_UpdateUI()
	-- The leftmost reward card overlaps this corner. Temporarily yield to the original choice UI.
	DzFrameShow(HopeQoL_Hud, active and HopeQoL_Visible and not picking)
	DzFrameShow(HopeQoL_Restore, active and not HopeQoL_Visible and not picking)
	DzFrameShow(HopeQoL_Panel, active and HopeQoL_Expanded and not HopeArchive_Expanded and not HopeGift_Expanded and not HopeRelic_Expanded and not picking)
	DzFrameShow(HopeQoL_StatsButton, active and not picking)
	DzFrameShow(HopeGift_OpenButton, active and not picking)
	if active then
		if LoadBoolean(YDHT, GetHandleId(u), 149034428) then
			focus = "|cffffd060精确打击就绪|r"
		elseif udg_zhuanzhuzhi_sy[p] >= 3.0 then
			focus = "|cff80ef90F 启用专注|r"
		else
			focus = "|cffaaaaaa专注不足 3|r"
		end
		DzFrameSetText(HopeQoL_Resources, "|cffd2b879行动 " .. (I2S(udg_xingdong_dian[p]) or "") .. "/" .. (I2S(udg_xingdong_dianSx[p]) or "") .. "|r  专注 " .. (HopeQoL_CompactNumber(udg_zhuanzhuzhi_sy[p]) or "") .. "/" .. (HopeQoL_CompactNumber(udg_DEX[p]) or ""))
		detail = HopeProfession_Text(u, p)
		if detail ~= "" then
			focus = detail
		end
		DzFrameSetText(HopeQoL_Status, (focus or "") .. "|n|cffaaaaaa背包 " .. (I2S(HopeQoL_Slots(u)) or "") .. "/6 · 助手 " .. (I2S(HopeQoL_Slots(udg_Bei_bao_danwei[p])) or "") .. "/6|r")
		if HopeMini_Actor[p] ~= nil then
			actor = HopeMini_Actor[p]
			DzFrameSetText(HopeQoL_Resources, "|cffd2b879小游戏角色|r")
			DzFrameSetText(HopeQoL_Status, "F3 重新定位小游戏角色|n剩余时间见游戏计时器")
		end
		DzFrameSetText(HopeQoL_LifeText, "|cff68b99a生命 " .. (I2S(R2I(GetUnitState(actor, UNIT_STATE_LIFE))) or "") .. "/" .. (I2S(R2I(GetUnitState(actor, UNIT_STATE_MAX_LIFE))) or "") .. "|r")
		DzFrameSetText(HopeQoL_ManaText, "|cff76a7d0魔法 " .. (I2S(R2I(GetUnitState(actor, UNIT_STATE_MANA))) or "") .. "/" .. (I2S(R2I(GetUnitState(actor, UNIT_STATE_MAX_MANA))) or "") .. "|r")
		HopeQoL_BarValue(HopeQoL_LifeFill, GetUnitState(actor, UNIT_STATE_LIFE), GetUnitState(actor, UNIT_STATE_MAX_LIFE))
		HopeQoL_BarValue(HopeQoL_ManaFill, GetUnitState(actor, UNIT_STATE_MANA), GetUnitState(actor, UNIT_STATE_MAX_MANA))
		if HopeQoL_Expanded then
			armor = GetUnitState(u, ConvertUnitState(32))
			if armor >= 0.0 then
				reduction = "护甲减伤 " .. (HopeQoL_Number(100.0 * (0.04 * armor) / (1.0 + 0.04 * armor)) or "") .. "%"
			else
				reduction = "负护甲：承受额外物理伤害"
			end
			hi = 120 + GetHeroStr(u, true)
			lo = IMinBJ(hi, 90 + _idiv_(GetHeroAgi(u, true), 2))
			detail = "|cffd2b879战斗属性|r|n"
			detail = (detail or "") .. "攻击基值  " .. (HopeQoL_Number(GetUnitState(u, ConvertUnitState(20))) or "") .. "|n平砍浮动  " .. (I2S(lo) or "") .. "-" .. (I2S(hi) or "") .. "%|n"
			detail = (detail or "") .. "护甲  " .. (HopeQoL_Number(armor) or "") .. "|n" .. (reduction or "") .. "|n"
			detail = (detail or "") .. "暴击率  " .. (I2S(udg_Baoji_Lv[p]) or "") .. "%|n暴击伤害  " .. (HopeQoL_Number(100.0 * udg_Baoji_Damage[p]) or "") .. "%|n"
			detail = (detail or "") .. "法术 / 技能  " .. (HopeQoL_Number(100.0 * udg_Fashang_Dm[p]) or "") .. "% / " .. (HopeQoL_Number(100.0 * udg_Skill_Dm[p]) or "") .. "%|n"
			detail = (detail or "") .. "精确打击  " .. (HopeQoL_Number(100.0 * udg_jingque_Daji_jiacheng[p]) or "") .. "%|n最终伤害  " .. (HopeQoL_Number(100.0 * udg_Zuizhong_Dm[p]) or "") .. "%|n"
			detail = (detail or "") .. "回合结束加甲  " .. (HopeQoL_Number(udg_Defend_HUIHE[p]) or "") .. "|n防御动作额外护甲  " .. (HopeQoL_Number(udg_Defend_fangyu[p]) or "")
			DzFrameSetText(HopeQoL_Details, detail)
			detail = "|cffd2b879基础属性 · Lv." .. (I2S(GetHeroLevel(u)) or "") .. "|r|n"
			detail = (detail or "") .. "力量 " .. (I2S(GetHeroStr(u, true)) or "") .. "  敏捷 " .. (I2S(GetHeroAgi(u, true)) or "") .. "  智力 " .. (I2S(GetHeroInt(u, true)) or "") .. "|n"
			detail = (detail or "") .. "三围总和  " .. (I2S(GetHeroStr(u, true) + GetHeroAgi(u, true) + GetHeroInt(u, true)) or "") .. "|n专注上限  " .. (HopeQoL_Number(udg_DEX[p]) or "") .. "|n|n"
			detail = (detail or "") .. "|cffd2b879每级成长|r|n力量  +" .. (HopeQoL_GradedGrowth(udg_cz1Str_up[p], false) or "") .. "|n敏捷  +" .. (HopeQoL_GradedGrowth(udg_cz2Agi_up[p], false) or "") .. "|n智力  +" .. (HopeQoL_GradedGrowth(udg_cz3Int_up[p], false) or "") .. "|n"
			detail = (detail or "") .. "生命  +" .. (HopeQoL_GradedGrowth(udg_cz4Hp_up[p], true) or "") .. "|n魔力  +" .. (HopeQoL_GradedGrowth(udg_cz5Mp_up[p], false) or "") .. "|n专注  +" .. (HopeQoL_GradedGrowth(udg_cz6Dex_up[p], false) or "")
			DzFrameSetText(HopeQoL_GrowthDetails, detail)
		end
	end
	u = nil
	actor = nil
end

function HopeQoL_Refresh()
	HopeQoL_RefreshContent()
	HopeLayout_Apply()
end

function HopeQoL_LoadUIResources()
	DestroyTimer(GetExpiredTimer())
	HopeQoL_UIResources = "加载中"
	DzLoadToc("HopeUI\\modern-ui.toc")
	HopeQoL_UIResources = "加载调用已返回"
end

function HopeQoL_CreateUI()
	local f = 0
	DestroyTimer(GetExpiredTimer())
	HopeQoL_UIPhase = "创建基础容器"
	HopeQoL_Hud = HopeQoL_Surface("HopeQoLHud", 0.014, 0.5, 0.134, 0.117)
	if HopeQoL_Hud == 0 then
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15.0, "基础界面创建失败；输入 -ui 查看状态。原生技能、装备及快捷操作保留。")
		return
	end
	-- UI load success must never change synchronized trigger/timer/tag allocation.
	HopeQoL_Modern = HopeQoL_Hud ~= 0
	HopeConsole_Init()
	HopeRoute_Panel = HopeQoL_Surface("HopeRoutePanel", 0.014, 0.375, 0.134, 0.1)
	HopeRoute_InfoPanel = HopeQoL_Surface("HopeRouteInfoPanel", 0.164, 0.445, 0.266, 0.25)
	HopeTurn_Panel = HopeQoL_Surface("HopeTurnPanel", 0.29, 0.232, 0.132, 0.068)
	HopeQoL_Panel = HopeQoL_Surface("HopeQoLPanel", 0.24, 0.53, 0.34, 0.285)
	HopeIntent_Panel = HopeQoL_Surface("HopeIntentPanel", 0.28, 0.53, 0.224, 0.052)
	if HopeRoute_Panel == 0 or HopeRoute_InfoPanel == 0 or HopeTurn_Panel == 0 or HopeQoL_Panel == 0 or HopeIntent_Panel == 0 then
		HopeQoL_UIPhase = "部分容器缺失；使用原生操作"
		return
	end
	HopeRoute_TitleText = HopeQoL_Label("HopeRouteTitle", HopeRoute_Panel, 0.007, -0.007, 0.12, 0.014, "")
	HopeRoute_Text = HopeQoL_Label("HopeRouteText", HopeRoute_Panel, 0.007, -0.052, 0.12, 0.036, "")
	f = HopeQoL_Label("HopeRouteInfoTitle", HopeRoute_InfoPanel, 0.012, -0.01, 0.242, 0.017, "|cffd2b879关卡说明|r")
	HopeRoute_DescriptionText = HopeQoL_Label("HopeRouteDescription", HopeRoute_InfoPanel, 0.012, -0.039, 0.242, 0.199, "")
	DzFrameShow(HopeRoute_InfoPanel, false)
	f = HopeQoL_Button("HopeRouteReady", HopeRoute_Panel, 0.007, -0.023, 0.077, 0.025, "准备出发")
	HopeRoute_ReadyButton = f
	HopeQoL_Bind(f, HopeRoute_ReadyClick, true)
	f = HopeQoL_Button("HopeRouteWait", HopeRoute_Panel, 0.007, -0.023, 0.077, 0.025, "已准备 · 取消")
	HopeRoute_WaitButton = f
	HopeQoL_Bind(f, HopeRoute_WaitClick, true)
	f = HopeQoL_Button("HopeRouteInfo", HopeRoute_Panel, 0.089, -0.025, 0.038, 0.022, "说明")
	HopeQoL_Bind(f, HopeRoute_ToggleDetails, false)
	DzFrameShow(HopeRoute_Panel, false)
	HopeQoL_UIPhase = "创建状态文字"
	HopeQoL_LifeText = HopeQoL_Label("HopeQoLLife", HopeQoL_Hud, 0.007, -0.006, 0.12, 0.013, "")
	HopeQoL_LifeFill = HopeQoL_Fill("HopeQoLLifeFill", HopeQoL_Hud, 0.007, -0.02, "HopeUI\\life-fill.blp")
	HopeQoL_ManaText = HopeQoL_Label("HopeQoLMana", HopeQoL_Hud, 0.007, -0.024, 0.12, 0.013, "")
	HopeQoL_ManaFill = HopeQoL_Fill("HopeQoLManaFill", HopeQoL_Hud, 0.007, -0.038, "HopeUI\\mana-fill.blp")
	HopeQoL_Resources = HopeQoL_Label("HopeQoLResources", HopeQoL_Hud, 0.007, -0.044, 0.12, 0.014, "")
	HopeQoL_Status = HopeQoL_Label("HopeQoLStatus", HopeQoL_Hud, 0.007, -0.06, 0.12, 0.023, "")
	-- Keyboard legends are informational text, not redundant mouse buttons.
	f = HopeQoL_Label("HopeQoLHero", HopeQoL_Hud, 0.007, -0.086, 0.058, 0.013, "|cffd2b879F3 聚焦|r")
	f = HopeQoL_Label("HopeQoLBag", HopeQoL_Hud, 0.069, -0.086, 0.058, 0.013, "|cffd2b879F2 助手|r")
	f = HopeQoL_Label("HopeQoLStats", HopeQoL_Hud, 0.007, -0.1, 0.058, 0.013, "|cffd2b879F4 属性|r")
	f = HopeQoL_Label("HopeQoLHide", HopeQoL_Hud, 0.069, -0.1, 0.058, 0.013, "|cffaaaaaaF5 收起|r")
	HopeQoL_Restore = HopeQoL_Label("HopeQoLRestore", DzGetGameUI(), 0.014, -0.1, 0.09, 0.016, "|cffd6c99bF5 展开速览|r")
	DzFrameClearAllPoints(HopeQoL_Restore)
	DzFrameSetAbsolutePoint(HopeQoL_Restore, 0, 0.014, 0.5)
	DzFrameShow(HopeQoL_Restore, false)
	-- Turn controls belong to their own root, so collapsing the corner HUD cannot hide them.
	-- Stay above the native console and leave the right-side skill tooltip region clear.
	HopeTurn_Text = HopeQoL_Label("HopeTurnText", HopeTurn_Panel, 0.008, -0.006, 0.116, 0.029, "")
	HopeTurn_Button = HopeQoL_Button("HopeTurnButton", HopeTurn_Panel, 0.008, -0.037, 0.116, 0.025, "结束回合 G")
	HopeQoL_Bind(HopeTurn_Button, HopeTurn_EndClick, true)
	DzFrameShow(HopeTurn_Panel, false)
	f = HopeQoL_Label("HopeStatsTitle", HopeQoL_Panel, 0.009, -0.007, 0.18, 0.017, "|cffffd060当前属性|r")
	f = HopeQoL_Button("HopeStatsClose", HopeQoL_Panel, 0.276, -0.004, 0.056, 0.025, "关闭")
	HopeQoL_Bind(f, HopeQoL_CloseStats, false)
	HopeQoL_Details = HopeQoL_Label("HopeQoLDetails", HopeQoL_Panel, 0.009, -0.033, 0.157, 0.153, "")
	HopeQoL_GrowthDetails = HopeQoL_Label("HopeQoLGrowthDetails", HopeQoL_Panel, 0.177, -0.033, 0.154, 0.153, "")
	f = HopeQoL_Label("HopeQoLRules", HopeQoL_Panel, 0.009, -0.192, 0.322, 0.087, "|cffd2b879属性与成长如何生效|r|n力量：每点 +2 生命、平砍浮动上限 +1%。|n敏捷：每两点 +1 攻击、浮动下限 +1%。|n智力：每点 +1 魔法，每三点 +1% 法伤。|n生命成长直接加生命；主属性每点另加 0.5 攻击。|n魔力 / 专注成长：每级增加成长值 ÷ 2 个百分点的|n技能 / 精确打击伤害。小数累积；特殊技能按其浮动。")
	DzFrameShow(HopeQoL_Panel, false)
	-- A real, discoverable details action is separate from the F4 keyboard legend.
	HopeQoL_StatsButton = HopeQoL_Button("HopeStatsOpen", DzGetGameUI(), 0, 0, 0.115, 0.023, "属性详情")
	DzFrameClearAllPoints(HopeQoL_StatsButton)
	DzFrameSetAbsolutePoint(HopeQoL_StatsButton, 0, 0.025, 0.238)
	HopeQoL_Bind(HopeQoL_StatsButton, HopeQoL_ToggleStats, false)
	DzFrameShow(HopeQoL_StatsButton, false)
	HopeGift_OpenButton = HopeQoL_Button("HopeGiftOpen", DzGetGameUI(), 0, 0, 0.035, 0.024, "抽奖")
	if HopeGift_OpenButton ~= 0 then
		DzFrameClearAllPoints(HopeGift_OpenButton)
		DzFrameSetAbsolutePoint(HopeGift_OpenButton, 0, 0.105, 0.208)
		HopeQoL_Bind(HopeGift_OpenButton, HopeGift_Toggle, false)
		DzFrameShow(HopeGift_OpenButton, false)
	end
	DzFrameShow(HopeQoL_Hud, false)
	-- A compact target readout grows only for effects present on the selected enemy.
	-- It has no click controls and disappears when that enemy is no longer selected.
	HopeIntent_Title = HopeQoL_Label("HopeIntentTitle", HopeIntent_Panel, 0.008, -0.005, 0.208, 0.014, "")
	HopeIntent_Text = HopeQoL_Label("HopeIntentText", HopeIntent_Panel, 0.008, -0.021, 0.208, 0.025, "")
	HopeIntent_Status = HopeQoL_Label("HopeIntentStatus", HopeIntent_Panel, 0.008, -0.05, 0.208, 0.014, "")
	if HopeIntent_Status ~= 0 then
		DzFrameShow(HopeIntent_Status, false)
	end
	DzFrameShow(HopeIntent_Panel, false)
	HopeChoice_Button = HopeQoL_Button("HopeChoiceToggle", DzGetGameUI(), 0, 0, 0.102, 0.026, "暂时收起选择")
	if HopeChoice_Button ~= 0 then
		DzFrameClearAllPoints(HopeChoice_Button)
		DzFrameSetAbsolutePoint(HopeChoice_Button, 0, 0.165, 0.557)
		HopeQoL_Bind(HopeChoice_Button, HopeChoice_Toggle, false)
		DzFrameShow(HopeChoice_Button, false)
	end
	HopeArchive_CreateUI()
	HopeGift_CreateUI()
	HopeRelic_CreateUI()
	HopeQoL_UIReady = HopeQoL_Hud ~= 0 and HopeRoute_Panel ~= 0 and HopeTurn_Panel ~= 0 and HopeQoL_Panel ~= 0 and HopeQoL_LifeText ~= 0 and HopeQoL_Details ~= 0 and HopeQoL_GrowthDetails ~= 0
	if HopeQoL_UIReady then
		HopeQoL_UIPhase = "已完成"
	else
		HopeQoL_UIPhase = "基础控件缺失"
	end
end

function HopeQoL_Diagnostics()
	if GetTriggerPlayer() == GetLocalPlayer() then
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20.0, "AI爬塔 1.0.4：" .. (HopeQoL_UIPhase or "") .. "；按钮回退 " .. (I2S(HopeQoL_UIFallbacks) or "") .. "|n资源：" .. (HopeQoL_UIResources or "") .. "|n速览 " .. (I2S(HopeQoL_Hud) or "") .. " / 准备 " .. (I2S(HopeRoute_Panel) or "") .. " / 属性 " .. (I2S(HopeQoL_Panel) or "") .. " / 回合 " .. (I2S(HopeTurn_Panel) or "") .. "|n文字：生命 " .. (I2S(HopeQoL_LifeText) or "") .. " / 属性 " .. (I2S(HopeQoL_Details) or ""))
	end
end

function HopeQoL_Init()
	local i = 0
	local chat = CreateTrigger()
	local leave = CreateTrigger()
	local diagnostic = CreateTrigger()
	local q = CreateQuest()
	for _ in _loop_() do
		if i >= 6 then break end
		TriggerRegisterPlayerChatEvent(chat, Player(i), "-ready", true)
		TriggerRegisterPlayerChatEvent(chat, Player(i), "-wait", true)
		TriggerRegisterPlayerChatEvent(chat, Player(i), "-route", true)
		TriggerRegisterPlayerChatEvent(diagnostic, Player(i), "-ui", true)
		TriggerRegisterPlayerEvent(leave, Player(i), EVENT_PLAYER_LEAVE)
		i = i + 1
	end
	TriggerAddAction(chat, HopeRoute_Chat)
	TriggerAddAction(leave, HopeRoute_Leave)
	TriggerAddAction(diagnostic, HopeQoL_Diagnostics)
	DzTriggerRegisterKeyEventByCode(nil, 113, 1, false, HopeQoL_SelectBag)
	DzTriggerRegisterKeyEventByCode(nil, 114, 1, false, HopeQoL_SelectHero)
	DzTriggerRegisterKeyEventByCode(nil, 115, 1, false, HopeQoL_ToggleStats)
	DzTriggerRegisterKeyEventByCode(nil, 116, 1, false, HopeQoL_ToggleHud)
	DzTriggerRegisterKeyEventByCode(nil, 117, 1, false, HopeChoice_ToggleLocal)
	i = 1
	for _ in _loop_() do
		if i > 6 then break end
		HopeTeam_APTag[i] = CreateTextTag()
		DzTextTagSetShadowColor(HopeTeam_APTag[i], 0)
		SetTextTagPermanent(HopeTeam_APTag[i], true)
		SetTextTagVisibility(HopeTeam_APTag[i], false)
		i = i + 1
	end
	QuestSetTitle(q, "AI爬塔 1.0.4 · 快捷指南")
	QuestSetDescription(q, "速览位于左上头像下，显示生命、魔法、行动点、专注与背包占用。|nF2：定位助手。F3：定位英雄或小游戏角色，保留缩放。|nF4：展开/收起属性。Esc：只关闭已展开的资料面板，不打开属性。|nF5：只收起速览，再按恢复；准备、队友行动点、怪物意图和结束回合仍显示。|nF6：收起/展开战利品、成长、升级与技能替换，保留选项。收起后即可查看其他数据。" .. "|nQ 攻击、W 防御、F 专注、G 结束回合、H 药剂、R 镜头锁定、Tab 查看保留。|n右键双击物品可在英雄和助手之间转交；失败时检查格子。防御可重复使用，需足够行动点与魔法。|n小地图上方可直接查看属性、存档、遗物和抽奖；这些入口不受 F5 影响。")
	QuestSetIconPath(q, "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn.blp")
	QuestSetRequired(q, false)
	QuestSetDiscovered(q, true)
	q = CreateQuest()
	QuestSetTitle(q, "AI爬塔 1.0.4 · 属性与存档")
	QuestSetDescription(q, "点击属性详情或按 F4，查看三围、六项成长与评级、暴击、护甲减伤和伤害倍率。Esc 只关闭已打开的属性或存档面板，也可关闭遗物和礼包抽奖。|n存档显示十项永久成长的累计加成、次数、上限与兑换价格。每项最多 5 次；新购成长在平台结算后于下一局生效。|n生命 +10、魔法 +1 是免费基底，不计入购买。永久数据未载入时暂不能兑换。" .. "|n遗物独立显示本局收藏，点击名称查看完整效果，底部翻页。|n礼包抽奖每次5积分，55%谢谢惠顾；六种礼包概率在面板公开。重复结果不叠加、不重抽、不返还，全部拥有后停止抽奖。新礼包永久解锁，提交平台结算后下局生效。|n奖励挡住数据时，点收起或按 F6，再原样展开继续选择。|n选中敌人可看简短行动预告；切回角色后自动收起。")
	QuestSetRequired(q, false)
	QuestSetDiscovered(q, true)
	q = CreateQuest()
	QuestSetTitle(q, "选路、准备与出发")
	QuestSetDescription(q, "开局由主机指定路线选择者。路线选择者点击黄色可达节点或路线列表提出路线，路线选择者选路时自动准备（仍须先领完奖励），其他人完成战利品、购物和背包整理后点击准备。全员准备后，路线选择者点击准备面板的【出发】。|n未选择战利品（或明确放弃）时不能准备；新发放奖励会撤销准备。|n换路线会自动确认路线选择者，队友需重新确认；取消准备立即阻止推进。离开玩家不计入等待人数，其他人重新确认。|n聊天命令：-ready 准备；-wait 取消；-route 查看状态。准备面板独立显示，F5 只收起速览。|n没有超时自动出发或强制跳过队友。")
	QuestSetRequired(q, false)
	QuestSetDiscovered(q, true)
	q = CreateQuest()
	QuestSetTitle(q, "伤害预览与敌人状态")
	QuestSetDescription(q, "不点击也能看头顶简短意图：攻击Cola(20)表示攻击Cola、减伤前伤害20。防御(DEF+10)表示增加10护甲，强化(ATK+3)表示增加3攻击。意图数值按原版取整显示，实际结算遵循原规则。施法和打断分别标记。攻击指向自己时写“你”；昵称按完整字符显示；长名省略，同名或缩写相同时附加编号，队友行动点旁显示相同名字。已出手的敌人等待下一轮预告。|n选中敌人时，面板显示具体意图和当前有效的中毒、破甲与虚弱；没有效果就不占空间。切换目标会收起。|n中毒层数按六名玩家分别结算，面板列出合计层数、你的层数和本轮毒伤参考。参考值按当前属性计算，已计增伤、脚本魔抗和暴击范围；护甲、免疫与追击另计。头顶只保留毒层数，毒伤详情在面板查看。" .. "|n上次毒结算净扣血：上一轮六次直接毒伤造成的实际生命净减少，不含稍后触发的追击；没有记录时不显示。|n破甲显示本轮已经降低的护甲量及当前护甲；敌人回合复原护甲后清除。虚弱显示下次攻击降低 30%，攻击预告本身已经计入，不再减第二次。|n鼠标移到技能上查看按当前属性计算的预估。技能说明中保留各自的随机区间、触发条件与资源消耗；预估不额外掷随机数，不提前消耗暴击或精确打击。")
	QuestSetRequired(q, false)
	QuestSetDiscovered(q, true)
	TimerStart(CreateTimer(), 0.02, false, HopeQoL_LoadUIResources)
	TimerStart(CreateTimer(), 0.05, false, HopeQoL_CreateUI)
	TimerStart(CreateTimer(), 0.08, false, HopeGrowth_CreateUI)
	TimerStart(CreateTimer(), 0.2, true, HopeQoL_Refresh)
	q = nil
	chat = nil
	leave = nil
	diagnostic = nil
end

function HopeModern_Choose(index, slot)
	local p = DzGetTriggerUIEventPlayer()
	local owner = GetPlayerId(p)
	local d = nil
	if index < 1 or index > HopeChoice_DialogCount or owner < 0 or owner >= 6 then
		p = nil
		return
	end
	if HopeModern_Dispatching or not HopeChoice_DialogPending[index] or HopeChoice_Owner[index] ~= owner or HopeModern_Tick - HopeModern_LastTick[owner] < 3 then
		p = nil
		return
	end
	d = HopeChoice_Dialog[index]
	if slot < 1 or slot > LoadInteger(HopeModern_Data, GetHandleId(d), 0) then
		p = nil
		d = nil
		return
	end
	HopeModern_LastTick[owner] = HopeModern_Tick
	HopeModern_Player = p
	HopeModern_Dialog = d
	HopeModern_Button = LoadButtonHandle(HopeModern_Data, GetHandleId(d), 200 + slot)
	HopeModern_Dispatching = true
	if d == udg_Youxi_ND_XZ then
		if udg_Yx_Nd_Dj == 0 then
			Trig____________________006Actions()
			HopeChoice_DialogClear(d)
			HopeRoute_Assigning = true
		end
	elseif d == udg_Wj_sj_xz[owner + 1] then
		Trig____________________013________2Actions()
	elseif d == udg_Rskill_shifoutihuan[owner + 1] then
		Trig_R_____________018Actions()
	end
	HopeModern_Dispatching = false
	HopeModern_Player = nil
	HopeModern_Dialog = nil
	HopeModern_Button = nil
	d = nil
	p = nil
end

function HopeModern_Fold()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeChoice_Hidden = true
	end
end

function HopeLayout_Choice(i, d)
	local j = 1
	local w = 0.28
	local h = 0.155
	local x = 0.0
	local y = 0.0
	local count = LoadInteger(HopeModern_Data, GetHandleId(d), 0)
	local isR = d == udg_Rskill_shifoutihuan[GetPlayerId(GetLocalPlayer()) + 1]
	if d == udg_Youxi_ND_XZ then
		w = 0.28
		h = 0.179
	elseif isR then
		w = 0.268
		h = 0.155
	end
	HopeLayout_Place(HopeModern_Panel[i], 0, (0.8 - w) / 2.0, 0.495, w, h)
	HopeLayout_Place(HopeModern_Title[i], HopeModern_Panel[i], 0.01, -0.009, w - 0.076, 0.019)
	HopeLayout_Place(HopeLayout_Fold[i], HopeModern_Panel[i], w - 0.056, -0.007, 0.046, 0.021)
	DzFrameSetText(HopeLayout_Fold[i], "收起")
	HopeLayout_Show(HopeR_Viewport[i], isR)
	HopeLayout_Show(HopeR_Up[i], isR)
	HopeLayout_Show(HopeR_Down[i], isR)
	HopeLayout_Show(HopeR_Notice[i], isR)
	HopeLayout_Show(HopeModern_Description[i], not isR)
	if not isR then
		HopeLayout_Place(HopeModern_Description[i], HopeModern_Panel[i], 0.01, -0.036, w - 0.02, 0.037)
		DzFrameSetFont(HopeModern_Description[i], "Fonts\\ZiTi.ttf", 0.009, 0)
	end
	for _ in _loop_() do
		if j > count then break end
		if isR then
			x = 0.01 + I2R(j - 1) * 0.13
			HopeLayout_Place(HopeModern_Row[i * 8 + j], HopeModern_Panel[i], x, -0.123, 0.118, 0.023)
			if j == 1 then
				DzFrameSetText(HopeModern_Row[i * 8 + j], "替换")
			else
				DzFrameSetText(HopeModern_Row[i * 8 + j], "保留原技能")
			end
		else
			x = 0.01 + I2R(ModuloInteger(j - 1, 2)) * 0.134
			y = -0.08 - I2R(_idiv_(j - 1, 2)) * 0.031
			HopeLayout_Place(HopeModern_Row[i * 8 + j], HopeModern_Panel[i], x, y, 0.126, 0.026)
		end
		j = j + 1
	end
end

function HopeModern_Refresh()
	local i = 1
	local j = 1
	local owner = GetPlayerId(GetLocalPlayer())
	local newest = 0
	local h = 0
	local abilityId = 0
	local d = nil
	local show = false
	local title = ""
	local detail = "选择后立即生效；收起 F6 可先查看角色资料。"
	HopeModern_Tick = HopeModern_Tick + 1
	HopeR_Active = 0
	if not HopeModern_Ready then
		return
	end
	for _ in _loop_() do
		if i > HopeChoice_DialogCount then break end
		if HopeChoice_DialogPending[i] and HopeChoice_Owner[i] == owner then
			newest = i
		end
		i = i + 1
	end
	i = 1
	for _ in _loop_() do
		if i > 13 then break end
		show = i == newest and not HopeChoice_Hidden and not HopeGrowth_Pending[owner] and not HopeRoute_Assigning
		HopeJob_ShowFrame(HopeModern_Panel[i], show)
		if show then
			d = HopeChoice_Dialog[i]
			h = GetHandleId(d)
			title = LoadStr(HopeModern_Data, h, 100)
			if d == udg_Rskill_shifoutihuan[owner + 1] then
				abilityId = LoadInteger(YDHT, h, -711261722)
				title = "替换 R 技能：" .. (GetAbilityName(abilityId) or "")
				detail = "当前：" .. (GetAbilityName(udg_R_Skill[owner + 1]) or "") .. "|n新技能：" .. (HopeSkill_Original(abilityId, 1) or "") .. "|n放弃不退还本次购买费用。"
			elseif d == udg_Youxi_ND_XZ then
				detail = "简单/普通：3轮；困难/极难：4轮。|n炼狱：5轮；无限挑战：无限轮。|n选定难度后，再指定本局的路线选择者。"
			else
				detail = "消耗的升级点已结算；以下奖励三选一。|n放弃不返还升级点；收起 F6 保留当前选项。"
			end
			HopeJob_SetText(HopeModern_Title[i], title)
			HopeJob_SetText(HopeModern_Description[i], detail)
			j = 1
			for _ in _loop_() do
				if j > 6 then break end
				HopeJob_ShowFrame(HopeModern_Row[i * 8 + j], j <= LoadInteger(HopeModern_Data, h, 0))
				HopeJob_SetText(HopeModern_Row[i * 8 + j], LoadStr(HopeModern_Data, h, j))
				j = j + 1
			end
			HopeLayout_Choice(i, d)
			if d == udg_Rskill_shifoutihuan[owner + 1] then
				HopeCompact_RRefresh(i, d, abilityId)
			end
		end
		i = i + 1
	end
	d = nil
end

function HopeModern_Click1_1()
	HopeModern_Choose(1, 1)
end

function HopeModern_Click1_2()
	HopeModern_Choose(1, 2)
end

function HopeModern_Click1_3()
	HopeModern_Choose(1, 3)
end

function HopeModern_Click1_4()
	HopeModern_Choose(1, 4)
end

function HopeModern_Click1_5()
	HopeModern_Choose(1, 5)
end

function HopeModern_Click1_6()
	HopeModern_Choose(1, 6)
end

function HopeModern_Click2_1()
	HopeModern_Choose(2, 1)
end

function HopeModern_Click2_2()
	HopeModern_Choose(2, 2)
end

function HopeModern_Click2_3()
	HopeModern_Choose(2, 3)
end

function HopeModern_Click2_4()
	HopeModern_Choose(2, 4)
end

function HopeModern_Click2_5()
	HopeModern_Choose(2, 5)
end

function HopeModern_Click2_6()
	HopeModern_Choose(2, 6)
end

function HopeModern_Click3_1()
	HopeModern_Choose(3, 1)
end

function HopeModern_Click3_2()
	HopeModern_Choose(3, 2)
end

function HopeModern_Click3_3()
	HopeModern_Choose(3, 3)
end

function HopeModern_Click3_4()
	HopeModern_Choose(3, 4)
end

function HopeModern_Click3_5()
	HopeModern_Choose(3, 5)
end

function HopeModern_Click3_6()
	HopeModern_Choose(3, 6)
end

function HopeModern_Click4_1()
	HopeModern_Choose(4, 1)
end

function HopeModern_Click4_2()
	HopeModern_Choose(4, 2)
end

function HopeModern_Click4_3()
	HopeModern_Choose(4, 3)
end

function HopeModern_Click4_4()
	HopeModern_Choose(4, 4)
end

function HopeModern_Click4_5()
	HopeModern_Choose(4, 5)
end

function HopeModern_Click4_6()
	HopeModern_Choose(4, 6)
end

function HopeModern_Click5_1()
	HopeModern_Choose(5, 1)
end

function HopeModern_Click5_2()
	HopeModern_Choose(5, 2)
end

function HopeModern_Click5_3()
	HopeModern_Choose(5, 3)
end

function HopeModern_Click5_4()
	HopeModern_Choose(5, 4)
end

function HopeModern_Click5_5()
	HopeModern_Choose(5, 5)
end

function HopeModern_Click5_6()
	HopeModern_Choose(5, 6)
end

function HopeModern_Click6_1()
	HopeModern_Choose(6, 1)
end

function HopeModern_Click6_2()
	HopeModern_Choose(6, 2)
end

function HopeModern_Click6_3()
	HopeModern_Choose(6, 3)
end

function HopeModern_Click6_4()
	HopeModern_Choose(6, 4)
end

function HopeModern_Click6_5()
	HopeModern_Choose(6, 5)
end

function HopeModern_Click6_6()
	HopeModern_Choose(6, 6)
end

function HopeModern_Click7_1()
	HopeModern_Choose(7, 1)
end

function HopeModern_Click7_2()
	HopeModern_Choose(7, 2)
end

function HopeModern_Click7_3()
	HopeModern_Choose(7, 3)
end

function HopeModern_Click7_4()
	HopeModern_Choose(7, 4)
end

function HopeModern_Click7_5()
	HopeModern_Choose(7, 5)
end

function HopeModern_Click7_6()
	HopeModern_Choose(7, 6)
end

function HopeModern_Click8_1()
	HopeModern_Choose(8, 1)
end

function HopeModern_Click8_2()
	HopeModern_Choose(8, 2)
end

function HopeModern_Click8_3()
	HopeModern_Choose(8, 3)
end

function HopeModern_Click8_4()
	HopeModern_Choose(8, 4)
end

function HopeModern_Click8_5()
	HopeModern_Choose(8, 5)
end

function HopeModern_Click8_6()
	HopeModern_Choose(8, 6)
end

function HopeModern_Click9_1()
	HopeModern_Choose(9, 1)
end

function HopeModern_Click9_2()
	HopeModern_Choose(9, 2)
end

function HopeModern_Click9_3()
	HopeModern_Choose(9, 3)
end

function HopeModern_Click9_4()
	HopeModern_Choose(9, 4)
end

function HopeModern_Click9_5()
	HopeModern_Choose(9, 5)
end

function HopeModern_Click9_6()
	HopeModern_Choose(9, 6)
end

function HopeModern_Click10_1()
	HopeModern_Choose(10, 1)
end

function HopeModern_Click10_2()
	HopeModern_Choose(10, 2)
end

function HopeModern_Click10_3()
	HopeModern_Choose(10, 3)
end

function HopeModern_Click10_4()
	HopeModern_Choose(10, 4)
end

function HopeModern_Click10_5()
	HopeModern_Choose(10, 5)
end

function HopeModern_Click10_6()
	HopeModern_Choose(10, 6)
end

function HopeModern_Click11_1()
	HopeModern_Choose(11, 1)
end

function HopeModern_Click11_2()
	HopeModern_Choose(11, 2)
end

function HopeModern_Click11_3()
	HopeModern_Choose(11, 3)
end

function HopeModern_Click11_4()
	HopeModern_Choose(11, 4)
end

function HopeModern_Click11_5()
	HopeModern_Choose(11, 5)
end

function HopeModern_Click11_6()
	HopeModern_Choose(11, 6)
end

function HopeModern_Click12_1()
	HopeModern_Choose(12, 1)
end

function HopeModern_Click12_2()
	HopeModern_Choose(12, 2)
end

function HopeModern_Click12_3()
	HopeModern_Choose(12, 3)
end

function HopeModern_Click12_4()
	HopeModern_Choose(12, 4)
end

function HopeModern_Click12_5()
	HopeModern_Choose(12, 5)
end

function HopeModern_Click12_6()
	HopeModern_Choose(12, 6)
end

function HopeModern_Click13_1()
	HopeModern_Choose(13, 1)
end

function HopeModern_Click13_2()
	HopeModern_Choose(13, 2)
end

function HopeModern_Click13_3()
	HopeModern_Choose(13, 3)
end

function HopeModern_Click13_4()
	HopeModern_Choose(13, 4)
end

function HopeModern_Click13_5()
	HopeModern_Choose(13, 5)
end

function HopeModern_Click13_6()
	HopeModern_Choose(13, 6)
end

function HopeModern_Create()
	local f = 0
	HopeModern_Panel[1] = HopeQoL_Surface("HopeChoicePanel1", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[1] = HopeQoL_Label("HopeChoiceTitle1", HopeModern_Panel[1], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[1] = HopeQoL_Label("HopeChoiceDetail1", HopeModern_Panel[1], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold1", HopeModern_Panel[1], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[1] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[9] = HopeQoL_Button("HopeChoiceRow1_1", HopeModern_Panel[1], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[9], HopeModern_Click1_1, true)
	HopeModern_Row[10] = HopeQoL_Button("HopeChoiceRow1_2", HopeModern_Panel[1], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[10], HopeModern_Click1_2, true)
	HopeModern_Row[11] = HopeQoL_Button("HopeChoiceRow1_3", HopeModern_Panel[1], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[11], HopeModern_Click1_3, true)
	HopeModern_Row[12] = HopeQoL_Button("HopeChoiceRow1_4", HopeModern_Panel[1], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[12], HopeModern_Click1_4, true)
	HopeModern_Row[13] = HopeQoL_Button("HopeChoiceRow1_5", HopeModern_Panel[1], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[13], HopeModern_Click1_5, true)
	HopeModern_Row[14] = HopeQoL_Button("HopeChoiceRow1_6", HopeModern_Panel[1], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[14], HopeModern_Click1_6, true)
	HopeR_Viewport[1] = HopeQoL_Button("HopeRViewport1", HopeModern_Panel[1], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[1], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[1], 3, HopeScroll_Leave, false)
	HopeR_Body[1] = HopeQoL_Label("HopeRBody1", HopeR_Viewport[1], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[1], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[1] = HopeQoL_Button("HopeRUp1", HopeModern_Panel[1], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[1], HopeScroll_RUp, false)
	HopeR_Down[1] = HopeQoL_Button("HopeRDown1", HopeModern_Panel[1], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[1], HopeScroll_RDown, false)
	HopeR_Notice[1] = HopeQoL_Label("HopeRNotice1", HopeModern_Panel[1], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[1], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[1], false)
	HopeModern_Panel[2] = HopeQoL_Surface("HopeChoicePanel2", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[2] = HopeQoL_Label("HopeChoiceTitle2", HopeModern_Panel[2], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[2] = HopeQoL_Label("HopeChoiceDetail2", HopeModern_Panel[2], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold2", HopeModern_Panel[2], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[2] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[17] = HopeQoL_Button("HopeChoiceRow2_1", HopeModern_Panel[2], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[17], HopeModern_Click2_1, true)
	HopeModern_Row[18] = HopeQoL_Button("HopeChoiceRow2_2", HopeModern_Panel[2], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[18], HopeModern_Click2_2, true)
	HopeModern_Row[19] = HopeQoL_Button("HopeChoiceRow2_3", HopeModern_Panel[2], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[19], HopeModern_Click2_3, true)
	HopeModern_Row[20] = HopeQoL_Button("HopeChoiceRow2_4", HopeModern_Panel[2], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[20], HopeModern_Click2_4, true)
	HopeModern_Row[21] = HopeQoL_Button("HopeChoiceRow2_5", HopeModern_Panel[2], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[21], HopeModern_Click2_5, true)
	HopeModern_Row[22] = HopeQoL_Button("HopeChoiceRow2_6", HopeModern_Panel[2], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[22], HopeModern_Click2_6, true)
	HopeR_Viewport[2] = HopeQoL_Button("HopeRViewport2", HopeModern_Panel[2], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[2], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[2], 3, HopeScroll_Leave, false)
	HopeR_Body[2] = HopeQoL_Label("HopeRBody2", HopeR_Viewport[2], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[2], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[2] = HopeQoL_Button("HopeRUp2", HopeModern_Panel[2], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[2], HopeScroll_RUp, false)
	HopeR_Down[2] = HopeQoL_Button("HopeRDown2", HopeModern_Panel[2], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[2], HopeScroll_RDown, false)
	HopeR_Notice[2] = HopeQoL_Label("HopeRNotice2", HopeModern_Panel[2], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[2], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[2], false)
	HopeModern_Panel[3] = HopeQoL_Surface("HopeChoicePanel3", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[3] = HopeQoL_Label("HopeChoiceTitle3", HopeModern_Panel[3], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[3] = HopeQoL_Label("HopeChoiceDetail3", HopeModern_Panel[3], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold3", HopeModern_Panel[3], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[3] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[25] = HopeQoL_Button("HopeChoiceRow3_1", HopeModern_Panel[3], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[25], HopeModern_Click3_1, true)
	HopeModern_Row[26] = HopeQoL_Button("HopeChoiceRow3_2", HopeModern_Panel[3], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[26], HopeModern_Click3_2, true)
	HopeModern_Row[27] = HopeQoL_Button("HopeChoiceRow3_3", HopeModern_Panel[3], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[27], HopeModern_Click3_3, true)
	HopeModern_Row[28] = HopeQoL_Button("HopeChoiceRow3_4", HopeModern_Panel[3], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[28], HopeModern_Click3_4, true)
	HopeModern_Row[29] = HopeQoL_Button("HopeChoiceRow3_5", HopeModern_Panel[3], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[29], HopeModern_Click3_5, true)
	HopeModern_Row[30] = HopeQoL_Button("HopeChoiceRow3_6", HopeModern_Panel[3], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[30], HopeModern_Click3_6, true)
	HopeR_Viewport[3] = HopeQoL_Button("HopeRViewport3", HopeModern_Panel[3], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[3], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[3], 3, HopeScroll_Leave, false)
	HopeR_Body[3] = HopeQoL_Label("HopeRBody3", HopeR_Viewport[3], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[3], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[3] = HopeQoL_Button("HopeRUp3", HopeModern_Panel[3], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[3], HopeScroll_RUp, false)
	HopeR_Down[3] = HopeQoL_Button("HopeRDown3", HopeModern_Panel[3], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[3], HopeScroll_RDown, false)
	HopeR_Notice[3] = HopeQoL_Label("HopeRNotice3", HopeModern_Panel[3], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[3], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[3], false)
	HopeModern_Panel[4] = HopeQoL_Surface("HopeChoicePanel4", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[4] = HopeQoL_Label("HopeChoiceTitle4", HopeModern_Panel[4], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[4] = HopeQoL_Label("HopeChoiceDetail4", HopeModern_Panel[4], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold4", HopeModern_Panel[4], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[4] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[33] = HopeQoL_Button("HopeChoiceRow4_1", HopeModern_Panel[4], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[33], HopeModern_Click4_1, true)
	HopeModern_Row[34] = HopeQoL_Button("HopeChoiceRow4_2", HopeModern_Panel[4], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[34], HopeModern_Click4_2, true)
	HopeModern_Row[35] = HopeQoL_Button("HopeChoiceRow4_3", HopeModern_Panel[4], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[35], HopeModern_Click4_3, true)
	HopeModern_Row[36] = HopeQoL_Button("HopeChoiceRow4_4", HopeModern_Panel[4], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[36], HopeModern_Click4_4, true)
	HopeModern_Row[37] = HopeQoL_Button("HopeChoiceRow4_5", HopeModern_Panel[4], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[37], HopeModern_Click4_5, true)
	HopeModern_Row[38] = HopeQoL_Button("HopeChoiceRow4_6", HopeModern_Panel[4], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[38], HopeModern_Click4_6, true)
	HopeR_Viewport[4] = HopeQoL_Button("HopeRViewport4", HopeModern_Panel[4], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[4], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[4], 3, HopeScroll_Leave, false)
	HopeR_Body[4] = HopeQoL_Label("HopeRBody4", HopeR_Viewport[4], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[4], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[4] = HopeQoL_Button("HopeRUp4", HopeModern_Panel[4], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[4], HopeScroll_RUp, false)
	HopeR_Down[4] = HopeQoL_Button("HopeRDown4", HopeModern_Panel[4], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[4], HopeScroll_RDown, false)
	HopeR_Notice[4] = HopeQoL_Label("HopeRNotice4", HopeModern_Panel[4], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[4], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[4], false)
	HopeModern_Panel[5] = HopeQoL_Surface("HopeChoicePanel5", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[5] = HopeQoL_Label("HopeChoiceTitle5", HopeModern_Panel[5], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[5] = HopeQoL_Label("HopeChoiceDetail5", HopeModern_Panel[5], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold5", HopeModern_Panel[5], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[5] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[41] = HopeQoL_Button("HopeChoiceRow5_1", HopeModern_Panel[5], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[41], HopeModern_Click5_1, true)
	HopeModern_Row[42] = HopeQoL_Button("HopeChoiceRow5_2", HopeModern_Panel[5], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[42], HopeModern_Click5_2, true)
	HopeModern_Row[43] = HopeQoL_Button("HopeChoiceRow5_3", HopeModern_Panel[5], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[43], HopeModern_Click5_3, true)
	HopeModern_Row[44] = HopeQoL_Button("HopeChoiceRow5_4", HopeModern_Panel[5], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[44], HopeModern_Click5_4, true)
	HopeModern_Row[45] = HopeQoL_Button("HopeChoiceRow5_5", HopeModern_Panel[5], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[45], HopeModern_Click5_5, true)
	HopeModern_Row[46] = HopeQoL_Button("HopeChoiceRow5_6", HopeModern_Panel[5], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[46], HopeModern_Click5_6, true)
	HopeR_Viewport[5] = HopeQoL_Button("HopeRViewport5", HopeModern_Panel[5], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[5], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[5], 3, HopeScroll_Leave, false)
	HopeR_Body[5] = HopeQoL_Label("HopeRBody5", HopeR_Viewport[5], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[5], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[5] = HopeQoL_Button("HopeRUp5", HopeModern_Panel[5], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[5], HopeScroll_RUp, false)
	HopeR_Down[5] = HopeQoL_Button("HopeRDown5", HopeModern_Panel[5], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[5], HopeScroll_RDown, false)
	HopeR_Notice[5] = HopeQoL_Label("HopeRNotice5", HopeModern_Panel[5], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[5], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[5], false)
	HopeModern_Panel[6] = HopeQoL_Surface("HopeChoicePanel6", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[6] = HopeQoL_Label("HopeChoiceTitle6", HopeModern_Panel[6], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[6] = HopeQoL_Label("HopeChoiceDetail6", HopeModern_Panel[6], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold6", HopeModern_Panel[6], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[6] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[49] = HopeQoL_Button("HopeChoiceRow6_1", HopeModern_Panel[6], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[49], HopeModern_Click6_1, true)
	HopeModern_Row[50] = HopeQoL_Button("HopeChoiceRow6_2", HopeModern_Panel[6], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[50], HopeModern_Click6_2, true)
	HopeModern_Row[51] = HopeQoL_Button("HopeChoiceRow6_3", HopeModern_Panel[6], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[51], HopeModern_Click6_3, true)
	HopeModern_Row[52] = HopeQoL_Button("HopeChoiceRow6_4", HopeModern_Panel[6], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[52], HopeModern_Click6_4, true)
	HopeModern_Row[53] = HopeQoL_Button("HopeChoiceRow6_5", HopeModern_Panel[6], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[53], HopeModern_Click6_5, true)
	HopeModern_Row[54] = HopeQoL_Button("HopeChoiceRow6_6", HopeModern_Panel[6], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[54], HopeModern_Click6_6, true)
	HopeR_Viewport[6] = HopeQoL_Button("HopeRViewport6", HopeModern_Panel[6], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[6], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[6], 3, HopeScroll_Leave, false)
	HopeR_Body[6] = HopeQoL_Label("HopeRBody6", HopeR_Viewport[6], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[6], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[6] = HopeQoL_Button("HopeRUp6", HopeModern_Panel[6], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[6], HopeScroll_RUp, false)
	HopeR_Down[6] = HopeQoL_Button("HopeRDown6", HopeModern_Panel[6], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[6], HopeScroll_RDown, false)
	HopeR_Notice[6] = HopeQoL_Label("HopeRNotice6", HopeModern_Panel[6], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[6], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[6], false)
	HopeModern_Panel[7] = HopeQoL_Surface("HopeChoicePanel7", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[7] = HopeQoL_Label("HopeChoiceTitle7", HopeModern_Panel[7], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[7] = HopeQoL_Label("HopeChoiceDetail7", HopeModern_Panel[7], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold7", HopeModern_Panel[7], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[7] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[57] = HopeQoL_Button("HopeChoiceRow7_1", HopeModern_Panel[7], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[57], HopeModern_Click7_1, true)
	HopeModern_Row[58] = HopeQoL_Button("HopeChoiceRow7_2", HopeModern_Panel[7], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[58], HopeModern_Click7_2, true)
	HopeModern_Row[59] = HopeQoL_Button("HopeChoiceRow7_3", HopeModern_Panel[7], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[59], HopeModern_Click7_3, true)
	HopeModern_Row[60] = HopeQoL_Button("HopeChoiceRow7_4", HopeModern_Panel[7], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[60], HopeModern_Click7_4, true)
	HopeModern_Row[61] = HopeQoL_Button("HopeChoiceRow7_5", HopeModern_Panel[7], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[61], HopeModern_Click7_5, true)
	HopeModern_Row[62] = HopeQoL_Button("HopeChoiceRow7_6", HopeModern_Panel[7], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[62], HopeModern_Click7_6, true)
	HopeR_Viewport[7] = HopeQoL_Button("HopeRViewport7", HopeModern_Panel[7], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[7], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[7], 3, HopeScroll_Leave, false)
	HopeR_Body[7] = HopeQoL_Label("HopeRBody7", HopeR_Viewport[7], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[7], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[7] = HopeQoL_Button("HopeRUp7", HopeModern_Panel[7], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[7], HopeScroll_RUp, false)
	HopeR_Down[7] = HopeQoL_Button("HopeRDown7", HopeModern_Panel[7], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[7], HopeScroll_RDown, false)
	HopeR_Notice[7] = HopeQoL_Label("HopeRNotice7", HopeModern_Panel[7], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[7], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[7], false)
	HopeModern_Panel[8] = HopeQoL_Surface("HopeChoicePanel8", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[8] = HopeQoL_Label("HopeChoiceTitle8", HopeModern_Panel[8], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[8] = HopeQoL_Label("HopeChoiceDetail8", HopeModern_Panel[8], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold8", HopeModern_Panel[8], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[8] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[65] = HopeQoL_Button("HopeChoiceRow8_1", HopeModern_Panel[8], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[65], HopeModern_Click8_1, true)
	HopeModern_Row[66] = HopeQoL_Button("HopeChoiceRow8_2", HopeModern_Panel[8], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[66], HopeModern_Click8_2, true)
	HopeModern_Row[67] = HopeQoL_Button("HopeChoiceRow8_3", HopeModern_Panel[8], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[67], HopeModern_Click8_3, true)
	HopeModern_Row[68] = HopeQoL_Button("HopeChoiceRow8_4", HopeModern_Panel[8], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[68], HopeModern_Click8_4, true)
	HopeModern_Row[69] = HopeQoL_Button("HopeChoiceRow8_5", HopeModern_Panel[8], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[69], HopeModern_Click8_5, true)
	HopeModern_Row[70] = HopeQoL_Button("HopeChoiceRow8_6", HopeModern_Panel[8], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[70], HopeModern_Click8_6, true)
	HopeR_Viewport[8] = HopeQoL_Button("HopeRViewport8", HopeModern_Panel[8], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[8], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[8], 3, HopeScroll_Leave, false)
	HopeR_Body[8] = HopeQoL_Label("HopeRBody8", HopeR_Viewport[8], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[8], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[8] = HopeQoL_Button("HopeRUp8", HopeModern_Panel[8], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[8], HopeScroll_RUp, false)
	HopeR_Down[8] = HopeQoL_Button("HopeRDown8", HopeModern_Panel[8], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[8], HopeScroll_RDown, false)
	HopeR_Notice[8] = HopeQoL_Label("HopeRNotice8", HopeModern_Panel[8], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[8], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[8], false)
	HopeModern_Panel[9] = HopeQoL_Surface("HopeChoicePanel9", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[9] = HopeQoL_Label("HopeChoiceTitle9", HopeModern_Panel[9], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[9] = HopeQoL_Label("HopeChoiceDetail9", HopeModern_Panel[9], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold9", HopeModern_Panel[9], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[9] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[73] = HopeQoL_Button("HopeChoiceRow9_1", HopeModern_Panel[9], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[73], HopeModern_Click9_1, true)
	HopeModern_Row[74] = HopeQoL_Button("HopeChoiceRow9_2", HopeModern_Panel[9], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[74], HopeModern_Click9_2, true)
	HopeModern_Row[75] = HopeQoL_Button("HopeChoiceRow9_3", HopeModern_Panel[9], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[75], HopeModern_Click9_3, true)
	HopeModern_Row[76] = HopeQoL_Button("HopeChoiceRow9_4", HopeModern_Panel[9], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[76], HopeModern_Click9_4, true)
	HopeModern_Row[77] = HopeQoL_Button("HopeChoiceRow9_5", HopeModern_Panel[9], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[77], HopeModern_Click9_5, true)
	HopeModern_Row[78] = HopeQoL_Button("HopeChoiceRow9_6", HopeModern_Panel[9], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[78], HopeModern_Click9_6, true)
	HopeR_Viewport[9] = HopeQoL_Button("HopeRViewport9", HopeModern_Panel[9], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[9], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[9], 3, HopeScroll_Leave, false)
	HopeR_Body[9] = HopeQoL_Label("HopeRBody9", HopeR_Viewport[9], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[9], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[9] = HopeQoL_Button("HopeRUp9", HopeModern_Panel[9], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[9], HopeScroll_RUp, false)
	HopeR_Down[9] = HopeQoL_Button("HopeRDown9", HopeModern_Panel[9], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[9], HopeScroll_RDown, false)
	HopeR_Notice[9] = HopeQoL_Label("HopeRNotice9", HopeModern_Panel[9], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[9], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[9], false)
	HopeModern_Panel[10] = HopeQoL_Surface("HopeChoicePanel10", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[10] = HopeQoL_Label("HopeChoiceTitle10", HopeModern_Panel[10], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[10] = HopeQoL_Label("HopeChoiceDetail10", HopeModern_Panel[10], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold10", HopeModern_Panel[10], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[10] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[81] = HopeQoL_Button("HopeChoiceRow10_1", HopeModern_Panel[10], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[81], HopeModern_Click10_1, true)
	HopeModern_Row[82] = HopeQoL_Button("HopeChoiceRow10_2", HopeModern_Panel[10], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[82], HopeModern_Click10_2, true)
	HopeModern_Row[83] = HopeQoL_Button("HopeChoiceRow10_3", HopeModern_Panel[10], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[83], HopeModern_Click10_3, true)
	HopeModern_Row[84] = HopeQoL_Button("HopeChoiceRow10_4", HopeModern_Panel[10], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[84], HopeModern_Click10_4, true)
	HopeModern_Row[85] = HopeQoL_Button("HopeChoiceRow10_5", HopeModern_Panel[10], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[85], HopeModern_Click10_5, true)
	HopeModern_Row[86] = HopeQoL_Button("HopeChoiceRow10_6", HopeModern_Panel[10], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[86], HopeModern_Click10_6, true)
	HopeR_Viewport[10] = HopeQoL_Button("HopeRViewport10", HopeModern_Panel[10], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[10], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[10], 3, HopeScroll_Leave, false)
	HopeR_Body[10] = HopeQoL_Label("HopeRBody10", HopeR_Viewport[10], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[10], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[10] = HopeQoL_Button("HopeRUp10", HopeModern_Panel[10], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[10], HopeScroll_RUp, false)
	HopeR_Down[10] = HopeQoL_Button("HopeRDown10", HopeModern_Panel[10], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[10], HopeScroll_RDown, false)
	HopeR_Notice[10] = HopeQoL_Label("HopeRNotice10", HopeModern_Panel[10], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[10], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[10], false)
	HopeModern_Panel[11] = HopeQoL_Surface("HopeChoicePanel11", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[11] = HopeQoL_Label("HopeChoiceTitle11", HopeModern_Panel[11], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[11] = HopeQoL_Label("HopeChoiceDetail11", HopeModern_Panel[11], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold11", HopeModern_Panel[11], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[11] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[89] = HopeQoL_Button("HopeChoiceRow11_1", HopeModern_Panel[11], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[89], HopeModern_Click11_1, true)
	HopeModern_Row[90] = HopeQoL_Button("HopeChoiceRow11_2", HopeModern_Panel[11], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[90], HopeModern_Click11_2, true)
	HopeModern_Row[91] = HopeQoL_Button("HopeChoiceRow11_3", HopeModern_Panel[11], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[91], HopeModern_Click11_3, true)
	HopeModern_Row[92] = HopeQoL_Button("HopeChoiceRow11_4", HopeModern_Panel[11], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[92], HopeModern_Click11_4, true)
	HopeModern_Row[93] = HopeQoL_Button("HopeChoiceRow11_5", HopeModern_Panel[11], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[93], HopeModern_Click11_5, true)
	HopeModern_Row[94] = HopeQoL_Button("HopeChoiceRow11_6", HopeModern_Panel[11], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[94], HopeModern_Click11_6, true)
	HopeR_Viewport[11] = HopeQoL_Button("HopeRViewport11", HopeModern_Panel[11], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[11], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[11], 3, HopeScroll_Leave, false)
	HopeR_Body[11] = HopeQoL_Label("HopeRBody11", HopeR_Viewport[11], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[11], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[11] = HopeQoL_Button("HopeRUp11", HopeModern_Panel[11], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[11], HopeScroll_RUp, false)
	HopeR_Down[11] = HopeQoL_Button("HopeRDown11", HopeModern_Panel[11], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[11], HopeScroll_RDown, false)
	HopeR_Notice[11] = HopeQoL_Label("HopeRNotice11", HopeModern_Panel[11], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[11], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[11], false)
	HopeModern_Panel[12] = HopeQoL_Surface("HopeChoicePanel12", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[12] = HopeQoL_Label("HopeChoiceTitle12", HopeModern_Panel[12], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[12] = HopeQoL_Label("HopeChoiceDetail12", HopeModern_Panel[12], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold12", HopeModern_Panel[12], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[12] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[97] = HopeQoL_Button("HopeChoiceRow12_1", HopeModern_Panel[12], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[97], HopeModern_Click12_1, true)
	HopeModern_Row[98] = HopeQoL_Button("HopeChoiceRow12_2", HopeModern_Panel[12], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[98], HopeModern_Click12_2, true)
	HopeModern_Row[99] = HopeQoL_Button("HopeChoiceRow12_3", HopeModern_Panel[12], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[99], HopeModern_Click12_3, true)
	HopeModern_Row[100] = HopeQoL_Button("HopeChoiceRow12_4", HopeModern_Panel[12], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[100], HopeModern_Click12_4, true)
	HopeModern_Row[101] = HopeQoL_Button("HopeChoiceRow12_5", HopeModern_Panel[12], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[101], HopeModern_Click12_5, true)
	HopeModern_Row[102] = HopeQoL_Button("HopeChoiceRow12_6", HopeModern_Panel[12], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[102], HopeModern_Click12_6, true)
	HopeR_Viewport[12] = HopeQoL_Button("HopeRViewport12", HopeModern_Panel[12], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[12], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[12], 3, HopeScroll_Leave, false)
	HopeR_Body[12] = HopeQoL_Label("HopeRBody12", HopeR_Viewport[12], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[12], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[12] = HopeQoL_Button("HopeRUp12", HopeModern_Panel[12], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[12], HopeScroll_RUp, false)
	HopeR_Down[12] = HopeQoL_Button("HopeRDown12", HopeModern_Panel[12], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[12], HopeScroll_RDown, false)
	HopeR_Notice[12] = HopeQoL_Label("HopeRNotice12", HopeModern_Panel[12], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[12], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[12], false)
	HopeModern_Panel[13] = HopeQoL_Surface("HopeChoicePanel13", 0.245, 0.52, 0.31, 0.222)
	HopeModern_Title[13] = HopeQoL_Label("HopeChoiceTitle13", HopeModern_Panel[13], 0.014, -0.012, 0.305, 0.026, "")
	HopeModern_Description[13] = HopeQoL_Label("HopeChoiceDetail13", HopeModern_Panel[13], 0.014, -0.046, 0.382, 0.118, "")
	f = HopeQoL_Button("HopeChoiceFold13", HopeModern_Panel[13], 0.324, -0.01, 0.072, 0.026, "收起 F6")
	HopeLayout_Fold[13] = f
	HopeQoL_Bind(f, HopeModern_Fold, false)
	HopeModern_Row[105] = HopeQoL_Button("HopeChoiceRow13_1", HopeModern_Panel[13], 0.014, -0.174, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[105], HopeModern_Click13_1, true)
	HopeModern_Row[106] = HopeQoL_Button("HopeChoiceRow13_2", HopeModern_Panel[13], 0.014, -0.217, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[106], HopeModern_Click13_2, true)
	HopeModern_Row[107] = HopeQoL_Button("HopeChoiceRow13_3", HopeModern_Panel[13], 0.014, -0.26, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[107], HopeModern_Click13_3, true)
	HopeModern_Row[108] = HopeQoL_Button("HopeChoiceRow13_4", HopeModern_Panel[13], 0.014, -0.303, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[108], HopeModern_Click13_4, true)
	HopeModern_Row[109] = HopeQoL_Button("HopeChoiceRow13_5", HopeModern_Panel[13], 0.014, -0.346, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[109], HopeModern_Click13_5, true)
	HopeModern_Row[110] = HopeQoL_Button("HopeChoiceRow13_6", HopeModern_Panel[13], 0.014, -0.389, 0.382, 0.037, "")
	HopeQoL_Bind(HopeModern_Row[110], HopeModern_Click13_6, true)
	HopeR_Viewport[13] = HopeQoL_Button("HopeRViewport13", HopeModern_Panel[13], 0.01, -0.034, 0.216, 0.066, "")
	DzFrameSetScriptByCode(HopeR_Viewport[13], 2, HopeScroll_EnterR, false)
	DzFrameSetScriptByCode(HopeR_Viewport[13], 3, HopeScroll_Leave, false)
	HopeR_Body[13] = HopeQoL_Label("HopeRBody13", HopeR_Viewport[13], 0.004, -0.003, 0.208, 0.059, "")
	DzFrameSetFont(HopeR_Body[13], "Fonts\\ZiTi.ttf", 0.0085, 0)
	HopeR_Up[13] = HopeQoL_Button("HopeRUp13", HopeModern_Panel[13], 0.235, -0.034, 0.023, 0.023, "上")
	HopeQoL_Bind(HopeR_Up[13], HopeScroll_RUp, false)
	HopeR_Down[13] = HopeQoL_Button("HopeRDown13", HopeModern_Panel[13], 0.235, -0.076, 0.023, 0.023, "下")
	HopeQoL_Bind(HopeR_Down[13], HopeScroll_RDown, false)
	HopeR_Notice[13] = HopeQoL_Label("HopeRNotice13", HopeModern_Panel[13], 0.01, -0.105, 0.248, 0.012, "")
	DzFrameSetFont(HopeR_Notice[13], "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeJob_ShowFrame(HopeModern_Panel[13], false)
	HopeModern_Ready = true
end

function HopeDamage_Battle()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeDamage_Run = false
	end
end

function HopeDamage_RunClick()
	if DzGetTriggerUIEventPlayer() == GetLocalPlayer() then
		HopeDamage_Run = true
	end
end

function HopeDamage_Value(i)
	if HopeDamage_Run then
		return HopeDamage_Total[i]
	end
	return udg_Shuchu_dm_tj[i]
end

function HopeDamage_Number(value)
	local exponent = 0
	if value < 10000.0 then
		return R2SW(value, 1, 0)
	elseif value < 100000000.0 then
		return (R2SW(value / 10000.0, 1, 1) or "") .. "万"
	elseif value < -727379968.0 then
		return (R2SW(value / 100000000.0, 1, 1) or "") .. "亿"
	end
	for _ in _loop_() do
		if value < 1000.0 or exponent >= 36 then break end
		value = value / 1000.0
		exponent = exponent + 3
	end
	return (R2SW(value, 1, 1) or "") .. "e" .. (I2S(exponent) or "")
end

function HopeDamage_Refresh()
	local i = 1
	local j = 0
	local count = 0
	local id = 0
	local amount = 0.0
	local sum = 0.0
	local text = ""
	local name = ""
	local line = ""
	for _ in _loop_() do
		if i > 6 then break end
		if udg_hero[i] ~= nil or HopeDamage_Total[i] > 0.0 then
			j = count
			for _ in _loop_() do
				if j <= 0 then break end
				if HopeDamage_Value(HopeDamage_Order[j]) >= HopeDamage_Value(i) then break end
				HopeDamage_Order[j + 1] = HopeDamage_Order[j]
				j = j - 1
			end
			HopeDamage_Order[j + 1] = i
			count = count + 1
			sum = sum + HopeDamage_Value(i)
		end
		i = i + 1
	end
	i = 1
	for _ in _loop_() do
		if i > count then break end
		id = HopeDamage_Order[i]
		name = HopeName_Label(Player(id - 1), 50)
		amount = HopeDamage_Value(id)
		line = (I2S(i) or "") .. ". " .. (name or "") .. " " .. (HopeDamage_Number(amount) or "")
		if sum > 0.0 then
			if amount / sum >= 0.9995 then
				line = (line or "") .. " 100%"
			else
				line = (line or "") .. " " .. (R2SW(amount / sum * 100.0, 1, 1) or "") .. "%"
			end
		end
		text = (text or "") .. (YDWEGetPlayerColorString(Player(id - 1), line) or "") .. "|n"
		i = i + 1
	end
	if count == 0 then
		text = "等待英雄进入本局。|n"
	end
	text = (text or "") .. "|cff999999结算伤害含溢出|r"
	HopeLayout_Place(HopeDamage_Panel, 0, 0.642, 0.574, 0.144, 0.051 + 0.011 * I2R(count))
	HopeLayout_Place(HopeDamage_Text, HopeDamage_Panel, 0.007, -0.029, 0.13, 0.015 + 0.011 * I2R(count))
	HopeJob_SetText(HopeDamage_Text, text)
	if HopeDamage_Run then
		HopeJob_SetText(HopeDamage_BattleButton, "本场")
		HopeJob_SetText(HopeDamage_TotalButton, "|cffffd060本局|r")
	else
		HopeJob_SetText(HopeDamage_BattleButton, "|cffffd060本场|r")
		HopeJob_SetText(HopeDamage_TotalButton, "本局")
	end
end

function HopeDamage_Create()
	local f = 0
	HopeDamage_Panel = HopeQoL_Surface("HopeDamagePanel", 0.642, 0.574, 0.144, 0.117)
	f = HopeQoL_Label("HopeDamageTitle", HopeDamage_Panel, 0.007, -0.006, 0.032, 0.014, "伤害榜")
	HopeDamage_BattleButton = HopeQoL_Button("HopeDamageBattle", HopeDamage_Panel, 0.045, -0.005, 0.043, 0.017, "本场")
	HopeQoL_Bind(HopeDamage_BattleButton, HopeDamage_Battle, false)
	HopeDamage_TotalButton = HopeQoL_Button("HopeDamageTotal", HopeDamage_Panel, 0.094, -0.005, 0.043, 0.017, "本局")
	HopeQoL_Bind(HopeDamage_TotalButton, HopeDamage_RunClick, false)
	HopeDamage_Text = HopeQoL_Label("HopeDamageText", HopeDamage_Panel, 0.007, -0.029, 0.13, 0.081, "")
	DzFrameSetFont(HopeDamage_Text, "Fonts\\ZiTi.ttf", 0.0085, 0)
end

function HopeLayout_Assignment()
	local i = 0
	local count = 0
	local slot = 0
	local x = 0.0
	local y = 0.0
	local name = ""
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			count = count + 1
		end
		i = i + 1
	end
	HopeLayout_Place(HopeRoute_AssignPanel, 0, 0.249, 0.5, 0.302, 0.074 + 0.034 * I2R(_idiv_(count + 1, 2)))
	i = 0
	for _ in _loop_() do
		if i >= 6 then break end
		if HopeRoute_Active(i) then
			x = 0.012 + 0.144 * I2R(ModuloInteger(slot, 2))
			y = -0.064 - 0.034 * I2R(_idiv_(slot, 2))
			HopeLayout_Place(HopeRoute_AssignButton[i + 1], HopeRoute_AssignPanel, x, y, 0.134, 0.027)
			name = (I2S(i + 1) or "") .. " · " .. (HopeName_Label(Player(i), 100) or "")
			DzFrameSetText(HopeRoute_AssignButton[i + 1], name)
			slot = slot + 1
		end
		i = i + 1
	end
end

function HopeLayout_Init()
	local i = 0
	HopeLayout_Place(HopeQoL_StatsButton, 0, 0.014, 0.248, 0.064, 0.021)
	HopeLayout_Place(HopeLayout_Route, 0, 0.084, 0.248, 0.064, 0.021)
	HopeLayout_Place(HopeLayout_Save, 0, 0.014, 0.222, 0.064, 0.021)
	HopeLayout_Place(HopeLayout_Relic, 0, 0.084, 0.222, 0.064, 0.021)
	HopeLayout_Place(HopeGift_OpenButton, 0, 0.014, 0.196, 0.064, 0.021)
	HopeLayout_Place(HopeLayout_History, 0, 0.084, 0.196, 0.064, 0.021)
	HopeLayout_Place(HopeChoice_Button, 0, 0.014, 0.375, 0.134, 0.022)
	HopeLayout_Place(HopeJob_OpenButton, 0, 0.16, 0.248, 0.1, 0.021)
	DzFrameSetText(HopeLayout_Route, "选择路线")
	DzFrameSetText(HopeGift_OpenButton, "礼包抽奖")
	HopeLayout_Place(HopeRoute_ReadyButton, HopeRoute_Panel, 0.007, -0.025, 0.077, 0.022)
	HopeLayout_Place(HopeRoute_WaitButton, HopeRoute_Panel, 0.007, -0.025, 0.077, 0.022)
	HopeLayout_Place(HopeRoute_DepartButton, HopeRoute_Panel, 0.007, -0.051, 0.12, 0.023)
	for _ in _loop_() do
		if i >= 6 then break end
		HopeLayout_Member[i] = HopeQoL_Label("HopeReadyMember" .. (I2S(i) or ""), HopeRoute_Panel, 0.007, -0.08, 0.058, 0.011, "")
		DzFrameSetFont(HopeLayout_Member[i], "Fonts\\ZiTi.ttf", 0.0085, 0)
		i = i + 1
	end
end

function HopeV8_RefreshContent()
	HopeModern_Refresh()
	HopeRoute_RefreshPicker()
	HopeLayout_Assignment()
	HopeDraw_Refresh()
	HopeDamage_Refresh()
	HopeMeta_Refresh()
	HopeMarket_Refresh()
end

function HopeV8_Refresh()
	HopeV8_RefreshContent()
	HopeLayout_Apply()
end

function HopeEvent_Close()
	HopeEvent_Open = false
end

function HopeEvent_Show()
	HopeEvent_Open = true
	HopeLayout_Focus(14)
end

function HopeEvent_Move(delta)
	HopeEvent_Offset = IMaxBJ(IMaxBJ(0, HopeEvent_Count - 512), IMinBJ(IMaxBJ(HopeEvent_Start, HopeEvent_Count - 13), HopeEvent_Offset + delta))
end

function HopeEvent_Up()
	HopeEvent_Move(-3)
end

function HopeEvent_Down()
	HopeEvent_Move(3)
end

function HopeEvent_Enter()
	HopeScroll_Hover = 3
end

function HopeEvent_Create()
	local f = 0
	local viewport = 0
	HopeEvent_Panel = HopeQoL_Surface("HopeEventPanel", 0.244, 0.505, 0.312, 0.228)
	f = HopeQoL_Label("HopeEventTitle", HopeEvent_Panel, 0.01, -0.008, 0.244, 0.019, "问号事件 · 全队记录")
	f = HopeQoL_Button("HopeEventClose", HopeEvent_Panel, 0.258, -0.007, 0.044, 0.021, "关闭")
	HopeQoL_Bind(f, HopeEvent_Close, false)
	viewport = HopeQoL_Button("HopeEventViewport", HopeEvent_Panel, 0.01, -0.035, 0.292, 0.153, "")
	DzFrameSetScriptByCode(viewport, 2, HopeEvent_Enter, false)
	DzFrameSetScriptByCode(viewport, 3, HopeScroll_Leave, false)
	HopeEvent_Body = HopeQoL_Label("HopeEventBody", viewport, 0.005, -0.004, 0.282, 0.145, "")
	DzFrameSetFont(HopeEvent_Body, "Fonts\\ZiTi.ttf", 0.0085, 0)
	f = HopeQoL_Button("HopeEventUp", HopeEvent_Panel, 0.01, -0.196, 0.036, 0.023, "上")
	HopeQoL_Bind(f, HopeEvent_Up, false)
	f = HopeQoL_Button("HopeEventDown", HopeEvent_Panel, 0.05, -0.196, 0.036, 0.023, "下")
	HopeQoL_Bind(f, HopeEvent_Down, false)
	HopeEvent_Status = HopeQoL_Label("HopeEventStatus", HopeEvent_Panel, 0.092, -0.201, 0.21, 0.016, "")
	DzFrameSetFont(HopeEvent_Status, "Fonts\\ZiTi.ttf", 0.008, 0)
	HopeEvent_Button = HopeQoL_Button("HopeEventEntry", DzGetGameUI(), 0.16, 0.222, 0.1, 0.021, "问号事件")
	HopeQoL_Bind(HopeEvent_Button, HopeEvent_Show, false)
	HopeJob_ShowFrame(HopeEvent_Panel, false)
end

function HopeV8_Init()
	DestroyTimer(GetExpiredTimer())
	HopeModern_Create()
	HopeRoute_CreateExtra()
	HopeDraw_Create()
	HopeEvent_Create()
	HopeWood_Init()
	HopeExchange_Init()
	HopeMeta_Create()
	DzTriggerRegisterMouseWheelEventByCode(nil, false, HopeScroll_Wheel)
	HopeDamage_Create()
	HopeLayout_Init()
	TimerStart(CreateTimer(), 0.1, true, HopeV8_Refresh)
end

end

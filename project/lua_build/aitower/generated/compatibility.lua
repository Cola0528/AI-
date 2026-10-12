-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function HopeInventory_Put(receiver, it)
	local i = GetPlayerId(GetOwningPlayer(receiver)) + 1
	local helper = nil
	if it == nil or GetItemTypeId(it) == 0 or receiver == nil then
		return false
	end
	if UnitAddItem(receiver, it) then
		return true
	end
	-- A pickup/combine callback may already have consumed the item.
	if GetItemTypeId(it) == 0 or IsItemOwned(it) then
		return true
	end
	if i >= 1 and i <= 6 and (receiver == udg_hero[i] or receiver == udg_Bei_bao_danwei[i]) then
		helper = udg_Bei_bao_danwei[i]
		if receiver == helper then
			helper = udg_hero[i]
		end
		if helper ~= nil and GetUnitTypeId(helper) ~= 0 and UnitAddItem(helper, it) then
			DisplayTimedTextToPlayer(GetOwningPlayer(receiver), 0, 0, 4.0, "背包已满：装备已转入另一背包。")
			helper = nil
			return true
		end
	end
	if GetItemTypeId(it) ~= 0 and not IsItemOwned(it) then
		SetItemPosition(it, GetUnitX(receiver), GetUnitY(receiver))
		DisplayTimedTextToPlayer(GetOwningPlayer(receiver), 0, 0, 5.0, "两个背包均无空位：装备已放在领取单位脚下。")
	end
	helper = nil
	return false
end

function HopeInventory_Give(id, receiver)
	local it = CreateItem(id, GetUnitX(receiver), GetUnitY(receiver))
	HopeInventory_Put(receiver, it)
	bj_lastCreatedItem = it
	it = nil
	return bj_lastCreatedItem
end

function s__YDWEStringFormula__Inventory__allocate()
	local this = si__YDWEStringFormula__Inventory_F
	if this ~= 0 then
		si__YDWEStringFormula__Inventory_F = si__YDWEStringFormula__Inventory_V[this]
	else
		si__YDWEStringFormula__Inventory_I = si__YDWEStringFormula__Inventory_I + 1
		this = si__YDWEStringFormula__Inventory_I
	end
	if this > 8190 then
		return 0
	end
	si__YDWEStringFormula__Inventory_type[this] = 2
	si__YDWEStringFormula__Inventory_V[this] = -1
	return this
end

function s__YDWEStringFormula__StringTable__allocate()
	local this = s__YDWEStringFormula__Inventory__allocate()
	local kthis
	if this == 0 then
		return 0
	end
	si__YDWEStringFormula__Inventory_type[this] = 3
	kthis = this
	return this
end

function s__YDWETimerPattern__Thread__allocate()
	local this = si__YDWETimerPattern__Thread_F
	if this ~= 0 then
		si__YDWETimerPattern__Thread_F = si__YDWETimerPattern__Thread_V[this]
	else
		si__YDWETimerPattern__Thread_I = si__YDWETimerPattern__Thread_I + 1
		this = si__YDWETimerPattern__Thread_I
	end
	if this > 8190 then
		return 0
	end
	si__YDWETimerPattern__Thread_type[this] = 10
	si__YDWETimerPattern__Thread_V[this] = -1
	return this
end

function sc__YDWETimerPattern__Thread_deallocate(this)
	if this == nil then
		return
	elseif si__YDWETimerPattern__Thread_V[this] ~= -1 then
		return
	end
	f__arg_this = this
	TriggerEvaluate(st__YDWETimerPattern__Thread_onDestroy[si__YDWETimerPattern__Thread_type[this]])
	si__YDWETimerPattern__Thread_V[this] = si__YDWETimerPattern__Thread_F
	si__YDWETimerPattern__Thread_F = this
end

function s__YDWETimerPattern__YDVector3__allocate()
	local this = si__YDWETimerPattern__YDVector3_F
	if this ~= 0 then
		si__YDWETimerPattern__YDVector3_F = si__YDWETimerPattern__YDVector3_V[this]
	else
		si__YDWETimerPattern__YDVector3_I = si__YDWETimerPattern__YDVector3_I + 1
		this = si__YDWETimerPattern__YDVector3_I
	end
	if this > 8190 then
		return 0
	end
	si__YDWETimerPattern__YDVector3_V[this] = -1
	return this
end

function s__YDWETimerPattern__YDVector3_deallocate(this)
	if this == nil then
		return
	elseif si__YDWETimerPattern__YDVector3_V[this] ~= -1 then
		return
	end
	si__YDWETimerPattern__YDVector3_V[this] = si__YDWETimerPattern__YDVector3_F
	si__YDWETimerPattern__YDVector3_F = this
end

function s__YDWEStringFormula__Sorting__allocate()
	local this = si__YDWEStringFormula__Sorting_F
	if this ~= 0 then
		si__YDWEStringFormula__Sorting_F = si__YDWEStringFormula__Sorting_V[this]
	else
		si__YDWEStringFormula__Sorting_I = si__YDWEStringFormula__Sorting_I + 1
		this = si__YDWEStringFormula__Sorting_I
	end
	if this > 1022 then
		return 0
	end
	s__YDWEStringFormula__Sorting_stack[this] = (this - 1) * 8
	s__YDWEStringFormula__Sorting_count[this] = (this - 1) * 8
	s__YDWEStringFormula__Sorting_total[this] = 7
	si__YDWEStringFormula__Sorting_V[this] = -1
	return this
end

function s__YDWETimerPattern__Deceleration__allocate()
	local this = s__YDWETimerPattern__Thread__allocate()
	local kthis
	if this == 0 then
		return 0
	end
	si__YDWETimerPattern__Thread_type[this] = 13
	kthis = this
	return this
end

function YDTriggerSaveLoadSystem___Init()
	YDHT = InitHashtable()
	YDLOC = InitHashtable()
end

function HopePriest_BaseDamage(amount)
	return amount * 0.8
end

function HopePriest_TargetDamage(amount, target)
	if IsUnitType(target, UNIT_TYPE_UNDEAD) then
		return amount * 1.25
	end
	return amount
end

function YDWESetUnitAbilityDataReal(u, abilcode, level, data_type, value)
	return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
end

function YDWESetUnitAbilityDataString(u, abilcode, level, data_type, value)
	local hopeSkillAbility = EXGetUnitAbility(u, abilcode)
	local hopeSkillResult = false
	local hopeSkillKey = 0
	if data_type == 218 and HopeSkill_IsPotion(abilcode) then
		value = HopeSkill_PotionDescription(u)
	end
	if data_type == 218 and HopeSkill_Base ~= nil and hopeSkillAbility ~= nil and HopeSkill_Supported(abilcode) then
		hopeSkillKey = HopeSkill_Key(abilcode, level)
		SaveStr(HopeSkill_Base, GetHandleId(u), hopeSkillKey, value)
		SaveInteger(HopeSkill_Base, GetHandleId(u), hopeSkillKey, GetHandleId(hopeSkillAbility))
		RemoveSavedString(HopeSkill_Rendered, GetHandleId(u), hopeSkillKey)
	end
	hopeSkillResult = EXSetAbilityDataString(hopeSkillAbility, level, data_type, value)
	hopeSkillAbility = nil
	return hopeSkillResult
end

function YDWEGetItemDataString(itemcode, data_type)
	return EXGetItemDataString(itemcode, data_type)
end

function YDWEH2I(h)
	return GetHandleId(h)
end

function YDWEFlushMissionByString(s)
	FlushChildHashtable(YDHT, StringHash(s))
end

function YDWEFlushStoredIntegerByString(s1, s2)
	RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
end

function YDWEHaveSavedIntegerByString(s1, s2)
	return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
end

function YDWESaveIntegerByString(pTable, pKey, i)
	SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
end

function YDWEGetIntegerByString(pTable, pKey)
	return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
end

function YDWESaveRealByString(pTable, pKey, r)
	SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
end

function YDWEGetRealByString(pTable, pKey)
	return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
end

function YDWESaveUnitByString(pTable, pKey, u)
	SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
end

function YDWEGetUnitByString(pTable, pKey)
	return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
end

function YDWECoordinateX(x)
	return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
end

function YDWECoordinateY(y)
	return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
end

function YDWEDistanceBetweenUnits(a, b)
	return SquareRoot((GetUnitX(a) - GetUnitX(b)) * (GetUnitX(a) - GetUnitX(b)) + (GetUnitY(a) - GetUnitY(b)) * (GetUnitY(a) - GetUnitY(b)))
end

function YDWEAngleBetweenUnits(fromUnit, toUnit)
	return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
end

function YDWEFlyEnable(u)
	UnitAddAbility(u, 1097691750)
	UnitRemoveAbility(u, 1097691750)
end

function YDWESyStemAbilityCastingOverTriggerAction(hero, index)
	local i = 0
	for _ in _loop_() do
		if i >= YDWEBase__AbilityCastingOverEventNumber then break end
		if YDWEBase__AbilityCastingOverEventType[i] == index then
			bj_lastAbilityCastingUnit = hero
			if YDWEBase__AbilityCastingOverEventQueue[i] ~= nil and TriggerEvaluate(YDWEBase__AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase__AbilityCastingOverEventQueue[i]) then
				TriggerExecute(YDWEBase__AbilityCastingOverEventQueue[i])
			end
		end
		i = i + 1
	end
end

function YDWEPlaceRandomItem(ip, x, y)
	bj_lastPoolAbstractedItem = PlaceRandomItem(ip, x, y)
end

function YDWEGetLastPoolAbstractedItem()
	return bj_lastPoolAbstractedItem
end

function YDWEGetPlayerColorString(p, s)
	return (YDWEBase__yd_PlayerColor[GetHandleId(GetPlayerColor(p))] or "") .. (s or "") .. "|r"
end

function HopeUI_PlayerText(p, text)
	local color = GetHandleId(GetPlayerColor(p))
	local prefix = YDWEBase__yd_PlayerColor[color]
	if color == 0 then
		prefix = "|cffff6b6b"
	elseif color == 1 then
		prefix = "|cff719fff"
	elseif color == 3 then
		prefix = "|cffbf80ef"
	elseif color == 10 then
		prefix = "|cff6fbea0"
	elseif color == 11 then
		prefix = "|cffc79365"
	elseif color >= 12 then
		prefix = "|cffa8a8a8"
	end
	return (prefix or "") .. (text or "") .. "|r"
end

function YDWEVersion_Display()
	DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cffffd27aAI爬塔|r")
	return false
end

function YDWEVersion_Init()
	local t = CreateTrigger()
	local i = 0
	for _ in _loop_() do
		if i == 12 then break end
		TriggerRegisterPlayerChatEvent(t, Player(i), "YDWE Version", true)
		i = i + 1
	end
	TriggerAddCondition(t, Condition(YDWEVersion_Display))
	t = nil
end

function InitializeYD()
	YDHT = InitHashtable()
	yd_MapMinX = GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	yd_MapMinY = GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	yd_MapMaxX = GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	yd_MapMaxY = GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	YDWEBase__yd_PlayerColor[0] = "|cFFFF0303"
	YDWEBase__yd_PlayerColor[1] = "|cFF0042FF"
	YDWEBase__yd_PlayerColor[2] = "|cFF1CE6B9"
	YDWEBase__yd_PlayerColor[3] = "|cFF540081"
	YDWEBase__yd_PlayerColor[4] = "|cFFFFFC01"
	YDWEBase__yd_PlayerColor[5] = "|cFFFE8A0E"
	YDWEBase__yd_PlayerColor[6] = "|cFF20C000"
	YDWEBase__yd_PlayerColor[7] = "|cFFE55BB0"
	YDWEBase__yd_PlayerColor[8] = "|cFF959697"
	YDWEBase__yd_PlayerColor[9] = "|cFF7EBFF1"
	YDWEBase__yd_PlayerColor[10] = "|cFF106246"
	YDWEBase__yd_PlayerColor[11] = "|cFF4E2A04"
	YDWEBase__yd_PlayerColor[12] = "|cFF282828"
	YDWEBase__yd_PlayerColor[13] = "|cFF282828"
	YDWEBase__yd_PlayerColor[14] = "|cFF282828"
	YDWEBase__yd_PlayerColor[15] = "|cFF282828"
	YDWEVersion_Init()
end

function YDWEIsEventDamageType(damageType)
	return damageType == ConvertDamageType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE))
end

function YDWEIsEventAttackType(attackType)
	return attackType == ConvertAttackType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE))
end

function YDWESetEventDamage(amount)
	return EXSetEventDamage(amount)
end

function YDWEGetUnitsInRangeOfLocMatchingNull(radius, whichLocation, filter)
	local g = CreateGroup()
	GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
	DestroyBoolExpr(filter)
	yd_NullTempGroup = g
	g = nil
	return yd_NullTempGroup
end

function YDWEGetUnitsInRectMatchingNull(r, filter)
	local g = CreateGroup()
	GroupEnumUnitsInRect(g, r, filter)
	DestroyBoolExpr(filter)
	yd_NullTempGroup = g
	g = nil
	return yd_NullTempGroup
end

function YDWEGetUnitsOfPlayerAndTypeIdNull(whichPlayer, unitid)
	local g = CreateGroup()
	bj_groupEnumTypeId = unitid
	GroupEnumUnitsOfPlayer(g, whichPlayer, filterGetUnitsOfPlayerAndTypeId)
	yd_NullTempGroup = g
	g = nil
	return yd_NullTempGroup
end

function YDWEGetUnitsOfPlayerMatchingNull(whichPlayer, filter)
	local g = CreateGroup()
	GroupEnumUnitsOfPlayer(g, whichPlayer, filter)
	DestroyBoolExpr(filter)
	yd_NullTempGroup = g
	g = nil
	return yd_NullTempGroup
end

function YDWEPolledWaitNull(duration)
	local t
	local timeRemaining
	if duration > 0 then
		t = CreateTimer()
		TimerStart(t, duration, false, nil)
		for _ in _loop_() do
			timeRemaining = TimerGetRemaining(t)
			if timeRemaining <= 0 then break end
			if timeRemaining > bj_POLLED_WAIT_SKIP_THRESHOLD then
				TriggerSleepAction(0.1 * timeRemaining)
			else
				TriggerSleepAction(bj_POLLED_WAIT_INTERVAL)
			end
		end
		DestroyTimer(t)
	end
	t = nil
end

function YDWEAnyUnitDamagedTriggerAction()
	local i = 0
	for _ in _loop_() do
		if i >= YDWETriggerEvent__DamageEventNumber then break end
		if YDWETriggerEvent__DamageEventQueue[i] ~= nil and IsTriggerEnabled(YDWETriggerEvent__DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__DamageEventQueue[i]) then
			TriggerExecute(YDWETriggerEvent__DamageEventQueue[i])
		end
		i = i + 1
	end
end

function YDWEAnyUnitDamagedFilter()
	if GetUnitAbilityLevel(GetFilterUnit(), 1097625443) <= 0 then
		TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
	end
	return false
end

function YDWEAnyUnitDamagedEnumUnit()
	local t = CreateTrigger()
	local r = CreateRegion()
	local g = CreateGroup()
	RegionAddRect(r, GetWorldBounds())
	TriggerRegisterEnterRegion(t, r, Condition(YDWEAnyUnitDamagedFilter))
	GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(YDWEAnyUnitDamagedFilter))
	DestroyGroup(g)
	r = nil
	t = nil
	g = nil
end

function YDWESyStemAnyUnitDamagedRegistTrigger(trg)
	if trg == nil then
		return
	end
	if YDWETriggerEvent__DamageEventNumber == 0 then
		yd_DamageEventTrigger = CreateTrigger()
		TriggerAddAction(yd_DamageEventTrigger, YDWEAnyUnitDamagedTriggerAction)
		YDWEAnyUnitDamagedEnumUnit()
	end
	YDWETriggerEvent__DamageEventQueue[YDWETriggerEvent__DamageEventNumber] = trg
	YDWETriggerEvent__DamageEventNumber = YDWETriggerEvent__DamageEventNumber + 1
end

function YDWESyStemItemUnmovableTriggerAction()
	local i = 0
	if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		bj_lastMovedItemInItemSlot = GetOrderTargetItem()
		for _ in _loop_() do
			if i >= YDWETriggerEvent__MoveItemEventNumber then break end
			if YDWETriggerEvent__MoveItemEventQueue[i] ~= nil and IsTriggerEnabled(YDWETriggerEvent__MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__MoveItemEventQueue[i]) then
				TriggerExecute(YDWETriggerEvent__MoveItemEventQueue[i])
			end
			i = i + 1
		end
	end
end

function YDWESyStemItemUnmovableRegistTrigger(trg)
	if trg == nil then
		return
	end
	if YDWETriggerEvent__MoveItemEventNumber == 0 then
		YDWETriggerEvent__MoveItemEventTrigger = CreateTrigger()
		TriggerAddAction(YDWETriggerEvent__MoveItemEventTrigger, YDWESyStemItemUnmovableTriggerAction)
		TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent__MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
	end
	YDWETriggerEvent__MoveItemEventQueue[YDWETriggerEvent__MoveItemEventNumber] = trg
	YDWETriggerEvent__MoveItemEventNumber = YDWETriggerEvent__MoveItemEventNumber + 1
end

function YDWETriggerRegisterEnterRectSimpleNull(trig, r)
	local rectRegion = CreateRegion()
	RegionAddRect(rectRegion, r)
	yd_NullTempRegion = rectRegion
	rectRegion = nil
	return TriggerRegisterEnterRegion(trig, yd_NullTempRegion, nil)
end

function YDWEUnitHasItemOfTypeBJNull(whichUnit, itemId)
	local index = 0
	if itemId ~= 0 then
		for _ in _loop_() do
			if GetItemTypeId(UnitItemInSlot(whichUnit, index)) == itemId then
				return true
			end
			index = index + 1
			if index >= bj_MAX_INVENTORY then break end
		end
	end
	return false
end

function s__hardware_onInit()
	SetTerrainFogEx(0, 20000.0, 20000.0, 0, 1, 1, 1)
	SetCameraField(CAMERA_FIELD_FARZ, 20000.0, 0)
end

function HopeScroll_Add(target, text)
	local p = 0
	local start = 0
	local size = StringLength(text)
	local line = ""
	for _ in _loop_() do
		if p > size then break end
		if p == size or SubString(text, p, p + 2) == "|n" then
			line = SubString(text, start, p)
			if line ~= "" then
				if target == 1 then
					HopeLog_Line[HopeLog_Count] = line
					HopeLog_Count = HopeLog_Count + 1
				else
					HopeR_Line[HopeR_Count] = line
					HopeR_Count = HopeR_Count + 1
				end
			end
			p = p + 2
			start = p
		else
			p = p + 1
		end
	end
end

function HopeScroll_View(target, offset, rows)
	local i = 0
	local count = HopeLog_Count
	local text = ""
	if target == 2 then
		count = HopeR_Count
	end
	for _ in _loop_() do
		if i >= rows or offset + i >= count then break end
		if i > 0 then
			text = (text or "") .. "|n"
		end
		if target == 1 then
			text = (text or "") .. (HopeLog_Line[offset + i] or "")
		else
			text = (text or "") .. (HopeR_Line[offset + i] or "")
		end
		i = i + 1
	end
	return text
end

function HopeScroll_Move(target, delta)
	if target == 3 then
		HopeEvent_Offset = IMaxBJ(IMaxBJ(0, HopeEvent_Count - 512), IMinBJ(IMaxBJ(HopeEvent_Start, HopeEvent_Count - 13), HopeEvent_Offset + delta))
	elseif target == 1 then
		HopeLog_Offset = IMaxBJ(0, IMinBJ(IMaxBJ(0, HopeLog_Count - 13), HopeLog_Offset + delta))
	else
		HopeR_Offset = IMaxBJ(0, IMinBJ(IMaxBJ(0, HopeR_Count - 5), HopeR_Offset + delta))
	end
end

function HopeScroll_Capturing()
	if HopeScroll_Hover == 3 then
		return HopeEvent_Open
	elseif HopeScroll_Hover == 1 then
		return HopeDraw_Open and HopeLog_Visible and not HopeRoute_Assigning
	elseif HopeScroll_Hover == 2 then
		return HopeR_Active > 0 and not HopeChoice_Hidden and not HopeRoute_Assigning and HopeChoice_DialogPending[HopeR_Active]
	end
	return false
end

function HopeScroll_EnterLog()
	HopeScroll_Hover = 1
end

function HopeScroll_EnterR()
	HopeScroll_Hover = 2
end

function HopeScroll_Leave()
	HopeScroll_Hover = 0
end

function HopeScroll_Wheel()
	if HopeScroll_Capturing() then
		if DzGetWheelDelta() < 0 then
			HopeScroll_Move(HopeScroll_Hover, 3)
		elseif DzGetWheelDelta() > 0 then
			HopeScroll_Move(HopeScroll_Hover, -3)
		end
	end
end

function HopeScroll_LogUp()
	HopeScroll_Move(1, -3)
end

function HopeScroll_LogDown()
	HopeScroll_Move(1, 3)
end

function HopeScroll_Latest()
	HopeLog_Offset = 0
end

function HopeScroll_RUp()
	HopeScroll_Move(2, -2)
end

function HopeScroll_RDown()
	HopeScroll_Move(2, 2)
end

function s__hardware_OnWheel()
	local delta = DzGetWheelDelta()
	if HopeScroll_Capturing() then
		return
	end
	if not DzIsMouseOverUI() then
		return
	end
	s__hardware_ResetCam = true
	if delta < 0 then
		if s__hardware_ViewLevel < s__hardware_ViewLevelMax then
			s__hardware_ViewLevel = s__hardware_ViewLevel + 1
		end
	elseif s__hardware_ViewLevel > s__hardware_ViewLevelMin then
		s__hardware_ViewLevel = s__hardware_ViewLevel - 1
	end
	s__hardware_X_ANGLE = Rad2Deg(GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK))
end

function s__hardware_Update()
	if s__hardware_ResetCam then
		SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, s__hardware_X_ANGLE, 0)
		SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, s__hardware_ViewLevel * 200, s__hardware_WheelSpeed)
		s__hardware_ResetCam = false
	end
end

function s__hardware_SetWideScreen()
	s__hardware_WideScr = not s__hardware_WideScr
	DzEnableWideScreen(s__hardware_WideScr)
	return s__hardware_WideScr
end

function YDWEGetUnitsInRectAllNull(r)
	return YDWEGetUnitsInRectMatchingNull(r, nil)
end

function YDWEGetUnitsOfPlayerAllNull(whichPlayer)
	return YDWEGetUnitsOfPlayerMatchingNull(whichPlayer, nil)
end

function YDWEJumpTimerLoop()
	local t = GetExpiredTimer()
	local hero = YDWEGetUnitByString(I2S(YDWEH2I(t)), "Hero")
	local angle = YDWEGetRealByString(I2S(YDWEH2I(t)), "Angle")
	local steeps = YDWEGetIntegerByString(I2S(YDWEH2I(t)), "steeps")
	local steepsMax = YDWEGetIntegerByString(I2S(YDWEH2I(t)), "steepsMax")
	local heightMax = YDWEGetRealByString(I2S(YDWEH2I(t)), "heightMax")
	local dist = YDWEGetRealByString(I2S(YDWEH2I(t)), "dist")
	local dheig = YDWEGetRealByString(I2S(YDWEH2I(t)), "dheig")
	local OriginHeight = YDWEGetRealByString(I2S(YDWEH2I(t)), "OriginHeight")
	local x = YDWEGetRealByString(I2S(YDWEH2I(t)), "X")
	local y = YDWEGetRealByString(I2S(YDWEH2I(t)), "Y")
	local x1 = 0
	local y1 = 0
	local height = 0
	local lvJumpTimer = MoveMoreLevel_JumpTimer
	local lvUnitMove = YDWEGetIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove")
	if steeps < steepsMax and lvJumpTimer >= lvUnitMove then
		x1 = x + steeps * dist * Cos(angle * 3.14159 / 180.0)
		y1 = y + steeps * dist * Sin(angle * 3.14159 / 180.0)
		x1 = YDWECoordinateX(x1)
		y1 = YDWECoordinateY(y1)
		SetUnitX(hero, x1)
		SetUnitY(hero, y1)
		steeps = steeps + 1
		YDWESaveIntegerByString(I2S(YDWEH2I(t)), "steeps", steeps)
		height = ( - (2 * I2R(steeps) * dheig - 1) * (2 * I2R(steeps) * dheig - 1) + 1) * heightMax + OriginHeight
		SetUnitFlyHeight(hero, height, 99999)
		SetUnitFacing(hero, angle)
	else
		SetUnitFlyHeight(hero, OriginHeight, 99999)
		SetUnitPathing(hero, true)
		DestroyTimer(t)
		YDWEFlushMissionByString(I2S(YDWEH2I(t)))
		YDWESaveIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove", 0)
		YDWESyStemAbilityCastingOverTriggerAction(hero, 2)
	end
	t = nil
	hero = nil
end

function YDWEJumpTimer(hero, angle, distance, lasttime, timeout, heightMax)
	local t = nil
	local x = GetUnitX(hero)
	local y = GetUnitY(hero)
	local steepsMax = R2I(lasttime / timeout)
	local steeps = 0
	local dist = distance / steepsMax
	local dheig = 1.0 / steepsMax
	local OriginHeight = GetUnitFlyHeight(hero)
	local lvUnitMove = YDWEGetIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove")
	if MoveMoreLevel_JumpTimer <= lvUnitMove then
		return
	end
	t = CreateTimer()
	YDWESaveIntegerByString(I2S(YDWEH2I(hero)), "lvUnitMove", MoveMoreLevel_JumpTimer)
	YDWEFlyEnable(hero)
	SetUnitPathing(hero, false)
	YDWESaveUnitByString(I2S(YDWEH2I(t)), "Hero", hero)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "OriginHeight", OriginHeight)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "Angle", angle)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "dist", dist)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "heightMax", heightMax)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "dheig", dheig)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "X", x)
	YDWESaveRealByString(I2S(YDWEH2I(t)), "Y", y)
	YDWESaveIntegerByString(I2S(YDWEH2I(t)), "steeps", steeps)
	YDWESaveIntegerByString(I2S(YDWEH2I(t)), "steepsMax", steepsMax)
	TimerStart(t, timeout, true, YDWEJumpTimerLoop)
	t = nil
end

function YDWESyStemItemCombineTriggerAction()
	local i = 0
	for _ in _loop_() do
		if i >= YDWEStringFormula__ItemCombineEventNumber then break end
		if YDWEStringFormula__ItemCombineEventQueue[i] ~= nil and TriggerEvaluate(YDWEStringFormula__ItemCombineEventQueue[i]) and IsTriggerEnabled(YDWEStringFormula__ItemCombineEventQueue[i]) then
			TriggerExecute(YDWEStringFormula__ItemCombineEventQueue[i])
		end
		i = i + 1
	end
end

function s__YDWEStringFormula__StringTable__getindex(this, key)
	return YDWEGetIntegerByString("YDWEStringFormula." .. (I2S(this) or ""), key)
end

function s__YDWEStringFormula__StringTable__setindex(this, key, value)
	YDWESaveIntegerByString("YDWEStringFormula." .. (I2S(this) or ""), key, value)
end

function s__YDWEStringFormula__StringTable_exists(this, key)
	return YDWEHaveSavedIntegerByString("YDWEStringFormula." .. (I2S(this) or ""), key)
end

function YDWEStringFormula__Convert(value, length)
	local Char = I2S(value)
	local slen = StringLength(Char)
	for _ in _loop_() do
		if slen >= length then break end
		Char = "0" .. (Char or "")
		slen = slen + 1
	end
	return Char
end

function s__YDWEStringFormula__ItemIdMatrix_get(id)
	return s__YDWEStringFormula__StringTable__getindex(s__YDWEStringFormula__ItemIdMatrix_Data, I2S(id))
end

function s__YDWEStringFormula__ItemIdMatrix_exists(id)
	return s__YDWEStringFormula__StringTable_exists(s__YDWEStringFormula__ItemIdMatrix_Data, I2S(id))
end

function s__YDWEStringFormula__ItemIdMatrix_sub(this, segment)
	local start = s__YDWEStringFormula__ItemIdMatrix_keyLen[this] * segment + 1
	return S2I(SubString(s__YDWEStringFormula__ItemIdMatrix_keyStr[this], start, start + s__YDWEStringFormula__ItemIdMatrix_keyLen[this]))
end

function s__YDWEStringFormula__ItemIdMatrix_assigns(id)
	local this = 0
	if id == nil or id == 0 then
		return 0
	end
	this = s__YDWEStringFormula__ItemIdMatrix_get(id)
	if this > 0 then
		return this
	end
	this = s__YDWEStringFormula__ItemIdMatrix_Total
	s__YDWEStringFormula__ItemIdMatrix_itemId[this] = id
	s__YDWEStringFormula__ItemIdMatrix_keyStr[this] = I2S(YDWEStringFormula__SEGMENT_LENGTH)
	s__YDWEStringFormula__ItemIdMatrix_keyLen[this] = YDWEStringFormula__SEGMENT_LENGTH
	s__YDWEStringFormula__StringTable__setindex(s__YDWEStringFormula__ItemIdMatrix_Data, I2S(id), this)
	s__YDWEStringFormula__ItemIdMatrix_Total = s__YDWEStringFormula__ItemIdMatrix_Total + 1
	return this
end

function s__YDWEStringFormula__ItemIdMatrix_memory(this, key)
	s__YDWEStringFormula__ItemIdMatrix_keyStr[this] = (s__YDWEStringFormula__ItemIdMatrix_keyStr[this] or "") .. (key or "")
end

function s__YDWEStringFormula__ItemIdMatrix_onInit()
	s__YDWEStringFormula__ItemIdMatrix_Data = s__YDWEStringFormula__StringTable__allocate()
end

function s__YDWEStringFormula__FormulaMatrix_exists(s)
	return s__YDWEStringFormula__StringTable_exists(s__YDWEStringFormula__FormulaMatrix_Data, s)
end

function s__YDWEStringFormula__FormulaMatrix_sub(this, segment)
	local start = s__YDWEStringFormula__FormulaMatrix_segmLen[this] * segment + 1
	return S2I(SubString(s__YDWEStringFormula__FormulaMatrix_formula[this], start, start + s__YDWEStringFormula__FormulaMatrix_segmLen[this]))
end

function s__YDWEStringFormula__FormulaMatrix_memory(lingth, formStr, eventually)
	local this = 0
	if s__YDWEStringFormula__FormulaMatrix_exists(formStr) then
		return 0
	end
	this = s__YDWEStringFormula__FormulaMatrix_Total
	s__YDWEStringFormula__FormulaMatrix_formula[this] = (formStr or "") .. (YDWEStringFormula__Convert(eventually, YDWEStringFormula__SEGMENT_LENGTH) or "")
	s__YDWEStringFormula__FormulaMatrix_segmLen[this] = lingth
	s__YDWEStringFormula__FormulaMatrix_model[this] = nil
	s__YDWEStringFormula__FormulaMatrix_message[this] = nil
	s__YDWEStringFormula__FormulaMatrix_chance[this] = 100
	s__YDWEStringFormula__FormulaMatrix_delete[this] = false
	s__YDWEStringFormula__StringTable__setindex(s__YDWEStringFormula__FormulaMatrix_Data, formStr, this)
	s__YDWEStringFormula__FormulaMatrix_Total = s__YDWEStringFormula__FormulaMatrix_Total + 1
	return this
end

function s__YDWEStringFormula__FormulaMatrix_onInit()
	s__YDWEStringFormula__FormulaMatrix_Data = s__YDWEStringFormula__StringTable__allocate()
end

function s__YDWEStringFormula__Sorting_onDestroy(this)
	local i = 0
	for _ in _loop_() do
		if i == s___YDWEStringFormula__Sorting_stack_size then break end
		s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] = 0
		s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] = 0
		i = i + 1
	end
	s__YDWEStringFormula__Sorting_char[this] = ""
end

function s__YDWEStringFormula__Sorting_deallocate(this)
	if this == nil then
		return
	elseif si__YDWEStringFormula__Sorting_V[this] ~= -1 then
		return
	end
	s__YDWEStringFormula__Sorting_onDestroy(this)
	si__YDWEStringFormula__Sorting_V[this] = si__YDWEStringFormula__Sorting_F
	si__YDWEStringFormula__Sorting_F = this
end

function s__YDWEStringFormula__Sorting_create(type1, n1, type2, n2, type3, n3, type4, n4, type5, n5, type6, n6, type7, n7)
	local this = s__YDWEStringFormula__Sorting__allocate()
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 1] = s__YDWEStringFormula__ItemIdMatrix_assigns(type1)
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 2] = s__YDWEStringFormula__ItemIdMatrix_assigns(type2)
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 3] = s__YDWEStringFormula__ItemIdMatrix_assigns(type3)
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 4] = s__YDWEStringFormula__ItemIdMatrix_assigns(type4)
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 5] = s__YDWEStringFormula__ItemIdMatrix_assigns(type5)
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 6] = s__YDWEStringFormula__ItemIdMatrix_assigns(type6)
	s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + 7] = s__YDWEStringFormula__ItemIdMatrix_assigns(type7)
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 1] = n1
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 2] = n2
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 3] = n3
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 4] = n4
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 5] = n5
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 6] = n6
	s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + 7] = n7
	return this
end

function s__YDWEStringFormula__Sorting_convert(this)
	local i = 1
	local j
	local k
	s__YDWEStringFormula__Sorting_char[this] = ""
	for _ in _loop_() do
		if i > s__YDWEStringFormula__Sorting_total[this] then break end
		if s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] == 0 or s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] == 0 then
			s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] = s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + s__YDWEStringFormula__Sorting_total[this]]
			s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] = s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + s__YDWEStringFormula__Sorting_total[this]]
			s__YDWEStringFormula__Sorting_total[this] = s__YDWEStringFormula__Sorting_total[this] - 1
			i = i - 1
		else
			j = i + 1
			for _ in _loop_() do
				if j > s__YDWEStringFormula__Sorting_total[this] then break end
				if s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j] == 0 or s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + j] == 0 then
					s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j] = s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + s__YDWEStringFormula__Sorting_total[this]]
					s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + j] = s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + s__YDWEStringFormula__Sorting_total[this]]
					s__YDWEStringFormula__Sorting_total[this] = s__YDWEStringFormula__Sorting_total[this] - 1
					j = j - 1
				elseif s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] > s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j] then
					k = s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i]
					s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] = s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j]
					s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j] = k
					k = s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i]
					s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] = s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + j]
					s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + j] = k
				elseif s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] == s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j] then
					s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] = s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] + s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + j]
					s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + j] = 0
					j = j - 1
				end
				j = j + 1
			end
			j = s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i]
			for _ in _loop_() do
				if j == 0 then break end
				s__YDWEStringFormula__Sorting_char[this] = (s__YDWEStringFormula__Sorting_char[this] or "") .. (YDWEStringFormula__Convert(s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i], YDWEStringFormula__SEGMENT_LENGTH) or "")
				j = j - 1
			end
		end
		i = i + 1
	end
	return s__YDWEStringFormula__Sorting_char[this]
end

function YDWEStringFormula__Adaptation()
	return true
end

function YDWEStringFormula__verify()
	return s__YDWEStringFormula__ItemIdMatrix_exists(GetItemTypeId(GetManipulatedItem()))
end

function YDWEStringFormula__GetCharges(it)
	local charges = GetItemCharges(it)
	if charges == 0 then
		charges = 1
	end
	return charges
end

function YDWEStringFormula__CraftItem()
	local forx = 0
	local itmx = s__YDWEStringFormula__ItemIdMatrix_get(GetItemTypeId(GetManipulatedItem()))
	local size = _idiv_(StringLength(s__YDWEStringFormula__ItemIdMatrix_keyStr[itmx]), s__YDWEStringFormula__ItemIdMatrix_keyLen[itmx])
	local inst = 0
	local numb = 0
	local sum = 0
	local tmpid = 0
	local i = 0
	local j = 0
	local b = false
	local it = nil
	local article = GetManipulatedItem()
	local caster = GetTriggerUnit()
	local items = _array_()
	local typeid = _array_(0)
	local amount = _array_(0)
	local surplus = _array_(0)
	i = 0
	for _ in _loop_() do
		if i == 6 then break end
		it = UnitItemInSlot(caster, i)
		if it ~= nil then
			items[sum] = it
			typeid[sum] = GetItemTypeId(it)
			amount[sum] = YDWEStringFormula__GetCharges(it)
			if it == article then
				b = true
			end
			sum = sum + 1
		end
		i = i + 1
		it = nil
	end
	if b == false then
		items[sum] = article
		typeid[sum] = GetItemTypeId(article)
		amount[sum] = 1
		sum = sum + 1
	end
	for _ in _loop_() do
		if inst == size then break end
		forx = s__YDWEStringFormula__ItemIdMatrix_sub(itmx, inst)
		numb = _idiv_(StringLength(s__YDWEStringFormula__FormulaMatrix_formula[forx]), s__YDWEStringFormula__FormulaMatrix_segmLen[forx]) - 1
		i = 0
		for _ in _loop_() do
			if i == sum then break end
			surplus[i] = amount[i]
			i = i + 1
		end
		i = 0
		for _ in _loop_() do
			tmpid = s__YDWEStringFormula__ItemIdMatrix_itemId[s__YDWEStringFormula__FormulaMatrix_sub(forx, i)]
			if i == numb then break end
			j = 0
			for _ in _loop_() do
				if j == sum then break end
				if typeid[j] == tmpid and surplus[j] > 0 then
					surplus[j] = surplus[j] - 1
					if true then break end
				end
				j = j + 1
			end
			if j == sum then break end
			i = i + 1
		end
		if i == numb then
			if GetRandomInt(0, 99) < s__YDWEStringFormula__FormulaMatrix_chance[forx] then
				if s__YDWEStringFormula__FormulaMatrix_model[forx] ~= nil then
					DestroyEffect(AddSpecialEffectTarget(s__YDWEStringFormula__FormulaMatrix_model[forx], caster, "origin"))
				end
				if s__YDWEStringFormula__FormulaMatrix_message[forx] ~= nil then
					DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, s__YDWEStringFormula__FormulaMatrix_message[forx])
				end
				i = 0
				for _ in _loop_() do
					if i == sum then break end
					if surplus[i] > 0 and GetItemCharges(items[i]) > 0 then
						SetItemCharges(items[i], surplus[i])
					elseif surplus[i] == 0 then
						RemoveItem(items[i])
					end
					i = i + 1
				end
				it = CreateItem(tmpid, GetUnitX(caster), GetUnitY(caster))
				if GetItemCharges(it) > 0 then
					SetItemCharges(it, 1)
					i = 0
					for _ in _loop_() do
						if i == sum then break end
						if typeid[i] == tmpid then
							RemoveItem(items[i])
							SetItemCharges(it, surplus[i] + 1)
						end
						i = i + 1
					end
				end
				HopeInventory_Put(caster, it)
				bj_lastCombinedItem = it
				YDWESyStemItemCombineTriggerAction()
			elseif s__YDWEStringFormula__FormulaMatrix_delete[forx] then
				i = 0
				for _ in _loop_() do
					if i == sum then break end
					if surplus[i] > 0 and GetItemCharges(items[i]) > 0 then
						SetItemCharges(items[i], surplus[i])
					elseif surplus[i] == 0 then
						RemoveItem(items[i])
					end
					i = i + 1
				end
			end
			it = nil
			if true then break end
		end
		inst = inst + 1
	end
	if b == false then
		RemoveItem(article)
	end
	i = 0
	for _ in _loop_() do
		if i == sum then break end
		items[i] = nil
		i = i + 1
	end
	article = nil
	caster = nil
	it = nil
end

function YDWEStringFormula__Init()
	local f = Filter(YDWEStringFormula__Adaptation)
	local t = CreateTrigger()
	local i = 0
	for _ in _loop_() do
		if i > 15 then break end
		TriggerRegisterPlayerUnitEvent(t, Player(i), EVENT_PLAYER_UNIT_PICKUP_ITEM, f)
		i = i + 1
	end
	TriggerAddCondition(t, Condition(YDWEStringFormula__verify))
	TriggerAddAction(t, YDWEStringFormula__CraftItem)
	DestroyFilter(f)
	f = nil
	t = nil
end

function YDWENewItemsFormula(type1, n1, type2, n2, type3, n3, type4, n4, type5, n5, type6, n6, eventually)
	local sort = s__YDWEStringFormula__Sorting_create(type1, n1, type2, n2, type3, n3, type4, n4, type5, n5, type6, n6, 0, 0)
	local itmx = s__YDWEStringFormula__ItemIdMatrix_assigns(eventually)
	local f = (I2S(YDWEStringFormula__SEGMENT_LENGTH) or "") .. (s__YDWEStringFormula__Sorting_convert(sort) or "")
	local s = ""
	local i = 0
	YDWEStringFormula__FormulaData = s__YDWEStringFormula__FormulaMatrix_memory(YDWEStringFormula__SEGMENT_LENGTH, f, itmx)
	if YDWEStringFormula__FormulaData > 0 then
		s = YDWEStringFormula__Convert(YDWEStringFormula__FormulaData, YDWEStringFormula__SEGMENT_LENGTH)
		i = 0
		for _ in _loop_() do
			if i > s__YDWEStringFormula__Sorting_total[sort] then break end
			s__YDWEStringFormula__ItemIdMatrix_memory(s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[sort] + i], s)
			i = i + 1
		end
		s__YDWEStringFormula__ItemIdMatrix_memory(itmx, s)
	end
	s__YDWEStringFormula__Sorting_deallocate(sort)
	f = ""
	s = ""
end

function YDWETimerPattern__SingleMagic(sour, targ, x, y, h, uid, aid, lv, order)
	local dummy = CreateUnit(GetOwningPlayer(sour), uid, x, y, GetUnitFacing(sour))
	UnitApplyTimedLife(dummy, 1112045413, 1.0)
	UnitAddAbility(dummy, aid)
	SetUnitAbilityLevel(dummy, aid, lv)
	SetUnitFlyHeight(dummy, h, 0.0)
	IssueTargetOrderById(dummy, order, targ)
	dummy = nil
end

function YDWETimerPattern__EnemyFilter(u, caster)
	return IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(u, UNIT_TYPE_RESISTANT) == false and IsUnitType(u, UNIT_TYPE_SLEEPING) == false and GetUnitState(u, UNIT_STATE_LIFE) > 0.405 and IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and IsUnitIllusion(u) == false and IsUnitHidden(u) == false and IsUnitEnemy(u, GetOwningPlayer(caster)) and IsUnitVisible(u, GetOwningPlayer(caster))
end

function YDWETimerPattern__TreeFilter()
	local id = GetDestructableTypeId(GetFilterDestructable())
	return id == 1280601204 or id == 1096053874 or id == 1112831095 or id == 1263826039 or id == 1498703476 or id == 1247044468 or id == 1498706804 or id == 1498702708 or id == 1498707828 or id == 1247048823 or id == 1146385256 or id == 1179939959 or id == 1129608306 or id == 1230271607 or id == 1314157687 or id == 1330934903 or id == 1515484279 or id == 1465152372 or id == 1196716904 or id == 1448373364 or id == 1465152631 or id == 1096053859 or id == 1112831075 or id == 1129608291 or id == 1230271587 or id == 1314157667 or id == 1515484259
end

function YDWETimerPattern__DamageFilter()
	local u = GetFilterUnit()
	local d = YDWETimerPattern__tmp_data
	if not IsUnitInGroup(u, s__YDWETimerPattern__Thread_g[d]) and s__YDWETimerPattern__Thread_switch[d] ~= 0 and YDWETimerPattern__EnemyFilter(u, s__YDWETimerPattern__Thread_caster[d]) then
		UnitDamageTarget(s__YDWETimerPattern__Thread_caster[d], u, s__YDWETimerPattern__Thread_amount[d], true, true, bj_lastSetAttackType, bj_lastSetDamageType, bj_lastSetWeaponType)
		DestroyEffect(AddSpecialEffectTarget(s__YDWETimerPattern__Thread_dsfx[d], u, s__YDWETimerPattern__Thread_part[d]))
		if s__YDWETimerPattern__Thread_skills[d] > 808464432 and s__YDWETimerPattern__Thread_skills[d] ~= nil and s__YDWETimerPattern__Thread_order[d] > 0 and s__YDWETimerPattern__Thread_order[d] ~= nil then
			YDWETimerPattern__SingleMagic(s__YDWETimerPattern__Thread_caster[d], u, s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[d]], s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[d]], GetUnitFlyHeight(s__YDWETimerPattern__Thread_obj[d]), s__YDWETimerPattern__Thread_unitid[d], s__YDWETimerPattern__Thread_skills[d], s__YDWETimerPattern__Thread_level[d], s__YDWETimerPattern__Thread_order[d])
		end
		if not s__YDWETimerPattern__Thread_recycle[d] then
			s__YDWETimerPattern__Thread_switch[d] = 0
		end
		s__YDWETimerPattern__Thread_target[d] = u
		u = nil
		return true
	end
	u = nil
	return false
end

function YDWETimerPattern__TreeKill()
	local d = GetEnumDestructable()
	if GetWidgetLife(d) > 0.405 then
		KillDestructable(d)
	end
	d = nil
end

function s__YDWETimerPattern__Thread__staticgetindex(h)
	return YDWEGetIntegerByString("YDWETimerPattern.", I2S(YDWEH2I(h)))
end

function s__YDWETimerPattern__Thread__staticsetindex(h, value)
	YDWESaveIntegerByString("YDWETimerPattern.", I2S(YDWEH2I(h)), value)
end

function s__YDWETimerPattern__Thread_flush(h)
	YDWEFlushStoredIntegerByString("YDWETimerPattern.", I2S(YDWEH2I(h)))
end

function s__YDWETimerPattern__Thread__set_x(this, value)
	s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]] = value
	SetUnitX(s__YDWETimerPattern__Thread_obj[this], value)
end

function s__YDWETimerPattern__Thread__set_y(this, value)
	s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]] = value
	SetUnitY(s__YDWETimerPattern__Thread_obj[this], value)
end

function s__YDWETimerPattern__Deceleration_move()
	local this = s__YDWETimerPattern__Thread__staticgetindex(GetExpiredTimer())
	local xp = GetUnitX(s__YDWETimerPattern__Thread_obj[this]) + s__YDWETimerPattern__Thread_dist[this] * s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_vel[this]]
	local yp = GetUnitY(s__YDWETimerPattern__Thread_obj[this]) + s__YDWETimerPattern__Thread_dist[this] * s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_vel[this]]
	if s__YDWETimerPattern__Thread_volume[this] == false then
		if IsTerrainPathable(xp, yp, PATHING_TYPE_WALKABILITY) then
			s__YDWETimerPattern__Thread_switch[this] = 0
		else
			s__YDWETimerPattern__Thread__set_x(this, xp)
			s__YDWETimerPattern__Thread__set_y(this, yp)
		end
	else
		s__YDWETimerPattern__Thread__set_x(this, xp)
		s__YDWETimerPattern__Thread__set_y(this, yp)
	end
	if s__YDWETimerPattern__Thread_follow[this] == 0 then
		if GetUnitFlyHeight(s__YDWETimerPattern__Thread_obj[this]) < 5.0 then
			if IsTerrainPathable(s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]], s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]], PATHING_TYPE_FLOATABILITY) then
				DestroyEffect(AddSpecialEffect(s__YDWETimerPattern__Thread_gsfx[this], s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]], s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]]))
			else
				DestroyEffect(AddSpecialEffect(s__YDWETimerPattern__Thread_wsfx[this], s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]], s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]]))
			end
		end
	end
	s__YDWETimerPattern__Thread_follow[this] = s__YDWETimerPattern__Thread_follow[this] + 1
	if s__YDWETimerPattern__Thread_follow[this] == 2 then
		s__YDWETimerPattern__Thread_follow[this] = 0
	end
	if s__YDWETimerPattern__Thread_killdest[this] then
		MoveRectTo(YDWETimerPattern__Area, s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]], s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]])
		EnumDestructablesInRect(YDWETimerPattern__Area, YDWETimerPattern__Bexpr, YDWETimerPattern__TreeKill)
	end
	if s__YDWETimerPattern__Thread_amount[this] > 0.0 then
		YDWETimerPattern__tmp_data = this
		GroupEnumUnitsInRange(s__YDWETimerPattern__Thread_g[this], s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]], s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]], 120.0, Condition(YDWETimerPattern__DamageFilter))
	end
	s__YDWETimerPattern__Thread_dist[this] = s__YDWETimerPattern__Thread_dist[this] - s__YDWETimerPattern__Thread_step[this]
	if s__YDWETimerPattern__Thread_dist[this] <= 0.0 or YDWECoordinateX(s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]]) ~= s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]] or YDWECoordinateY(s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]]) ~= s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]] then
		s__YDWETimerPattern__Thread_switch[this] = 0
	end
	if s__YDWETimerPattern__Thread_switch[this] == 0 then
		SetUnitFlyHeight(s__YDWETimerPattern__Thread_obj[this], GetUnitDefaultFlyHeight(s__YDWETimerPattern__Thread_obj[this]), 200.0)
		SetUnitTimeScale(s__YDWETimerPattern__Thread_obj[this], 1)
		YDWESyStemAbilityCastingOverTriggerAction(s__YDWETimerPattern__Thread_obj[this], 6)
		sc__YDWETimerPattern__Thread_deallocate(this)
	end
end

function s__YDWETimerPattern__Deceleration_create(source, object, angle, distance, time, interval, damage, killtrees, cycle, path, part, geff, weff)
	local this = s__YDWETimerPattern__Deceleration__allocate()
	s__YDWETimerPattern__Thread_des[this] = s__YDWETimerPattern__YDVector3__allocate()
	s__YDWETimerPattern__Thread_pos[this] = s__YDWETimerPattern__YDVector3__allocate()
	s__YDWETimerPattern__Thread_vel[this] = s__YDWETimerPattern__YDVector3__allocate()
	s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_vel[this]] = Cos(angle)
	s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_vel[this]] = Sin(angle)
	s__YDWETimerPattern__Thread_dist[this] = 2 * distance * interval / time
	s__YDWETimerPattern__Thread_step[this] = s__YDWETimerPattern__Thread_dist[this] * interval / time
	s__YDWETimerPattern__YDVector3_x[s__YDWETimerPattern__Thread_pos[this]] = GetUnitX(object)
	s__YDWETimerPattern__YDVector3_y[s__YDWETimerPattern__Thread_pos[this]] = GetUnitY(object)
	s__YDWETimerPattern__Thread_caster[this] = source
	s__YDWETimerPattern__Thread_obj[this] = object
	s__YDWETimerPattern__Thread_amount[this] = damage
	s__YDWETimerPattern__Thread_killdest[this] = killtrees
	s__YDWETimerPattern__Thread_recycle[this] = cycle
	s__YDWETimerPattern__Thread_volume[this] = path
	s__YDWETimerPattern__Thread_gsfx[this] = geff
	s__YDWETimerPattern__Thread_wsfx[this] = weff
	s__YDWETimerPattern__Thread_switch[this] = 1
	s__YDWETimerPattern__Thread_follow[this] = 0
	s__YDWETimerPattern__Thread_g[this] = CreateGroup()
	s__YDWETimerPattern__Thread_t[this] = CreateTimer()
	TimerStart(s__YDWETimerPattern__Thread_t[this], interval, true, s__YDWETimerPattern__Deceleration_move)
	s__YDWETimerPattern__Thread__staticsetindex(s__YDWETimerPattern__Thread_t[this], this)
	return this
end

function YDWETimerPatternRushSlide(u, face, dis, lasttime, timeout, damage, killtrees, cycle, path, part, gsfx, wsfx)
	if u == nil then
		return
	end
	s__YDWETimerPattern__Deceleration_create(u, u, Deg2Rad(face), RMaxBJ(dis, 0), RMaxBJ(lasttime, 0), RMaxBJ(timeout, 0), damage, killtrees, cycle, path, part, gsfx, wsfx)
end

function YDWETimerPattern__Init()
	YDWETimerPattern__Area = Rect(-120.0, -120.0, 120.0, 120.0)
	YDWETimerPattern__Bexpr = Filter(YDWETimerPattern__TreeFilter)
end

function YDWETimerSystem__NewTaskIndex()
	local h = YDWETimerSystem__TaskListIdleHead
	if YDWETimerSystem__TaskListIdleHead < 0 then
		if YDWETimerSystem__TaskListIdleMax >= 8000 then
			return 8100
		else
			YDWETimerSystem__TaskListIdleMax = YDWETimerSystem__TaskListIdleMax + 1
			return YDWETimerSystem__TaskListIdleMax
		end
	end
	YDWETimerSystem__TaskListIdleHead = YDWETimerSystem__TaskListIdle[h]
	return h
end

function YDWETimerSystem__DeleteTaskIndex(index)
	YDWETimerSystem__TaskListIdle[index] = YDWETimerSystem__TaskListIdleHead
	YDWETimerSystem__TaskListIdleHead = index
end

function YDWETimerSystem__NewTask(time, proc)
	local index = YDWETimerSystem__NewTaskIndex()
	local h = YDWETimerSystem__TaskListHead
	local t = R2I(100.0 * time) + YDWETimerSystem__CurrentTime
	local p
	YDWETimerSystem__TaskListProc[index] = proc
	YDWETimerSystem__TaskListTime[index] = t
	for _ in _loop_() do
		p = YDWETimerSystem__TaskListNext[h]
		if p < 0 or YDWETimerSystem__TaskListTime[p] >= t then
			YDWETimerSystem__TaskListNext[h] = index
			YDWETimerSystem__TaskListNext[index] = p
			return index
		end
		h = p
	end
	return index
end

function YDWETimerSystem__RemoveUnit_CallBack()
	RemoveUnit(LoadUnitHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
	RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
end

function YDWETimerRemoveUnit(time, u)
	SaveUnitHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time, YDWETimerSystem__fnRemoveUnit), u)
end

function YDWETimerSystem__DestroyTimer_CallBack()
	DestroyTimer(LoadTimerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
	RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
end

function YDWETimerSystem__RemoveItem_CallBack()
	RemoveItem(LoadItemHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
	RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
end

function YDWETimerRemoveItem(time, it)
	SaveItemHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time, YDWETimerSystem__fnRemoveItem), it)
end

function YDWETimerSystem__DestroyEffect_CallBack()
	DestroyEffect(LoadEffectHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
	RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
end

function YDWETimerDestroyEffect(time, e)
	SaveEffectHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time, YDWETimerSystem__fnDestroyEffect), e)
end

function YDWETimerSystem__DestroyLightning_CallBack()
	DestroyLightning(LoadLightningHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
	RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
end

function YDWETimerSystem__RunTrigger_CallBack()
	TriggerExecute(LoadTriggerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
	RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
end

function YDWETimerDestroyTextTag(time, tt)
	if time <= 0 then
		time = 0.01
	end
	SetTextTagPermanent(tt, false)
	SetTextTagLifespan(tt, time)
	SetTextTagFadepoint(tt, time)
end

function YDWETimerSystem__Main()
	local h = YDWETimerSystem__TaskListHead
	for _ in _loop_() do
		YDWETimerSystem__CurrentIndex = YDWETimerSystem__TaskListNext[h]
		if YDWETimerSystem__CurrentIndex < 0 or YDWETimerSystem__CurrentTime < YDWETimerSystem__TaskListTime[YDWETimerSystem__CurrentIndex] then break end
		TriggerEvaluate(YDWETimerSystem__TaskListProc[YDWETimerSystem__CurrentIndex])
		YDWETimerSystem__DeleteTaskIndex(YDWETimerSystem__CurrentIndex)
		YDWETimerSystem__TaskListNext[h] = YDWETimerSystem__TaskListNext[YDWETimerSystem__CurrentIndex]
	end
	YDWETimerSystem__CurrentTime = YDWETimerSystem__CurrentTime + 1
end

function YDWETimerSystem__Init()
	YDWETimerSystem__Timer = CreateTimer()
	YDWETimerSystem__TimerHandle = GetHandleId(YDWETimerSystem__Timer)
	YDWETimerSystem__CurrentTime = 0
	YDWETimerSystem__TaskListHead = 0
	YDWETimerSystem__TaskListNext[0] = -1
	YDWETimerSystem__TaskListIdleHead = 1
	YDWETimerSystem__TaskListIdleMax = 1
	YDWETimerSystem__TaskListIdle[1] = -1
	YDWETimerSystem__fnRemoveUnit = CreateTrigger()
	YDWETimerSystem__fnDestroyTimer = CreateTrigger()
	YDWETimerSystem__fnRemoveItem = CreateTrigger()
	YDWETimerSystem__fnDestroyEffect = CreateTrigger()
	YDWETimerSystem__fnDestroyLightning = CreateTrigger()
	YDWETimerSystem__fnRunTrigger = CreateTrigger()
	TriggerAddCondition(YDWETimerSystem__fnRemoveUnit, Condition(YDWETimerSystem__RemoveUnit_CallBack))
	TriggerAddCondition(YDWETimerSystem__fnDestroyTimer, Condition(YDWETimerSystem__DestroyTimer_CallBack))
	TriggerAddCondition(YDWETimerSystem__fnRemoveItem, Condition(YDWETimerSystem__RemoveItem_CallBack))
	TriggerAddCondition(YDWETimerSystem__fnDestroyEffect, Condition(YDWETimerSystem__DestroyEffect_CallBack))
	TriggerAddCondition(YDWETimerSystem__fnDestroyLightning, Condition(YDWETimerSystem__DestroyLightning_CallBack))
	TriggerAddCondition(YDWETimerSystem__fnRunTrigger, Condition(YDWETimerSystem__RunTrigger_CallBack))
	TimerStart(YDWETimerSystem__Timer, 0.01, true, YDWETimerSystem__Main)
end

function HopeCamera_ResetKeepView()
	local distance = GetCameraField(CAMERA_FIELD_TARGET_DISTANCE)
	local attack = Rad2Deg(GetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK))
	local rotation = Rad2Deg(GetCameraField(CAMERA_FIELD_ROTATION))
	local roll = Rad2Deg(GetCameraField(CAMERA_FIELD_ROLL))
	local fov = Rad2Deg(GetCameraField(CAMERA_FIELD_FIELD_OF_VIEW))
	local z = GetCameraField(CAMERA_FIELD_ZOFFSET)
	local farz = GetCameraField(CAMERA_FIELD_FARZ)
	ResetToGameCamera(0.0)
	SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, distance, 0.0)
	SetCameraField(CAMERA_FIELD_ANGLE_OF_ATTACK, attack, 0.0)
	SetCameraField(CAMERA_FIELD_ROTATION, rotation, 0.0)
	SetCameraField(CAMERA_FIELD_ROLL, roll, 0.0)
	SetCameraField(CAMERA_FIELD_FIELD_OF_VIEW, fov, 0.0)
	SetCameraField(CAMERA_FIELD_ZOFFSET, z, 0.0)
	SetCameraField(CAMERA_FIELD_FARZ, farz, 0.0)
end

function HopeCamera_FocusUnit(p, u, follow)
	if p == GetLocalPlayer() and u ~= nil and GetUnitTypeId(u) ~= 0 then
		HopeCamera_ResetKeepView()
		ClearSelection()
		SelectUnit(u, true)
		PanCameraToTimed(GetUnitX(u), GetUnitY(u), 0.0)
		if follow then
			SetCameraTargetController(u, 0.0, 0.0, false)
		end
	end
end

function HopeMini_Focus(p)
	HopeCamera_FocusUnit(p, HopeMini_Actor[GetPlayerId(p) + 1], true)
end

function HopeCamera_EnterRoom(p)
	if HopeMini_Actor[GetPlayerId(p) + 1] ~= nil then
		HopeMini_Focus(p)
	else
		HopeCamera_FocusUnit(p, udg_hero[GetPlayerId(p) + 1], LoadBoolean(YDHT, GetHandleId(udg_hero[GetPlayerId(p) + 1]), 2039566794))
	end
end

function HopeMini_FocusAfterEntry()
	local t = GetExpiredTimer()
	local p = LoadPlayerHandle(YDHT, GetHandleId(t), 0)
	local u = LoadUnitHandle(YDHT, GetHandleId(t), 1)
	if u ~= nil and HopeMini_Actor[GetPlayerId(p) + 1] == u and GetUnitTypeId(u) ~= 0 then
		HopeMini_Focus(p)
	end
	FlushChildHashtable(YDHT, GetHandleId(t))
	DestroyTimer(t)
	u = nil
	p = nil
	t = nil
end

function HopeMini_Attach(p, u)
	local t = nil
	HopeMini_Actor[GetPlayerId(p) + 1] = u
	SaveBoolean(YDHT, GetHandleId(udg_hero[GetPlayerId(p) + 1]), 2039566794, false)
	HopeMini_Focus(p)
	if u ~= nil then
		t = CreateTimer()
		SavePlayerHandle(YDHT, GetHandleId(t), 0, p)
		SaveUnitHandle(YDHT, GetHandleId(t), 1, u)
		TimerStart(t, 0.03, false, HopeMini_FocusAfterEntry)
	end
	t = nil
end

function HopeMini_Detach(p)
	HopeMini_Actor[GetPlayerId(p) + 1] = nil
	HopeCamera_FocusUnit(p, udg_hero[GetPlayerId(p) + 1], false)
end

function HopeDebuff_RecordArmor(u, beforeArmor)
	local reduced = 0.0
	if HopeStatus_History ~= nil and u ~= nil and GetUnitTypeId(u) ~= 0 and IsUnitAliveBJ(u) then
		reduced = beforeArmor - GetUnitState(u, ConvertUnitState(32))
		if reduced > 1e-05 then
			SaveReal(HopeStatus_History, GetHandleId(u), 3, LoadReal(HopeStatus_History, GetHandleId(u), 3) + reduced)
		end
	end
end

function HopeDebuff_ClearArmor(u)
	if HopeStatus_History ~= nil and u ~= nil then
		RemoveSavedReal(HopeStatus_History, GetHandleId(u), 3)
	end
end

function HopeDebuff_Armor(u)
	if HopeStatus_History == nil or u == nil or GetUnitTypeId(u) == 0 or not IsUnitAliveBJ(u) then
		return 0.0
	end
	return LoadReal(HopeStatus_History, GetHandleId(u), 3)
end

function HopeDebuff_Weakened(u)
	if u == nil or GetUnitTypeId(u) == 0 or not IsUnitAliveBJ(u) then
		return false
	end
	-- A canceled attack is already represented by the original intent kind "1".
	return LoadStr(YDHT, GetHandleId(u), -1661751302) == "attack" and LoadBoolean(YDHT, GetHandleId(u), 240964279)
end

function HopeDebuff_Number(value)
	if RAbsBJ(value - I2R(R2I(value))) < 1e-05 then
		return I2S(R2I(value))
	end
	return R2SW(value, 1, 1)
end

function HopeDebuff_Lines(u)
	local count = 0
	if HopeDebuff_Armor(u) > 1e-05 then
		count = count + 1
	end
	if HopeDebuff_Weakened(u) then
		count = count + 1
	end
	return count
end

function HopeDebuff_Details(u)
	local text = ""
	local reduced = HopeDebuff_Armor(u)
	if reduced > 1e-05 then
		text = "|cffffc58b破甲 -" .. (HopeDebuff_Number(reduced) or "") .. " · 当前甲 " .. (HopeDebuff_Number(GetUnitState(u, ConvertUnitState(32))) or "") .. "|r"
	end
	if HopeDebuff_Weakened(u) then
		if text ~= "" then
			text = (text or "") .. "|n"
		end
		text = (text or "") .. "|cffffc58b虚弱 · 下次攻击 -30%|r"
	end
	return text
end

function HopeBattle_Cleanup()
	local i = 1
	for _ in _loop_() do
		if i > 6 then break end
		if udg_hero[i] ~= nil and GetUnitAbilityLevel(udg_hero[i], 1093678147) > 0 then
			UnitRemoveAbility(udg_hero[i], 1093678147)
		end
		if udg_Zuizhong_Dm_Hh_jc[i] > 0.0 then
			udg_Zuizhong_Dm[i] = udg_Zuizhong_Dm[i] - udg_Zuizhong_Dm_Hh_jc[i]
			udg_Zuizhong_Dm_Hh_jc[i] = 0.0
		end
		i = i + 1
	end
end

function HopeConsole_Init()
end

function HopeProfession_Text(u, p)
	local kind = 0
	local current = 0
	local capacity = 0
	if p < 1 or p > 6 or u == nil then
		return ""
	end
	if HopeMini_Actor[p] ~= nil then
		return ""
	end
	kind = GetUnitTypeId(u)
	if kind == 1211117637 then
		current = LoadInteger(YDHT, GetHandleId(u), 812780749)
		capacity = GetUnitAbilityLevel(u, 1093678161) + 1
		if current <= 0 then
			return "|cffff8585子弹 " .. (I2S(current) or "") .. "/" .. (I2S(capacity) or "") .. " · Q装填|r"
		end
		return "|cffd2b879子弹 " .. (I2S(current) or "") .. "/" .. (I2S(capacity) or "") .. "|r"
	elseif kind == 1311781191 then
		current = HopeMonk_Qi[p]
		if current >= 3 then
			return "|cff80ef90气 " .. (I2S(current) or "") .. "/3 · 已满|r"
		end
		return "|cff76cdd0气 " .. (I2S(current) or "") .. "/3|r"
	elseif kind == 1311781185 and GetUnitAbilityLevel(u, 1093677901) > 1 then
		-- The live passive starts at rank 2 and awards STR on the 15th heavy chop.
		current = udg_Zhongkan_cs[p]
		if current >= 14 then
			return "|cff80ef90重砍 " .. (I2S(current) or "") .. "/15 · 下次+1力|r"
		end
		return "|cffd2b879重砍 " .. (I2S(current) or "") .. "/15|r"
	end
	return HopeThird_Resource(u, p)
end

function HopeCompact_RText(id)
	if id == 1093677364 then
		return "对目标敌人造成当前护甲值*5的物理伤害|n行动点消耗:1|n每回合限定使用1次"
	elseif id == 1093677365 then
		return "投掷出一道具有攻击力的闪电，可以对4个敌人造成|n伤害，伤害值为英雄智力*4|n每回合限用一次"
	elseif id == 1093677379 then
		return "对一直线敌人造成智力*6的法术伤害|n行动点消耗:1|n每回合限用一次"
	elseif id == 1093677380 then
		return "英雄法伤+30% 技能伤害+20%"
	elseif id == 1093677384 then
		return "恢复施法前3+（智力/5）点魔法，最多补满当前魔|n法上限。|n本回合智力提高30%（取整），不增加魔法上限。|n消耗1行动点、0魔法；每回合一次。|n回合结束移除临时智力，保留已恢复魔法。"
	elseif id == 1093677385 then
		return "丢飞刃攻击敌人造成物理伤害|n基础伤害值：敏捷*4|n每次丢飞刀后伤害减半（可低于1点），回合结束时|n重置|n每点敏捷增加该伤害1%"
	elseif id == 1093677386 then
		return "增加英雄2点行动值|n同时扣除自身999点护甲|n每回合限用一次"
	elseif id == 1093677387 then
		return "向敌人冲锋|n造成力量*4的伤害值|n如果敌人行为是防御或强化攻击则打断其动作并且伤|n害翻倍|n每回合限用一次"
	elseif id == 1093677390 then
		return "增加周围友军单位30%的攻击力。|n持续30秒。|n每回合限用一次"
	elseif id == 1093677391 then
		return "减少目标单位15点的护甲 |n每回合限用一次|n(目标护甲为负时技能无效）"
	elseif id == 1093677616 then
		return "英雄暴击率+15% 暴击伤害+50%"
	elseif id == 1093677617 then
		return "跳跃过去对目标区域内的所有单位造成力量*3.5的|n物理伤害|n行动点消耗:1|n每回合限用一次"
	elseif id == 1093677890 then
		return "万箭齐发，对所有敌人造成 英雄敏捷*1.5的物理|n伤害|n行动点消耗:1|n每点敏捷增加该伤害1%"
	elseif id == 1093677891 then
		return "对敌人释放一次混沌打击，造成物理伤害|n基础伤害值：攻击力*5|n浮动值1%-300% |n(该浮动不会因为力量敏捷专注而改变)|n行动点消耗:2|n每回合限用一次"
	elseif id == 1093677913 then
		return "消耗所有MP，对敌人造成巨量物理伤害|n基础伤害值：力量*7.5*（1+消耗魔法值/25)|n行动点消耗:3|n每回合限用一次"
	elseif id == 1093677914 then
		return "召唤6颗陨石随机对范围内敌人造成法术伤害|n每颗陨石伤害值：智力*3|n行动点消耗:2|n每回合限用一次"
	elseif id == 1093678133 then
		return "瞬移到敌人身后对其造成物理伤害|n该伤害必定暴击|n基础伤害值：敏捷值*5+攻击力*2|n行动点消耗：2|n每回合限定使用一次|n每点敏捷增加该伤害1%"
	end
	return HopeSkill_Original(id, 1)
end

function HopeCompact_RRefresh(i, d, abilityId)
	local owner = GetPlayerId(GetLocalPlayer()) + 1
	local current = "无"
	if HopeR_Key ~= abilityId or HopeR_Current ~= udg_R_Skill[owner] then
		HopeR_Key = abilityId
		HopeR_Current = udg_R_Skill[owner]
		HopeR_Count = 0
		HopeR_Offset = 0
		if udg_R_Skill[owner] ~= 0 then
			current = GetAbilityName(udg_R_Skill[owner])
		end
		HopeScroll_Add(2, "当前：" .. (current or "") .. "|n新技能：" .. (GetAbilityName(abilityId) or ""))
		HopeScroll_Add(2, HopeCompact_RText(abilityId))
	end
	HopeR_Active = i
	HopeJob_SetText(HopeModern_Title[i], "替换 R 技能")
	HopeJob_SetText(HopeR_Body[i], HopeScroll_View(2, HopeR_Offset, 5))
	HopeJob_SetText(HopeR_Notice[i], "放弃不退费用 · 滚轮/上下按钮查看详情")
end

function sa__YDWEStringFormula__Inventory_onDestroy()
	local this = f__arg_this
	YDWEFlushMissionByString("YDWEStringFormula." .. (I2S(this) or ""))
	return true
end

function sa__YDWETimerPattern__Thread_onDestroy()
	local this = f__arg_this
	s__YDWETimerPattern__Thread_flush(s__YDWETimerPattern__Thread_obj[this])
	s__YDWETimerPattern__Thread_flush(s__YDWETimerPattern__Thread_t[this])
	GroupClear(s__YDWETimerPattern__Thread_g[this])
	DestroyGroup(s__YDWETimerPattern__Thread_g[this])
	PauseTimer(s__YDWETimerPattern__Thread_t[this])
	DestroyTimer(s__YDWETimerPattern__Thread_t[this])
	s__YDWETimerPattern__YDVector3_deallocate(s__YDWETimerPattern__Thread_des[this])
	s__YDWETimerPattern__YDVector3_deallocate(s__YDWETimerPattern__Thread_pos[this])
	s__YDWETimerPattern__YDVector3_deallocate(s__YDWETimerPattern__Thread_vel[this])
	s__YDWETimerPattern__Thread_caster[this] = nil
	s__YDWETimerPattern__Thread_target[this] = nil
	s__YDWETimerPattern__Thread_obj[this] = nil
	s__YDWETimerPattern__Thread_g[this] = nil
	s__YDWETimerPattern__Thread_t[this] = nil
	s__YDWETimerPattern__Thread_amount[this] = 0
	s__YDWETimerPattern__Thread_skills[this] = 0
	s__YDWETimerPattern__Thread_order[this] = 0
	s__YDWETimerPattern__Thread_dsfx[this] = ""
	s__YDWETimerPattern__Thread_gsfx[this] = ""
	s__YDWETimerPattern__Thread_wsfx[this] = ""
	s__YDWETimerPattern__Thread_part[this] = ""
	return true
end

function sa__YDWEStringFormula__Sorting_onDestroy()
	local this = f__arg_this
	local i = 0
	for _ in _loop_() do
		if i == s___YDWEStringFormula__Sorting_stack_size then break end
		s___YDWEStringFormula__Sorting_stack[s__YDWEStringFormula__Sorting_stack[this] + i] = 0
		s___YDWEStringFormula__Sorting_count[s__YDWEStringFormula__Sorting_count[this] + i] = 0
		i = i + 1
	end
	s__YDWEStringFormula__Sorting_char[this] = ""
	return true
end

function jasshelper__initstructs885894093()
	st__YDWEStringFormula__Inventory_onDestroy[2] = CreateTrigger()
	st__YDWEStringFormula__Inventory_onDestroy[3] = st__YDWEStringFormula__Inventory_onDestroy[2]
	TriggerAddCondition(st__YDWEStringFormula__Inventory_onDestroy[2], Condition(sa__YDWEStringFormula__Inventory_onDestroy))
	st__YDWETimerPattern__Thread_onDestroy[10] = CreateTrigger()
	st__YDWETimerPattern__Thread_onDestroy[11] = st__YDWETimerPattern__Thread_onDestroy[10]
	st__YDWETimerPattern__Thread_onDestroy[12] = st__YDWETimerPattern__Thread_onDestroy[10]
	st__YDWETimerPattern__Thread_onDestroy[13] = st__YDWETimerPattern__Thread_onDestroy[10]
	TriggerAddCondition(st__YDWETimerPattern__Thread_onDestroy[10], Condition(sa__YDWETimerPattern__Thread_onDestroy))
	st__YDWEStringFormula__Sorting_onDestroy = CreateTrigger()
	TriggerAddCondition(st__YDWEStringFormula__Sorting_onDestroy, Condition(sa__YDWEStringFormula__Sorting_onDestroy))
	ExecuteFunc("s__hardware_onInit")
	ExecuteFunc("s__YDWEStringFormula__ItemIdMatrix_onInit")
	ExecuteFunc("s__YDWEStringFormula__FormulaMatrix_onInit")
end

end

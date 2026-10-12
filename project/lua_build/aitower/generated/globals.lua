-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
--W3x2lni Data: 2023-10-18 14:50:44.367
DzLoadToc = _native_'DzLoadToc'
DzCreateFrame = _native_'DzCreateFrame'
DzFrameSetAllPoints = _native_'DzFrameSetAllPoints'
DzFrameSetAlpha = _native_'DzFrameSetAlpha'
DzTextTagSetShadowColor = _native_'DzTextTagSetShadowColor'

HopeThird_Data = nil
HopeThird_Ability = _array_(0)
HopeThird_Passive = _array_(false)
HopeThird_Cavalry = _array_(false)
HopeThird_ComboToken = _array_(0)
HopeThird_ComboCount = _array_(0)
HopeThird_ComboPaid = _array_(false)
HopeThird_PressureToken = _array_(0)
HopeThird_Pressure = _array_(0)
HopeThird_PressureTarget = _array_()
HopeThird_HitsToken = _array_(0)
HopeThird_Hits = _array_(0)
HopeThird_HiddenToken = _array_(0)
HopeThird_HiddenMask = _array_(0)
HopeThird_FireTarget = _array_()
HopeThird_Gen = 1
HopeThird_HealCount = _array_(0)
HopeDraw_Serial = 0
HopeDraw_Team = false
HopeDraw_MyTab = 0
HopeDraw_TeamTab = 0
HopeTeam_Cursor = _array_(0)
HopeName_Raw = _array_()
HopeName_Plain = _array_()
HopeName_Active = _array_(false)
HopeName_Cached = _array_()
HopeName_Stamp = _array_(0)
HopeName_Version = 1
HopeMonk_Qi = _array_(0)
HopeMonk_LastE = _array_(0)
HopeMonk_LastW = _array_(0)
HopeMonk_LastZ = _array_(0)
HopeEvent_Count = 0
HopeEvent_Sequence = 0
HopeEvent_Start = 0
HopeEvent_Line = _array_()
HopeEvent_Seen = 0
HopeEvent_Offset = 0
HopeEvent_Open = false
HopeEvent_Panel = 0
HopeEvent_Body = 0
HopeEvent_Status = 0
HopeEvent_Button = 0

HopeReclass_Busy = _array_(false)
HopeReclass_Replacing = false
HopeReclass_PotionRank = _array_(0)
HopeReclass_Items = _array_()
HopeCoop_RoomPlayers = 1
HopeCoop_Started = false
HopeCoop_Announced = false
HopeCoop_BaseHandicap = 100.0
HopeChallenge_TurnSerial = 1
HopeHidden_LastHeal = _array_(0)
HopeHidden_LastDrain = _array_(0)

-- Independent promotion UI. Presentation state is local; each gameplay callback has a fixed option.
HopeMeditation_Active = _array_(false)
HopeMeditation_Unit = _array_()
HopeMeditation_LastCast = _array_(0)
HopeJob_Panel = 0
HopeJob_OpenButton = 0
HopeJob_Title = 0
HopeJob_Status = 0
HopeJob_Detail = 0
HopeJob_Footer = 0
HopeJob_Row = _array_(0)
HopeJob_Confirm = _array_(0)
HopeJob_Source = _array_(0)
HopeJob_Target = _array_(0)
HopeJob_Item = _array_(0)
HopeJob_Stage = _array_(0)
HopeJob_Level = _array_(0)
HopeJob_Str = _array_(0)
HopeJob_Agi = _array_(0)
HopeJob_Int = _array_(0)
HopeJob_Name = _array_()
HopeJob_Role = _array_()
HopeJob_Skills = _array_()
HopeJob_Passive = _array_()
HopeJob_Selected = -1
HopeJob_Entry = 1
HopeJob_Page = 0
HopeJob_LastType = 0
HopeJob_Expanded = false
HopeJob_Awakened = _array_(false)
HopeJob_AwakenOption = _array_(0)
HopeJob_UltimateKind = _array_(0)
HopeJob_LastCast = _array_(0)
HopeJob_RandomPromotion = false
HopeJob_DetailPage = 0
HopeJob_SkillCount = _array_(0)
HopeJob_PassiveCount = _array_(0)
HopeJob_DetailText = _array_()
HopeJob_PrevButton = 0
HopeJob_NextButton = 0
HopeJob_PageLabel = 0
HopeJob_Count = 43
YDHT = nil
YDLOC = nil
bj_lastAbilityCastingUnit = nil
bj_lastPoolAbstractedItem = nil
bj_lastSetAttackType = ATTACK_TYPE_NORMAL
bj_lastSetDamageType = DAMAGE_TYPE_NORMAL
bj_lastSetWeaponType = WEAPON_TYPE_WHOKNOWS
yd_MapMaxX = 0
yd_MapMinX = 0
yd_MapMaxY = 0
yd_MapMinY = 0
YDWEBase__yd_PlayerColor = _array_()
YDWEBase__AbilityCastingOverEventQueue = _array_()
YDWEBase__AbilityCastingOverEventType = _array_(0)
YDWEBase__AbilityCastingOverEventNumber = 0
YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE = 6
yd_NullTempGroup = nil
yd_DamageEventTrigger = nil
YDWETriggerEvent__DamageEventQueue = _array_()
YDWETriggerEvent__DamageEventNumber = 0
bj_lastMovedItemInItemSlot = nil
YDWETriggerEvent__MoveItemEventTrigger = nil
YDWETriggerEvent__MoveItemEventQueue = _array_()
YDWETriggerEvent__MoveItemEventNumber = 0
yd_NullTempRegion = nil
MoveMoreLevel_JumpTimer = 3
bj_lastCombinedItem = nil
YDWEStringFormula__ItemCombineEventQueue = _array_()
YDWEStringFormula__ItemCombineEventNumber = 0
YDWEStringFormula__SEGMENT_LENGTH = 4
YDWEStringFormula__FormulaData = 0
YDWETimerPattern__Bexpr = nil
YDWETimerPattern__Area = nil
YDWETimerPattern__tmp_data = 0
YDWETimerPattern__yd_loc = Location(0.0, 0.0)
YDWETimerSystem__CurrentTime = 0
YDWETimerSystem__CurrentIndex = 0
YDWETimerSystem__TaskListHead = 0
YDWETimerSystem__TaskListIdleHead = 0
YDWETimerSystem__TaskListIdleMax = 0
YDWETimerSystem__TaskListIdle = _array_(0)
YDWETimerSystem__TaskListNext = _array_(0)
YDWETimerSystem__TaskListTime = _array_(0)
YDWETimerSystem__TaskListProc = _array_()
YDWETimerSystem__fnRemoveUnit = nil
YDWETimerSystem__fnDestroyTimer = nil
YDWETimerSystem__fnRemoveItem = nil
YDWETimerSystem__fnDestroyEffect = nil
YDWETimerSystem__fnDestroyLightning = nil
YDWETimerSystem__fnRunTrigger = nil
YDWETimerSystem__Timer = nil
YDWETimerSystem__TimerHandle = 0
udg_Hero_dian = _array_()
udg_hero = _array_()
udg_huihe_s = 0
udg_dtzhongxindian = _array_()
udg_Guaiwu_dwz = nil
udg_WJZ = nil
udg_Youxi_ND_XZ = nil
udg_ND_sz = 0
udg_WJZ_______cunhuo = nil
udg_WJZ_______siwang = nil
udg_WJZ_______weizhunbei = nil
udg_cz1Str_up = _array_(0.0)
udg_cz2Agi_up = _array_(0.0)
udg_cz3Int_up = _array_(0.0)
udg_cz4Hp_up = _array_(0.0)
udg_cz5Mp_up = _array_(0.0)
udg_cz6Dex_up = _array_(0.0)
udg_DEX = _array_(0.0)
udg_LUK = _array_(0.0)
udg_Guaiwu_dian = _array_()
udg_zcSTR_XS = _array_(0.0)
udg_zcAGI_XS = _array_(0.0)
udg_zcINT_XS = _array_(0.0)
udg_xingdong_dian = _array_(0)
udg_xingdong_dianSx = _array_(0)
udg_xingdongdian_xs = _array_(0)
udg_wp = _array_(0)
udg_zhengshu = 0
udg_UI_sg = _array_(0)
udg_Defend_HUIHE = _array_(0.0)
udg_meiceng_GQS = _array_(0)
udg_Sd_guanghuan_lx = _array_(0)
udg_luxianditu = _array_()
udg_Luxian_shandian = _array_()
udg_shandian_sl = 0
udg_Gh = 0
udg_qi_dwz = _array_()
udg_BOSS_LX_______DA = _array_(0)
udg_BOSS_LX = _array_(0)
udg_boci_gw_lx = _array_(0)
udg_boci = 0
udg_boci_______boss = 0
udg_Youxi_xzgq = nil
udg_zouguo_luxian = nil
udg_shuangji_queding = false
udg_Guaiwu_sl = 0
udg_diren_xueliang = 0
udg_Boss_dian = _array_()
udg_Boss_xingwei = 0
udg_Shangdian_dian = _array_()
udg_Mj_Danwei = _array_()
udg_Yx_Nd_Dj = 0
udg_quanshu = 0
udg_Defend_fangyu = _array_(0.0)
udg_Yaoshui_shenyu_cs = _array_(0)
udg_huihe_huilan = _array_(0.0)
udg_Linshi_Int = _array_(0)
udg_R_Skill = _array_(0)
udg_Rskill_shifoutihuan = _array_()
udg_Skill_wp = _array_(0)
udg_zhengskill = 0
udg_Quanshu = nil
udg_wuchongtuA = 0
udg_Minjie_jiaGong = _array_(0)
udg_Ls_zj_Str = _array_(0)
udg_Ls_zj_Int = _array_(0)
udg_Ls_zj_Agi = _array_(0)
udg_zhuanzhuzhi_sy = _array_(0.0)
udg_Baoji_Lv = _array_(0)
udg_Baoji_Damage = _array_(0.0)
udg_Yiwu_danwei = _array_()
udg_jingque_Daji_jiacheng = _array_(0.0)
udg_Zuizhong_Dm = _array_(0.0)
udg_Gongjili_Jc = _array_(0)
udg_YiwuChi = _array_()
udg_shuchubang = nil
udg_Shuchu_dm_tj = _array_(0.0)
udg_Skill_Dm = _array_(0.0)
udg_Cundang_danwei = _array_()
udg_Guaiwu_jsshu = 0
udg_Wj_jf = _array_(0)
udg_Guaiwu_Fuhuo_cs = 0
udg_Fashang_Dm = _array_(0.0)
udg_AAAUI_TAB = _array_(0)
udg_Zhongkan_cs = _array_(0)
udg_Yiwu_danwei_2 = _array_()
udg_Yiwu_sl = _array_(0)
udg_ZhandouZhong = false
udg_Linshi_Str = _array_(0)
udg_STR_cs = _array_(0)
udg_AGI_cs = _array_(0)
udg_INT_cs = _array_(0)
udg_Youxi1_dian = _array_()
udg_Youxi1_sjgwlx = _array_(0)
udg_Youxi1_jishiqi_ck = nil
udg_Youxi1_jishiqi = nil
udg_Zuizhong_Dm_Hh_jc = _array_(0.0)
udg_Lieyan = nil
udg_Moyu_Limit = _array_(0)
udg_Banben_ID = 0
udg_sl_jinqian_jiangli = _array_(0)
udg_Bei_bao_danwei = _array_()
udg_shengji_dian = _array_(0)
udg_Wj_sj_xz = _array_()
udg_N1_tgcs = _array_(0)
udg_N5_tgcs = _array_(0)
udg_N2_tgcs = _array_(0)
udg_N3_tgcs = _array_(0)
udg_N4_tgcs = _array_(0)
udg_duihuak = _array_()
udg_CZ_czcs = _array_(0)
udg_x_Skill = _array_(0)
udg_Zhili_jiaFQ_______u = _array_(0)
udg_Guaiwu_Fuhuo_Zhong = 0
gg_rct______________000 = nil
gg_rct______________001 = nil
gg_rct______________002 = nil
gg_rct______________003 = nil
gg_rct______________004 = nil
gg_rct______________004_______u = nil
gg_rct______________004________2 = nil
gg_rct______________005 = nil
gg_rct______________008 = nil
gg_rct______________009 = nil
gg_rct______________010 = nil
gg_rct______________011 = nil
gg_rct______________012 = nil
gg_rct______________013 = nil
gg_rct______________014 = nil
gg_rct______________015 = nil
gg_rct______________016 = nil
gg_rct______________017 = nil
gg_rct______________018 = nil
gg_trg_______________2 = nil
gg_trg____________________016 = nil
gg_trg_Esc_____________026 = nil
gg_trg____________________041 = nil
gg_trg_TAB = nil
gg_trg______________u = nil
gg_trg_______u = nil
gg_trg____________________008 = nil
gg_trg____________________003 = nil
gg_trg____________________006 = nil
gg_trg__________________________037 = nil
gg_trg______________009 = nil
gg_trg______________026 = nil
gg_trg__________________________041 = nil
gg_trg_________________________0_042 = nil
gg_trg_JN_______001 = nil
gg_trg_JN_______001_______u = nil
gg_trg_JN____________006 = nil
gg_trg_JN______006_______u = nil
gg_trg_JN____________008 = nil
gg_trg_Y______009 = nil
gg_trg_JN_____________008_______u = nil
gg_trg_JN_____________008______________u = nil
gg_trg_JN_______008______________u = nil
gg_trg_JN_______003 = nil
gg_trg_JN_______003_______u = nil
gg_trg_JN_______003______________u = nil
gg_trg_JN_______0049 = nil
gg_trg____________________039 = nil
gg_trg_JN_______004 = nil
gg_trg_JN_______004_______u = nil
gg_trg_JN_____________026 = nil
gg_trg_JN_______005 = nil
gg_trg_JN____________00010 = nil
gg_trg_JN__________0001 = nil
gg_trg_JN__________0012 = nil
gg_trg_JN_____________0010 = nil
gg_trg_JN__________007_______u = nil
gg_trg_JN_______002 = nil
gg_trg_JN_____________002_______u = nil
gg_trg_JN_____________012 = nil
gg_trg_JN_____________009_______u = nil
gg_trg_JN_______009______________u = nil
gg_trg_Y_____________001 = nil
gg_trg_R_____________016 = nil
gg_trg_R_____________017 = nil
gg_trg_R_____________018 = nil
gg_trg_RJN_______001 = nil
gg_trg_RJN_____________002 = nil
gg_trg_RJN_______003 = nil
gg_trg_RJN______004 = nil
gg_trg_RJN_____________________________________005 = nil
gg_trg_RJN_______006 = nil
gg_trg_RJN_______013 = nil
gg_trg_RJN__________013 = nil
gg_trg_RJN_____________011 = nil
gg_trg_RJN___________________012 = nil
gg_trg_X__________041 = nil
gg_trg____________________001_______u = nil
gg_trg______________0012 = nil
gg_trg______________003 = nil
gg_trg______________0001 = nil
gg_trg__________________________0002 = nil
gg_trg________________________________028 = nil
gg_trg_____________________________028_______u = nil
gg_trg____________________005 = nil
gg_trg____________________001 = nil
gg_trg____________________040 = nil
gg_trg____________________013________2 = nil
gg_trg____________________011_______u = nil
gg_trg___________________0002 = nil
gg_trg_______1_______0001 = nil
gg_trg_GZ_1______________015 = nil
gg_trg_1 = nil
gg_trg_2 = nil
gg_trg_3 = nil
gg_trg_4 = nil
gg_trg_G_____________004 = nil
gg_trg_X_____________004_______u = nil
gg_trg_X_____________004 = nil
gg_trg_MGCJ__________01 = nil
gg_trg____________________025 = nil
gg_trg______________012 = nil
gg_trg_________________011 = nil
gg_trg______________011 = nil
gg_trg_L____________0012 = nil
gg_trg_S___________________012 = nil
gg_trg____________________038 = nil
gg_trg_____________00013 = nil
gg_trg____________________031 = nil
gg_trg____________________037 = nil
gg_trg_X________________030 = nil
gg_trg____________________032 = nil
gg_trg____________________033 = nil
gg_trg____________________034 = nil
gg_trg____________________030 = nil
gg_trg____________________035 = nil
gg_trg____________________036 = nil
gg_trg____________________018 = nil
gg_trg____________________019 = nil
gg_trg____________________020 = nil
gg_trg____________________020_______u = nil
gg_trg_S_______001 = nil
gg_trg____________________017 = nil
gg_trg____________________010 = nil
gg_trg___________012 = nil
gg_trg_________________012 = nil
gg_trg____________________009 = nil
gg_trg____________________009________3 = nil
gg_trg____________________009________2 = nil
gg_trg____________________011 = nil
gg_trg_W_______0001 = nil
gg_trg_W_______0002_______u = nil
gg_trg_W_______0003 = nil
gg_trg_W_________________________016 = nil
gg_trg______________030 = nil
gg_trg____________________015 = nil
gg_trg____________________035_______u = nil
gg_trg_Y__________________027 = nil
gg_trg_Y______0028_______u = nil
gg_trg____________________023 = nil
gg_trg____________________021 = nil
gg_trg_Y______________028 = nil
gg_trg____________________027 = nil
gg_trg____________________024 = nil
gg_trg____________________029 = nil
gg_trg_______SD_017 = nil
gg_trg____________________028 = nil
gg_trg____________________012 = nil
gg_trg_______________2222 = nil
gg_unit_n019_0032 = nil
gg_unit_n00N_0023 = nil
gg_unit_n00P_0024 = nil
gg_unit_n00Q_0028 = nil
gg_unit_n01C_0003 = nil
s__hardware_ViewLevel = 8
s__hardware_ResetCam = false
s__hardware_WheelSpeed = 0.1
s__hardware_WideScr = false
s__hardware_X_ANGLE = 304.0
s__hardware_ViewLevelMax = 14
s__hardware_ViewLevelMin = 3
si__YDWEStringFormula__Inventory_F = 0
si__YDWEStringFormula__Inventory_I = 0
si__YDWEStringFormula__Inventory_V = _array_(0)
s__YDWEStringFormula__ItemIdMatrix_Data = 0
s__YDWEStringFormula__ItemIdMatrix_Total = 1
s__YDWEStringFormula__ItemIdMatrix_itemId = _array_(0)
s__YDWEStringFormula__ItemIdMatrix_keyStr = _array_()
s__YDWEStringFormula__ItemIdMatrix_keyLen = _array_(0)
s__YDWEStringFormula__FormulaMatrix_Data = 0
s__YDWEStringFormula__FormulaMatrix_Total = 1
s__YDWEStringFormula__FormulaMatrix_formula = _array_()
s__YDWEStringFormula__FormulaMatrix_segmLen = _array_(0)
s__YDWEStringFormula__FormulaMatrix_model = _array_()
s__YDWEStringFormula__FormulaMatrix_message = _array_()
s__YDWEStringFormula__FormulaMatrix_chance = _array_(0)
s__YDWEStringFormula__FormulaMatrix_delete = _array_(false)
si__YDWEStringFormula__Sorting_F = 0
si__YDWEStringFormula__Sorting_I = 0
si__YDWEStringFormula__Sorting_V = _array_(0)
s___YDWEStringFormula__Sorting_stack = _array_(0)
s___YDWEStringFormula__Sorting_stack_size = 8
s__YDWEStringFormula__Sorting_stack = _array_(0)
s___YDWEStringFormula__Sorting_count = _array_(0)
s__YDWEStringFormula__Sorting_count = _array_(0)
s__YDWEStringFormula__Sorting_total = _array_(0)
s__YDWEStringFormula__Sorting_char = _array_()
si__YDWETimerPattern__YDVector3_F = 0
si__YDWETimerPattern__YDVector3_I = 0
si__YDWETimerPattern__YDVector3_V = _array_(0)
s__YDWETimerPattern__YDVector3_x = _array_(0.0)
s__YDWETimerPattern__YDVector3_y = _array_(0.0)
si__YDWETimerPattern__Thread_F = 0
si__YDWETimerPattern__Thread_I = 0
si__YDWETimerPattern__Thread_V = _array_(0)
s__YDWETimerPattern__Thread_des = _array_(0)
s__YDWETimerPattern__Thread_pos = _array_(0)
s__YDWETimerPattern__Thread_vel = _array_(0)
s__YDWETimerPattern__Thread_caster = _array_()
s__YDWETimerPattern__Thread_target = _array_()
s__YDWETimerPattern__Thread_obj = _array_()
s__YDWETimerPattern__Thread_dist = _array_(0.0)
s__YDWETimerPattern__Thread_step = _array_(0.0)
s__YDWETimerPattern__Thread_amount = _array_(0.0)
s__YDWETimerPattern__Thread_switch = _array_(0)
s__YDWETimerPattern__Thread_follow = _array_(0)
s__YDWETimerPattern__Thread_unitid = _array_(0)
s__YDWETimerPattern__Thread_skills = _array_(0)
s__YDWETimerPattern__Thread_order = _array_(0)
s__YDWETimerPattern__Thread_level = _array_(0)
s__YDWETimerPattern__Thread_dsfx = _array_()
s__YDWETimerPattern__Thread_gsfx = _array_()
s__YDWETimerPattern__Thread_wsfx = _array_()
s__YDWETimerPattern__Thread_part = _array_()
s__YDWETimerPattern__Thread_recycle = _array_(false)
s__YDWETimerPattern__Thread_killdest = _array_(false)
s__YDWETimerPattern__Thread_volume = _array_(false)
s__YDWETimerPattern__Thread_g = _array_()
s__YDWETimerPattern__Thread_t = _array_()
si__YDWEStringFormula__Inventory_type = _array_(0)
st__YDWEStringFormula__Inventory_onDestroy = _array_()
si__YDWETimerPattern__Thread_type = _array_(0)
st__YDWETimerPattern__Thread_onDestroy = _array_()
st__YDWEStringFormula__Sorting_onDestroy = nil
f__arg_this = 0
-- These variables only affect local presentation, never shared gameplay.
HopeQoL_Hud = 0
HopeQoL_Restore = 0
HopeQoL_ButtonIndex = 2000
HopeQoL_Resources = 0
HopeQoL_Status = 0
HopeQoL_LifeText = 0
HopeQoL_ManaText = 0
HopeQoL_LifeFill = 0
HopeQoL_ManaFill = 0
HopeQoL_StatsButton = 0
HopeQoL_Modern = false
HopeQoL_Panel = 0
HopeQoL_Details = 0
HopeQoL_GrowthDetails = 0
HopeQoL_Expanded = false
HopeQoL_Visible = true
HopeQoL_UIReady = false
HopeQoL_UIPhase = "等待开局"
HopeQoL_UIResources = "等待加载"
HopeQoL_UIFallbacks = 0

-- Shared route state: only synchronized selection/chat/UI/leave events write it.
HopeRoute_Node = nil
HopeRoute_Depth = 0
HopeRoute_Chapter = 0
HopeRoute_Ready = _array_(false)
HopeRoute_Left = _array_(false)
HopeRoute_Panel = 0
HopeRoute_Text = 0
HopeRoute_TitleText = 0
HopeRoute_ReadyButton = 0
HopeRoute_WaitButton = 0
HopeRoute_DescriptionText = 0
HopeRoute_InfoPanel = 0
HopeRoute_Details = false
HopeRoute_LastPreview = nil

-- Actor references are synchronized; selection, camera and reminder fields are local UI only.
HopeMini_Actor = _array_()
HopeTurn_Panel = 0
HopeTurn_Text = 0
HopeTurn_Button = 0
HopeTurn_IdleTicks = 0
HopeTurn_LastRound = -1
HopeTurn_LastAP = -1
HopeTurn_Reminded = false
HopeIntent_Selected = nil
HopeIntent_Panel = 0
HopeIntent_Text = 0
HopeIntent_Status = 0
HopeIntent_Title = 0
-- Allocate the same six tags on every client; only their visibility is local.
HopeTeam_APTag = _array_()

-- No extra selection console: original engine selection information is retained.

-- Dialog handles/buttons and pending counts are updated only by synchronized
-- original dialog events. Hidden is strictly local presentation state.
HopeChoice_DialogCount = 0
HopeChoice_Dialog = _array_()
HopeChoice_FoldButton = _array_()
HopeChoice_Owner = _array_(0)
HopeChoice_DialogPending = _array_(false)
HopeChoice_PlayerPending = _array_(0)
HopeChoice_Hidden = false
HopeChoice_Button = 0
HopeChoice_NativeVisible = 0
HopeChoice_SkillQueue = nil
HopeChoice_SkillHead = _array_(0)
HopeChoice_SkillTail = _array_(0)

-- Read-only combat observations; never used by damage, targeting or RNG.
HopeStatus_History = nil

-- Registry and handle lifetime are shared; display height is local UI only.
HopeIntent_Tags = _array_()
HopeIntent_Units = _array_()
HopeIntent_LastText = _array_()
HopeIntent_Placed = _array_(false)
HopeIntent_X = _array_(0.0)
HopeIntent_Y = _array_(0.0)
HopeIntent_Lane = _array_(0)
HopeIntent_Count = 0

-- Snapshot the platform load result before any permanent progress can change.
-- A failed load is read-only for this entire run; never overwrite an unknown archive.
HopeCloud_Checked = _array_(false)
HopeCloud_Ready = _array_(false)
HopeCloud_Lobby = _array_(false)
HopeCloud_Test = _array_(false)
HopeCloud_LoadError = _array_(0)
HopeCloud_LoadedPoints = _array_(0)
HopeCloud_Submissions = _array_(0)
HopeCloud_LastKey = _array_()
HopeCloud_LastValue = _array_(0)

-- Shared observations of the original one-time platform entitlement trigger.
HopeGift_Checked = _array_(false)
HopeGift_Applied = _array_(false)

-- Ownership, lottery results and transactions are synchronized game state.
HopeGift_PointOwned = _array_(false)
HopeGift_PlatformOwned = _array_(false)
HopeGift_Loaded = _array_(false)
HopeGift_Busy = _array_(false)
HopeGift_LastResult = _array_()
-- Handles are presentation only; Draw is the single synchronized UI action.
HopeGift_DrawButton = 0
HopeGift_ResultText = 0
-- Local presentation; independent of HUD visibility and combat state.
HopeGift_Expanded = false
HopeGift_UIReady = false
HopeGift_OpenButton = 0
HopeGift_Panel = 0
HopeGift_Heading = 0
HopeGift_Summary = 0
HopeGift_Footer = 0
HopeGift_NameText = _array_(0)
HopeGift_EffectText = _array_(0)
HopeGift_StateText = _array_(0)

-- Shared transaction/snapshot state; never depend on local frame visibility.
HopeArchive_Busy = _array_(false)
HopeArchive_Captured = _array_(false)
HopeArchive_AtLoadCounts = _array_(0)
-- Presentation only; F5 never changes the archive panel state.
HopeArchive_Expanded = false
HopeArchive_UIReady = false
HopeArchive_Panel = 0
HopeArchive_Heading = 0
HopeArchive_Status = 0
HopeArchive_Footer = 0
HopeArchive_ProductText = _array_(0)
HopeArchive_CountText = _array_(0)
HopeArchive_BuyButton = _array_(0)

-- Acquisition counts are synchronized display history, not effect stacks.
HopeRelic_Acquired = _array_(0)
HopeRelic_Expanded = false
HopeRelic_UIReady = false
HopeRelic_Page = 0
HopeRelic_Selected = -1
HopeRelic_DetailPage = 0
HopeRelic_Panel = 0
HopeRelic_Heading = 0
HopeRelic_Summary = 0
HopeRelic_Icon = 0
HopeRelic_NameText = 0
HopeRelic_StateText = 0
HopeRelic_DetailText = 0
HopeRelic_PageText = 0
HopeRelic_PrevButton = 0
HopeRelic_NextButton = 0
HopeRelic_DetailButton = 0
HopeRelic_RowButton = _array_(0)
HopeRelic_RowIndex = _array_(0)

-- All handles are allocated synchronously. Contents below are presentation only.
HopeSkill_Base = nil
HopeSkill_Rendered = nil
HopeSkill_Ids = _array_(0)
HopeSkill_Count = 0
HopeSkill_LastHero = _array_()
HopeSkill_LastHandle = _array_(0)
HopeSkill_LastLevel = _array_(0)

HopePoints_Busy = _array_(false)
-- Synchronized initial-growth lifecycle; frame visibility is local only.
HopeGrowth_Started = _array_(false)
HopeGrowth_Pending = _array_(false)
HopeGrowth_Hero = _array_()
HopeGrowth_UIReady = false
HopeGrowth_Panel = 0
HopeGrowth_Title = 0
HopeGrowth_Summary = 0
HopeGrowth_Footer = 0
HopeGrowth_FreeButton = 0
HopeGrowth_PaidButton = 0
HopeGrowth_AcceptButton = 0
HopeGrowth_ValueText = _array_(0)


HopeModern_Data = nil
HopeModern_Player = nil
HopeModern_Dialog = nil
HopeModern_Button = nil
HopeModern_Panel = _array_(0)
HopeModern_Title = _array_(0)
HopeModern_Description = _array_(0)
HopeModern_Row = _array_(0)
HopeModern_LastTick = _array_(0)
HopeModern_Tick = 10
HopeModern_Ready = false
HopeModern_Dispatching = false


HopeRoute_ChosenLeader = -1
HopeRoute_Assigning = false
HopeRoute_AssignPanel = 0
HopeRoute_AssignButton = _array_(0)
HopeRoute_DepartButton = 0
HopeRoute_Picker = 0
HopeRoute_PickerTitle = 0
HopeRoute_NodeButton = _array_(0)
HopeRoute_Available = _array_()
HopeRoute_AvailableCount = 0
HopeRoute_PickerOpen = false
HopeRoute_Marker = nil
HopeRoute_MarkerText = nil


HopeDraw_History = nil
HopeDraw_Count = _array_(0)
HopeDraw_Busy = _array_(false)
HopeDraw_Panel = 0
HopeDraw_Title = 0
HopeDraw_Text = 0
HopeDraw_Open = false
HopeDraw_Page = 0


HopeDamage_Total = _array_(0.0)
HopeDamage_Panel = 0
HopeDamage_Text = 0
HopeDamage_BattleButton = 0
HopeDamage_TotalButton = 0
HopeDamage_Run = false
HopeDamage_Order = _array_(0)


HopeLayout_Save = 0
HopeLayout_Relic = 0
HopeLayout_Route = 0
HopeLayout_History = 0
HopeLayout_Member = _array_(0)
HopeLayout_Fold = _array_(0)


HopeScroll_Hover = 0
HopeLog_Count = 0
HopeLog_Cached = -1
HopeLog_Offset = 0
HopeLog_Status = 0
HopeLog_Visible = false
HopeLog_Line = _array_()
HopeR_Count = 0
HopeR_Offset = 0
HopeR_Key = 0
HopeR_Current = 0
HopeR_Active = 0
HopeR_Line = _array_()
HopeR_Viewport = _array_(0)
HopeR_Body = _array_(0)
HopeR_Up = _array_(0)
HopeR_Down = _array_(0)
HopeR_Notice = _array_(0)

-- v19: synchronized progression; only presentation fields below are local.
HopeMeta_Loaded = _array_(false)
HopeMeta_Started = _array_(false)
HopeMeta_Finished = _array_(false)
HopeMeta_Xp = _array_(0)
HopeMeta_Soul = _array_(0)
HopeMeta_Talent = _array_(0)
HopeMeta_RunTalent = _array_(0)
HopeMeta_Keystone = _array_(0)
HopeMeta_RunKey = _array_(0)
HopeMeta_Abyss = _array_(0)
HopeMeta_RunAbyss = _array_(0)
HopeMeta_Ach = _array_(0)
HopeMeta_Relic = _array_(0)
HopeMeta_Mastery = _array_(0)
HopeMeta_RunMastery = _array_(0)
HopeMeta_Best = _array_(0)
HopeMeta_Bosses = _array_(0)
HopeMeta_FirstRelic = _array_(0)
HopeMeta_SeedPending = _array_(false)
HopeReward_DrawCount = _array_(0)
HopeReward_DrawId = _array_(0)
HopeMeta_SeedCount = _array_(0)
HopeMeta_SeedCharges = _array_(0)
HopeMeta_SupplyOwner = 0
HopeMeta_SupplyItem = _array_(0)
HopeMeta_SeedCandidate = _array_(0)
HopeMeta_SeedButton = _array_(0)
HopeMeta_SeedIcon = _array_(0)
HopeMeta_SeedText = _array_(0)
HopeMeta_SeedHover = -1
HopeMeta_SeedInfoPanel = 0
HopeMeta_SeedInfoText = 0
HopeChoice_UniqueEntry = _array_(0)
HopeMeta_LastTurn = _array_(0)
HopeMeta_Hits = _array_(0)
HopeMeta_LowUsed = _array_(false)
HopeMeta_Shield = _array_(0.0)
HopeMeta_Legacy = _array_(0.0)
HopeMeta_BaseLevel = _array_(0)
HopeMeta_AchName = _array_()
HopeMeta_NodeName = _array_()
HopeMeta_NodeDesc = _array_()
HopeMeta_NodeBrief = _array_()
HopeMeta_NodeCost = _array_(0)
HopeMeta_NodePrereq = _array_(0)
HopeMeta_AbyssName = _array_()
HopeMeta_AbyssDesc = _array_()
HopeMeta_AbyssCost = _array_(0)
HopeMeta_Open = false
HopeMeta_Tab = 0
HopeMeta_Page = 0
HopeMeta_Panel = 0
HopeMeta_Entry = 0
HopeMeta_ArchiveEntry = 0
HopeMeta_Heading = 0
HopeMeta_Body = 0
HopeMeta_Status = 0
HopeMeta_TabButton = _array_(0)
HopeMeta_BuyButton = _array_(0)
HopeMeta_BuyText = _array_(0)
HopeMeta_TreeHeading = _array_(0)
HopeMeta_ResetButton = 0
HopeMeta_SeedRerollButton = 0
HopeMarket_Panel = 0
HopeMarket_Body = 0
HopeMarket_Open = false
HopeMarket_InRoom = false
HopeMarket_Entry = 0
HopeMarket_GoldCost = 77
HopeMarket_GoldReward = 51


DzIsMouseOverUI = _native_'DzIsMouseOverUI'
DzTriggerRegisterKeyEventByCode = _native_'DzTriggerRegisterKeyEventByCode'
DzTriggerRegisterMouseWheelEventByCode = _native_'DzTriggerRegisterMouseWheelEventByCode'
DzGetWheelDelta = _native_'DzGetWheelDelta'
DzFrameGetHeroBarButton = _native_'DzFrameGetHeroBarButton'
DzFrameSetUpdateCallbackByCode = _native_'DzFrameSetUpdateCallbackByCode'
DzFrameShow = _native_'DzFrameShow'
DzFrameSetPoint = _native_'DzFrameSetPoint'
DzFrameSetAbsolutePoint = _native_'DzFrameSetAbsolutePoint'
DzFrameClearAllPoints = _native_'DzFrameClearAllPoints'
DzFrameSetScriptByCode = _native_'DzFrameSetScriptByCode'
DzGetTriggerUIEventPlayer = _native_'DzGetTriggerUIEventPlayer'
DzGetGameUI = _native_'DzGetGameUI'
DzEnableWideScreen = _native_'DzEnableWideScreen'
DzFrameSetText = _native_'DzFrameSetText'
DzFrameSetTexture = _native_'DzFrameSetTexture'
DzFrameSetSize = _native_'DzFrameSetSize'
DzCreateFrameByTagName = _native_'DzCreateFrameByTagName'
DzFrameSetFont = _native_'DzFrameSetFont'
DzFrameFindByName = _native_'DzFrameFindByName'
DzFrameSetTextAlignment = _native_'DzFrameSetTextAlignment'
DzAPI_Map_SaveServerValue = _native_'DzAPI_Map_SaveServerValue'
DzAPI_Map_GetServerValueErrorCode = _native_'DzAPI_Map_GetServerValueErrorCode'
RequestExtraBooleanData = _native_'RequestExtraBooleanData'
DzAPI_Map_GetServerValue = _native_'DzAPI_Map_GetServerValue'
DzAPI_Map_HasMallItem = _native_'DzAPI_Map_HasMallItem'
EXGetUnitAbility = _native_'EXGetUnitAbility'
EXSetAbilityDataReal = _native_'EXSetAbilityDataReal'
EXSetAbilityDataString = _native_'EXSetAbilityDataString'
EXGetItemDataString = _native_'EXGetItemDataString'
EXGetEventDamageData = _native_'EXGetEventDamageData'
EXSetEventDamage = _native_'EXSetEventDamage'
EXGetEffectX = _native_'EXGetEffectX'
EXGetEffectY = _native_'EXGetEffectY'
EXSetEffectXY = _native_'EXSetEffectXY'
EXSetEffectZ = _native_'EXSetEffectZ'
EXSetEffectSize = _native_'EXSetEffectSize'
EXEffectMatRotateZ = _native_'EXEffectMatRotateZ'
EXExecuteScript = _native_'EXExecuteScript'

-- Meditation keeps real mana and mana capacity independent of the temporary intelligence.

-- Keep turn identity separate from the unbounded challenge round counter.

-- Count participating human slots, including fallen heroes who can be revived.
-- A player who left is excluded at the next room, never partway through a fight.
-- Called exclusively inside local presentation branches, including local parts
-- of synchronized actions. Choice pending counts and gameplay stay untouched.

-- Canonical run pressure includes encounter HP, attack, count and round count.
-- Coefficients are generated/calculated in audit/v19-calibration.py.





-- KK official loading diagnostics. ErrorCode is a LOAD result, not a save receipt.







-- The original cloud interface submits writes; it is not a commit receipt.
-- Call only from synchronized gameplay callbacks, never from local UI refresh.

-- Generated from the original ability object data at build time.
-- v15 per-hero awakenings. Gameplay helpers run only in synchronized callbacks.
-- Battle-scoped marks: child key 0 stores the battle generation; stale handles read as 0.
-- Conservative legacy bound at the current level, including flat stats, HP,
-- crit and skill. New numeric growth spends only the remaining 28% envelope.
-- Old purchased stats are never reduced, even if their early-game ratio >28%.


-- Priest offense only: restore/support amounts never use these multipliers.


-- Pure previews of original combat expressions. Never roll, simulate damage,
-- change an ability's numeric fields, or write to a gameplay hashtable.














-- Camera and selection changes are client-local; gameplay state stays synchronized.
-- ResetToGameCamera releases a previous unit controller, but also resets the lens.
-- Keep every view field so F3, room changes and unlocking never force a new zoom.



-- The generic room-entry callback runs after the minigame creation trigger.
-- It must not pan back to the old, inactive hero after a minigame actor exists.

-- One synchronized next-frame correction handles same-frame camera transitions.
-- Do not keep recentering every UI tick: players can still inspect the arena.



-- A02U poison has six separate source stacks in the original enemy hashtable.
-- These getters never infer damage from the sum or mutate any combat state.



-- Format only after the real calculation; never cast large damage to integer.






-- The exact sum of the six original pre-engine damage calls at current stats.
-- Final health loss may also depend on native mitigation and damage triggers.

-- Known script multipliers only. Native armor/immune rules and asynchronous
-- follow-up strikes are deliberately not represented as guaranteed HP loss.







-- Presentation-only armor reduction history. Original combat setters remain in place.
-- Reuse the status display table; keys 1/2 belong to observed poison history.
-- Spawn/death/room-exit display cleanup removes the entire per-unit child table.







-- One persistent label per real combat enemy. Never recreate it on selection.
-- No speculative targeting, RNG, orders or writes to the original intent data.

-- Original overhead labels truncate the displayed value, not combat state.
-- Keep R2I inside a safe range. Larger native reals have no fractional precision.






-- Keep the native anchor on the actual enemy. Avoidance may change only the
-- height among three bounded lanes, never world X/Y or screen-edge positions.



-- Synchronized UI event: issue the original ability order; never duplicate its effects.





-- Shared bookkeeping is separate from local visibility. These helpers must be
-- defined before the original growth/upgrade/skill dialog actions.


















-- The enter-region event fires during CreateUnit, before udg_hero is assigned.
-- Save that unit here; callbacks later require it to be the current hero.






-- Battle-scoped relic effects: clear on every battle start and end.








-- Return true only at the original synchronized route-entry event.













-- Catalog functions are generated from the original 44 item/ability mappings.






-- Called exactly once by the original synchronized pickup action. Does not
-- modify the item, ability, pool, stats, rewards or existing pickup control flow.










-- Preserve original platform checks; saved-point draws use a synchronized callback.





-- Exactly 100 equally likely outcomes.  Ownership never changes this table.




-- The original .1-second check may predate cloud readiness.  Recheck only
-- after the normal .2-second cloud load; never overwrite original raw keys.

-- Apply a loaded entitlement once at startup.  A prior platform grant sets
-- Applied first, so owning either or both sources never doubles its benefit.

-- A failed cloud load stays read-only this run.  This function never runs
-- from the earlier .1-second platform grant or from a lottery callback.

-- Only a fixed synchronized UI callback invokes Draw.  Validate all gameplay
-- state before spending, and spend successfully before making exactly one roll.






-- The ten original abilities, prices and Chinese GetAbilityName archive keys.






-- One transaction path for both native spellbook casts and synchronized UI clicks.
-- No gameplay attributes are applied here: the original start trigger applies
-- archived ability levels on the next run, including its free HP/MP baseline.


-- Legacy callback is defined before the new frame factories, so it only toggles
-- local presentation state; periodic refresh paints the already-created panel.




-- The engine console owns the complete selection panel, attribute display,
-- skill buttons, inventory, experience bar and their visibility hierarchy.
-- Preserve that complete hierarchy. Showing a child after HideInterface does
-- not restore its hidden parent, and restoring buttons alone loses unit info.








-- Compact labels retain UTF-8 characters; the full roster remains available.
-- The chat command -route continues to show every complete name.




-- Original six growth ratings (Trig______________009Actions), with their color
-- families lightened for readable text on the dark panel.
-- Life (7,8] originally inherited Intelligence's previous rating by mistake;
-- complete its S band as (7,9] without changing any growth value.



-- Refresh the legacy value for compatibility, but do not resurrect its duplicate overlay on F5.


-- Informational only: the original transition still draws the random result.








-- The passive text child keeps the entire flat button clickable.




-- Decorative lines never receive a click handler. Anchor both ends so a party
-- size change resizes the border with its panel rather than stretching a bitmap.

-- Fade only the background sibling, keeping text and controls fully opaque.



-- Local archive presentation. Real purchases are fixed, synchronized callbacks.







-- Six fixed lottery outcomes.  Browsing stays local; the Draw action synchronizes.



-- Every list/page event is local and only changes display state.







-- These transactions are called only from synchronized button events.
-- A stale click after confirmation cannot spend points or draw random values.










-- Resource loading is an isolated timer thread. If it aborts, the independent
-- construction timer can still build generic containers, text and fallback buttons.

-- Only UI allocations occur here, after blocking map initialization is over.


-- Allocate synchronized gameplay handles before any optional UI construction.
-- A template failure must not remove chat, keys, tags or the refresh timer.





-- Entrance selection is local presentation state; synchronized promotion never reads it.

-- Replace only the hidden lineage. Keep ordinary first/second promotions on the original item triggers.


-- Eligibility and payment use synchronized player/hero state, never UI selection.


-- Separate spell tokens prevent cooldown resets from granting extra casts.
























end

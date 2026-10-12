-- Generated from the complete validated source; see migration index.
return function(S)
local _ENV=S
function InitGlobals()
	local i = 0
	udg_huihe_s = 1
	udg_Guaiwu_dwz = CreateGroup()
	udg_WJZ = CreateForce()
	udg_Youxi_ND_XZ = DialogCreate()
	udg_ND_sz = 0
	udg_WJZ_______cunhuo = CreateForce()
	udg_WJZ_______siwang = CreateForce()
	udg_WJZ_______weizhunbei = CreateForce()
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_cz1Str_up[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_cz2Agi_up[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_cz3Int_up[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_cz4Hp_up[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_cz5Mp_up[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_cz6Dex_up[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_DEX[i] = 3.0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_LUK[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_zcSTR_XS[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_zcAGI_XS[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_zcINT_XS[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_xingdong_dian[i] = 3
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_xingdong_dianSx[i] = 3
		i = i + 1
	end
	udg_zhengshu = 0
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Defend_HUIHE[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 1 then break end
		udg_meiceng_GQS[i] = 0
		i = i + 1
	end
	udg_shandian_sl = 0
	udg_Gh = 0
	i = 0
	for _ in _loop_() do
		if i > 1 then break end
		udg_qi_dwz[i] = CreateGroup()
		i = i + 1
	end
	udg_boci = 1
	udg_boci_______boss = 0
	udg_zouguo_luxian = CreateGroup()
	udg_shuangji_queding = false
	udg_Guaiwu_sl = 1
	udg_diren_xueliang = 0
	udg_Boss_xingwei = 0
	udg_Yx_Nd_Dj = 0
	udg_quanshu = 0
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Defend_fangyu[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Yaoshui_shenyu_cs[i] = 1
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_huihe_huilan[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Linshi_Int[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_R_Skill[i] = 1093677388
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Rskill_shifoutihuan[i] = DialogCreate()
		i = i + 1
	end
	udg_zhengskill = 0
	udg_wuchongtuA = 0
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Minjie_jiaGong[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Ls_zj_Str[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Ls_zj_Int[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Ls_zj_Agi[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_zhuanzhuzhi_sy[i] = 5.0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 12 then break end
		udg_Baoji_Lv[i] = 5
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 12 then break end
		udg_Baoji_Damage[i] = 1.5
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_jingque_Daji_jiacheng[i] = 1.1
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 12 then break end
		udg_Zuizhong_Dm[i] = 1.0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Gongjili_Jc[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Shuchu_dm_tj[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 12 then break end
		udg_Skill_Dm[i] = 1.0
		i = i + 1
	end
	udg_Guaiwu_jsshu = 0
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Wj_jf[i] = 0
		i = i + 1
	end
	udg_Guaiwu_Fuhuo_cs = 0
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Fashang_Dm[i] = 1.0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 1 then break end
		udg_Zhongkan_cs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Yiwu_sl[i] = 0
		i = i + 1
	end
	udg_ZhandouZhong = false
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Linshi_Str[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_STR_cs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_AGI_cs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_INT_cs[i] = 0
		i = i + 1
	end
	udg_Youxi1_jishiqi = CreateTimer()
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Zuizhong_Dm_Hh_jc[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Moyu_Limit[i] = 0
		i = i + 1
	end
	udg_Banben_ID = 31
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_sl_jinqian_jiangli[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_shengji_dian[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Wj_sj_xz[i] = DialogCreate()
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_N1_tgcs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_N5_tgcs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_N2_tgcs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_N3_tgcs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_N4_tgcs[i] = 0
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_duihuak[i] = DialogCreate()
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_CZ_czcs[i] = 3
		i = i + 1
	end
	i = 0
	for _ in _loop_() do
		if i > 6 then break end
		udg_Zhili_jiaFQ_______u[i] = 0
		i = i + 1
	end
	udg_Guaiwu_Fuhuo_Zhong = 0
end

function CreateUnitsForPlayer0()
	local p = Player(0)
	local u
	u = CreateUnit(p, 1211117616, -2387.7, -3146.9, 120.125)
end

function CreateUnitsForPlayer1()
	local p = Player(1)
	local u
	u = CreateUnit(p, 1211117616, -2189.5, -3010.7, 137.739)
end

function CreateUnitsForPlayer2()
	local p = Player(2)
	local u
	u = CreateUnit(p, 1211117616, -2053.7, -3125.0, 128.32)
end

function CreateUnitsForPlayer3()
	local p = Player(3)
	local u
	u = CreateUnit(p, 1211117616, -1964.1, -2823.9, 144.946)
end

function CreateUnitsForPlayer4()
	local p = Player(4)
	local u
	u = CreateUnit(p, 1211117616, -2240.8, -3273.8, 122.093)
end

function CreateUnitsForPlayer5()
	local p = Player(5)
	local u
	u = CreateUnit(p, 1211117616, -1864.9, -2991.8, 139.191)
end

function CreateUnitsForPlayer11()
	local p = Player(11)
	local u
	u = CreateUnit(p, 1848651824, -2272.0, -2414.8, 299.95)
	u = CreateUnit(p, 1848651824, -2446.2, -2294.5, 309.394)
	u = CreateUnit(p, 1848651824, -2895.5, -2777.4, 340.247)
	u = CreateUnit(p, 1848651824, -2456.4, -2618.7, 310.455)
	u = CreateUnit(p, 1848651824, -2683.5, -2799.9, 329.107)
	u = CreateUnit(p, 1848651824, -2880.1, -3000.9, 328.94)
	u = CreateUnit(p, 1848651824, -2264.4, -2193.8, 289.295)
	u = CreateUnit(p, 1848651824, -2077.2, -2260.3, 281.416)
	u = CreateUnit(p, 1848651824, -2760.4, -2598.4, 326.443)
	u = CreateUnit(p, 1848651824, -2661.7, -3035.4, 328.94)
	u = CreateUnit(p, 1848651824, -2473.4, -2823.5, 328.94)
	u = CreateUnit(p, 1848651824, -2255.8, -2611.9, 328.94)
	u = CreateUnit(p, 1848651824, -2059.8, -2475.2, 285.103)
end

function CreateNeutralPassiveBuildings()
	local p = Player(PLAYER_NEUTRAL_PASSIVE)
	local u
	gg_unit_n01C_0003 = CreateUnit(p, 1848652099, -3072.0, 2112.0, 270.0)
	u = CreateUnit(p, 1852010546, -1440.0, -864.0, 270.0)
	gg_unit_n00N_0023 = CreateUnit(p, 1848651854, 1024.0, 256.0, 270.0)
	gg_unit_n00P_0024 = CreateUnit(p, 1848651856, -2240.0, -640.0, 270.0)
	u = CreateUnit(p, 1848651832, -2240.0, 2176.0, 270.0)
	u = CreateUnit(p, 1852010546, -1312.0, 2528.0, 270.0)
	u = CreateUnit(p, 1852010546, -1376.0, 736.0, 270.0)
	gg_unit_n00Q_0028 = CreateUnit(p, 1848651857, -2240.0, -1152.0, 270.0)
	u = CreateUnit(p, 1848652084, -2240.0, 768.0, 270.0)
	gg_unit_n019_0032 = CreateUnit(p, 1848652089, -3072.0, 2816.0, 270.0)
	u = CreateUnit(p, 1848652100, -2240.0, 2752.0, 270.0)
end

function CreatePlayerBuildings()
end

function CreatePlayerUnits()
	CreateUnitsForPlayer0()
	CreateUnitsForPlayer1()
	CreateUnitsForPlayer2()
	CreateUnitsForPlayer3()
	CreateUnitsForPlayer4()
	CreateUnitsForPlayer5()
	CreateUnitsForPlayer11()
end

function CreateAllUnits()
	CreateNeutralPassiveBuildings()
	CreatePlayerBuildings()
	CreatePlayerUnits()
end

function CreateRegions()
	gg_rct______________000 = Rect(-3328.0, -3616.0, -1504.0, -1920.0)
	gg_rct______________001 = Rect(-2560.0, -3456.0, -1696.0, -2688.0)
	gg_rct______________002 = Rect(928.0, -3232.0, 1216.0, -2976.0)
	gg_rct______________003 = Rect(-2752.0, -2432.0, -2624.0, -2272.0)
	gg_rct______________004 = Rect(-1568.0, -992.0, -1312.0, -736.0)
	gg_rct______________004_______u = Rect(-1504.0, 608.0, -1248.0, 864.0)
	gg_rct______________004________2 = Rect(-1440.0, 2400.0, -1184.0, 2656.0)
	gg_rct______________005 = Rect(-64.0, -3520.0, 2240.0, 96.0)
	gg_rct______________008 = Rect(3904.0, 832.0, 6080.0, 2880.0)
	gg_rct______________009 = Rect(3360.0, -960.0, 3744.0, -480.0)
	gg_rct______________010 = Rect(3296.0, -3648.0, 7456.0, -384.0)
	gg_rct______________011 = Rect(4096.0, -3616.0, 6688.0, -416.0)
	gg_rct______________012 = Rect(3328.0, -3616.0, 4096.0, -1632.0)
	gg_rct______________013 = Rect(6688.0, -2400.0, 7424.0, -480.0)
	gg_rct______________014 = Rect(6912.0, -3584.0, 7392.0, -2752.0)
	gg_rct______________015 = Rect(-1792.0, -3584.0, -1536.0, -3296.0)
	gg_rct______________016 = Rect(-3136.0, 608.0, -2816.0, 960.0)
	gg_rct______________017 = Rect(-3104.0, -1056.0, -2752.0, -672.0)
	gg_rct______________018 = Rect(-3296.0, -7712.0, 32.0, -4704.0)
end

function InitCustomTriggers()
	InitTrig_______________2()
	InitTrig____________________016()
	InitTrig_Esc_____________026()
	InitTrig____________________041()
	InitTrig_TAB()
	InitTrig______________u()
	InitTrig_______u()
	InitTrig____________________008()
	InitTrig____________________003()
	InitTrig____________________006()
	InitTrig__________________________037()
	InitTrig______________009()
	InitTrig______________026()
	InitTrig__________________________041()
	InitTrig_________________________0_042()
	InitTrig_JN_______001()
	InitTrig_JN_______001_______u()
	InitTrig_JN____________006()
	InitTrig_JN______006_______u()
	InitTrig_JN____________008()
	InitTrig_Y______009()
	InitTrig_JN_____________008_______u()
	InitTrig_JN_____________008______________u()
	InitTrig_JN_______008______________u()
	InitTrig_JN_______003()
	InitTrig_JN_______003_______u()
	InitTrig_JN_______003______________u()
	InitTrig_JN_______0049()
	InitTrig____________________039()
	InitTrig_JN_______004()
	InitTrig_JN_______004_______u()
	InitTrig_JN_____________026()
	InitTrig_JN_______005()
	InitTrig_JN____________00010()
	InitTrig_JN__________0001()
	InitTrig_JN__________0012()
	InitTrig_JN_____________0010()
	InitTrig_JN__________007_______u()
	InitTrig_JN_______002()
	InitTrig_JN_____________002_______u()
	InitTrig_JN_____________012()
	InitTrig_JN_____________009_______u()
	InitTrig_JN_______009______________u()
	InitTrig_Y_____________001()
	InitTrig_R_____________016()
	InitTrig_R_____________017()
	InitTrig_R_____________018()
	InitTrig_RJN_______001()
	InitTrig_RJN_____________002()
	InitTrig_RJN_______003()
	InitTrig_RJN______004()
	InitTrig_RJN_____________________________________005()
	InitTrig_RJN_______006()
	InitTrig_RJN_______013()
	InitTrig_RJN__________013()
	InitTrig_RJN_____________011()
	InitTrig_RJN___________________012()
	InitTrig_X__________041()
	InitTrig____________________001_______u()
	InitTrig______________0012()
	InitTrig______________003()
	InitTrig______________0001()
	InitTrig__________________________0002()
	InitTrig________________________________028()
	InitTrig_____________________________028_______u()
	InitTrig____________________005()
	InitTrig____________________001()
	InitTrig____________________040()
	InitTrig____________________013________2()
	InitTrig____________________011_______u()
	InitTrig___________________0002()
	InitTrig_______1_______0001()
	InitTrig_GZ_1______________015()
	InitTrig_1()
	InitTrig_2()
	InitTrig_3()
	InitTrig_4()
	InitTrig_G_____________004()
	InitTrig_X_____________004_______u()
	InitTrig_X_____________004()
	InitTrig_MGCJ__________01()
	InitTrig____________________025()
	InitTrig______________012()
	InitTrig_________________011()
	InitTrig______________011()
	InitTrig_L____________0012()
	InitTrig_S___________________012()
	InitTrig____________________038()
	InitTrig_____________00013()
	InitTrig____________________031()
	InitTrig____________________037()
	InitTrig_X________________030()
	InitTrig____________________032()
	InitTrig____________________033()
	InitTrig____________________034()
	InitTrig____________________030()
	InitTrig____________________035()
	InitTrig____________________036()
	InitTrig____________________018()
	InitTrig____________________019()
	InitTrig____________________020()
	InitTrig____________________020_______u()
	InitTrig_S_______001()
	InitTrig____________________017()
	InitTrig____________________010()
	InitTrig___________012()
	InitTrig_________________012()
	InitTrig____________________009()
	InitTrig____________________009________3()
	InitTrig____________________009________2()
	InitTrig____________________011()
	InitTrig_W_______0001()
	InitTrig_W_______0002_______u()
	InitTrig_W_______0003()
	InitTrig_W_________________________016()
	InitTrig______________030()
	InitTrig____________________015()
	InitTrig____________________035_______u()
	InitTrig_Y__________________027()
	InitTrig_Y______0028_______u()
	InitTrig____________________023()
	InitTrig____________________021()
	InitTrig_Y______________028()
	InitTrig____________________027()
	InitTrig____________________024()
	InitTrig____________________029()
	InitTrig_______SD_017()
	InitTrig____________________028()
	InitTrig____________________012()
	InitTrig_______________2222()
end

function RunInitializationTriggers()
	ConditionalTriggerExecute(gg_trg_______________2)
	ConditionalTriggerExecute(gg_trg_TAB)
	ConditionalTriggerExecute(gg_trg______________u)
	ConditionalTriggerExecute(gg_trg_______u)
	ConditionalTriggerExecute(gg_trg___________________0002)
	ConditionalTriggerExecute(gg_trg____________________031)
end

function InitCustomPlayerSlots()
	SetPlayerStartLocation(Player(0), 0)
	SetPlayerColor(Player(0), ConvertPlayerColor(0))
	SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
	SetPlayerRaceSelectable(Player(0), false)
	SetPlayerController(Player(0), MAP_CONTROL_USER)
	SetPlayerStartLocation(Player(1), 1)
	SetPlayerColor(Player(1), ConvertPlayerColor(1))
	SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
	SetPlayerRaceSelectable(Player(1), false)
	SetPlayerController(Player(1), MAP_CONTROL_USER)
	SetPlayerStartLocation(Player(2), 2)
	SetPlayerColor(Player(2), ConvertPlayerColor(2))
	SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
	SetPlayerRaceSelectable(Player(2), false)
	SetPlayerController(Player(2), MAP_CONTROL_USER)
	SetPlayerStartLocation(Player(3), 3)
	SetPlayerColor(Player(3), ConvertPlayerColor(3))
	SetPlayerRacePreference(Player(3), RACE_PREF_NIGHTELF)
	SetPlayerRaceSelectable(Player(3), false)
	SetPlayerController(Player(3), MAP_CONTROL_USER)
	SetPlayerStartLocation(Player(4), 4)
	SetPlayerColor(Player(4), ConvertPlayerColor(4))
	SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
	SetPlayerRaceSelectable(Player(4), false)
	SetPlayerController(Player(4), MAP_CONTROL_USER)
	SetPlayerStartLocation(Player(5), 5)
	SetPlayerColor(Player(5), ConvertPlayerColor(5))
	SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
	SetPlayerRaceSelectable(Player(5), false)
	SetPlayerController(Player(5), MAP_CONTROL_USER)
	SetPlayerStartLocation(Player(10), 6)
	SetPlayerColor(Player(10), ConvertPlayerColor(10))
	SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
	SetPlayerRaceSelectable(Player(10), false)
	SetPlayerController(Player(10), MAP_CONTROL_COMPUTER)
	SetPlayerStartLocation(Player(11), 7)
	SetPlayerColor(Player(11), ConvertPlayerColor(11))
	SetPlayerRacePreference(Player(11), RACE_PREF_NIGHTELF)
	SetPlayerRaceSelectable(Player(11), false)
	SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
end

function InitCustomTeams()
	SetPlayerTeam(Player(0), 0)
	SetPlayerTeam(Player(1), 0)
	SetPlayerTeam(Player(2), 0)
	SetPlayerTeam(Player(3), 0)
	SetPlayerTeam(Player(4), 0)
	SetPlayerTeam(Player(5), 0)
	SetPlayerTeam(Player(10), 0)
	SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
	SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
	SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
	SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
	SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
	SetPlayerAllianceStateAllyBJ(Player(0), Player(10), true)
	SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
	SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
	SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
	SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
	SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
	SetPlayerAllianceStateAllyBJ(Player(1), Player(10), true)
	SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
	SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
	SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
	SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
	SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
	SetPlayerAllianceStateAllyBJ(Player(2), Player(10), true)
	SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
	SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
	SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
	SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
	SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
	SetPlayerAllianceStateAllyBJ(Player(3), Player(10), true)
	SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
	SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
	SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
	SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
	SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
	SetPlayerAllianceStateAllyBJ(Player(4), Player(10), true)
	SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
	SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
	SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
	SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
	SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
	SetPlayerAllianceStateAllyBJ(Player(5), Player(10), true)
	SetPlayerAllianceStateAllyBJ(Player(10), Player(0), true)
	SetPlayerAllianceStateAllyBJ(Player(10), Player(1), true)
	SetPlayerAllianceStateAllyBJ(Player(10), Player(2), true)
	SetPlayerAllianceStateAllyBJ(Player(10), Player(3), true)
	SetPlayerAllianceStateAllyBJ(Player(10), Player(4), true)
	SetPlayerAllianceStateAllyBJ(Player(10), Player(5), true)
	SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
	SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
	SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
	SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
	SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
	SetPlayerAllianceStateVisionBJ(Player(0), Player(10), true)
	SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
	SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
	SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
	SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
	SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
	SetPlayerAllianceStateVisionBJ(Player(1), Player(10), true)
	SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
	SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
	SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
	SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
	SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
	SetPlayerAllianceStateVisionBJ(Player(2), Player(10), true)
	SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
	SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
	SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
	SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
	SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
	SetPlayerAllianceStateVisionBJ(Player(3), Player(10), true)
	SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
	SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
	SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
	SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
	SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
	SetPlayerAllianceStateVisionBJ(Player(4), Player(10), true)
	SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
	SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
	SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
	SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
	SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
	SetPlayerAllianceStateVisionBJ(Player(5), Player(10), true)
	SetPlayerAllianceStateVisionBJ(Player(10), Player(0), true)
	SetPlayerAllianceStateVisionBJ(Player(10), Player(1), true)
	SetPlayerAllianceStateVisionBJ(Player(10), Player(2), true)
	SetPlayerAllianceStateVisionBJ(Player(10), Player(3), true)
	SetPlayerAllianceStateVisionBJ(Player(10), Player(4), true)
	SetPlayerAllianceStateVisionBJ(Player(10), Player(5), true)
	SetPlayerTeam(Player(11), 1)
end

function InitAllyPriorities()
	SetStartLocPrioCount(0, 3)
	SetStartLocPrio(0, 0, 2, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(0, 1, 4, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(0, 2, 5, MAP_LOC_PRIO_HIGH)
	SetStartLocPrioCount(1, 1)
	SetStartLocPrio(1, 0, 5, MAP_LOC_PRIO_HIGH)
	SetStartLocPrioCount(2, 2)
	SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(2, 1, 3, MAP_LOC_PRIO_HIGH)
	SetStartLocPrioCount(3, 2)
	SetStartLocPrio(3, 0, 2, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(3, 1, 4, MAP_LOC_PRIO_HIGH)
	SetStartLocPrioCount(4, 3)
	SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(4, 1, 3, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(4, 2, 5, MAP_LOC_PRIO_LOW)
	SetStartLocPrioCount(5, 2)
	SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
	SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
end

function main()
	SetCameraBounds(-3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -7680.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 7424.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -7680.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	NewSoundEnvironment("Default")
	SetAmbientDaySound("LordaeronSummerDay")
	SetAmbientNightSound("LordaeronSummerNight")
	SetMapMusic("Music", true, 0)
	CreateRegions()
	CreateAllUnits()
	InitBlizzard()
	ExecuteFunc("jasshelper__initstructs885894093")
	ExecuteFunc("YDTriggerSaveLoadSystem___Init")
	ExecuteFunc("InitializeYD")
	ExecuteFunc("YDWEStringFormula__Init")
	ExecuteFunc("YDWETimerPattern__Init")
	ExecuteFunc("YDWETimerSystem__Init")
	InitGlobals()
	HopeDraw_History = InitHashtable()
	HopeModern_Data = InitHashtable()
	InitCustomTriggers()
	HopeSkill_Init()
	HopeStatus_Init()
	RunInitializationTriggers()
	HopeQoL_Init()
	TimerStart(CreateTimer(), 0.3, false, HopeV8_Init)
	TimerStart(CreateTimer(), 0.01, false, HopeJob_Init)
end

function config()
	SetMapName("AI爬塔")
	SetMapDescription("AI爬塔 1.0.4：回合制合作爬塔，规划路线、选择奖励，搭配技能与装备。")
	SetPlayers(8)
	SetTeams(8)
	SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
	DefineStartLocation(0, 2624.0, -704.0)
	DefineStartLocation(1, 2624.0, -1664.0)
	DefineStartLocation(2, 2624.0, -128.0)
	DefineStartLocation(3, 3136.0, -128.0)
	DefineStartLocation(4, 3136.0, -704.0)
	DefineStartLocation(5, 2624.0, -1216.0)
	DefineStartLocation(6, 3136.0, -1664.0)
	DefineStartLocation(7, 3136.0, -1216.0)
	InitCustomPlayerSlots()
	InitCustomTeams()
	InitAllyPriorities()
end

end

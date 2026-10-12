// AI爬塔: lobby-only JASS bootstrap. All gameplay is in aitower Lua modules.
native DzLoadToc takes string fileName returns nothing
native DzCreateFrame takes string frame,integer parent,integer id returns integer
native DzFrameSetAllPoints takes integer frame,integer relativeFrame returns boolean
native DzFrameSetAlpha takes integer frame,integer alpha returns nothing
native DzTextTagSetShadowColor takes texttag t,integer color returns nothing
native DzIsMouseOverUI takes nothing returns boolean
native DzTriggerRegisterKeyEventByCode takes trigger trig,integer key,integer status,boolean sync,code funcHandle returns nothing
native DzTriggerRegisterMouseWheelEventByCode takes trigger trig,boolean sync,code funcHandle returns nothing
native DzGetWheelDelta takes nothing returns integer
native DzFrameGetHeroBarButton takes integer buttonId returns integer
native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
native DzFrameShow takes integer frame,boolean enable returns nothing
native DzFrameSetPoint takes integer frame,integer point,integer relativeFrame,integer relativePoint,real x,real y returns nothing
native DzFrameSetAbsolutePoint takes integer frame,integer point,real x,real y returns nothing
native DzFrameClearAllPoints takes integer frame returns nothing
native DzFrameSetScriptByCode takes integer frame,integer eventId,code funcHandle,boolean sync returns nothing
native DzGetTriggerUIEventPlayer takes nothing returns player
native DzGetGameUI takes nothing returns integer
native DzEnableWideScreen takes boolean enable returns nothing
native DzFrameSetText takes integer frame,string text returns nothing
native DzFrameSetTexture takes integer frame,string texture,integer flag returns nothing
native DzFrameSetSize takes integer frame,real w,real h returns nothing
native DzCreateFrameByTagName takes string frameType,string name,integer parent,string template,integer id returns integer
native DzFrameSetFont takes integer frame,string fileName,real height,integer flag returns nothing
native DzFrameFindByName takes string name,integer id returns integer
native DzFrameSetTextAlignment takes integer frame,integer align returns nothing
native DzAPI_Map_SaveServerValue takes player whichPlayer,string key,string value returns boolean
native DzAPI_Map_GetServerValueErrorCode takes player whichPlayer returns integer
native RequestExtraBooleanData takes integer dataType,player whichPlayer,string param1,string param2,boolean param3,integer param4,integer param5,integer param6 returns boolean
native DzAPI_Map_GetServerValue takes player whichPlayer,string key returns string
native DzAPI_Map_HasMallItem takes player whichPlayer,string key returns boolean
native EXGetUnitAbility takes unit u,integer abilcode returns ability
native EXSetAbilityDataReal takes ability abil,integer level,integer data_type,real value returns boolean
native EXSetAbilityDataString takes ability abil,integer level,integer data_type,string value returns boolean
native EXGetItemDataString takes integer itemcode,integer data_type returns string
native EXGetEventDamageData takes integer edd_type returns integer
native EXSetEventDamage takes real amount returns boolean
native EXGetEffectX takes effect e returns real
native EXGetEffectY takes effect e returns real
native EXSetEffectXY takes effect e,real x,real y returns nothing
native EXSetEffectZ takes effect e,real z returns nothing
native EXSetEffectSize takes effect e,real size returns nothing
native EXEffectMatRotateZ takes effect e,real angle returns nothing
native EXExecuteScript takes string script returns string

function main takes nothing returns nothing
local string status=EXExecuteScript("require('aitower').boot()")
if status!="AI_LUA_READY" then
call DisplayTimedTextToPlayer(GetLocalPlayer(),0.,0.,60.,"AI爬塔 Lua 启动失败："+status)
endif
endfunction
function InitCustomPlayerSlots takes nothing returns nothing
call SetPlayerStartLocation(Player(0),0)
call SetPlayerColor(Player(0),ConvertPlayerColor(0))
call SetPlayerRacePreference(Player(0),RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(0),false)
call SetPlayerController(Player(0),MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(1),1)
call SetPlayerColor(Player(1),ConvertPlayerColor(1))
call SetPlayerRacePreference(Player(1),RACE_PREF_ORC)
call SetPlayerRaceSelectable(Player(1),false)
call SetPlayerController(Player(1),MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(2),2)
call SetPlayerColor(Player(2),ConvertPlayerColor(2))
call SetPlayerRacePreference(Player(2),RACE_PREF_UNDEAD)
call SetPlayerRaceSelectable(Player(2),false)
call SetPlayerController(Player(2),MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(3),3)
call SetPlayerColor(Player(3),ConvertPlayerColor(3))
call SetPlayerRacePreference(Player(3),RACE_PREF_NIGHTELF)
call SetPlayerRaceSelectable(Player(3),false)
call SetPlayerController(Player(3),MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(4),4)
call SetPlayerColor(Player(4),ConvertPlayerColor(4))
call SetPlayerRacePreference(Player(4),RACE_PREF_HUMAN)
call SetPlayerRaceSelectable(Player(4),false)
call SetPlayerController(Player(4),MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(5),5)
call SetPlayerColor(Player(5),ConvertPlayerColor(5))
call SetPlayerRacePreference(Player(5),RACE_PREF_ORC)
call SetPlayerRaceSelectable(Player(5),false)
call SetPlayerController(Player(5),MAP_CONTROL_USER)
call SetPlayerStartLocation(Player(10),6)
call SetPlayerColor(Player(10),ConvertPlayerColor(10))
call SetPlayerRacePreference(Player(10),RACE_PREF_UNDEAD)
call SetPlayerRaceSelectable(Player(10),false)
call SetPlayerController(Player(10),MAP_CONTROL_COMPUTER)
call SetPlayerStartLocation(Player(11),7)
call SetPlayerColor(Player(11),ConvertPlayerColor(11))
call SetPlayerRacePreference(Player(11),RACE_PREF_NIGHTELF)
call SetPlayerRaceSelectable(Player(11),false)
call SetPlayerController(Player(11),MAP_CONTROL_COMPUTER)
endfunction

function InitCustomTeams takes nothing returns nothing
call SetPlayerTeam(Player(0),0)
call SetPlayerTeam(Player(1),0)
call SetPlayerTeam(Player(2),0)
call SetPlayerTeam(Player(3),0)
call SetPlayerTeam(Player(4),0)
call SetPlayerTeam(Player(5),0)
call SetPlayerTeam(Player(10),0)
call SetPlayerAllianceStateAllyBJ(Player(0),Player(1),true)
call SetPlayerAllianceStateAllyBJ(Player(0),Player(2),true)
call SetPlayerAllianceStateAllyBJ(Player(0),Player(3),true)
call SetPlayerAllianceStateAllyBJ(Player(0),Player(4),true)
call SetPlayerAllianceStateAllyBJ(Player(0),Player(5),true)
call SetPlayerAllianceStateAllyBJ(Player(0),Player(10),true)
call SetPlayerAllianceStateAllyBJ(Player(1),Player(0),true)
call SetPlayerAllianceStateAllyBJ(Player(1),Player(2),true)
call SetPlayerAllianceStateAllyBJ(Player(1),Player(3),true)
call SetPlayerAllianceStateAllyBJ(Player(1),Player(4),true)
call SetPlayerAllianceStateAllyBJ(Player(1),Player(5),true)
call SetPlayerAllianceStateAllyBJ(Player(1),Player(10),true)
call SetPlayerAllianceStateAllyBJ(Player(2),Player(0),true)
call SetPlayerAllianceStateAllyBJ(Player(2),Player(1),true)
call SetPlayerAllianceStateAllyBJ(Player(2),Player(3),true)
call SetPlayerAllianceStateAllyBJ(Player(2),Player(4),true)
call SetPlayerAllianceStateAllyBJ(Player(2),Player(5),true)
call SetPlayerAllianceStateAllyBJ(Player(2),Player(10),true)
call SetPlayerAllianceStateAllyBJ(Player(3),Player(0),true)
call SetPlayerAllianceStateAllyBJ(Player(3),Player(1),true)
call SetPlayerAllianceStateAllyBJ(Player(3),Player(2),true)
call SetPlayerAllianceStateAllyBJ(Player(3),Player(4),true)
call SetPlayerAllianceStateAllyBJ(Player(3),Player(5),true)
call SetPlayerAllianceStateAllyBJ(Player(3),Player(10),true)
call SetPlayerAllianceStateAllyBJ(Player(4),Player(0),true)
call SetPlayerAllianceStateAllyBJ(Player(4),Player(1),true)
call SetPlayerAllianceStateAllyBJ(Player(4),Player(2),true)
call SetPlayerAllianceStateAllyBJ(Player(4),Player(3),true)
call SetPlayerAllianceStateAllyBJ(Player(4),Player(5),true)
call SetPlayerAllianceStateAllyBJ(Player(4),Player(10),true)
call SetPlayerAllianceStateAllyBJ(Player(5),Player(0),true)
call SetPlayerAllianceStateAllyBJ(Player(5),Player(1),true)
call SetPlayerAllianceStateAllyBJ(Player(5),Player(2),true)
call SetPlayerAllianceStateAllyBJ(Player(5),Player(3),true)
call SetPlayerAllianceStateAllyBJ(Player(5),Player(4),true)
call SetPlayerAllianceStateAllyBJ(Player(5),Player(10),true)
call SetPlayerAllianceStateAllyBJ(Player(10),Player(0),true)
call SetPlayerAllianceStateAllyBJ(Player(10),Player(1),true)
call SetPlayerAllianceStateAllyBJ(Player(10),Player(2),true)
call SetPlayerAllianceStateAllyBJ(Player(10),Player(3),true)
call SetPlayerAllianceStateAllyBJ(Player(10),Player(4),true)
call SetPlayerAllianceStateAllyBJ(Player(10),Player(5),true)
call SetPlayerAllianceStateVisionBJ(Player(0),Player(1),true)
call SetPlayerAllianceStateVisionBJ(Player(0),Player(2),true)
call SetPlayerAllianceStateVisionBJ(Player(0),Player(3),true)
call SetPlayerAllianceStateVisionBJ(Player(0),Player(4),true)
call SetPlayerAllianceStateVisionBJ(Player(0),Player(5),true)
call SetPlayerAllianceStateVisionBJ(Player(0),Player(10),true)
call SetPlayerAllianceStateVisionBJ(Player(1),Player(0),true)
call SetPlayerAllianceStateVisionBJ(Player(1),Player(2),true)
call SetPlayerAllianceStateVisionBJ(Player(1),Player(3),true)
call SetPlayerAllianceStateVisionBJ(Player(1),Player(4),true)
call SetPlayerAllianceStateVisionBJ(Player(1),Player(5),true)
call SetPlayerAllianceStateVisionBJ(Player(1),Player(10),true)
call SetPlayerAllianceStateVisionBJ(Player(2),Player(0),true)
call SetPlayerAllianceStateVisionBJ(Player(2),Player(1),true)
call SetPlayerAllianceStateVisionBJ(Player(2),Player(3),true)
call SetPlayerAllianceStateVisionBJ(Player(2),Player(4),true)
call SetPlayerAllianceStateVisionBJ(Player(2),Player(5),true)
call SetPlayerAllianceStateVisionBJ(Player(2),Player(10),true)
call SetPlayerAllianceStateVisionBJ(Player(3),Player(0),true)
call SetPlayerAllianceStateVisionBJ(Player(3),Player(1),true)
call SetPlayerAllianceStateVisionBJ(Player(3),Player(2),true)
call SetPlayerAllianceStateVisionBJ(Player(3),Player(4),true)
call SetPlayerAllianceStateVisionBJ(Player(3),Player(5),true)
call SetPlayerAllianceStateVisionBJ(Player(3),Player(10),true)
call SetPlayerAllianceStateVisionBJ(Player(4),Player(0),true)
call SetPlayerAllianceStateVisionBJ(Player(4),Player(1),true)
call SetPlayerAllianceStateVisionBJ(Player(4),Player(2),true)
call SetPlayerAllianceStateVisionBJ(Player(4),Player(3),true)
call SetPlayerAllianceStateVisionBJ(Player(4),Player(5),true)
call SetPlayerAllianceStateVisionBJ(Player(4),Player(10),true)
call SetPlayerAllianceStateVisionBJ(Player(5),Player(0),true)
call SetPlayerAllianceStateVisionBJ(Player(5),Player(1),true)
call SetPlayerAllianceStateVisionBJ(Player(5),Player(2),true)
call SetPlayerAllianceStateVisionBJ(Player(5),Player(3),true)
call SetPlayerAllianceStateVisionBJ(Player(5),Player(4),true)
call SetPlayerAllianceStateVisionBJ(Player(5),Player(10),true)
call SetPlayerAllianceStateVisionBJ(Player(10),Player(0),true)
call SetPlayerAllianceStateVisionBJ(Player(10),Player(1),true)
call SetPlayerAllianceStateVisionBJ(Player(10),Player(2),true)
call SetPlayerAllianceStateVisionBJ(Player(10),Player(3),true)
call SetPlayerAllianceStateVisionBJ(Player(10),Player(4),true)
call SetPlayerAllianceStateVisionBJ(Player(10),Player(5),true)
call SetPlayerTeam(Player(11),1)
endfunction

function InitAllyPriorities takes nothing returns nothing
call SetStartLocPrioCount(0,3)
call SetStartLocPrio(0,0,2,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0,1,4,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(0,2,5,MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(1,1)
call SetStartLocPrio(1,0,5,MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(2,2)
call SetStartLocPrio(2,0,0,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(2,1,3,MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(3,2)
call SetStartLocPrio(3,0,2,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(3,1,4,MAP_LOC_PRIO_HIGH)
call SetStartLocPrioCount(4,3)
call SetStartLocPrio(4,0,0,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4,1,3,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(4,2,5,MAP_LOC_PRIO_LOW)
call SetStartLocPrioCount(5,2)
call SetStartLocPrio(5,0,0,MAP_LOC_PRIO_HIGH)
call SetStartLocPrio(5,1,1,MAP_LOC_PRIO_HIGH)
endfunction

function config takes nothing returns nothing
call SetMapName("AI爬塔")
call SetMapDescription("AI爬塔 1.0.16 Lua：回合制合作爬塔，规划路线、选择奖励，搭配技能与装备。")
call SetPlayers(8)
call SetTeams(8)
call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
call DefineStartLocation(0,2624.,-704.)
call DefineStartLocation(1,2624.,-1664.)
call DefineStartLocation(2,2624.,-128.)
call DefineStartLocation(3,3136.,-128.)
call DefineStartLocation(4,3136.,-704.)
call DefineStartLocation(5,2624.,-1216.)
call DefineStartLocation(6,3136.,-1664.)
call DefineStartLocation(7,3136.,-1216.)
call InitCustomPlayerSlots()
call InitCustomTeams()
call InitAllyPriorities()
endfunction

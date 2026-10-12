-- Two independent Lua states with the same synchronized inputs but different
-- local selections, UI reads and GC schedules. Native attacks/armor are a
-- model: this does NOT certify the KK executable's networking or projectile AI.
package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local function id(s)return string.unpack('>I4',s)end
local function eq(a,b,message)assert(a==b,(message or '')..': '..tostring(a)..' ~= '..tostring(b))end
local results={}
local function pass(s)results[#results+1]=s;print('PASS '..s)end
local function peer(localId)
 local b=require('tests.lua_engine').new();b.localId=localId;b.hits={}
 local S=require('aitower.core.runtime').create(b)
 for _,name in ipairs(require 'aitower.modules')do require(name)(S)end
 S.YDHT=S.InitHashtable();S.YDLOC=S.InitHashtable();S.HopeModern_Data=S.InitHashtable()
 S.HopeStatus_History=S.InitHashtable();S.HopeSkill_Original=S.InitHashtable();S.HopeSkill_Rendered=S.InitHashtable()
 S.jasshelper__initstructs885894093();S.YDWETimerPattern__Init();S.YDWETimerSystem__Init();S.HopeThird_Init();S.CreateRegions()
 S.GetUnitLoc=function(u)assert(u,'nil unit location');return S.Location(u.x,u.y)end
 S.SetUnitPosition=function(u,x,y)u.x=x;u.y=y end
 S.SetUnitPositionLoc=function(u,p)u.x=p.x;u.y=p.y end
 S.IsUnitPaused=function(u)return u.paused or false end
 S.PauseUnit=function(u,v)u.paused=v end
 S.IsPlayerInForce=function(p,f)return f and f.members and f.members[p.id]or false end
 S.ForceAddPlayer=function(f,p)f.members[p.id]=true end
 S.ForceRemovePlayer=function(f,p)f.members[p.id]=nil end
 S.ForForce=function(f,fn)
  local old=b.enumPlayer
  for i=0,15 do if f.members[i]then b.enumPlayer=S.Player(i);fn()end end
  b.enumPlayer=old
 end
 S.GetEnumPlayer=function()return b.enumPlayer end
 S.IsUnitAlly=function(u,p)return u.owner.id<6 and p.id<6 end
 S.IsUnitEnemy=function(u,p)return (u.owner.id<6)~=(p.id<6)end
 S.IsUnitType=function(u,t)return t==S.UNIT_TYPE_HERO and u.hero or false end
 S.IsUnitVisible=function()return true end
 S.GetSpellTargetUnit=function()return b.target end
 S.SaveTextTagHandle=S.SaveUnitHandle;S.LoadTextTagHandle=S.LoadUnitHandle
 S.udg_WJZ={members={[0]=true,[1]=true}};S.udg_WJZ_______weizhunbei={members={[0]=true,[1]=true}};S.udg_WJZ_______cunhuo=S.udg_WJZ
 S.udg_ZhandouZhong=true;S.udg_quanshu=1;S.udg_boci=4;S.udg_huihe_s=1
 S.udg_dtzhongxindian[1]=S.Location(400,500);S.udg_Boss_dian[1]=S.Location(400,700)
 S.udg_Guaiwu_dwz=S.CreateGroup()
 for i=1,2 do
  local u=S.CreateUnit(S.Player(i-1),id(i==1 and 'O003'or'O001'),100*i,100,0)
  u.name=i==1 and '巨魔投手'or'兽人战士';u.hero=true;u.Str=15;u.Agi=12;u.Int=8;u.states[20]=30
  S.udg_hero[i]=u;S.udg_Yiwu_danwei[i]=S.CreateUnit(S.Player(i-1),id('hfoo'),0,0,0)
  S.udg_Hero_dian[i]=S.Location(u.x,u.y);S.udg_xingdong_dian[i]=4;S.udg_xingdong_dianSx[i]=4
  S.udg_DEX[i]=3;S.udg_zhuanzhuzhi_sy[i]=3;S.udg_jingque_Daji_jiacheng[i]=1.1
  S.udg_Fashang_Dm[i]=1;S.udg_Skill_Dm[i]=1;S.udg_Zuizhong_Dm[i]=1
  S.udg_Baoji_Lv[i]=35;S.udg_Baoji_Damage[i]=1.5;S.udg_Defend_fangyu[i]=5
  S.udg_xingdongdian_xs[i]=S.DzCreateFrameByTagName('TEXT','AP'..i,1,'',0)
 end
 S.udg_hero[1].abilities[id('A02T')]=1;S.udg_hero[1].abilities[id('A02U')]=1
 S.udg_hero[2].abilities[id('A01R')]=1
 b.enemy=S.CreateUnit(S.Player(11),id('nvil'),400,700,0);b.enemy.name='精英测试目标';b.enemy.states[0]=10000;b.enemy.states[1]=10000
 S.GroupAddUnit(S.udg_Guaiwu_dwz,b.enemy)
 local damageTrigger=S.CreateTrigger();local poisonTrigger=S.CreateTrigger();local attackTrigger=S.CreateTrigger()
 S.gg_trg______________003=S.CreateTrigger()
 S.TriggerAddAction(S.gg_trg______________003,function()b.enemyTurns=(b.enemyTurns or 0)+1 end)
 S.GetEventDamageSource=function()return b.source end
 S.GetEventDamage=function()return b.damage or 0 end
 S.EXSetEventDamage=function(v)b.damage=v;return true end
 S.EXGetEventDamageData=function(k)
  if k==S.YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE then return b.damageType end
  if k==S.YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE then return b.attackType end
  return 0
 end
 S.UnitDamageTarget=function(u,target,amount,_,_,attackType,damageType)
  assert(u and target and amount>0,'lost attack source/target/damage')
  local old={b.eventUnit,b.eventTrigger,b.source,b.damage,b.attackType,b.damageType}
  b.source=u;b.eventUnit=target;b.eventTrigger=damageTrigger;b.damage=amount;b.attackType=attackType;b.damageType=damageType
  if S.Trig____________________005Conditions()then S.Trig____________________005Actions()end
  b.eventTrigger=poisonTrigger
  if S.Trig_JN_____________026Conditions()then S.Trig_JN_____________026Actions()end
  target.states[0]=target.states[0]-b.damage
  b.hits[#b.hits+1]={owner=u.owner.id,amount=b.damage,source=u.type,target=target.id}
  b.eventUnit,b.eventTrigger,b.source,b.damage,b.attackType,b.damageType=table.unpack(old,1,6)
  return true
 end
 -- Model the engine's delayed one-shot missile hit, NOT another map rule.
 S.IssueTargetOrder=function(u,order,target)
  assert(order=='attackonce'and u.type==id('e00R'),'unexpected native order')
  local t=S.CreateTimer()
  S.TimerStart(t,.10,false,function()
   S.DestroyTimer(t)
   S.UnitDamageTarget(u,target,S.GetUnitState(u,S.ConvertUnitState(18)),true,true,S.ATTACK_TYPE_NORMAL,S.DAMAGE_TYPE_NORMAL,0)
  end)
  return true
 end
 require('aitower.game.sync_diagnostics').install(S)
 S.__syncDiagnostics.start()
 local function cast(index,ability,fn)
  b.eventUnit=S.udg_hero[index];b.target=b.enemy;b.eventAbility=id(ability);b.eventPlayer=S.Player(index-1);b.eventTrigger=attackTrigger
  S.TriggerExecute(S.__syncDiagnostics.casts)
  b.run(fn)
 end
 function b.attack(index)cast(index,index==1 and 'A02T'or'A01R',index==1 and S.Trig_JN_______004_______uActions or S.Trig_JN_______001Actions)end
 function b.defend(index)cast(index,'A002',S.Trig_JN_______002Actions)end
 function b.endTurn(index)cast(index,'A001',S.Trig____________________001_______uActions)end
 function b.poisonTick()
  b.eventTrigger=poisonTrigger
  S.ForGroup(S.udg_Guaiwu_dwz,S.Trig______________003Func006A)
 end
 function b.nextTurn()
  b.eventTrigger=attackTrigger
  b.run(S.Trig______________0001Actions)
 end
 b.S=S
 return b
end
local a,b=peer(0),peer(1)
local function same(label)
 local x,y=a.S.HopeSync_Snapshot(),b.S.HopeSync_Snapshot()
 eq(x.raw,y.raw,label);eq(a.seed,b.seed,label..' RNG');eq(#a.hits,#b.hits,label..' hits')
end
same('initial')
local function localReads(peer,loops)
 local S=peer.S;local before=S.HopeSync_Snapshot().raw;local seed=peer.seed;local timers=#peer.timers;local units=#peer.units
 for _=1,loops do
  S.ClearSelection();S.SelectUnit(peer.enemy,true)
  S.HopeIntent_Description(peer.enemy);S.HopeStatus_PoisonDetails(peer.enemy,S.GetLocalPlayer());S.HopeStatus_PoisonPreviewLine(peer.enemy)
  S.HopeSkill_PotionDescription(S.udg_hero[peer.localId+1])
  S.HopeQoL_SelectHero()
  local garbage={};for n=1,400 do garbage[n]={tostring(n),S.udg_hero[peer.localId+1]}end
  collectgarbage('collect')
 end
 eq(S.HopeSync_Snapshot().raw,before,'local view changed gameplay');eq(peer.seed,seed);eq(#peer.timers,timers);eq(#peer.units,units)
end
localReads(a,2);localReads(b,19);same('different local UI and GC')
pass('Different local selection, tooltips, focus and Lua GC leave combat snapshot/RNG unchanged')
-- Both players cast while the other player's roll timer is still running.
a.attack(1);b.attack(1);a.step(.09);b.step(.09);a.attack(2);b.attack(2)
for tick=1,35 do
 a.step(.09+tick*.1);b.step(.09+tick*.1)
 if tick%5==0 then localReads(a,1);localReads(b,3)end
 same('concurrent attacks tick '..tick)
end
eq(a.S.udg_xingdong_dian[1],3);eq(a.S.udg_xingdong_dian[2],3);eq(#a.hits,2)
assert(a.hits[1].amount>0 and a.hits[2].amount>0 and a.hits[1].owner~=a.hits[2].owner)
eq(a.S.HopeStatus_PoisonCount(a.enemy,0),2);eq(b.S.HopeStatus_PoisonCount(b.enemy,0),2)
assert(a.enemy.states[0]<10000 and a.S.udg_Shuchu_dm_tj[1]>0 and a.S.udg_Shuchu_dm_tj[2]>0)
pass('Actual troll/warrior roll timers, projectile order, melee damage, poison and damage totals agree on both peers')
for _,p in ipairs({a,b})do p.defend(1);p.defend(2);p.defend(2)end
same('repeated defense');eq(a.S.udg_xingdong_dian[2],1);eq(a.S.udg_hero[2].states[32],40)
pass('Repeated defense consumes action points and grants the same armor to both peers')
-- Diagnostic is event-based: both peers execute the same chat event. It must
-- never allocate native objects, change health, or advance the random stream.
for _,p in ipairs({a,b})do
 local before=p.S.HopeSync_Snapshot().raw;local units,timers=#p.units,#p.timers
 p.S.TriggerExecute(p.S.__syncDiagnostics.chat)
 eq(p.S.HopeSync_Snapshot().raw,before);eq(#p.units,units);eq(#p.timers,timers)
 assert(p.lastMessage:find('联机诊断 #1')and p.lastMessage:find('毒 2'))
end
same('diagnostics');pass('Shared chat diagnostic is read-only and uses the same checkpoint on both peers')
local old=b.enemy.states[0];b.enemy.states[0]=old-1
assert(a.S.HopeSync_Snapshot().signature~=b.S.HopeSync_Snapshot().signature,'HP mismatch hidden by diagnostic')
b.enemy.states[0]=old;b.S.udg_xingdong_dian[1]=1
assert(a.S.HopeSync_Snapshot().signature~=b.S.HopeSync_Snapshot().signature,'AP mismatch hidden by diagnostic')
b.S.udg_xingdong_dian[1]=2;same('restored test fault')
pass('Diagnostic detects deliberately different enemy health and player action points')
for _,p in ipairs({a,b})do p.endTurn(1);p.step(p.now+1.1);eq(p.enemyTurns,nil);p.endTurn(2);p.step(p.now+1.1);eq(p.enemyTurns,1)end
same('both players ended');assert(a.S.udg_hero[1].paused and a.S.udg_hero[2].paused)
pass('Original end-turn timers wait for both players before one enemy turn')
local before=a.enemy.states[0]
a.poisonTick();b.poisonTick();same('poison settlement')
assert(a.enemy.states[0]<before);eq(a.S.HopeStatus_PoisonCount(a.enemy,0),1)
pass('Original enemy-turn poison deals positive equal damage and removes one layer on both peers')
for _,p in ipairs({a,b})do p.nextTurn();p.step(p.now+1.1)end
same('new round');eq(a.S.udg_huihe_s,2)
for i=1,2 do eq(a.S.udg_xingdong_dian[i],4);eq(a.S.udg_hero[i].states[32],0);assert(not a.S.udg_hero[i].paused)end
pass('Original next-turn callback restores AP, clears temporary armor and unpauses both players')
local f=assert(io.open('audit/lua-multiplayer.txt','wb'));f:write(table.concat(results,'\n')..'\n'..#results..' model checks passed. No KK multi-machine runtime verification.\n');f:close()

package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local function json(v)
 if v==nil then return 'null'elseif type(v)=='boolean'or type(v)=='number'then return tostring(v)
 elseif type(v)=='string'then return '"'..v:gsub('[%z\1-\31\\"]',function(c)return ({['"']='\\"',['\\']='\\\\',['\n']='\\n',['\r']='\\r',['\t']='\\t'})[c]or string.format('\\u%04x',c:byte())end)..'"'
 else local parts={};for k,x in pairs(v)do parts[#parts+1]=json(tostring(k))..':'..json(x)end;table.sort(parts);return '{'..table.concat(parts,',')..'}'end
end
local b=require('tests.lua_engine').new()
b.slk={item={}}
local boot=require 'aitower.bootstrap';assert(boot.boot(b)=='AI_LUA_READY');b.step(5)
local S=boot.state;local app=S.__app;local results={};local snapshots={}
S.Trig_GZ_1______________015Actions()
local function check(name,fn)fn();results[#results+1]=name end
for i=0,5 do
 local p=S.Player(i);S.HopeCloud_CheckLoad(p);S.HopeMeta_Loaded[i]=true;S.HopeMeta_Started[i]=true
 S.udg_hero[i+1]=S.CreateUnit(p,123,0,0,0);S.udg_Wj_jf[i+1]=57;S.HopeMeta_Soul[i]=8
 S.udg_xingdong_dian[i+1]=3;S.udg_xingdong_dianSx[i+1]=4;S.udg_zhuanzhuzhi_sy[i+1]=3;S.udg_DEX[i+1]=5
 S.udg_Skill_Dm[i+1]=1;S.udg_Fashang_Dm[i+1]=1;S.udg_Zuizhong_Dm[i+1]=1;S.udg_Baoji_Damage[i+1]=1.5
end
S.HopeRoute_Assigning=false
local function visible(f)
 if not f then return false end
 if f.shown==false then return false end
 if f.parent and b.frames[f.parent]then return visible(b.frames[f.parent])end
 return true
end
local function snap(name)
 local frames={}
 for id,f in pairs(b.frames)do
  if visible(f)then frames[tostring(id)]={id=id,kind=f.kind,name=f.name,parent=f.parent,x=f.x,y=f.y,w=f.w,h=f.h,absolute=f.absolute,font=f.font,text=f.text,texture=f.texture,allPoints=f.allPoints,alpha=f.alpha,enabled=f.enabled}end
 end
 snapshots[name]=frames
end
local function refresh()S.HopeLayout_Apply();app.refresh();app.hud.refresh();app.character.refresh();app.tactical.refresh()end
check('Unified archive entry and navigation, no legacy entry overlap',function()
 refresh();assert(visible(b.frames[app.entry.id]));assert(not visible(b.frames[S.HopeLayout_Save]));assert(not visible(b.frames[S.HopeGift_OpenButton]))
 assert(b.frames[app.tactical.relicEntry.id].y==.248)
end)
check('All screens load with 15 tree nodes and independent keystone seals',function()
 S.HopeMarket_InRoom=true
 for tab=0,11 do
  app.open(tab);refresh()
  if tab==11 then assert(app.tab==11,'room trade hidden in shop')end
  snap('archive-'..tab)
  for _,widget in ipairs(app.ui.widgets)do
   if widget.parent==app.panel and visible(b.frames[widget.id])then
    local f=b.frames[widget.id]
    assert(f.x>=0 and f.x+f.w<=app.panel.w+.0001,'outside modal horizontally '..f.name)
    assert(f.y<=0 and -f.y+f.h<=app.panel.h+.0001,'outside modal vertically '..f.name)
   end
  end
 end
 app.open(2);refresh();for n=0,14 do assert(visible(b.frames[app.journal.nodes[n].id]))end
 app.open(3);refresh();for n=0,2 do assert(visible(b.frames[app.journal.keys[n].id]))end
end)
check('Talent tree inspects locally, honors prerequisite links and spends fixed synchronized IDs',function()
 app.open(2);refresh();local v=app.journal
 local before=S.udg_Wj_jf[1]
 assert(not b.frames[v.nodes[1].id].scripts[1].sync)
 b.frames[v.nodes[1].id].scripts[1].fn();refresh()
 assert(v.selected==1 and S.udg_Wj_jf[1]==before)
 assert(not b.frames[v.upgrades[1].id].enabled)
 assert(v.detail.value:find('武器训练'))
 local links=0;for n,edge in pairs(v.links)do links=links+1;assert(S.HopeMeta_NodePrereq[n]>=0)end;assert(links==12)
 S.udg_Wj_jf[1]=100
 local buy=b.frames[v.upgrades[0].id].scripts[1];assert(buy.sync)
 v.selected=14;buy.fn();refresh()
 assert(S.HopeMeta_Level(S.HopeMeta_Talent[0],0)==1)
 assert(S.HopeMeta_Level(S.HopeMeta_Talent[2],4)==0)
 v.selected=1;refresh();assert(b.frames[v.upgrades[1].id].enabled)
 assert(b.frames[v.links[1].lines[1].id].alpha==220)
 snap('tree-learned');S.HopeMeta_Talent[0]=0;S.udg_Wj_jf[1]=before
end)
check('All 44 collectible icons select full descriptions without a purchase',function()
 app.open(6)
 local balance=S.udg_Wj_jf[1]
 for n=0,43 do
  local callback=b.frames[app.journal.relics[n].id].scripts[1];assert(not callback.sync);callback.fn();refresh()
  assert(app.page==n);assert(app.journal.relicName.value:find(S.HopeRelic_Name(n),1,true));assert(app.journal.relicText.value~='')
 end
 assert(balance==S.udg_Wj_jf[1])
end)
check('Periodic updates preserve talent hit targets instead of hiding and recreating them',function()
 app.open(2);refresh();local v=app.journal
 local ids={v.roots[2].id,v.upgrades[v.selected].id,app.reset.id}
 local before={};for _,id in ipairs(ids)do before[id]=b.frames[id].showWrites end
 for n=1,5 do refresh()end
 for _,id in ipairs(ids)do assert(b.frames[id].showWrites==before[id],'refresh hides active click target')end
end)
check('Local tabs cannot grant remote shop access',function()
 S.HopeMarket_InRoom=false;app.open(11);refresh();assert(app.tab==0);assert(not visible(b.frames[app.navigation[11].id]))
end)
check('Personal and teammate draw history retain all records and full text',function()
 S.HopeDraw_SaveRecord(S.Player(0),'我的十连','第一条|n第二条',false)
 S.HopeDraw_SaveRecord(S.Player(1),'队友礼包','礼包详情|n完整说明',false)
 app.open(9);app.teamRecords=false;refresh();assert(app.body.value:find('我的十连'))
 app.teamRecords=true;refresh();assert(app.body.value:find('队友礼包'));assert(app.body.value:find('完整说明'));snap('teammate-history')
end)
check('Pending seed survives close, offers full description and single reward route',function()
 S.HopeMeta_SeedPending[0]=true;S.HopeMeta_SeedCount[0]=4
 for n=0,3 do S.HopeMeta_SeedCandidate[n]=n end
 app.open(10);app.hover=0;refresh();assert(app.seedDetail.value~='');snap('relic-choice')
 app.close();refresh();assert(S.HopeMeta_SeedPending[0]);app.open(10);refresh();assert(S.HopeMeta_SeedPending[0])
 S.HopeMeta_SeedPending[0]=false
end)
check('Complete 44 relic descriptions and six mastery pages stay accessible',function()
 for n=0,43 do app.open(6);app.page=n;refresh();assert(app.body.value:find(S.HopeRelic_Name(n),1,true))end
 for n=0,5 do app.open(7);app.page=n;refresh();assert(app.body.value~='')end
end)
check('HUD refreshes AP immediately and F5 leaves party and turn controls independent',function()
 app.close();S.HopeQoL_Expanded=false;S.udg_ZhandouZhong=true;S.HopeQoL_Visible=false;refresh()
 S.udg_xingdong_dian[1]=0;app.hud.refresh();assert(app.hud.ap.value:find('0 / 4'))
 S.udg_xingdong_dian[1]=4;app.hud.refresh();assert(app.hud.ap.value:find('4 / 4'))
 assert(not app.hud.party.visible,'solo play must not duplicate own AP in a teammate panel');snap('battle-hud')
end)
check('F4 character panel contains growth ratings, armor and all original modifiers',function()
 S.HopeQoL_Expanded=true;refresh();assert(app.character.panel.visible)
 for _,word in ipairs({'法术','技能','精确','最终','护甲','防御'})do assert(app.character.stats.value:find(word))end
 for _,word in ipairs({'力量','敏捷','智力','生命','魔力','专注'})do assert(app.character.growth.value:find(word))end
 snap('character')
end)
check('Loot hide/reopen retains choices and one synchronized click cannot claim twice',function()
 S.HopeQoL_Expanded=false;app.close()
 local p=S.Player(0);local key=S.GetHandleId(p)
 S.SaveBoolean(S.YDHT,key,-1422318988,false)
 S.SaveInteger(S.YDHT,key,-952593264,5)
 S.udg_wp[5]=1234
 local issued=0;S.HopeInventory_Give=function()issued=issued+1 end
 S.HopeChoice_Hidden=false;refresh();assert(visible(b.frames[S.udg_UI_sg[1]]))
 for _,id in ipairs({3,7,11})do S.DzFrameSetText(S.udg_UI_sg[id],'[A] 示例战利品|n攻击 +10|n每回合开始恢复生命。|n实际名称与效果由原奖励池提供。')end
 snap('loot')
 S.HopeChoice_Hidden=true;refresh();assert(not visible(b.frames[S.udg_UI_sg[1]]));assert(not S.LoadBoolean(S.YDHT,key,-1422318988))
 S.HopeChoice_Hidden=false;refresh();assert(visible(b.frames[S.udg_UI_sg[1]]))
 local callback=b.frames[S.udg_UI_sg[4]].scripts[1];assert(callback.sync)
 callback.fn();callback.fn();assert(issued==1,'loot duplicate or missing')
end)
check('Compact sidebar works even when native control getters are unavailable',function()
 local other=require('tests.lua_engine').new();other.japi.DzFrameGetCommandBarButton=nil
 local startup=assert(loadfile('lua_src/aitower/bootstrap.lua'))();assert(startup.boot(other)=='AI_LUA_READY');other.step(1)
 local hud=startup.state.__app.hud;assert(not startup.state.__app.native.available)
 for _,node in ipairs({hud.ap,hud.focus,hud.armor,hud.keys})do
  assert(-node.y+node.h<=node.parent.h+.0001,'fallback text outside panel')
 end
 assert(hud.turn.parent==startup.state.__app.native.dock,'turn control must stay in the sidebar')
end)
check('Native console remains intact; 18 controls retain original parents without opaque coverage',function()
 local other=require('tests.lua_engine').new();other.enableFullConsole()
 local startup=assert(loadfile('lua_src/aitower/bootstrap.lua'))();assert(startup.boot(other)=='AI_LUA_READY');other.step(5)
 local native=startup.state.__app.native
 assert(not native.full and not other.consoleHidden and native.activated)
 assert(#native.sections==1 and #native.commands==12 and #native.items==6)
 for _,list in ipairs({native.commands,native.items})do
  for _,id in ipairs(list)do
   local f=other.frames[id];assert(f.parent==1 and f.shown and f.alpha==255 and f.enabled==nil)
   assert(f.y<=native.reservedTop,'native controls must stay in the original console')
   assert(native.dock.y-native.dock.h>native.reservedTop,'custom dock overlaps console')
  end
 end
 assert(#other.errors==0)
end)
check('Native slots are never covered by HUD backdrops and retain engine disabled state',function()
 local n=app.native
 local function rect(f)
  if f.allPoints then return rect(b.frames[f.allPoints])end
  local x,y=f.x or 0,f.y or 0
  if not f.absolute and b.frames[f.parent]then local px,py=rect(b.frames[f.parent]);x=x+px;y=y+py end
  return x,y,f.w or 0,f.h or 0
 end
 for _,list in ipairs({n.commands,n.items})do for _,id in ipairs(list)do
  local f=b.frames[id];local x,y,w,h=rect(f)
  for _,node in ipairs(app.ui.widgets)do
   local g=b.frames[node.id]
   local ancestor=g
   while ancestor and ancestor.id~=n.dock.id do ancestor=b.frames[ancestor.parent]end
   if ancestor and g.kind=='BACKDROP' then
    local gx,gy,gw,gh=rect(g)
    assert(math.min(x+w,gx+gw)-math.max(x,gx)<=.0001 or math.min(y,gy)-math.max(y-h,gy-gh)<=.0001,'HUD backdrop overlaps native '..f.name)
   end
  end
 end end
 b.frames[n.commands[1]].enabled=false;b.frames[n.commands[1]].shown=false
 n.activate();app.refreshRun()
 assert(b.frames[n.commands[1]].enabled==false and b.frames[n.commands[1]].shown==false)
 b.frames[n.commands[1]].shown=true
end)
check('Missing console surface never invokes destructive interface hide',function()
 local other=require('tests.lua_engine').new();other.enableFullConsole();other.japi.DzFrameGetTooltip=function()return 0 end
 local startup=assert(loadfile('lua_src/aitower/bootstrap.lua'))();assert(startup.boot(other)=='AI_LUA_READY');other.step(1)
 assert(startup.state.__app.native.available and not startup.state.__app.native.full)
 assert(not other.consoleHidden)
end)

check('Native attributes remain authoritative; only armor reduction supplements them',function()
 app.close();S.HopeLayout_Focus(0);S.HopeRoute_Assigning=false
 S.udg_ZhandouZhong=true;S.HopeQoL_Visible=true
 local u=S.udg_hero[1];S.SetHeroStr(u,21,true);S.SetHeroAgi(u,15,true);S.SetHeroInt(u,9,true)
 u.bonusStr=7;u.bonusAgi=3;u.bonusInt=-2
 local attr=require('aitower.ui.attribute_text')
 local primary=attr.primary(S,u,'  ')
 assert(primary:find('|cffe8e3d721|r |cff80e880+7|r',1,true))
 assert(primary:find('|cffff927a-2|r',1,true))
 assert(app.hud.primary==nil and app.hud.hp==nil and app.hud.mp==nil and app.hud.potions==nil,'duplicate native stats returned')
 S.SetUnitState(u,S.ConvertUnitState(32),10);refresh();assert(app.hud.armor.value:find('28.6%%'))
 S.SetUnitState(u,S.ConvertUnitState(32),25);refresh();assert(app.hud.armor.value:find('50.0%%'))
 S.SetUnitState(u,S.ConvertUnitState(32),-10);refresh();assert(app.hud.armor.value:find('易伤 33.5%%'))
 S.SetUnitState(u,S.ConvertUnitState(32),10);refresh();snap('battle-core')
end)
check('Merchant observes real stock and never purchases through a local catalog click',function()
 S.udg_ZhandouZhong=false;S.HopeMarket_InRoom=true;S.HopeLayout_Focus(0)
 local selection
 S.ClearSelection=function()selection=nil end
 S.SelectUnit=function(u,on)if on then selection=u end end
 S.IsUnitSelected=function(u)return u==selection end
 b.slk.item.I001={Name='试炼长剑',Art='ReplaceableTextures\\CommandButtons\\BTNSteelMelee.blp',Ubertip=string.rep('攻击提高，适合勇敢的旅者。',15),goldcost='77',lumbercost='0'}
 local id=string.unpack('>I4','I001');local shop=S.gg_unit_n00P_0024
 S.AddItemToStock(shop,id,1,1);S.AddItemToStock(shop,id,1,1)
 assert(#S.__catalog.list(shop)==1,'duplicate stock rows')
 local gold=S.GetPlayerState(S.Player(0),S.PLAYER_STATE_RESOURCE_GOLD)
 app.merchant.choose(2);app.refreshRun()
 assert(app.merchant.open and app.merchant.ids[1]==id)
 assert(app.native.context==app.merchant.panel)
 for _,handle in ipairs(app.native.commands)do assert(b.frames[handle].parent==1)end
 local click=b.frames[app.merchant.rows[1].id].scripts[1];assert(not click.sync);click.fn();app.refreshRun()
 assert(app.merchant.itemName.value:find('试炼长剑')and app.merchant.cost.value:find('77'))
 assert(S.GetPlayerState(S.Player(0),S.PLAYER_STATE_RESOURCE_GOLD)==gold)
 assert(app.merchant.more.visible);refresh();snap('merchant')
 S.RemoveItemFromStock(shop,id);app.refreshRun();assert(#app.merchant.ids==0)
 S.HopeMarket_InRoom=false;app.refreshRun();assert(not app.merchant.open and not app.merchant.entry.visible)
 assert(selection==S.udg_hero[1],'closing shop leaves seller command card selected')
 for _,handle in ipairs(app.native.commands)do assert(b.frames[handle].parent==1)end
 app.merchant.choose(1);assert(not app.merchant.open)
end)
check('Enemy roster pages live intents without selecting, and removes dead or hidden units',function()
 S.HopeLayout_Focus(0);S.udg_ZhandouZhong=true;S.HopeIntent_Count=8
 S.IsUnitVisible=function(u)return not u.hidden end
 for n=1,8 do
  local u=S.CreateUnit(S.Player(11),123,-2200+n*30,-2600,0);u.name='守卫'..n
  S.HopeIntent_Units[n]=u
  S.SaveStr(S.YDHT,S.GetHandleId(u),-1661751302,'attack')
  S.SaveUnitHandle(S.YDHT,S.GetHandleId(u),-272485038,S.udg_hero[1])
  S.SaveReal(S.YDHT,S.GetHandleId(u),-1820993401,20+n)
 end
 app.encounter.folded=false;app.encounter.refresh();assert(#app.encounter.units==8 and app.encounter.next.visible)
 assert(app.encounter.rows[1].intent.value:find('21'))
 app.refreshRun();snap('enemy-roster')
 app.encounter.page=1;app.encounter.refresh();assert(app.encounter.rows[1].name.value:find('守卫5'))
 S.HopeIntent_Units[8].hidden=true;S.SetWidgetLife(S.HopeIntent_Units[7],0)
 app.encounter.refresh();assert(#app.encounter.units==6 and app.encounter.page==1)
 local click=b.frames[app.encounter.rows[1].id].scripts[1];assert(not click.sync);click.fn();app.encounter.refresh()
 assert(app.encounter.detail.visible)
 S.ClearSelection();S.SelectUnit(S.udg_hero[1],true);click.fn();app.encounter.refresh()
 assert(S.IsUnitSelected(S.udg_hero[1],S.Player(0)),'enemy inspection stole combat controls')
 app.encounter.folded=true;app.encounter.refresh();assert(not app.encounter.rows[1].visible)
 S.udg_ZhandouZhong=false;app.encounter.refresh();assert(not app.encounter.root.visible)
end)
check('UTF8 effect pagination retains every character and all route buttons fit their panels',function()
 local text=string.rep('护甲防御金币',30)
 local pages=require('aitower.ui.textflow').pages('|cffabcdef'..text..'|r',20,4)
 assert(#pages>1 and table.concat(pages):gsub('|n','')==text)
 for _,kind in ipairs({'Assign','Node'})do
  local root=kind=='Assign'and S.HopeRoute_AssignPanel or S.HopeRoute_Picker
  local panel=b.frames[root]
  for n=1,6 do
   local id=kind=='Assign'and S.HopeRoute_AssignButton[n]or S.HopeRoute_NodeButton[n]
   local f=b.frames[id];assert(f.x>=0 and f.x+f.w<=panel.w and -f.y+f.h<=panel.h)
   assert(f.scripts[1].sync)
  end
 end
 S.DzFrameShow(S.HopeRoute_AssignPanel,true);snap('leader-choice');S.DzFrameShow(S.HopeRoute_AssignPanel,false)
 S.DzFrameShow(S.HopeRoute_Picker,true);snap('route-picker');S.DzFrameShow(S.HopeRoute_Picker,false)
end)
check('Arena decoration is installed once and adds no units or collision objects',function()
 local before=b.calls.CreateUnit
 local effects=b.calls.AddSpecialEffect
 require('aitower.game.scene').build(S)
 assert(b.calls.CreateUnit==before and b.calls.AddSpecialEffect==effects)
 assert(effects>=6)
end)


check('Difficulty and upgrade choices preserve fixed transactions and fit separate layouts',function()
 S.HopeLayout_Focus(0);S.udg_ZhandouZhong=false;app.refreshRun()
 local previous=S.udg_Youxi_ND_XZ
 local previousUpgrade=S.udg_Wj_sj_xz[1]
 local d=S.DialogCreate();S.udg_Youxi_ND_XZ=d
 for _,test in ipairs({{count=6,title='选择远征难度',name='difficulty',difficulty=true},{count=4,title='领悟 · 选择一项天赋',name='upgrade',difficulty=false}})do
  if not test.difficulty then S.udg_Youxi_ND_XZ=previous;S.udg_Wj_sj_xz[1]=d end
  S.SaveInteger(S.HopeModern_Data,S.GetHandleId(d),0,test.count)
  for slot=1,test.count do
   if not test.difficulty then
    local button=S.DialogAddButton(d,'',0)
    S.SaveButtonHandle(S.HopeModern_Data,S.GetHandleId(d),200+slot,button)
    S.SaveInteger(S.YDHT,S.GetHandleId(button),0x0340FE72,({17,16,5,99})[slot])
   end
   S.SaveStr(S.HopeModern_Data,S.GetHandleId(d),slot,test.difficulty and ({'简单','普通','困难','极难','炼狱','无限挑战'})[slot]or ({'[A] 攻击提升','[S] 最终伤害 +1%','[D] 生命上限 +10','放弃'})[slot])
   S.DzFrameSetText(S.HopeModern_Row[8+slot],test.difficulty and ({'简单','普通','困难','极难','炼狱','无限挑战'})[slot]or ({'[A] 攻击提升','[S] 最终伤害 +1%','[D] 生命上限 +10','放弃'})[slot])
  end
  S.HopeLayout_Choice(1,d);S.DzFrameSetText(S.HopeModern_Title[1],test.title)
  S.DzFrameSetText(S.HopeModern_Description[1],'选定后生效；也可以收起 F6，先查看角色数据。')
  S.DzFrameShow(S.HopeModern_Panel[1],true)
  local panel=b.frames[S.HopeModern_Panel[1]]
  for slot=1,6 do
   local frame=b.frames[S.HopeModern_Row[8+slot]];S.DzFrameShow(S.HopeModern_Row[8+slot],slot<=test.count)
   if slot<=test.count then assert(frame.x>=0 and frame.x+frame.w<=panel.w and -frame.y+frame.h<=panel.h);assert(frame.scripts[1].sync)end
  end
  snap(test.name);S.DzFrameShow(S.HopeModern_Panel[1],false)
 end
 S.udg_Youxi_ND_XZ=previous
 S.udg_Wj_sj_xz[1]=previousUpgrade
 assert(#b.errors==0,table.concat(b.errors,'\n'))
end)
check('Native potion remains the only potion control; skill reminders follow selected actor',function()
 app.close();S.HopeLayout_Focus(0);S.HopeRoute_Assigning=false;S.HopeQoL_Visible=true
 local hero=S.udg_hero[1];S.ClearSelection();S.SelectUnit(hero,true)
 S.udg_Yaoshui_shenyu_cs[1]=1;hero.skillPoints=2;app.refreshRun()
 assert(app.hud.potions==nil and #app.native.commands==12)
 assert(app.field.context.value:find('技能点 2'))
 S.udg_Yaoshui_shenyu_cs[1]=0;hero.skillPoints=0;S.udg_shengji_dian[1]=2;app.refreshRun()
 assert(app.hud.potionIcon==nil)
 assert(app.field.context.value:find('属性点 2'))
 local assistant=S.CreateUnit(S.Player(0),123,0,0,0);S.udg_Bei_bao_danwei[1]=assistant
 b.frames[app.field.bag.id].scripts[1].fn();app.refreshRun();assert(S.IsUnitSelected(assistant,S.Player(0)))
 assert(app.field.hero.value=='返回角色');b.frames[app.field.hero.id].scripts[1].fn()
 assert(S.IsUnitSelected(hero,S.Player(0)))
 local mini=S.CreateUnit(S.Player(0),123,0,0,0);S.HopeMini_Actor[1]=mini;app.refreshRun()
 assert(not app.field.bag.visible);b.frames[app.field.hero.id].scripts[1].fn();assert(S.IsUnitSelected(mini,S.Player(0)))
 S.HopeMini_Actor[1]=nil;S.udg_shengji_dian[1]=0;S.SelectUnit(hero,true);app.refreshRun()
 for _,node in ipairs({app.hud.focus,app.hud.armor})do
  assert(-node.y+node.h<=app.native.dock.h)
 end
 snap('battle-controls')
end)
check('Five and six option layouts never produce negative text heights or invisible options',function()
 local d=S.DialogCreate()
 for count=5,6 do
  S.SaveInteger(S.HopeModern_Data,S.GetHandleId(d),0,count)
  for n=1,count do S.SaveStr(S.HopeModern_Data,S.GetHandleId(d),n,'可选项目 '..n)end
  S.HopeLayout_Choice(1,d)
  local panel=b.frames[S.HopeModern_Panel[1]]
  for n=1,count do
   local id=S.HopeModern_Row[8+n];local button=b.frames[id];local text
   assert(button.x>=0 and button.x+button.w<=panel.w)
   for _,child in pairs(b.frames)do if child.parent==id and child.text=='可选项目 '..n then text=child;break end end
   assert(text and text.shown and text.h>0 and -text.y+text.h<=button.h)
  end
 end
end)
check('Local observer has no hero dock and cannot select another player actor',function()
 local other=require('tests.lua_engine').new();other.localId=7
 local startup=assert(loadfile('lua_src/aitower/bootstrap.lua'))();assert(startup.boot(other)=='AI_LUA_READY');other.step(5)
 assert(#other.errors==0,table.concat(other.errors,'\n'))
 local view=startup.state.__app
 assert(not view.native.dock.visible and not view.field.hero.visible)
 other.frames[view.field.hero.id].scripts[1].fn();other.frames[view.field.bag.id].scripts[1].fn()
end)
check('Persistent HUD reserves the entire native console, including portrait, info and artwork',function()
 local function rect(node)
  local x,y=node.x,node.y
  if node.parent then local px,py=rect(node.parent);x=x+px;y=y+py end
  return x,y,node.w,node.h
 end
 local native=app.native
 for _,node in ipairs({native.dock,app.hud.party,app.field.hero,app.field.bag,app.field.context,app.merchant.entry})do
  local x,y,w,h=rect(node)
  assert(y-h>=native.reservedTop+.004,'custom widget invades original console')
  assert(x>=0 and x+w<=.8+.0001)
 end
 for _,section in ipairs(native.sections)do
  for _,node in ipairs(app.ui.widgets)do if node.parent==section then
   assert(node.x>=0 and node.x+node.w<=section.w+.0001,'readout spills across columns')
   assert(node.y<=0 and -node.y+node.h<=section.h+.0001,'readout spills vertically')
  end end
 end
 S.HopeLayout_Focus(0);S.udg_ZhandouZhong=true;S.HopeMini_Actor[1]=nil
 app.encounter.folded=false;app.encounter.page=0;app.refreshRun()
 local ex=rect(app.encounter.root)
 assert(ex>native.dock.x+native.dock.w,'enemy roster intersects left HUD')
 -- Same normalized safety region applies at 4:3, 16:9 and wide resolutions.
 for _,resolution in ipairs({{1024,768},{1920,1080},{2560,1080}})do
  local scale=resolution[2]/.6
  assert((native.dock.y-native.dock.h-native.reservedTop)*scale>=10)
 end
 snap('battle-console-separated')
end)
check('Refreshing or changing command context never writes native position, size or visibility',function()
 local other=require('tests.lua_engine').new();other.enableFullConsole()
 local startup=assert(loadfile('lua_src/aitower/bootstrap.lua'))();assert(startup.boot(other)=='AI_LUA_READY');other.step(5)
 local n=startup.state.__app.native
 for row=0,2 do for col=0,3 do
  local f=other.frames[n.commands[row*4+col+1]]
  assert(f.x==.644+col*.040 and f.y==.145-row*.043 and f.w==.036 and f.h==.036)
  assert(f.showWrites==nil and f.parent==1)
 end end
 for i,id in ipairs(n.items)do
  local f=other.frames[id];local slot=i-1
  assert(f.x==.518+(slot%2)*.038 and f.y==.142-math.floor(slot/2)*.042)
  f.enabled=false;f.shown=false
 end
 n.commandContext({});n.commandContext(nil);n.activate();startup.state.__app.refreshRun()
 for _,id in ipairs(n.items)do local f=other.frames[id];assert(f.enabled==false and f.shown==false and f.showWrites==nil)end
end)
local realCanEnd=S.HopeTurn_CanEnd
check('Sidebar leaves the lower middle and native tooltip corner clear at all detail states',function()
 -- Exercise the view's enabled-turn state; rules eligibility is covered in the behavior suite.
 S.HopeTurn_CanEnd=function()return true end
 S.HopeLayout_Focus(0);S.udg_ZhandouZhong=true;S.HopeMini_Actor[1]=nil
 for _,expanded in ipairs({true,false})do
  S.HopeQoL_Visible=expanded;app.refreshRun()
  for _,node in ipairs({app.native.dock,app.field.hero,app.field.bag,app.field.context,app.hud.party})do
   assert(node.x+node.w<=.1621,'combat readout returned to centre/right')
   assert(node.y-node.h>.248,'sidebar covers left-bottom entry buttons')
  end
  assert(app.native.dock.y==.490,'sidebar must sit below the top-left portrait')
  assert(app.hud.turn.visible and visible(b.frames[app.hud.endButton.id]),'F5 must not remove end-turn')
 end
 local oldActive=S.HopeRoute_Active
 S.HopeRoute_Active=function(n)return n>=0 and n<=5 end
 app.hud.refresh();assert(app.hud.party.visible)
 local _,lines=app.hud.partyText.value:gsub('|n','');assert(lines==4,'only the five other players belong in the team list')
 assert(app.hud.party.y-app.hud.party.h>.248)
 S.HopeRoute_Active=function(n)return n==0 end
 app.hud.refresh();assert(not app.hud.party.visible)
 S.HopeRoute_Active=oldActive;S.HopeQoL_Visible=true
 app.encounter.folded=true;app.encounter.selected=nil;app.refreshRun();snap('battle-left-sidebar')
end)
check('Native tooltip temporarily suppresses enemy overlays and restores inspection state',function()
 b.enableFullConsole()
 local id=b.japi.DzFrameGetTooltip();local tooltip=b.frames[id]
 tooltip.x=.570;tooltip.y=.490;tooltip.w=.218;tooltip.h=.310;tooltip.absolute=true
 tooltip.text='原生技能提示：效果、消耗、每级成长';tooltip.font=.009
 app.encounter.folded=false;app.encounter.page=0
 app.encounter.refresh();app.encounter.selected=app.encounter.units[1];app.encounter.refresh()
 assert(app.encounter.root.visible and app.encounter.detail.visible)
 local selected=app.encounter.selected
 tooltip.shown=true;app.refreshRun()
 assert(not app.encounter.root.visible and not app.encounter.detail.visible)
 assert(app.hud.turn.visible and app.native.dock.visible,'tooltip must not hide left-side actions')
 assert(tooltip.showWrites==nil and tooltip.scripts[2]==nil,'never modify native tooltip or hover scripts')
 snap('battle-native-tooltip')
 tooltip.shown=false;app.refreshRun()
 assert(app.encounter.root.visible and app.encounter.detail.visible and app.encounter.selected==selected)
 assert(not app.encounter.folded,'hover must not change the player choice')
 app.encounter.folded=true;tooltip.shown=true;app.refreshRun();tooltip.shown=false;app.refreshRun()
 assert(app.encounter.folded and not app.encounter.rows[1].visible)
 local api=b.japi.DzFrameIsVisible
 b.japi.DzFrameIsVisible=nil;app.refreshRun();assert(app.encounter.root.visible)
 b.japi.DzFrameIsVisible=function()error('unsupported in this engine')end
 app.refreshRun();assert(app.encounter.root.visible)
 b.japi.DzFrameIsVisible=api;app.encounter.selected=nil;S.HopeTurn_CanEnd=realCanEnd;app.refreshRun()
end)
check('Reward reopen has an independent hit row and preserves pending selection',function()
 app.close();S.HopeLayout_Focus(0);S.HopeRoute_Assigning=false
 local p=S.Player(0);local key=S.GetHandleId(p)
 S.SaveBoolean(S.YDHT,key,-1422318988,false)
 S.SaveInteger(S.YDHT,key,-952593264,5)
 S.HopeChoice_Hidden=true;S.HopeChoice_Refresh();refresh();app.field.refresh()
 local button=b.frames[S.HopeChoice_Button]
 assert(button.shown and button.text=='展开待选项')
 assert(button.x==.014 and button.y==.522 and button.w==.148 and button.h==.022)
 local function disjoint(a,c)
  return a.x+a.w<=c.x or c.x+c.w<=a.x or a.y-a.h>=c.y or c.y-c.h>=a.y
 end
 for _,node in ipairs({app.native.dock,app.field.hero,app.field.bag,app.field.context,app.hud.party})do
  assert(disjoint(button,node),'reward reopen overlaps sidebar control')
 end
 assert(disjoint(button,b.frames[S.HopeQoL_Restore]),'F5 restore occupies reward row')
 assert(button.scripts[1] and not button.scripts[1].sync)
 local saved=S.LoadInteger(S.YDHT,key,-952593264)
 button.scripts[1].fn();S.HopeChoice_Refresh();refresh()
 assert(not S.HopeChoice_Hidden and visible(b.frames[S.udg_UI_sg[1]]))
 assert(S.LoadInteger(S.YDHT,key,-952593264)==saved and not S.LoadBoolean(S.YDHT,key,-1422318988))
 S.HopeChoice_ToggleLocal();S.HopeChoice_Refresh();refresh();app.field.refresh()
 assert(S.HopeChoice_Hidden and button.shown and button.text=='展开待选项')
 assert(app.field.hero.visible and app.field.bag.visible)
 snap('reward-reopen-sidebar')
 S.SaveBoolean(S.YDHT,key,-1422318988,true);S.HopeChoice_Refresh();refresh()
 assert(not button.shown)
end)
check('Loot uses one fold action, one skip caption and content-sized cards with readable overflow',function()
 local p=S.Player(0);local key=S.GetHandleId(p)
 S.SaveBoolean(S.YDHT,key,-1422318988,false);S.HopeChoice_Hidden=false
 local texts={'木材堆|n|n给予玩家2木材','奎尔萨拉斯之靴 +6|n|n增加英雄6点敏捷。|cffffff00该物品2个相同物品自动合成|r','法师长袍 +6|n|n增加英雄6点智力。|cffffff00该物品2个相同物品自动合成|r'}
 for n,id in ipairs({3,7,11})do S.DzFrameSetText(S.udg_UI_sg[id],texts[n])end
 S.DzFrameSetText(S.udg_UI_sg[15],'放弃选择') -- actual legacy population write
 S.HopeChoice_Refresh();refresh()
 local panel=b.frames[S.udg_UI_sg[1]];local skip=b.frames[S.udg_UI_sg[16]]
 assert(panel.h<.285,'short rewards leave the former large empty bottom')
 assert(skip.text=='' and b.frames[S.udg_UI_sg[15]].text=='放弃选择','two skip captions')
 assert(-skip.y+skip.h<=panel.h and -skip.y+skip.h>=panel.h-.015)
 assert(not b.frames[S.HopeChoice_Button].shown,'outside fold control overlays open reward')
 assert(not b.frames[S.udg_UI_sg[3]].shown,'legacy source must not create a second body')
 snap('loot-compact')
 local original='遗物测试|n'..string.rep('攻击加成和合成条件，',45)..'末尾效果保留'
 S.DzFrameSetText(S.udg_UI_sg[3],original);S.HopeChoice_Refresh()
 local more,body
 for _,f in pairs(b.frames)do
  if f.parent==panel.id and f.shown and (f.text or ''):find('^说明 1/')then more=f end
  if f.parent==S.udg_UI_sg[4] and f.kind=='TEXT'and f.shown and (f.text or ''):find('遗物测试',1,true)then body=f end
 end
 assert(more and body and more.scripts[1]and not more.scripts[1].sync)
 local card=b.frames[S.udg_UI_sg[4]]
 assert(more.y<=card.y-card.h,'paging hitbox overlaps reward-claim hitbox')
 local height=panel.h;local pages=tonumber(more.text:match('/(%d+)'))
 local gathered={}
 for n=1,pages do
  gathered[#gathered+1]=body.text
  more.scripts[1].fn();S.HopeChoice_Refresh()
  assert(panel.h==height,'page changes move the whole window')
  assert(not S.LoadBoolean(S.YDHT,key,-1422318988),'description page claimed reward')
 end
 assert(table.concat(gathered):gsub('|n','')==original:gsub('|n',''),'overflow silently lost content')
 assert(b.frames[S.udg_UI_sg[3]].text==original)
 local getText=b.japi.DzFrameGetText;b.japi.DzFrameGetText=nil;S.HopeChoice_Refresh()
 assert(b.frames[S.udg_UI_sg[3]].shown,'missing optional getter must retain original text')
 b.japi.DzFrameGetText=getText
 for n,id in ipairs({3,7,11})do S.DzFrameSetText(S.udg_UI_sg[id],texts[n])end
 S.HopeChoice_Refresh();S.HopeChoice_ToggleLocal();S.HopeChoice_Refresh()
 assert(b.frames[S.HopeChoice_Button].shown and not b.frames[S.udg_UI_sg[1]].shown)
 b.frames[S.HopeChoice_Button].scripts[1].fn();S.HopeChoice_Refresh()
 assert(b.frames[S.udg_UI_sg[1]].shown and not b.frames[S.HopeChoice_Button].shown)
 S.SaveBoolean(S.YDHT,key,-1422318988,true);S.HopeChoice_Refresh()
end)
local f=assert(io.open('audit/lua-ui-model.json','wb'));f:write(json({engineTested=false,checks=results,snapshots=snapshots}));f:close()
print(#results..' Lua UI suites passed; '..#app.ui.widgets..' new widgets; snapshots are engine models only')

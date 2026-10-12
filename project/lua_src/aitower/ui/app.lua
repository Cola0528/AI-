local components=require 'aitower.ui.components'
local themes=require 'aitower.ui.theme'
local command_module=require 'aitower.game.commands'
local M={}
function M.new(S)
    local app={tab=0,page=0,cards={},groups={},mounted=false}
    local ui,bus
    local G,W,MUT,C=themes.gold,themes.white,themes.muted,themes.clear
    local icon=themes.icons
    local tabs={'总览','基础成长','天赋树','基石','深渊','成就','遗物图鉴','职业熟练','礼包抽奖','抽取记录','遗物先机','商店资源'}
    local descriptions={
        '存档、永久成长和礼包权益，在这里统一管理。',
        '每项最多购买5次，直接查看已购合计。永久兑换下一局生效。',
        '点选节点查看；在详情中学习。前置至少1级，成长下一局生效。',
        '三种基石只选一种。重置天赋时同时返还基石花费。',
        '消耗魂晶解锁。通过极难及以上的守门人挑战获得魂晶。',
        '首次完成每项成就获得5积分；记录与你同行和登顶的时刻。',
        '曾经获得的遗物会留在图鉴中，完整效果随时可查。',
        '各职业独立积累守门人经验，熟练度加成下一局载入。',
        '礼包消耗5积分抽取，55%空签；已拥有不会移出奖池。',
        '查看你的抽取结果，金币、木材与礼包各按原规则结算。',
        '点击领取一件；悬停查看完整效果。可以关闭后再回来选择。',
        '实际进入商店关卡后开放。离开商店，资源交易立即关闭。',
    }
    local function player()return S.GetLocalPlayer()end
    local function owner()return S.GetPlayerId(player())end
    local function text(node,value)node.text(value or '')end
    local function no_op()end
    function app.open(tab)
        if tab~=nil then app.tab=tab;app.page=0 end
        S.HopeMeta_Open=true
        S.HopeLayout_Focus(15)
    end
    function app.close()S.HopeMeta_Open=false end
    function app.toggle(tab)
        if S.HopeMeta_Open and (tab==nil or app.tab==tab)then app.close()else app.open(tab)end
    end
    local function group(key,count,layout,kind,icons)
        local cards={}
        for n=0,count-1 do
            local x,y,w,h=layout(n)
            local card=ui.card(app.panel,x,y,w,h,icons(n))
            if kind then bus.bind(card.id,kind,n)end
            cards[n]=card
            card.show(false)
        end
        app.groups[key]=cards
        return cards
    end
    function app.mount()
        if app.mounted then return end
        local timer=S.CreateTimer()
        S.TimerStart(timer,.10,true,function()
            if app.mounted then app.refresh();app.refreshRun()end
        end)
        ui=components.new(S);bus=command_module.new(S)
        app.ui=ui
        app.panel=ui.panel(nil,.020,.578,.760,.416)
        app.panel.show(false)
        S.HopeMeta_Panel=app.panel.id
        app.title=ui.label(app.panel,.018,-.012,.210,.023,G..'AI 爬塔'..C,.016)
        ui.label(app.panel,.117,-.019,.210,.016,MUT..'旅者手记  /  1.0.16'..C,.008)
        app.balance=ui.label(app.panel,.390,-.017,.291,.023,'',.010)
        local close=ui.textButton(app.panel,.693,-.010,.050,.028,'关闭')
        close.localAction(app.close)
        app.navigation={};app.navMarks={}
        local mainTabs={0,2,3,1,4,8,6}
        local mainNames={'旅途','天赋','基石','成长','深渊','秘藏','收藏'}
        for order,tab in ipairs(mainTabs)do
            local x=.017+(order-1)*.103
            local button=ui.textButton(app.panel,x,-.049,.095,.026,mainNames[order])
            button.localAction(function()app.tab=tab;app.page=0 end)
            app.navigation[tab]=button
            app.navMarks[tab]=ui.image(app.panel,x+.014,-.077,.067,.001,'AITower\\gold.tga')
        end
        for _,tab in ipairs({5,7,9,10,11})do
            local index=tab
            app.navigation[tab]=ui.textButton(app.panel,0,0,.105,.021,tabs[tab+1])
            app.navigation[tab].localAction(function()app.tab=index;app.page=0 end)
        end
        app.heading=ui.label(app.panel,.020,-.085,.165,.018,'',.0095)
        app.description=ui.label(app.panel,.187,-.086,.555,.019,'',.008)
        app.treeTitles={}
        app.body=ui.label(app.panel,.025,-.126,.708,.250,'',.009)
        app.footer=ui.label(app.panel,.022,-.397,.490,.014,'',.0078)
        app.previous=ui.textButton(app.panel,.652,-.389,.038,.024,'‹')
        app.next=ui.textButton(app.panel,.706,-.389,.038,.024,'›')
        app.previous.localAction(function()app.page=math.max(0,app.page-1)end)
        app.next.localAction(function()app.page=app.page+1 end)
        app.reset=ui.textButton(app.panel,.536,-.389,.205,.024,'重置修习 · 10积分')
        bus.bind(app.reset.id,'reset')
        app.seedDetail=ui.label(app.panel,.367,-.125,.366,.210,'',.009)
        app.seedReroll=ui.button(app.panel,.400,-.350,.305,.028,'重选遗物候选')
        S.DzFrameSetScriptByCode(app.seedReroll.id,1,S.HopeMeta_SeedReroll,true)
        group('seed',4,function(n)return .025,-.125-n*.060,.311,.053 end,'relic',function()return icon.relic end)
        for n=0,3 do local slot=n;app.groups.seed[n].hover(function()app.hover=slot end)end
        app.recordMine=ui.textButton(app.panel,.026,-.118,.108,.025,'我的记录')
        app.recordTeam=ui.textButton(app.panel,.147,-.118,.108,.025,'队友记录')
        app.recordMine.localAction(function()app.teamRecords=false;app.page=0 end)
        app.recordTeam.localAction(function()app.teamRecords=true;app.page=0 end)
        local market=group('market',6,function(n)return .025+(n%2)*.365,-.147-math.floor(n/2)*.072,.346,.063 end,'market',function()return icon.gold end)
        local trade={'木材单抽','木材十连','购买1木材','购买5木材','出售1木材','出售5木材'}
        local costs={'1木材 · 独立50%空签','10木材 · 每次独立50%空签','77金币 → 1木材','385金币 → 5木材','1木材 → 51金币','5木材 → 255金币'}
        for n=0,5 do text(market[n].title,G..trade[n+1]..C);text(market[n].body,costs[n+1])end
        app.journal=require('aitower.ui.journal').new(S,ui,bus,app)
        app.entry=ui.button(nil,.014,.222,.134,.023,'成长档案 · F7')
        app.entry.localAction(function()app.toggle()end)
        S.DzTriggerRegisterKeyEventByCode(nil,118,1,false,function()app.toggle()end)
        app.native=require('aitower.ui.native_controls').install(S,ui)
        app.hud=require('aitower.ui.hud').new(S,ui,bus,app.native)
        app.character=require('aitower.ui.character').new(S,ui)
        app.tactical=require('aitower.ui.tactical').new(S,ui,bus,app.native)
        app.merchant=require('aitower.ui.merchant').new(S,ui,app)
        app.encounter=require('aitower.ui.encounter').new(S,ui,app.native)
        app.field=require('aitower.ui.field').new(S,ui,app)
        app.mounted=true
        if app.native.activate then app.native.activate()end
    end
    function app.refreshRun()
        app.hud.refresh();app.character.refresh();app.tactical.refresh()
        app.merchant.refresh();app.encounter.refresh();app.field.refresh()
    end
    local function show_group(key)
        for _,card in pairs(app.groups[key])do card.show(true)end -- local frame visibility only
    end
    function app.refresh()
        if not app.mounted then return end
        local i,p=owner(),player()
        if i<0 or i>=6 then app.panel.show(false);app.entry.show(false);return end
        local active=S.udg_hero[i+1]~=nil
        local open=S.HopeMeta_Open
        local available=S.HopeWood_Allowed(S.gg_unit_n00Q_0028,S.udg_hero[i+1])
        if app.tab==11 and not available then app.tab=0;app.page=0 end
        app.panel.show(open);app.entry.show(active and not open)
        local collection=app.tab==5 or app.tab==6 or app.tab==7
        local treasure=app.tab==8 or app.tab==9 or app.tab==10 or app.tab==11
        local subTabs=collection and {5,7} or treasure and {9,10,11} or {}
        local subActive={}
        for n,tab in ipairs(subTabs)do
            app.navigation[tab].place(.350+(n-1)*.127,-.085,.120,.021)
            subActive[tab]=tab~=11 or available
        end
        for _,tab in ipairs({5,7,9,10,11})do app.navigation[tab].show(subActive[tab]or false)end
        app.description.show(not collection and not treasure)
        for n,mark in pairs(app.navMarks)do mark.show(open and (n==app.tab or n==6 and collection or n==8 and treasure))end
        if not open then app.journal.hide();return end
        for key,cards in pairs(app.groups)do for n,card in pairs(cards)do
            card.show(key=='market' and app.tab==11 or key=='seed' and app.tab==10 and S.HopeMeta_SeedPending[i] and n<S.HopeMeta_SeedCount[i])
        end end
        for _,node in ipairs(app.treeTitles)do node.show(app.tab==2 and S.HopeMeta_Loaded[i])end
        app.reset.show(S.HopeMeta_Loaded[i] and (app.tab==2 or app.tab==3))
        app.seedDetail.show(app.tab==10 and S.HopeMeta_SeedPending[i])
        app.seedReroll.show(app.tab==10 and S.HopeMeta_SeedPending[i] and S.HopeMeta_SeedCharges[i]>0)
        app.recordMine.show(app.tab==9);app.recordTeam.show(app.tab==9)
        if app.tab~=7 and app.tab~=9 then app.previous.show(false);app.next.show(false)end
        app.body.show(true);text(app.body,'')
        app.body.place(.025,-.126,.708,.250)
        for n,button in pairs(app.navigation)do
            local names={[0]='旅途',[2]='天赋',[3]='基石',[1]='成长',[4]='深渊',[8]='秘藏',[6]='收藏'}
            button.text((n==app.tab and G or MUT)..(names[n]or tabs[n+1])..C)
        end
        text(app.balance,G..'积分  '..S.udg_Wj_jf[i+1]..C..'    '..W..'魂晶  '..S.HopeMeta_Soul[i]..C)
        text(app.heading,G..tabs[app.tab+1]..C)
        text(app.description,MUT..descriptions[app.tab+1]..C)
        text(app.footer,S.HopeCloud_Status(p))
        local loaded=S.HopeMeta_Loaded[i]
        if not loaded and app.tab~=9 and app.tab~=10 and app.tab~=11 then
            app.journal.hide()
            app.previous.show(false);app.next.show(false)
            text(app.body,'云档尚未就绪，永久购买暂不可用。|n|n当前不会创建空档或覆盖旧余额。|n请在 KK 作者测试大厅 / RPG 地图房间启动。|n输入 -save 查看平台诊断。')
            return
        end
        if app.journal.refresh(app.tab,i,p)then return end
        if app.tab==9 then
            app.recordMine.show(true);app.recordTeam.show(true)
            app.body.place(.027,-.154,.706,.223)
            local records={}
            for owner=0,5 do
                if (app.teamRecords and owner~=i)or(not app.teamRecords and owner==i)then
                    for record=math.max(1,S.HopeDraw_Count[owner]-63),S.HopeDraw_Count[owner]do
                        local slot=record%64*2
                        records[#records+1]={owner=owner,slot=slot,serial=S.LoadInteger(S.HopeDraw_History,owner,1000+slot)}
                    end
                end
            end
            table.sort(records,function(a,b)return a.serial>b.serial end) -- local display only
            local count=#records
            app.page=math.min(math.max(0,count-1),app.page)
            if count<=0 then text(app.body,app.teamRecords and '队友暂时没有抽取记录。'or '暂时没有抽取记录。')
            else
                local r=records[app.page+1]
                text(app.body,G..S.GetPlayerName(S.Player(r.owner))..' · '..S.LoadStr(S.HopeDraw_History,r.owner,r.slot)..C..'|n|n'..S.LoadStr(S.HopeDraw_History,r.owner,r.slot+1))
            end
            text(app.description,(app.teamRecords and '队友' or '个人')..'抽取记录  '..(count>0 and app.page+1 or 0)..' / '..count..'  ·  每位玩家保留最近64条')
            app.previous.show(count>1);app.next.show(count>1)
        elseif app.tab==10 then
            app.body.show(false)
            if S.HopeMeta_SeedPending[i]then
                app.seedDetail.show(true)
                app.seedReroll.show(S.HopeMeta_SeedCharges[i]>0)
                for n=0,3 do
                    local card=app.groups.seed[n]
                    card.show(n<S.HopeMeta_SeedCount[i])
                    if n<S.HopeMeta_SeedCount[i]then
                        local index=S.HopeMeta_SeedCandidate[i*4+n]
                        card.icon.texture(S.HopeRelic_IconPath(index));text(card.title,G..S.HopeRelic_Name(index)..C)
                        text(card.body,'查看右侧效果 · 点击领取')
                    end
                end
                local n=app.hover
                if n and n<S.HopeMeta_SeedCount[i]then
                    local index=S.HopeMeta_SeedCandidate[i*4+n]
                    text(app.seedDetail,G..S.HopeRelic_Name(index)..C..'|n|n'..S.HopeRelic_Description(index,0)..'|n'..S.HopeRelic_Description(index,1))
                else text(app.seedDetail,'将鼠标移到左侧遗物候选，|n这里会显示完整效果。')end
            else app.body.show(true);text(app.body,'本局暂无待选的遗物先机奖励。')end
        elseif app.tab==11 then show_group('market');app.body.show(false)end
    end
    function app.install()
        -- Every retained dialog uses the same Lua component primitives/theme.
        -- Generated business pages keep their actual actions and data sources.
        -- Creation starts in the map's delayed UI callbacks, after the game UI
        -- exists. Installing presentation overrides must not create frames in main.
        local instance
        local legacy_ui=setmetatable({}, {__index=function(_,name)
            instance=instance or components.new(S)
            return instance[name]
        end})
        require('aitower.ui.choices').install(S,legacy_ui)
        require('aitower.ui.collections').install(S,legacy_ui)
        require('aitower.ui.routes').install(S,legacy_ui)
        require('aitower.game.catalog').install(S)
        -- The legacy reward-reopen button used y=.375, now occupied by the
        -- hero/helper selectors. Reserve its own row above the left sidebar.
        local initLayout=S.HopeLayout_Init
        S.HopeLayout_Init=function()
            initLayout()
            S.HopeLayout_Place(S.HopeChoice_Button,0,.014,.522,.148,.022)
        end
        S.HopeQoL_Button=function(_,parent,x,y,w,h,value)
            if not parent or parent==0 then return 0 end
            local relative
            if parent~=S.DzGetGameUI()then relative={id=parent}end
            return legacy_ui.button(relative,x,y,w,h,value).id
        end
        S.HopeQoL_Label=function(_,parent,x,y,w,h,value)
            if not parent or parent==0 then return 0 end
            return legacy_ui.label({id=parent},x,y,w,h,value,.0095).id
        end
        S.HopeQoL_Surface=function(_,x,y,w,h)
            local panel=legacy_ui.panel(nil,x,y,w,h);panel.show(false);return panel.id
        end
        -- All original rules are Lua functions in S; these are presentation
        -- redirects, not calls back into the removed gameplay JASS script.
        S.HopeMeta_Create=function()
            S.HopeMeta_Config();S.HopeMeta_ConfigBrief()
            S.TimerStart(S.CreateTimer(),.5,true,S.HopeMeta_Tick)
            local trigger=S.CreateTrigger()
            for i=0,5 do S.TriggerRegisterPlayerChatEvent(trigger,S.Player(i),'-relic ',false)end
            S.TriggerAddAction(trigger,S.HopeMeta_SeedChat)
            local ok,err=pcall(app.mount)
            if not ok then S.__report('界面初始化失败：'..tostring(err))end
        end
        S.HopeMeta_Refresh=app.refresh
        S.HopeMarket_Refresh=no_op
        S.HopeMeta_Show=function()app.open()end
        S.HopeMeta_Toggle=function()app.toggle()end
        S.HopeMeta_Close=app.close
        S.HopeArchive_Toggle=function()app.toggle(1)end
        S.HopeArchive_OpenFor=function(p)if p==player()then app.open(1)end;return true end
        S.HopeGift_Toggle=function()app.toggle(8)end
        S.HopeGift_OpenFor=function(p)if p==player()then app.open(8)end;return true end
        S.HopeDraw_OpenHistory=function()app.open(9)end
        S.HopeMarket_Show=function()
            local i=owner()
            if app.mounted and i>=0 and i<6 and S.HopeWood_Allowed(S.gg_unit_n00Q_0028,S.udg_hero[i+1])then app.merchant.choose(1)end
        end
        local offer=S.HopeMeta_OfferRelic
        S.HopeMeta_OfferRelic=function()
            offer()
            if owner()==S.HopeMeta_SupplyOwner and S.HopeMeta_SeedPending[owner()]then app.open(10)end
        end
        local apply=S.HopeLayout_Apply
        S.HopeLayout_Apply=function()
            if S.HopeDraw_Open then S.HopeDraw_Open=false;app.open(9)end
            apply()
            -- There is one visible archive entry. Old functions/data remain
            -- callable for native unit selection and chat compatibility.
            S.HopeLayout_Show(S.HopeLayout_Save,false)
            S.HopeLayout_Show(S.HopeGift_OpenButton,false)
            S.HopeLayout_Show(S.HopeLayout_History,false)
            if app.mounted then app.refresh();app.refreshRun()end
        end
    end
    return app
end
return M

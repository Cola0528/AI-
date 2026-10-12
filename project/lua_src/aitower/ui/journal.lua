-- Function-specific screens. Navigation is local; every spending control has a
-- fixed synchronized command payload, independent of the selected/hovered node.
local T=require 'aitower.ui.theme'
local M={}
local G,C,W,MUT=T.gold,T.clear,T.white,T.muted
local function btn(name)return 'ReplaceableTextures\\CommandButtons\\BTN'..name..'.blp'end
local talentIcons={'SteelMelee','Brilliance','CriticalStrike','Berserk','BootsOfSpeed',
 'Periapt','Defend','Heal','Rejuvenation','ManaShield',
 'ChestOfGold','BundleOfLumber','StaffOfTeleportation','PendantOfEnergy','HealingSalve'}
function M.new(S,ui,bus,app)
 local v={roots={},nodes={},links={},selected=0,collection=0,selectedKey=0}
 local function root(tab)
  local f=ui.frame(app.panel,.016,-.111,.728,.271);f.show(false);v.roots[tab]=f;return f
 end
 local function label(p,x,y,w,h,t,size)return ui.label(p,x,y,w,h,t,size or .009)end
 local function line(p,x,y,w)return ui.image(p,x,y,w,.0006,'AITower\\gold.tga')end
 local function level(i,n)return S.HopeMeta_Level(S.HopeMeta_Talent[i*3+math.floor(n/5)],n%5)end
 local function name(p,x,y,w,t)return label(p,x,y,w,.020,G..t..C,.012)end
 -- Journey: illustrated character chronicle, large numbers and purchased totals.
 local home=root(0)
 ui.image(home,0,0,.407,.271,'AITower\\journey.tga')
 ui.image(home,.009,-.009,.300,.101,'AITower\\panel.tga').alpha(185)
 v.playerName=name(home,.018,-.018,.345,'')
 v.journey=label(home,.018,-.048,.280,.065,'',.010)
 label(home,.018,-.222,.300,.035,MUT..'每次出发，都留下属于你的足迹。|n成长在下一局载入，当前冒险保持不变。'..C,.008)
 v.meters={}
 for n,t in ipairs({'基础成长','天赋修习','遗物收藏','成就足迹'})do
  local x=.370+((n-1)%2)*.176;local y=-.016-math.floor((n-1)/2)*.073
  label(home,x,y,.160,.015,MUT..t..C,.008)
  v.meters[n]=label(home,x,y-.022,.160,.027,'',.018)
 end
 line(home,.370,-.164,.340)
 v.effects=label(home,.370,-.181,.340,.079,'',.0082)
 -- Talents: three real forked trees. Links render behind icons; learned paths
 -- light up. Each node can be inspected without accidentally spending points.
 local tree=root(2)
 ui.image(tree,0,0,.728,.271,'AITower\\talents.tga')
 v.treeStats=label(tree,.510,-.242,.206,.021,'',.008)
 local positions={}
 for branch=0,2 do
  local center=.078+branch*.156
  label(tree,center-.038,-.004,.093,.017,({'|cffe3b879征伐','|cff91ccba守护','|cff94bbde远行'})[branch+1]..C,.011)
  local order=branch==1 and {0,1,2,4,3}or {0,1,2,3,4}
  local spots={{center,-.034},{center-.041,-.110},{center+.041,-.110},{center-.041,-.196},{center+.041,-.196}}
  for k=1,5 do positions[branch*5+order[k]]={spots[k][1]-.016,spots[k][2]}end
 end
 for n=0,14 do
  local pre=S.HopeMeta_NodePrereq[n]
  if pre>=0 then local a,b=positions[pre],positions[n];v.links[n]=ui.link(tree,a[1]+.016,a[2]-.050,b[1]+.016,b[2]+.001)end
 end
 v.detailIcon=ui.image(tree,.518,-.020,.043,.043,btn(talentIcons[1]))
 v.detailTitle=name(tree,.570,-.024,.147,'')
 v.detail=label(tree,.518,-.077,.198,.126,'',.009)
 v.upgrades={}
 for n=0,14 do
  local index=n;local xy=positions[n]
  local node=ui.iconButton(tree,xy[1],xy[2],.033,btn(talentIcons[n+1]))
  node.name=label(tree,xy[1]-.025,xy[2]-.046,.093,.013,S.HopeMeta_NodeName[n],.0077)
  node.rank=label(node,.003,-.034,.028,.012,'',.0075)
  node.pips={}
  for k=1,3 do node.pips[k]=ui.image(node,.003+(k-1)*.010,-.029,.008,.0025,'AITower\\gold.tga')end
  node.select=ui.image(node,-.003,.003,.039,.0014,'AITower\\gold.tga')
  node.hover(function()v.selected=index end)
  node.localAction(function()v.selected=index end)
  v.nodes[n]=node
  local upgrade=ui.button(tree,.518,-.207,.198,.027,'学习天赋')
  bus.bind(upgrade.id,'talent',n);upgrade.show(false);v.upgrades[n]=upgrade
 end
 v.treeTip=label(tree,.009,-.255,.485,.015,MUT..'点选 / 悬停查看  ·  金线表示前置已学  ·  每项最多 3 级'..C,.0074)
 -- Base attributes: a compact ledger with visible rank segments and effect sums.
 local base=root(1);v.base={}
 for n=0,9 do
  local x=math.floor(n/5)*.369;local y=-(n%5)*.051
  local r=ui.frame(base,x,y,.354,.047)
  ui.image(r,.002,-.005,.027,.027,btn(talentIcons[({1,1,5,2,6,9,11,12,4,2})[n+1]]))
  local row={title=label(r,.039,-.003,.217,.014,'',.009),effect=label(r,.039,-.020,.217,.015,'',.008)}
  row.buy=ui.button(r,.268,-.009,.080,.025,'');bus.bind(row.buy.id,'base',n)
  row.pips={};for k=1,5 do row.pips[k]=ui.image(r,.039+(k-1)*.041,-.039,.037,.002,'AITower\\gold.tga')end
  v.base[n]=row
 end
 -- Keystone: three prominent seals, a single commitment, never a talent page.
 local keys=root(3);v.keys={}
 ui.image(keys,0,0,.728,.271,'AITower\\talents.tga')
 local keyNames={'先阵','休整','探索'}
 local keyTag={'破局的第一步','为长途留余力','将未知握在手中'}
 local keyEffects={'每场首回合：4%生命护盾。|n首个命中：回复2魔法。','每场胜利额外回复2%生命。','首次正常遗物奖励4选1。|n免费重选候选一次。'}
 for n=0,2 do
  local x=.016+n*.242
  ui.image(keys,x+.069,-.012,.082,.082,btn(({'Defend','Rejuvenation','PendantOfEnergy'})[n+1]))
  name(keys,x+.071,-.103,.128,keyNames[n+1])
  label(keys,x+.028,-.133,.203,.018,MUT..keyTag[n+1]..C,.008)
  label(keys,x+.014,-.164,.215,.050,keyEffects[n+1],.0085)
  local choose=ui.button(keys,x+.015,-.225,.205,.029,'');bus.bind(choose.id,'keystone',n+1)
  v.keys[n]=choose
 end
 -- Abyss: compact seals plus a dedicated contract inspector, not six cards.
 local abyss=root(4);v.abyss={};v.abyssChoice=0
 ui.image(abyss,0,0,.728,.271,'AITower\\talents.tga')
 name(abyss,.020,-.012,.360,'深渊契约')
 label(abyss,.020,-.042,.335,.045,MUT..'穿越守门人的试炼，留下魂晶。|n契约将伴随你下一次进入高塔。'..C,.009)
 v.abyssText=label(abyss,.413,-.030,.290,.150,'',.011)
 v.abyssBuy={}
 for n=0,5 do
  local index=n;local x=.039+(n%3)*.119;local y=-.108-math.floor(n/3)*.078
  local node=ui.iconButton(abyss,x,y,.041,btn(talentIcons[({3,7,14,13,8,10})[n+1]]))
  node.state=label(abyss,x-.017,y-.044,.111,.026,'',.008)
  node.localAction(function()v.abyssChoice=index end);node.hover(function()v.abyssChoice=index end)
  v.abyss[n]=node
  local buy=ui.button(abyss,.413,-.205,.270,.033,'');bus.bind(buy.id,'abyss',n);buy.show(false);v.abyssBuy[n]=buy
 end
 -- Achievement medals, collected/uncollected visible together.
 local achievements=root(5);v.medals={}
 for n=0,23 do
  local x=(n%6)*.121;local y=-math.floor(n/6)*.066
  local row={icon=ui.image(achievements,x+.006,y+.001,.019,.019,btn('MedalionOfCourage')),
   title=label(achievements,x+.002,y-.023,.114,.024,'',.008),status=label(achievements,x+.029,y,.085,.017,'',.007)}
  v.medals[n]=row
 end
 -- Relic collection: browsable icon gallery + complete selected description.
 local collection=root(6);v.relics={}
 for n=0,43 do
  local index=n;local x=(n%8)*.044;local y=-.011-math.floor(n/8)*.041
  local node=ui.iconButton(collection,x,y,.033,S.HopeRelic_IconPath(n))
  node.mark=label(node,.021,-.022,.012,.012,'',.007)
  node.localAction(function()app.page=index end);node.hover(function()v.collectionHover=index end)
  v.relics[n]=node
 end
 v.relicIcon=ui.image(collection,.397,-.009,.048,.048,S.HopeRelic_IconPath(0))
 v.relicName=name(collection,.458,-.020,.254,'')
 v.relicText=label(collection,.397,-.076,.318,.177,'',.0085)
 -- Mastery roster: progress bars communicate experience, never pages of prose.
 local mastery=root(7);v.jobs={}
 for n=0,7 do
  local x=math.floor(n/4)*.369;local y=-(n%4)*.066
  local r={title=label(mastery,x,y,.348,.018,'',.010),detail=label(mastery,x,y-.023,.348,.018,'',.008),bar=ui.bar(mastery,x,y-.047,.344,.004,'AITower\\mana.tga')}
  v.jobs[n]=r
 end
 -- Reliquary: art focal point, honest odds ledger, large explicit draw control.
 local gift=root(8);v.gifts={};v.giftChoice=0
 v.chest=ui.image(gift,.049,-.001,.183,.183,'AITower\\reliquary.tga')
 v.giftDetail=label(gift,.020,-.194,.270,.072,'',.009)
 v.drawResult=label(gift,.309,-.217,.394,.015,'',.008)
 label(gift,.309,0,.392,.020,G..'秘藏奖池'..C,.012)
 label(gift,.309,-.028,.392,.032,MUT..'每次消耗5积分 · 空签55%|n重复礼包不会移出奖池，也不会叠加权益。'..C,.008)
 for n=0,5 do
  local index=n;local y=-.068-n*.024
  local row=ui.textButton(gift,.303,y,.400,.022,'')
  row.label=label(row,.006,-.004,.388,.017,'',.009)
  row.hover(function()v.giftChoice=index end);row.localAction(function()v.giftChoice=index end)
  v.gifts[n]=row
 end
 v.draw=ui.button(gift,.309,-.234,.394,.031,'开启秘藏  ·  5积分');bus.bind(v.draw.id,'gift')
 function v.hide()for _,f in pairs(v.roots)do f.show(false)end end
 function v.refresh(tab,i,p)
  for index,screen in pairs(v.roots)do screen.show(index==tab)end
  local f=v.roots[tab];if not f then return false end
  app.body.show(false)
  if tab==0 then
   v.playerName.text(G..S.GetPlayerName(p)..C..' · 旅者档案')
   v.journey.text('爬塔等级 '..(1+math.floor(math.sqrt(S.HopeMeta_Xp[i]/100)))..'|n无限最高 '..S.HopeMeta_Best[i]..' 轮|n'..MUT..'AI 爬塔 · 1.0.6'..C)
   local values={S.HopeArchive_Total(p)..' / 50',S.HopeMeta_Learned(i)..' / 15',S.HopeRelic_Total(p)..' / 44',S.HopeMeta_Count(S.HopeMeta_Ach[i])..' / 24'}
   for n,r in ipairs(v.meters)do r.text(G..values[n]..C)end
   local effects={G..'已购基础属性合计'..C}
   for n=0,9,2 do effects[#effects+1]=S.HopeArchive_Effect(n,S.HopeArchive_Count(p,n))..'  '..S.HopeArchive_Effect(n+1,S.HopeArchive_Count(p,n+1))end
   v.effects.text(table.concat(effects,'|n'))
  elseif tab==1 then
   for n,r in pairs(v.base)do
    local count=S.HopeArchive_Count(p,n);local cost=S.HopeArchive_Price(S.HopeArchive_Ability(n))
    r.title.text(S.GetAbilityName(S.HopeArchive_Ability(n))..'  '..count..'/5')
    r.effect.text(MUT..S.HopeArchive_Effect(n,count)..C)
    r.buy.text(count>=5 and '已满级' or cost..'积分')
    r.buy.enable(count<5 and S.udg_Wj_jf[i+1]>=cost)
    for k,pip in ipairs(r.pips)do pip.alpha(k<=count and 255 or 35)end
   end
  elseif tab==2 then
   app.reset.show(true)
   for n,node in pairs(v.nodes)do
    local rank=level(i,n);local pre=S.HopeMeta_NodePrereq[n];local unlocked=pre<0 or level(i,pre)>0
    node.icon.alpha(unlocked and 255 or 75);node.select.show(n==v.selected)
    node.name.text((unlocked and W or MUT)..S.HopeMeta_NodeName[n]..C)
    node.rank.text((unlocked and G or MUT)..rank..'/3'..C)
    for k,pip in ipairs(node.pips)do pip.alpha(k<=rank and 255 or 40)end
    if v.links[n]then v.links[n].set(unlocked)end
    local upgrade=v.upgrades[n];upgrade.show(n==v.selected)
    local cost=S.HopeMeta_NodeCost[n]*(rank+1)
    upgrade.enable(unlocked and rank<3 and S.udg_Wj_jf[i+1]>=cost)
    upgrade.text(rank>=3 and '已修习至最高级' or not unlocked and '前置尚未修习' or '学习下一阶 · '..cost..'积分')
    if n==v.selected then
     v.detailIcon.texture(btn(talentIcons[n+1]));v.detailTitle.text(G..S.HopeMeta_NodeName[n]..C)
     v.detail.text('当前 '..rank..' / 3 级|n|n'..S.HopeMeta_NodeDesc[n]..'|n|n'..(pre<0 and '起始节点 · 无需前置' or (unlocked and T.green or T.red)..'前置：'..S.HopeMeta_NodeName[pre]..' 1级'..C)..'|n|n'..MUT..'永久成长 · 下一局生效'..C)
    end
   end
   v.treeStats.text('已学习 '..S.HopeMeta_Learned(i)..' / 15 项 · 各3级')
  elseif tab==3 then
   app.reset.show(true)
   for n,choose in pairs(v.keys)do
    local own=S.HopeMeta_Keystone[i]
    choose.text(own==n+1 and T.green..'已立誓约'..C or own>0 and '已选择其他誓约' or '立下誓约 · 80积分')
    choose.enable(own==0 and S.udg_Wj_jf[i+1]>=80)
   end
  elseif tab==4 then
   for n,node in pairs(v.abyss)do
    local has=S.HopeMeta_Has(S.HopeMeta_Abyss[i],n)
    node.icon.alpha(has and 255 or 110)
    node.state.text((has and T.green..'◆ ' or MUT..'◇ ')..S.HopeMeta_AbyssName[n]..C)
    local buy=v.abyssBuy[n];buy.show(n==v.abyssChoice);buy.text(has and '契约已缔结' or '缔结契约 · '..S.HopeMeta_AbyssCost[n]..'魂晶')
    buy.enable(not has and S.HopeMeta_Soul[i]>=S.HopeMeta_AbyssCost[n])
    if n==v.abyssChoice then v.abyssText.text(G..S.HopeMeta_AbyssName[n]..C..'|n|n'..S.HopeMeta_AbyssDesc[n]..'|n|n'..MUT..'永久生效；下一次出发载入。|n与原有成长共用伤害 / 防护预算。'..C)end
   end
  elseif tab==5 then
   for n,row in pairs(v.medals)do
    local has=S.HopeMeta_Has(S.HopeMeta_Ach[i],n);row.icon.alpha(has and 255 or 60)
    row.title.text((has and G or MUT)..S.HopeMeta_AchName[n]..C)
    row.status.text(has and T.green..'已达成'..C or MUT..'待完成 · +5'..C)
   end
  elseif tab==6 then
   local n=math.max(0,math.min(43,app.page));app.page=n
   for k,node in pairs(v.relics)do
    local has=S.HopeMeta_Has(S.HopeMeta_Relic[i*2+math.floor(k/22)],k%22)
    node.icon.alpha(has and 255 or 70);node.mark.text(k==n and G..'◆'..C or has and T.green..'•'..C or '')
   end
   local has=S.HopeMeta_Has(S.HopeMeta_Relic[i*2+math.floor(n/22)],n%22)
   v.relicIcon.texture(S.HopeRelic_IconPath(n));v.relicName.text(G..S.HopeRelic_Name(n)..C)
   local detail=(has and T.green..'已收藏' or MUT..'尚未发现')..C..'|n|n'..S.HopeRelic_Description(n,0)..'|n'..S.HopeRelic_Description(n,1)
   v.relicText.text(detail);app.body.text(S.HopeRelic_Name(n)..'|n'..detail)
  elseif tab==7 then
   app.page=math.min(5,app.page);app.previous.show(true);app.next.show(true)
   local names={}
   for n,r in pairs(v.jobs)do
    local job=app.page*8+n;local valid=job<43
    r.title.show(valid);r.detail.show(valid);r.bar.background.show(valid);r.bar.fill.show(valid)
    if valid then
     local xp=S.HopeMeta_Mastery[i*43+job];local rank=math.min(5,math.floor(xp/5))
     r.title.text(G..S.HopeJob_Name[job]..C..'  '..rank..'/5')
     r.detail.text(MUT..'守门人经验 '..xp..(rank>=5 and ' · 已精通' or ' · 距下一阶 '..(5-xp%5))..C)
     r.bar.set(xp,25);names[#names+1]=S.HopeJob_Name[job]
    end
   end
   app.body.text(table.concat(names,'|n'))
  elseif tab==8 then
   for n,row in pairs(v.gifts)do row.label.text((n==v.giftChoice and G..'› ' or W)..S.HopeGift_Name(n)..C..'  '..S.HopeGift_Chance(n)..'%  '..S.HopeGift_State(p,n))end
   v.giftDetail.text(G..S.HopeGift_Name(v.giftChoice)..C..'|n|n'..S.HopeGift_Effect(v.giftChoice))
   v.drawResult.text(S.HopeGift_LastResult[i]);v.draw.enable(S.udg_Wj_jf[i+1]>=5)
  end
  return true
 end
 return v
end
return M

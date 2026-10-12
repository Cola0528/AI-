local theme=require 'aitower.ui.theme'
local M={}
function M.new(S,ui)
    local view={}
    local G,C=theme.gold,theme.clear
    view.panel=ui.panel(nil,.125,.556,.550,.379)
    view.panel.show(false)
    view.title=ui.label(view.panel,.018,-.014,.420,.025,'',.015)
    local close=ui.textButton(view.panel,.492,-.012,.044,.024,'关闭')
    close.localAction(function()S.HopeQoL_Expanded=false end)
    view.resources=ui.label(view.panel,.018,-.051,.516,.025,'',.0095)
    ui.image(view.panel,.018,-.084,.514,.0006,'AITower\\gold.tga')
    ui.image(view.panel,.332,-.105,.0006,.169,'AITower\\gold.tga').alpha(90)
    view.stats=ui.label(view.panel,.018,-.103,.301,.180,'',.0095)
    view.growth=ui.label(view.panel,.349,-.103,.186,.173,'',.010)
    ui.image(view.panel,.018,-.292,.514,.0006,'AITower\\gold.tga')
    view.rules=ui.label(view.panel,.018,-.305,.516,.061,'',.008)
    view.rules.text('力量：每点+2生命，平砍浮动上限+1%。|n敏捷：每两点+1攻击，浮动下限+1%。|n智力：每点+1魔法，每三点+1%法伤。|n主属性每点另加0.5攻击；成长小数累积。|n魔力/专注成长每级增加成长值÷2个百分点技能/精确伤害。')
    function view.refresh()
        local i=S.GetPlayerId(S.GetLocalPlayer())+1
        local hero=i<=6 and S.udg_hero[i]or nil
        local visible=hero~=nil and S.HopeQoL_Expanded and S.HopeLayout_Mode()==1
        view.panel.show(visible)
        S.HopeLayout_Show(S.HopeQoL_Panel,false)
        if not visible then return end
        local armor=S.GetUnitState(hero,S.ConvertUnitState(32))
        local hi=120+S.GetHeroStr(hero,true)
        local lo=math.min(hi,90+math.floor(S.GetHeroAgi(hero,true)/2))
        local attack=S.GetUnitState(hero,S.ConvertUnitState(20))
        local reduction=require('aitower.game.armor').text(armor)
        view.title.text(G..S.GetUnitName(hero)..C..'  ·  Lv.'..S.GetHeroLevel(hero))
        view.resources.text(require('aitower.ui.attribute_text').primary(S,hero)..'   专注上限 '..S.HopeQoL_CompactNumber(S.udg_DEX[i]))
        view.stats.text(G..'战斗属性'..C..'|n攻击基值 '..math.floor(attack)..'  ·  平砍 '..math.floor(attack*lo*.01)..'—'..math.floor(attack*hi*.01)..'  ('..lo..'—'..hi..'%)|n护甲 '..math.floor(armor)..'  ·  '..reduction..'|n暴击 '..S.udg_Baoji_Lv[i]..'%  /  '..math.floor(100*S.udg_Baoji_Damage[i])..'%伤害|n法术 '..math.floor(100*S.udg_Fashang_Dm[i])..'%  ·  技能 '..math.floor(100*S.udg_Skill_Dm[i])..'%|n精确 '..math.floor(100*S.udg_jingque_Daji_jiacheng[i])..'%  ·  最终 '..math.floor(100*S.udg_Zuizhong_Dm[i])..'%|n每回合末护甲 +'..S.HopeQoL_Number(S.udg_Defend_HUIHE[i])..'  ·  防御额外护甲 +'..S.HopeQoL_Number(S.udg_Defend_fangyu[i]))
        view.growth.text(G..'每级成长 / 评级'..C..'|n|n力量  '..S.HopeQoL_GradedGrowth(S.udg_cz1Str_up[i],false)..'|n|n敏捷  '..S.HopeQoL_GradedGrowth(S.udg_cz2Agi_up[i],false)..'|n|n智力  '..S.HopeQoL_GradedGrowth(S.udg_cz3Int_up[i],false)..'|n|n生命  '..S.HopeQoL_GradedGrowth(S.udg_cz4Hp_up[i],true)..'|n|n魔力  '..S.HopeQoL_GradedGrowth(S.udg_cz5Mp_up[i],false)..'|n|n专注  '..S.HopeQoL_GradedGrowth(S.udg_cz6Dex_up[i],false))
    end
    return view
end
return M

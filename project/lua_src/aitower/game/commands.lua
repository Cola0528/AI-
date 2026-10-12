-- Fixed, synchronized command IDs. A player's local tab/selection is never
-- read to decide what transaction other peers execute.
local M={}
function M.new(S)
    local bus={}
    local actions={
        base=function(p,n)S.HopeArchive_BuyIndex(p,n)end,
        talent=function(p,n)S.HopeMeta_BuyTalent(p,n)end,
        keystone=function(p,n)S.HopeMeta_Key(p,n)end,
        abyss=function(p,n)S.HopeMeta_BuyAbyss(p,n)end,
        reset=function(p)S.HopeMeta_Reset(p)end,
        gift=function(p)S.HopeGift_Draw(p)end,
        market=function(p,n)S.HopeMarket_Trade(p,n)end,
        relic=function(p,n)S.HopeMeta_SeedTake(p,n)end,
        end_turn=function(p)
            if S.HopeTurn_CanEnd(p)then S.IssueImmediateOrder(S.udg_hero[S.GetPlayerId(p)+1],'stasistrap')end
        end,
        ready=function(p)S.HopeRoute_SetReady(p,true)end,
    }
    function bus.bind(frame,kind,index)
        assert(actions[kind],'unknown synchronized action')
        local action,payload=actions[kind],index
        S.DzFrameSetScriptByCode(frame,1,function()
            local p=S.DzGetTriggerUIEventPlayer()
            local id=S.GetPlayerId(p)
            if id>=0 and id<6 then action(p,payload)end
        end,true)
    end
    return bus
end
return M

local runtime=require 'aitower.core.runtime'
local M={}
function M.boot(backend)
    if M.state and M.state.__ready then return 'AI_LUA_READY'end
    if M.failure then return M.failure end -- never recreate a partially initialized world
    if M.starting then return 'AI_LUA_STARTING'end
    M.starting=true
    local S
    local ok,result=pcall(function()
        S=runtime.create(backend)
        for _,name in ipairs(require 'aitower.modules')do require(name)(S)end
        for _,name in ipairs({'CreateTrigger','TriggerAddAction','TimerStart','TriggerSleepAction','DzCreateFrame','DzCreateFrameByTagName','DzFrameSetScriptByCode','DzGetTriggerUIEventPlayer','DzAPI_Map_SaveServerValue'})do
            assert(type(S[name])=='function','required KK API missing: '..name)
        end
        M.state=S
        require('aitower.game.sync_diagnostics').install(S)
        require('aitower.game.rooms').install(S)
        require('aitower.game.minigames').install(S)
        local app=require('aitower.ui.app').new(S)
        S.__app=app
        app.install()
        S.main()
        require('aitower.game.scene').build(S)
        S.__syncDiagnostics.start()
        S.__ready=true
        M.state=S
        return 'AI_LUA_READY'
    end)
    M.starting=false
    if not ok then
        if S and S.__report then S.__report(result)end
        M.failure='AI_LUA_ERROR: '..tostring(result)
        return M.failure
    end
    return result
end
return M

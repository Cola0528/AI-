local M={}
local host=_G
function M.create(backend)
    if not backend then
        local ok,dzapi=pcall(require,'jass.dzapi')
        local japi=require('jass.japi')
        backend={common=require('jass.common'),japi=setmetatable({}, {__index=function(_,name)
            return japi[name] or (ok and dzapi[name]) or nil
        end}),runtime=require('jass.runtime')}
    end
    local common,japi=backend.common,backend.japi
    local runtime=backend.runtime or {}
    -- Full userdata (level 2) refs/unrefs Warcraft handles from Lua __gc.
    -- Local panels/selection allocate different Lua objects on each peer;
    -- their GC must never determine when synchronized handle IDs recycle.
    -- Lightuserdata keeps the native null -> nil convention without GC refs.
    -- Set once, before ANY generated module creates or reads native handles.
    runtime.handle_level=1
    runtime.sleep=true -- all original waits and coroutine callbacks must execute
    local errors={}
    local S={__backend=backend,__errors=errors,__ready=false}
    setmetatable(S,{__index=host})
    S._G=S
    local function report(message)
        local text=tostring(message)
        errors[#errors+1]=text
        if #errors>20 then table.remove(errors,1)end
        if backend.onError then backend.onError(text)end
        if common.DisplayTimedTextToPlayer and common.GetLocalPlayer then
            common.DisplayTimedTextToPlayer(common.GetLocalPlayer(),0,0,15,'|cffffb28fLua：'..text..'|r')
        end
    end
    S.__report=report
    runtime.error_handle=report
    function S._native_(name)
        return rawget(S,name) or japi[name] or common[name]
    end
    function S._array_(default)
        return setmetatable({}, {
            __index=function(_,index)
                assert(type(index)=='number' and index%1==0 and index>=0 and index<=8191,'invalid array index')
                return default
            end,
            __newindex=function(array,index,value)
                assert(type(index)=='number' and index%1==0 and index>=0 and index<=8191,'invalid array index')
                rawset(array,index,value)
            end,
        })
    end
    function S._loop_()
        local n=0
        return function()
            n=n+1
            assert(n<=1000000,'loop limit exceeded')
            return true
        end
    end
    function S._idiv_(a,b)
        assert(b~=0,'integer division by zero')
        local value=a/b
        return value<0 and math.ceil(value) or math.floor(value)
    end
    local native_execute=common.ExecuteFunc
    function S.ExecuteFunc(name)
        local action=rawget(S,name)
        if type(action)=='function' then
            action() -- exceptions/yields retain native trigger thread semantics
        elseif native_execute then
            native_execute(name)
        else
            error('unknown dispatched function: '..tostring(name))
        end
    end
    return S
end
return M

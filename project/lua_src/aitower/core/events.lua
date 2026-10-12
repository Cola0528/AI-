local M={}
function M.new()
    local listeners,next_id={},0
    local bus={}
    function bus.on(event,callback)
        next_id=next_id+1
        local record={id=next_id,callback=callback,active=true}
        local list=listeners[event] or {};listeners[event]=list;list[#list+1]=record
        return function()record.active=false end
    end
    function bus.emit(event,...)
        local list=listeners[event] or {}
        local count=#list -- deterministic numeric order; newly subscribed handlers wait
        for i=1,count do if list[i].active then list[i].callback(...)end end
    end
    return bus
end
return M

local M={}
function M.new(events)
    local values={}
    local store={}
    function store.get(key)return values[key]end
    function store.set(key,value)
        if values[key]==value then return false end
        local old=values[key];values[key]=value
        events.emit(key,value,old)
        return true
    end
    function store.watch(key,callback)return events.on(key,callback)end
    return store
end
return M

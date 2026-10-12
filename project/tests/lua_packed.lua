-- Run the actual packed entry in a fresh process; no source-module fallback.
package.path='lua_build/?.lua;./?.lua;'..package.path
local backend=require('tests.lua_engine').new()
backend.enableFullConsole()
local boot=require 'aitower'
assert(boot.boot(backend)=='AI_LUA_READY')
backend.step(5)
local app=boot.state.__app
assert(app.mounted and app.native.activated and app.native.preservedParents)
assert(not backend.consoleHidden and not app.native.full)
assert(#app.native.commands==12 and #app.native.items==6)
assert(#backend.errors==0,table.concat(backend.errors,'\n'))
assert(boot.boot(backend)=='AI_LUA_READY')
local report='1.0.16 packed entry: startup, delayed mount, original native parents, 18 native controls, idempotent boot passed.\nEngine model only; not Warcraft/KK runtime validation.\n'
for _,path in ipairs({'audit/lua-packed-entry.txt','audit/lua-packed-smoke.txt'})do local f=assert(io.open(path,'wb'));f:write(report);f:close()end
print(report)

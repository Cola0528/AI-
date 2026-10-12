package.path='lua_src/?.lua;lua_build/?.lua;./?.lua;'..package.path
local b=require('tests.lua_engine').new()
local boot=require 'aitower.bootstrap'
local result=boot.boot(b)
print(result)
assert(result=='AI_LUA_READY',result)
b.step(1)
assert(boot.state.__app.mounted,'app did not mount')
print('world units',b.calls.CreateUnit,'frames',boot.state.__frameSerial,'timers',#b.timers)

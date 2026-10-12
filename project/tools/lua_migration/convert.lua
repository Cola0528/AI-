-- Build-time AST conversion using the pinned MIT-licensed jass2lua parser.
-- No map/reference code is executed by this tool.
local root='tools/vendor/jass2lua'
package.path=root..'/src/?.lua;'..root..'/src/?/init.lua;'..package.path
package.cpath=root..'/bin/?.dll;'..package.cpath
local function read(path)
 local f=assert(io.open(path,'rb'));local s=f:read('a');f:close();return s
end
local function write(path,s)
 local f=assert(io.open(path,'wb'));f:write(s);f:close()
end
package.preload.lang=function()
 local values={}
 local key
 for line in (read(root..'/locale/en-US/parser.lng')..'\n'):gmatch('([^\r\n]*)[\r\n]+') do
  local name=line:match('^%[(.-)%]$')
  if name then key=name elseif key then values[key]=(values[key] or '')..line end
 end
 return {parser=setmetatable(values,{__index=function(_,k)return k end})}
end
local parser=require 'parser'
local text=read(root..'/src/converter.lua')
-- Lua floor division differs from JASS truncation for negative integers.
local before="return ('%s // %s'):format(get_exp(exp[1], '//', 1), get_exp(exp[2], '//', 2))"
local first,last=assert(text:find(before,1,true))
text=text:sub(1,first-1).."return ('_idiv_(%s, %s)'):format(get_exp(exp[1]), get_exp(exp[2]))"..text:sub(last+1)
assert(not text:find("return ('%s // %s')",1,true),'integer division patch failed')
local converter=assert(load(text,'@pinned-converter-with-jass-division','t',_ENV))()
local option={}
local function convert(input,output)
 local source=read(input):gsub('\r\n','\n')
 local ast,comments,errors=parser.parser(source,input,option)
 for _,group in ipairs(errors)do
  if type(group)=='table' and #group>0 then
   for _,err in ipairs(group)do print(err.message or err.text or tostring(err))end
   error('JASS parser rejected '..input)
  end
 end
 for _,global in ipairs(ast.globals)do
  if not global.array and not global[1] then
   if global.type=='integer' then global[1]={type='integer',vtype='integer',value=0}
   elseif global.type=='real' then global[1]={type='real',vtype='real',value='0.0'}
   elseif global.type=='boolean' then global[1]={type='boolean',vtype='boolean',value=false}end
  end
 end
 write(output,converter(ast,comments,option.state):gsub('\r\n','\n'))
 print('Converted '..input..': '..#ast.functions..' functions, '..#ast.globals..' globals')
end
convert(arg[1],arg[4])
convert(arg[2],arg[5])
convert(arg[3],arg[6])

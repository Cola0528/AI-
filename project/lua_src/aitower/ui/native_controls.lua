-- The engine owns the whole lower console (y <= .17), not just its buttons.
-- Do not relocate or hide any native element. Custom controls live on the left;
-- the lower centre and right belong to the console and its native tooltips.
local M={}
function M.install(S,ui)
 local api=S.__backend.japi
 local result={available=false,commands={},items={},full=false,activated=false,preservedParents=true,engineLayout=true,reservedTop=.170}
 function result.tooltipVisible()
  if not api.DzFrameGetTooltip or not api.DzFrameIsVisible then return false end
  local ok,id=pcall(api.DzFrameGetTooltip)
  if not ok or not id or id==0 then return false end
  local success,value=pcall(api.DzFrameIsVisible,id)
  return success and (value==true or value==1)
 end
 if api.DzFrameGetCommandBarButton and api.DzFrameGetItemBarButton then
  for row=0,2 do for col=0,3 do
   local id=api.DzFrameGetCommandBarButton(row,col)
   if not id or id==0 then return result end
   result.commands[#result.commands+1]=id
  end end
  for n=0,5 do
   local id=api.DzFrameGetItemBarButton(n)
   if not id or id==0 then return result end
   result.items[#result.items+1]=id
  end
  result.available=true
 end
 function result.activate()result.activated=true end
 function result.commandContext(panel)result.context=panel end
 return result
end
return M

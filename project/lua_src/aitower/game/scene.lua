-- Shared, visual-only scenery. No new units, blockers, damage or terrain
-- changes: the original formation and all spell distances remain intact.
local M={}
function M.build(S)
 if S.__arenaScenery then return end
 local rect=S.gg_rct______________000
 if not rect then return end
 local effects={};S.__arenaScenery=effects
 local left,right=S.GetRectMinX(rect)+80,S.GetRectMaxX(rect)-80
 local bottom,top=S.GetRectMinY(rect)+80,S.GetRectMaxY(rect)-80
 for _,point in ipairs({{left,bottom},{right,bottom},{left,top},{right,top},{left,(top+bottom)/2},{right,(top+bottom)/2}})do
  effects[#effects+1]=S.AddSpecialEffect('Doodads\\LordaeronSummer\\Props\\Brazier\\Brazier.mdx',point[1],point[2])
 end
end
return M

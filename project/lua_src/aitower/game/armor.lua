-- This map's war3mapMisc.txt sets DefenseArmor=0.04. Display only: damage
-- remains computed by Warcraft. Negative armour uses its exponential curve.
local M={}
function M.reduction(armor)
 if armor>=0 then return .04*armor/(1+.04*armor)end
 return .96^(-armor)-1
end
function M.text(armor)
 local reduction=M.reduction(armor)
 return '护甲 '..string.format('%g',math.floor(armor*10+.5)/10)..'  '..(reduction>=0 and '物理减伤 'or '物理易伤 ')..string.format('%.1f',math.abs(reduction)*100)..'%'
end
return M

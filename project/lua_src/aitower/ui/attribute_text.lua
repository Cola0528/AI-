local M={}
M.white='|cffe8e3d7';M.green='|cff80e880';M.red='|cffff927a'
function M.value(name,base,total)
 local bonus=total-base
 local text=name..' '..M.white..tostring(base)..'|r'
 if bonus~=0 then text=text..' '..(bonus>0 and M.green..'+' or M.red)..tostring(bonus)..'|r'end
 return text
end
function M.primary(S,u,separator)
 local rows={}
 for _,pair in ipairs({{'力量','GetHeroStr'},{'敏捷','GetHeroAgi'},{'智力','GetHeroInt'}})do
  local getter=S[pair[2]];rows[#rows+1]=M.value(pair[1],getter(u,false),getter(u,true))
 end
 return table.concat(rows,separator or '   ')
end
return M

-- UTF-8 safe text pages. Strip Warcraft colour codes before wrapping so an
-- arbitrary page boundary cannot leave an unterminated colour escape.
local M={}
function M.pages(text,columns,rows)
 text=(text or ''):gsub('|c%x%x%x%x%x%x%x%x',''):gsub('|r',''):gsub('|n','\n')
 local lines,line,width={},'',0
 for _,code in utf8.codes(text)do
  local c=utf8.char(code);local cell=code<128 and .55 or 1
  if c=='\n'then lines[#lines+1]=line;line='';width=0
  else
   if width+cell>columns then lines[#lines+1]=line;line='';width=0 end
   line=line..c;width=width+cell
  end
 end
 lines[#lines+1]=line
 local pages={}
 for n=1,#lines,rows do
  local chunk={};for j=n,math.min(#lines,n+rows-1)do chunk[#chunk+1]=lines[j]end
  pages[#pages+1]=table.concat(chunk,'|n')
 end
 return pages
end
return M

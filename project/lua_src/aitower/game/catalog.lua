-- Observe real engine stock. This never creates items, spends gold or replaces
-- the engine's sale/pickup events. Metadata comes from this map's live SLK.
local M={}
function M.install(S)
 local catalog={stock={},revision=0}
 local slk=S.__backend.slk
 if not slk then local ok,value=pcall(require,'jass.slk');if ok then slk=value end end
 local function raw(id)
  return string.char((id>>24)&255,(id>>16)&255,(id>>8)&255,id&255)
 end
 function catalog.item(id)
  local row=slk and slk.item and slk.item[raw(id)] or {}
  local function field(name)return row[name] or row[name:lower()]end
  local name=field('Name') or S.GetObjectName(id)
  if not name or name==''then name=raw(id)end
  local description=field('Ubertip') or field('Tip') or '悬停下方商品图标查看游戏内完整说明。'
  return {id=id,name=name,description=description,icon=field('Art'),gold=tonumber(field('goldcost')),wood=tonumber(field('lumbercost'))}
 end
 local add,remove=S.AddItemToStock,S.RemoveItemFromStock
 S.AddItemToStock=function(u,id,current,maximum)
  add(u,id,current,maximum)
  local key=S.GetHandleId(u);catalog.stock[key]=catalog.stock[key] or {}
  catalog.stock[key][id]=true;catalog.revision=catalog.revision+1
 end
 S.RemoveItemFromStock=function(u,id)
  remove(u,id)
  local entries=catalog.stock[S.GetHandleId(u)]
  if entries then entries[id]=nil end
  catalog.revision=catalog.revision+1
 end
 function catalog.list(u)
  local out={};for id in pairs(catalog.stock[S.GetHandleId(u)]or {})do out[#out+1]=id end
  table.sort(out);return out
 end
 S.__catalog=catalog
 return catalog
end
return M

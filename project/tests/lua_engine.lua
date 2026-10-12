-- Deterministic engine MODEL. Executes the delivered Lua; it is not Warcraft.
local M={}
function M.new()
 local b={common={},japi={},runtime={},frames={},timers={},threads={},calls={},cloud={},writes={},players={},errors={},units={},now=0,localId=0}
 local c,j=b.common,b.japi
 local serial=100
 local function handle(kind)
  serial=serial+1
  return {id=serial,kind=kind}
 end
 local function count(name)b.calls[name]=(b.calls[name]or 0)+1 end
 for name,ret in pairs(require('tests.lua_api'))do
  local fn=function(...)
   count(name)
   if name:match('^Convert')then return (...)end
   if ret=='nothing'then return end
   if ret=='string'then return ''end
   if ret=='integer'or ret=='real'then return 0 end
   if ret=='boolean'then return false end
   if name:match('^Create')or name:match('^Init')or name:match('^TriggerRegister')then return handle(ret)end
  end
  if name:match('^Dz')or name:match('^EX')or name:match('^RequestExtra')then j[name]=fn else c[name]=fn end
 end
 for i=0,15 do b.players[i]={id=i,name='玩家'..i,states={[1]=1000,[2]=20},active=i<6}end
 c.Player=function(i)return b.players[i]end
 c.GetPlayerId=function(p)return p and p.id or -1 end
 c.GetLocalPlayer=function()return b.players[b.localId]end
 c.GetPlayerName=function(p)return p.name end
 c.GetPlayerSlotState=function(p)return p.active and 1 or 0 end
 c.GetPlayerController=function()return 0 end
 c.GetPlayerState=function(p,k)return p.states[k]or 0 end
 c.SetPlayerState=function(p,k,v)p.states[k]=v end
 c.GetHandleId=function(h)return h and h.id or 0 end
 c.GetOwningPlayer=function(u)return u and u.owner or b.players[15]end
 c.GetUnitTypeId=function(u)return u and u.type or 0 end
 c.RemoveUnit=function(u)if u then u.type=0;u.removed=true end end
 local selections={}
 c.ClearSelection=function()selections[b.localId]={}end
 c.SelectUnit=function(u,on)selections[b.localId]=selections[b.localId]or {};selections[b.localId][u]=on or nil end
 c.IsUnitSelected=function(u,p)return u~=nil and selections[p.id]~=nil and selections[p.id][u]==true end
 c.GetUnitState=function(u,k)return u and u.states[k]or 0 end
 c.SetUnitState=function(u,k,v)if u then u.states[k]=v end end
 c.GetWidgetLife=function(u)return u and u.states[0]or 0 end
 c.SetWidgetLife=function(u,v)if u then u.states[0]=v end end
 c.GetUnitName=function(u)return u and u.name or ''end
 c.GetHeroLevel=function(u)return u and u.level or 0 end
 for _,a in ipairs({'Str','Agi','Int'})do c['GetHero'..a]=function(u,include)return (u[a]or 0)+(include and (u['bonus'..a]or 0)or 0)end;c['SetHero'..a]=function(u,v)u[a]=v end end
 c.GetUnitX=function(u)return u and u.x or 0 end;c.GetUnitY=function(u)return u and u.y or 0 end
 c.SetUnitX=function(u,v)u.x=v end;c.SetUnitY=function(u,v)u.y=v end
 c.GetUnitAbilityLevel=function(u,k)return u and u.abilities[k]or 0 end
 c.SetUnitAbilityLevel=function(u,k,v)if not u or not u.abilities[k]then return 0 end;u.abilities[k]=v;return v end
 c.GetHeroSkillPoints=function(u)return u and u.skillPoints or 0 end
 c.UnitModifySkillPoints=function(u,delta)if not u or (u.skillPoints or 0)+delta<0 then return false end;u.skillPoints=(u.skillPoints or 0)+delta;return true end
 c.UnitAddAbility=function(u,k)u.abilities[k]=1;return true end
 c.UnitRemoveAbility=function(u,k)u.abilities[k]=nil;return true end
 c.GetAbilityName=function(id)return '属性'..id end
 c.CreateUnit=function(p,id,x,y)
  count('CreateUnit');local u=handle('unit');u.type=id;u.owner=p;u.x=x;u.y=y;u.name='民兵';u.level=1
  u.states={[0]=1000,[1]=1000,[2]=40,[3]=50,[18]=50,[20]=100,[32]=10};u.Str=100;u.Agi=100;u.Int=100;u.abilities={};u.items={}
  b.units[#b.units+1]=u;return u
 end
 c.CreateUnitAtLoc=function(p,id,loc,facing)return c.CreateUnit(p,id,loc and loc.x or 0,loc and loc.y or 0,facing)end
 c.CreateGroup=function()local h=handle('group');h.units={};return h end
 c.DialogCreate=function()local d=handle('dialog');d.buttons={};return d end
 c.DialogAddButton=function(d,text)local button=handle('button');button.text=text;d.buttons[#d.buttons+1]=button;return button end
 c.DialogClear=function(d)d.buttons={}end
 c.GroupAddUnit=function(g,u)g.units[#g.units+1]=u end
 c.GroupClear=function(g)g.units={}end
 c.FirstOfGroup=function(g)return g.units[1]end
 c.GroupRemoveUnit=function(g,u)for i,v in ipairs(g.units)do if v==u then table.remove(g.units,i);break end end end
 c.GroupEnumUnitsOfPlayer=function(g,p,filter)
  g.units={}
  for _,u in ipairs(b.units)do if not u.removed and u.owner==p then
   b.filterUnit=u;if not filter or filter()then g.units[#g.units+1]=u end
  end end
 end
 c.GetFilterUnit=function()return b.filterUnit end
 c.ForGroup=function(g,fn)for _,u in ipairs(g.units)do b.enumUnit=u;fn()end end
 c.GetEnumUnit=function()return b.enumUnit end
 c.IsUnitInGroup=function(u,g)for _,v in ipairs(g.units)do if v==u then return true end end;return false end
 c.Location=function(x,y)local h=handle('location');h.x=x;h.y=y;return h end
 c.GetLocationX=function(h)return h.x end;c.GetLocationY=function(h)return h.y end
 c.Rect=function(a,d,e,f)local h=handle('rect');h.minx=a;h.miny=d;h.maxx=e;h.maxy=f;return h end
 c.GetRectMinX=function(r)return r.minx end;c.GetRectMinY=function(r)return r.miny end
 c.GetRectMaxX=function(r)return r.maxx end;c.GetRectMaxY=function(r)return r.maxy end
 c.GetRectCenterX=function(r)return (r.minx+r.maxx)/2 end;c.GetRectCenterY=function(r)return (r.miny+r.maxy)/2 end
 c.GetWorldBounds=function()return c.Rect(-8192,-8192,8192,8192)end
 c.InitHashtable=function()return handle('hashtable')end
 for _,kind in ipairs({'Integer','Real','Boolean','Str','UnitHandle','PlayerHandle','TimerHandle','TriggerHandle','GroupHandle','LocationHandle','EffectHandle','ItemHandle','ButtonHandle'})do
  c['Save'..kind]=function(t,h,k,v)assert(t,'nil hashtable');t[h]=t[h]or {};t[h][k]=v;return true end
  c['Load'..kind]=function(t,h,k)local v=t and t[h]and t[h][k];if v~=nil then return v end;if kind=='Integer'or kind=='Real'then return 0 elseif kind=='Boolean'then return false elseif kind=='Str'then return ''end end
 end
 c.HaveSavedInteger=function(t,h,k)return t and t[h]and t[h][k]~=nil or false end
 c.HaveSavedBoolean=c.HaveSavedInteger;c.HaveSavedHandle=c.HaveSavedInteger
 c.FlushChildHashtable=function(t,h)t[h]=nil end
 c.FlushParentHashtable=function(t)for k in pairs(t)do if type(k)=='number'then t[k]=nil end end end
 c.I2S=function(n)return tostring(math.modf(n))end
 c.R2S=tostring;c.R2SW=function(v,_,prec)return string.format('%.'..prec..'f',v)end
 c.I2R=function(n)return n end;c.R2I=function(n)return math.modf(n)end
 c.S2I=function(s)return math.modf(tonumber(s)or 0)end;c.S2R=function(s)return tonumber(s)or 0 end
 c.StringLength=function(s)return #(s or '')end
 c.SubString=function(s,a,z)return (s or ''):sub(a+1,z)end
 c.StringCase=function(s,upper)return upper and s:upper()or s:lower()end
 c.StringHash=function(s)local h=0;for n=1,#s do h=(h*31+s:byte(n))%2147483647 end;return h end
 c.Pow=function(a,z)return a^z end;c.SquareRoot=math.sqrt;c.Sin=math.sin;c.Cos=math.cos;c.Atan2=math.atan
 b.seed=9
 c.GetRandomInt=function(a,z)b.seed=(b.seed*1664525+1013904223)%4294967296;return a+b.seed%(z-a+1)end
 c.GetRandomReal=function(a,z)return a+(z-a)*c.GetRandomInt(0,1000000)/1000000 end
 c.CreateTimer=function()local t=handle('timer');b.timers[#b.timers+1]=t;return t end
 c.TimerStart=function(t,d,repeat_,f)assert(f==nil or type(f)=='function','invalid timer callback');t.fn=f or function()end;t.d=d;t.repeat_=repeat_;t.due=b.now+d;t.active=true end
 c.DestroyTimer=function(t)if t then t.active=false end end;c.PauseTimer=c.DestroyTimer
 c.GetExpiredTimer=function()return b.expired end;c.TimerGetElapsed=function()return b.now end
 c.TimerGetRemaining=function(t)return t and t.active and math.max(0,t.due-b.now)or 0 end
 c.CreateTrigger=function()local t=handle('trigger');t.actions={};t.conditions={};t.enabled=true;return t end
 c.TriggerAddAction=function(t,f)assert(type(f)=='function','trigger action missing');t.actions[#t.actions+1]=f;return handle('triggeraction')end
 c.Condition=function(f)return f end;c.Filter=c.Condition
 c.TriggerAddCondition=function(t,f)t.conditions[#t.conditions+1]=f;return handle('condition')end
 c.TriggerEvaluate=function(t)for _,f in ipairs(t.conditions)do if not f()then return false end end;return true end
 c.TriggerExecute=function(t)if t.enabled then for _,f in ipairs(t.actions)do b.run(f)end end end
 c.DisableTrigger=function(t)t.enabled=false end;c.EnableTrigger=function(t)t.enabled=true end
 c.TriggerSleepAction=function(d)count('sleep');if coroutine.isyieldable()then coroutine.yield(d)end end
 c.GetTriggerPlayer=function()return b.eventPlayer or b.players[0]end
 c.GetTriggerUnit=function()return b.eventUnit end
 c.GetTriggeringTrigger=function()return b.eventTrigger end
 c.GetSpellAbilityId=function()return b.eventAbility or 0 end
 c.GetLearnedSkill=function()return b.eventAbility or 0 end
 c.GetSellingUnit=function()return b.eventSeller end
 c.GetSoldUnit=function()return b.eventSold end
 c.DisplayTimedTextToPlayer=function(_,_,_,_,text)b.lastMessage=text end;c.DisplayTextToPlayer=function(_,_,_,text)b.lastMessage=text end
 c.IssueImmediateOrder=function(u,order)b.lastOrder={u,order};return true end
 c.UnitItemInSlot=function(u,n)return u and u.items[n]end
 c.GetItemTypeId=function(it)return it and it.type or 0 end
 c.CreateItem=function(id,x,y)local it=handle('item');it.type=id;it.x=x;it.y=y;return it end
 c.UnitAddItem=function(u,it)for n=0,5 do if not u.items[n]then u.items[n]=it;it.holder=u;return true end end;return false end
 c.UnitRemoveItem=function(u,it)for n=0,5 do if u.items[n]==it then u.items[n]=nil;it.holder=nil;return end end end
 c.IsItemOwned=function(it)return it.holder~=nil end
 c.SetItemPosition=function(it,x,y)it.x=x;it.y=y end
 c.GetItemName=function(it)return '物品'..it.type end
 j.RequestExtraBooleanData=function(n)return n==10 or n==74 end
 j.DzAPI_Map_GetServerValueErrorCode=function(p)return p.loadError or 0 end
 j.DzAPI_Map_GetServerValue=function(p,k)return b.cloud[p.id..'/'..k]or ''end
 j.DzAPI_Map_SaveServerValue=function(p,k,v)b.cloud[p.id..'/'..k]=v;b.writes[#b.writes+1]={p.id,k,v};return true end
 local names={}
 local function frame(kind,name,parent,context)
  local key=name..':'..(context or 0)
  if name:match('^AI')then assert(not names[key],'duplicate frame '..key)end
  serial=serial+1;local f={id=serial,kind=kind,name=name,parent=parent,context=context,shown=true,scripts={}}
  b.frames[serial]=f;names[key]=serial;return serial
 end
 j.DzGetGameUI=function()return 1 end
 j.DzCreateFrameByTagName=function(kind,name,parent,_,context)return frame(kind,name,parent,context)end
 j.DzCreateFrame=function(name,parent,context)local id=frame('BUTTON',name,parent,context);frame('TEXT','AIButtonText',id,context);return id end
 j.DzFrameFindByName=function(name,context)return names[name..':'..context]or 0 end
 j.DzFrameSetPoint=function(id,_,parent,_,x,y)local f=assert(b.frames[id],id);f.parent=parent;f.x=x;f.y=y;f.absolute=false end
 j.DzFrameSetAbsolutePoint=function(id,_,x,y)local f=assert(b.frames[id],id);f.x=x;f.y=y;f.absolute=true end
 j.DzFrameSetSize=function(id,w,h)local f=assert(b.frames[id],id);f.w=w;f.h=h end
 j.DzFrameSetText=function(id,s)local f=assert(b.frames[id],id);f.text=s end
 j.DzFrameGetText=function(id)return assert(b.frames[id],id).text or ''end
 j.DzFrameShow=function(id,v)if id~=0 then local f=assert(b.frames[id],id);f.shown=v;f.showWrites=(f.showWrites or 0)+1 end end
 j.DzFrameIsVisible=function(id)
  local f=assert(b.frames[id],id)
  return f.shown and (not b.frames[f.parent] or j.DzFrameIsVisible(f.parent))
 end
 j.DzFrameSetFont=function(id,path,size)assert(b.frames[id],id).font=size end
 j.DzFrameSetScriptByCode=function(id,event,fn,sync)assert(type(fn)=='function');assert(b.frames[id],id).scripts[event]={fn=fn,sync=sync}end
 j.DzFrameSetTexture=function(id,path)assert(b.frames[id],id).texture=path end
 j.DzFrameSetParent=function(id,parent)local f=assert(b.frames[id],id);assert(f.kind~='NATIVE' or parent==1,'Native control cannot be reparented into ordinary FRAME');f.parent=parent end
 j.DzFrameSetAllPoints=function(id,parent)assert(b.frames[id],id).allPoints=parent;return true end
 j.DzGetTriggerUIEventPlayer=function()return b.eventPlayer or b.players[0]end
 j.DzGetTriggerUIEventFrame=function()return b.eventFrame end
 j.DzFrameGetCommandBarButton=function(row,col)
  local key='Command'..row..col
  if names[key..':0']then return names[key..':0']end
  local id=frame('NATIVE',key,1,0);local f=b.frames[id]
  f.x=.644+col*.040;f.y=.145-row*.043;f.w=.036;f.h=.036;f.absolute=true;f.alpha=255
  return id
 end
 j.DzFrameGetItemBarButton=function(n)
  local key='Item'..n;if names[key..':0']then return names[key..':0']end
  local id=frame('NATIVE',key,1,0);local f=b.frames[id]
  f.x=.518+(n%2)*.038;f.y=.142-math.floor(n/2)*.042;f.w=.032;f.h=.032;f.absolute=true;f.alpha=255
  return id
 end
 j.DzFrameSetEnable=function(id,v)assert(b.frames[id],id).enabled=v end
 j.DzFrameSetAlpha=function(id,v)assert(b.frames[id],id).alpha=v end
 function b.enableFullConsole()
  for _,name in ipairs({'DzFrameGetMinimap','DzFrameGetMinimapButton','DzFrameGetUpperButtonBarButton',
   'DzFrameGetChatMessage','DzFrameGetUnitMessage','DzFrameGetTooltip','DzFrameGetHeroBarButton','DzFrameGetHeroHPBar','DzFrameGetHeroManaBar'})do
   j[name]=function(index)
    local key=name..(index or '');local id=names[key..':0']
    if not id then id=frame('NATIVE',key,1,0);if name=='DzFrameGetTooltip'then b.frames[id].shown=false end end
    return id
   end
  end
  j.DzFrameHideInterface=function()b.consoleHidden=(b.consoleHidden or 0)+1 end
  j.DzFrameEditBlackBorders=function(upper,lower)b.borders={upper,lower}end
 end
 b.onError=function(e)b.errors[#b.errors+1]=e end
 function b.run(fn)
  local co=coroutine.create(fn);local ok,value=coroutine.resume(co)
  assert(ok,debug.traceback(co,tostring(value)))
  if coroutine.status(co)=='suspended'then b.threads[#b.threads+1]={co=co,due=b.now+(tonumber(value)or 0),expired=b.expired}end
  return coroutine.status(co),value
 end
 function b.step(until_)
  local steps=0
  while true do
   local chosen
   for _,t in ipairs(b.timers)do if t.active and t.due<=until_ and(not chosen or t.due<chosen.due)then chosen=t end end
   local thread,index
   for i,t in ipairs(b.threads)do if t.due<=until_ and(not thread or t.due<thread.due)then thread=t;index=i end end
   if thread and(not chosen or thread.due<chosen.due)then
    table.remove(b.threads,index);b.now=thread.due;b.expired=thread.expired
    local ok,value=coroutine.resume(thread.co);assert(ok,value)
    if coroutine.status(thread.co)=='suspended'then thread.due=b.now+(tonumber(value)or 0);b.threads[#b.threads+1]=thread end
    goto continue
   end
   if not chosen then break end
   steps=steps+1;assert(steps<20000,'timer runaway')
   b.now=chosen.due;b.expired=chosen
   if chosen.repeat_ then chosen.due=b.now+chosen.d else chosen.active=false end
   b.run(chosen.fn)
   ::continue::
  end
  b.now=until_
 end
 return b
end
return M

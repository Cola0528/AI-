local M={}
function M.new(S)
    if not S.__uiResources then
        S.DzLoadToc('AITower\\ui.toc')
        S.__uiResources=true
    end
    local backend=S.__backend.japi
    local root=S.DzGetGameUI()
    local widgets={}
    local ui={widgets=widgets,root=root}
    local function id(name)
        S.__frameSerial=(S.__frameSerial or 0)+1
        local serial=S.__frameSerial
        return 'AI'..name..serial,serial
    end
    local function widget(frame,parent,x,y,w,h)
        assert(frame and frame~=0,'frame creation failed')
        local node={id=frame,parent=parent,x=x,y=y,w=w,h=h,visible=true}
        widgets[#widgets+1]=node
        function node.place(nx,ny,nw,nh)
            if node.placed and node.x==nx and node.y==ny and node.w==nw and node.h==nh then return end
            node.placed=true
            node.x,node.y,node.w,node.h=nx,ny,nw,nh
            S.DzFrameClearAllPoints(frame)
            if not parent then S.DzFrameSetAbsolutePoint(frame,0,nx,ny)
            else S.DzFrameSetPoint(frame,0,parent.id,0,nx,ny)end
            S.DzFrameSetSize(frame,nw,nh)
        end
        function node.show(show)
            if node.visible~=show then S.DzFrameShow(frame,show);node.visible=show end
        end
        function node.text(text)
            if node.value~=text then S.DzFrameSetText(frame,text);node.value=text end
        end
        function node.font(size)
            S.DzFrameSetFont(frame,'Fonts\\ZiTi.ttf',size,0);node.fontSize=size
        end
        function node.alpha(alpha)
            if node.lastAlpha~=alpha then S.DzFrameSetAlpha(frame,alpha);node.lastAlpha=alpha end
        end
        function node.localAction(callback)
            S.DzFrameSetScriptByCode(frame,1,callback,false)
        end
        function node.hover(callback)
            S.DzFrameSetScriptByCode(frame,2,callback,false)
        end
        function node.enable(enabled)
            if node.enabled~=enabled and backend.DzFrameSetEnable then backend.DzFrameSetEnable(frame,enabled);node.enabled=enabled end
        end
        function node.texture(path)
            if node.texturePath~=path then S.DzFrameSetTexture(frame,path,0);node.texturePath=path end
        end
        node.place(x,y,w,h)
        return node
    end
    function ui.frame(parent,x,y,w,h)
        local name=id('Frame')
        return widget(S.DzCreateFrameByTagName('FRAME',name,parent and parent.id or root,'AIPassFrame',0),parent,x,y,w,h)
    end
    function ui.image(parent,x,y,w,h,path)
        local name=id('Image')
        local node=widget(S.DzCreateFrameByTagName('BACKDROP',name,parent and parent.id or root,'AIPassBackdrop',0),parent,x,y,w,h)
        node.texture(path or 'Textures\\Black32.blp')
        return node
    end
    function ui.panel(parent,x,y,w,h)
        local node=ui.frame(parent,x,y,w,h)
        node.background=ui.image(node,0,0,w,h,'AITower\\panel.tga')
        S.DzFrameSetAllPoints(node.background.id,node.id)
        ui.outline(node)
        return node
    end
    function ui.outline(node)
        for _,edge in ipairs({{0,2,true},{6,8,true},{0,6,false},{2,8,false}})do
            local line=ui.image(node,0,0,edge[3] and node.w or .00045,edge[3] and .00045 or node.h,'AITower\\gold.tga')
            line.alpha(100)
            S.DzFrameClearAllPoints(line.id)
            S.DzFrameSetPoint(line.id,edge[1],node.id,edge[1],0,0)
            S.DzFrameSetPoint(line.id,edge[2],node.id,edge[2],0,0)
        end
    end
    function ui.label(parent,x,y,w,h,text,size)
        local name=id('Text')
        local node=widget(S.DzCreateFrameByTagName('TEXT',name,parent and parent.id or root,'AIPassText',0),parent,x,y,w,h)
        node.font(size or .009);node.text(text or '')
        return node
    end
    function ui.button(parent,x,y,w,h,text,template)
        local name,context=id('Button')
        local node=widget(S.DzCreateFrame(template or 'AIButton',parent and parent.id or root,context),parent,x,y,w,h)
        node.text(text or '')
        node.caption=S.DzFrameFindByName('AIButtonText',context)
        if node.caption and node.caption~=0 then S.DzFrameSetFont(node.caption,'Fonts\\ZiTi.ttf',.009,0)end
        return node
    end
    function ui.textButton(parent,x,y,w,h,text)
        return ui.button(parent,x,y,w,h,text,'AITextButton')
    end
    function ui.iconButton(parent,x,y,size,path)
        local node=ui.button(parent,x,y,size,size,'','AIIconButton')
        node.icon=ui.image(node,.002,-.002,size-.004,size-.004,path)
        return node
    end
    -- Orthogonal links stay sharp at any resolution and need no rotated API.
    function ui.link(parent,x1,y1,x2,y2)
        local middle=(y1+y2)*.5
        local texture='AITower\\track.tga'
        local lines={ui.image(parent,x1,y1,.0012,math.max(.001,y1-middle),texture),
            ui.image(parent,math.min(x1,x2),middle,math.max(.001,math.abs(x2-x1)),.0012,texture),
            ui.image(parent,x2,middle,.0012,math.max(.001,middle-y2),texture)}
        return {set=function(learned)
            for _,line in ipairs(lines)do line.texture(learned and 'AITower\\gold.tga' or 'AITower\\mana.tga');line.alpha(learned and 220 or 75)end
        end,lines=lines}
    end
    function ui.card(parent,x,y,w,h,icon)
        local card=ui.button(parent,x,y,w,h,'')
        local compact=h<.065
        card.icon=ui.image(card,.006,-.004,compact and .014 or .019,compact and .014 or .019,icon)
        card.title=ui.label(card,compact and .024 or .031,-.005,w-(compact and .031 or .038),.014,'',.0085)
        card.body=ui.label(card,.007,compact and -.019 or -.026,w-.014,h-(compact and .023 or .030),'',compact and .0076 or .008)
        return card
    end
    function ui.bar(parent,x,y,w,h,texture)
        local background=ui.image(parent,x,y,w,h,'AITower\\track.tga')
        local fill=ui.image(parent,x,y,w,h,texture)
        local bar={background=background,fill=fill,width=w}
        function bar.set(current,maximum)
            local ratio=maximum>0 and math.max(0,math.min(1,current/maximum)) or 0
            fill.place(x,y,math.max(.0001,w*ratio),h)
        end
        return bar
    end
    return ui
end
return M

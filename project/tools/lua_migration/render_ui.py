"""Render recorded Lua frame coordinates for layout inspection, NOT game captures."""
from pathlib import Path
import json,re,math
from PIL import Image,ImageDraw,ImageFont
ROOT=Path(__file__).resolve().parents[2]
data=json.loads((ROOT/'audit/lua-ui-model.json').read_text(encoding='utf-8'))
catalog=ROOT/'audit/lua-ui-resources.json'
icons={r['name']:r['preview']for r in json.loads(catalog.read_text(encoding='utf-8'))['assets']}if catalog.exists()else {}
OUT=ROOT/'audit/lua-layout';OUT.mkdir(exist_ok=True)
W,H=1600,1200;scale=H/.6
font='C:/Windows/Fonts/msyh.ttc'
def plain(s):return re.sub(r'\|c[0-9a-fA-F]{8}|\|r','',s or '').replace('|n','\n')
for name in ['archive-0','archive-2','archive-3','archive-4','archive-5','archive-6','archive-7','archive-8','battle-hud','character','relic-choice','battle-core','battle-controls','battle-console-separated','battle-left-sidebar','battle-native-tooltip','reward-reopen-sidebar','merchant','enemy-roster','leader-choice','route-picker','difficulty','upgrade','loot','loot-compact']:
 frames=data['snapshots'][name];im=Image.new('RGB',(W,H),(29,35,42));d=ImageDraw.Draw(im)
 for x in range(0,W,80):d.line((x,80,x,H),fill=(32,39,48))
 for y in range(80,H,80):d.line((0,y,W,y),fill=(32,39,48))
 d.text((28,20),'LAYOUT MODEL · Lua frame coordinates · NOT a Warcraft screenshot',font=ImageFont.truetype(font,20),fill=(161,164,166))
 def rect(f):
  if f.get('allPoints')and str(f['allPoints'])in frames:return rect(frames[str(f['allPoints'])])
  x,y=f.get('x')or 0,f.get('y')or 0
  if not f.get('absolute')and str(f.get('parent'))in frames:
   px,py,_,_=rect(frames[str(f['parent'])]);x+=px;y+=py
  return x,y,f.get('w')or 0,f.get('h')or 0
 if name.startswith('battle'):
  top=round((.6-.170)*scale)
  d.rectangle((0,top,W,H),fill=(37,39,42))
  d.line((0,top,W,top),fill=(162,135,82),width=2)
  d.text((350,top+40),'原生控制台保留区：头像 / 单位属性 / 技能 / 背包',font=ImageFont.truetype(font,15),fill=(180,178,170))
 for key,f in sorted(frames.items(),key=lambda p:int(p[0])):
  x,y,w,h=rect(f);x=round(x*scale);y=round((.6-y)*scale);w=round(w*scale);h=round(h*scale)
  if w<=0 or h<=0:continue
  box=(x,y,x+w,y+h)
  if f['kind']=='NATIVE' and f.get('name','').startswith('DzFrameGetTooltip'):
   d.rectangle(box,fill=(19,25,35),outline=(193,167,100),width=2)
  if f['kind']=='NATIVE' and f.get('name','').startswith(('Command','Item')):
   d.rounded_rectangle(box,radius=4,fill=(38,46,55),outline=(173,149,90),width=2)
   d.text((x+4,y+int(h*.35)),f['name'],font=ImageFont.truetype(font,11),fill=(218,203,163))
  if f.get('texture','').endswith('.tga'):
   texture=ROOT/'lua_build'/f['texture'].replace('\\','/')
   if texture.exists():
    t=Image.open(texture).convert('RGBA').resize((w,h))
    if f.get('alpha')is not None:t.putalpha(t.getchannel('A').point(lambda a:int(a*f['alpha']/255)))
    im.paste(t,(x,y),t)
  elif f.get('texture'):
   path=icons.get(f['texture'])
   if path and Path(path).exists():
    t=Image.open(path).convert('RGBA').resize((w,h))
    if f.get('alpha')is not None:t.putalpha(t.getchannel('A').point(lambda a:int(a*f['alpha']/255)))
    im.paste(t,(x,y),t)
   else:d.rounded_rectangle(box,radius=3,fill=(59,67,75),outline=(132,114,76))
  if f['kind']=='BUTTON'and f.get('name')not in ('AITextButton','AIIconButton'):d.rounded_rectangle(box,radius=3,fill=(24,30,38),outline=(117,99,66))
  text=plain(f.get('text'));size=max(9,round((f.get('font')or .009)*scale));ft=ImageFont.truetype(font,size)
  if text:
   lines=[]
   for raw in text.split('\n'):
    line=''
    for ch in raw:
     if d.textlength(line+ch,font=ft)>w-3 and line:lines.append(line);line=ch
     else:line+=ch
    lines.append(line)
   if f['kind']=='BUTTON':
    ty=y+max(0,(h-len(lines)*size*1.15)/2)
    for line in lines:d.text((x+(w-d.textlength(line,font=ft))/2,ty),line,font=ft,fill=(213,194,146));ty+=size*1.15
   else:
    ty=y
    for line in lines:d.text((x,ty),line,font=ft,fill=(228,225,213));ty+=size*1.15
 im.save(OUT/(name+'.png'))
print('Rendered coordinate models to audit/lua-layout')

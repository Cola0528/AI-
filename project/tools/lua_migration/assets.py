"""Render repo-native UI primitives; no reference-map art is imported."""
from pathlib import Path
from PIL import Image,ImageDraw

ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'lua_build/AITower';OUT.mkdir(parents=True,exist_ok=True)
for name,color,edge in [
    ('panel',(12,17,24,244),(112,92,56,180)),
    ('rail',(8,13,20,245),(62,63,61,180)),
    ('button',(24,30,38,246),(117,99,66,210)),
    ('hover',(34,40,48,246),(199,165,97,255)),
    ('down',(17,23,30,252),(200,167,97,255)),
    ('disabled',(19,25,32,235),(68,72,74,200)),
    ('track',(6,10,16,220),(43,51,61,200)),
    ('life',(92,151,107,255),None),
    ('mana',(89,138,183,255),None),
    ('gold',(191,160,100,225),None),
]:
    img=Image.new('RGBA',(64,64),color)
    draw=ImageDraw.Draw(img)
    # Border geometry belongs to the frame, not a stretched 64px texture.
    # Stretching a raster border produces the old thick, blurry yellow rim.
    img.save(OUT/(name+'.tga'))

fdf='''Frame "FRAME" "AIPassFrame" {
    UseActiveContext,
    LayerStyle "IGNORETRACKEVENTS",
}
Frame "BACKDROP" "AIPassBackdrop" {
    UseActiveContext,
    LayerStyle "IGNORETRACKEVENTS",
    BackdropBackground "Textures\\Black32.blp",
    BackdropBlendAll,
}
Frame "TEXT" "AIPassText" {
    UseActiveContext,
    LayerStyle "IGNORETRACKEVENTS",
    FrameFont "Fonts\\ZiTi.ttf", 0.009, "",
    FontFlags "FIXEDSIZE",
    FontJustificationH JUSTIFYLEFT,
    FontJustificationV JUSTIFYTOP,
    FontColor 0.91 0.90 0.86 1.0,
    FontShadowColor 0.0 0.0 0.0 0.0,
    FontShadowOffset 0.0 0.0,
    Text "",
}
Frame "GLUETEXTBUTTON" "AIButton" {
    UseActiveContext,
    ControlStyle "AUTOTRACK|HIGHLIGHTONMOUSEOVER",
    ButtonPushedTextOffset 0.0 -0.0007,
    ControlBackdrop "AIButtonNormal",
    Frame "BACKDROP" "AIButtonNormal" INHERITS "AIPassBackdrop" {
        BackdropBackground "AITower\\button.tga",
    }
    ControlPushedBackdrop "AIButtonDown",
    Frame "BACKDROP" "AIButtonDown" INHERITS "AIPassBackdrop" {
        BackdropBackground "AITower\\down.tga",
    }
    ControlDisabledBackdrop "AIButtonDisabled",
    Frame "BACKDROP" "AIButtonDisabled" INHERITS "AIPassBackdrop" {
        BackdropBackground "AITower\\disabled.tga",
    }
    ControlDisabledPushedBackdrop "AIButtonDisabledDown",
    Frame "BACKDROP" "AIButtonDisabledDown" INHERITS "AIPassBackdrop" {
        BackdropBackground "AITower\\disabled.tga",
    }
    ControlMouseOverHighlight "AIButtonHover",
    Frame "HIGHLIGHT" "AIButtonHover" {
        LayerStyle "IGNORETRACKEVENTS",
        HighlightType "FILETEXTURE",
        HighlightAlphaFile "AITower\\hover.tga",
        HighlightAlphaMode "ADD",
    }
    ButtonText "AIButtonText",
    Frame "TEXT" "AIButtonText" INHERITS "AIPassText" {
        FontJustificationH JUSTIFYCENTER,
        FontJustificationV JUSTIFYMIDDLE,
        FontColor 0.84 0.75 0.57 1.0,
    }
}
'''
# Text navigation and icon nodes intentionally have no rectangular normal skin.
for name in ('AITextButton','AIIconButton'):
    fdf+='''Frame "GLUETEXTBUTTON" "%s" {
    UseActiveContext,
    ControlStyle "AUTOTRACK|HIGHLIGHTONMOUSEOVER",
    ControlMouseOverHighlight "AIPlainHover",
    Frame "HIGHLIGHT" "AIPlainHover" {
        LayerStyle "IGNORETRACKEVENTS",
        HighlightType "FILETEXTURE",
        HighlightAlphaFile "AITower\\hover.tga",
        HighlightAlphaMode "ADD",
    }
    ButtonText "AIButtonText",
    Frame "TEXT" "AIButtonText" INHERITS "AIPassText" {
        FontJustificationH JUSTIFYCENTER,
        FontJustificationV JUSTIFYMIDDLE,
    }
}
'''%name
(OUT/'ui.fdf').write_bytes(fdf.replace('\n','\r\n').encode('utf-8'))
(OUT/'ui.toc').write_bytes(b'AITower\\ui.fdf\r\n')
print('Built UI FDF, TOC and ten dark/gold texture primitives.')

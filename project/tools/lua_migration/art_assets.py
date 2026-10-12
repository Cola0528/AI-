"""Mechanical encoding of original generated PNG art into native RGBA TGA."""
from pathlib import Path
from PIL import Image
ROOT=Path(__file__).resolve().parents[2]
for name,size in [('talents',(1024,512)),('journey',(1024,1024)),('reliquary',(512,512))]:
 image=Image.open(ROOT/'assets/art'/(name+'.png')).convert('RGBA')
 image.resize(size,Image.Resampling.LANCZOS).save(ROOT/'lua_build/AITower'/(name+'.tga'))
print('Encoded three original game art textures, including reliquary transparency.')

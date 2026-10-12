"""Read-only StormLib byte validation, owned by the v19 project."""
from pathlib import Path
import ctypes as C
import hashlib

def verify_archive(path, expected):
    dll=Path('C:/Project/爬塔/tools/vendor/stormlib/x64/StormLib.dll')
    lib=C.WinDLL(str(dll),use_last_error=True)
    H=C.c_void_p; D=C.c_uint32
    lib.SFileOpenArchive.argtypes=[C.c_void_p,D,D,C.POINTER(H)];lib.SFileOpenArchive.restype=C.c_bool
    lib.SFileOpenFileEx.argtypes=[H,C.c_char_p,D,C.POINTER(H)];lib.SFileOpenFileEx.restype=C.c_bool
    lib.SFileGetFileSize.argtypes=[H,C.POINTER(D)];lib.SFileGetFileSize.restype=D
    lib.SFileReadFile.argtypes=[H,C.c_void_p,D,C.POINTER(D),C.c_void_p];lib.SFileReadFile.restype=C.c_bool
    lib.SFileCloseFile.argtypes=[H];lib.SFileCloseFile.restype=C.c_bool
    lib.SFileCloseArchive.argtypes=[H];lib.SFileCloseArchive.restype=C.c_bool
    archive=H();opened=False
    for name in [C.c_wchar_p(str(Path(path).resolve())),C.c_char_p(str(Path(path).resolve()).encode('mbcs'))]:
        if lib.SFileOpenArchive(C.cast(name,C.c_void_p),0,0x100,C.byref(archive)):
            opened=True;break
    if not opened:raise OSError(C.get_last_error(),'StormLib archive open failed')
    files={}
    try:
        for name,data in expected.items():
            member=H()
            if not lib.SFileOpenFileEx(archive,name.encode('utf-8'),0,C.byref(member)):
                raise OSError(C.get_last_error(),f'StormLib member open failed: {name}')
            try:
                high=D();size=lib.SFileGetFileSize(member,C.byref(high))+(high.value<<32)
                assert size==len(data),(name,size,len(data))
                digest=hashlib.sha256();remaining=size
                while remaining:
                    amount=min(remaining,1048576);buffer=C.create_string_buffer(amount);count=D()
                    if not lib.SFileReadFile(member,buffer,amount,C.byref(count),None):
                        raise OSError(C.get_last_error(),f'StormLib read failed: {name}')
                    assert count.value==amount,name
                    digest.update(buffer.raw[:count.value]);remaining-=count.value
                assert digest.hexdigest()==hashlib.sha256(data).hexdigest(),name
                files[name]={'bytes':size,'sha256':digest.hexdigest()}
            finally:lib.SFileCloseFile(member)
    finally:lib.SFileCloseArchive(archive)
    return {'ok':True,'reader':'StormLib','files':files}

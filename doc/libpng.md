# LibPng
projects/vstudio/vstudio.sIn を開く

警告レベルを /W3 に落とす。

pngvalid.c の先頭の方に以下の行を追加する
```
#pragma warning(disable:4127)
```

IDEでコンパイルを行う。

projects/vstudio/release/*.dll を bin へ  
```C:¥Downloads¥libpng-x.x.x>xcopy /s /e projects¥vstudio¥release¥*.dll %OSS_LIB_DIR%¥bin¥```

projects/vstudio/release/libpng*.lib を lib へ  
```C:¥Downloads¥libpng-x.x.x>xcopy /s /e projects¥vstudio¥release¥*.lib %OSS_LIB_DIR%¥lib¥```

ルート直下の *.h を include へ  
```C:¥Downloads¥libpng-x.x.x>xcopy /s /e *.h %OSS_LIB_DIR%¥include¥libpng```


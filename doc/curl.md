# curl

## ビルドに必要なもの
- perl

perl.exe に path を通しておくこと  
例)  set path=%path%;c:\Perl64\bin

## ビルド手順
コマンドを実行する  
```
C:¥Downloads¥curl-x.x.x> mkdir build
C:¥Downloads¥curl-x.x.x> cd build
C:¥Downloads¥curl-x.x.x¥build> cmake .. -G”NMake Makefiles” -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\libcurl
C:¥Downloads¥curl-x.x.x¥build> nmake
C:¥Downloads¥curl-x.x.x¥build> nmake install
```

#OpenJpeg

コマンドを実行する  
```
C:¥Downloads¥openjpeg-x.x.x> mkdir build
C:¥Downloads¥openjpeg-x.x.x> cd build
C:¥Downloads¥openjpeg-x.x.x¥build> cmake .. -G”NMake Makefiles” -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\openjpeg
C:¥Downloads¥openjpeg-x.x.x¥build> nmake
C:¥Downloads¥openjpeg-x.x.x¥build> nmake install
```

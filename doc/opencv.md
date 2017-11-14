# OpenCv

コマンドを実行する  
```
C:¥Downloads¥opencv-x.x.x> mkdir build
C:¥Downloads¥opencv-x.x.x> cd build
C:¥Downloads¥opencv-x.x.x¥build> cmake .. -G”NMake Makefiles” -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\opencv
C:¥Downloads¥opencv-x.x.x¥build> nmake
C:¥Downloads¥opencv-x.x.x¥build> nmake install
```

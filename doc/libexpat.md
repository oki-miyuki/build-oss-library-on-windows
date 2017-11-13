# LibExpat
リポジトリから取得  
```C:¥Downloads> git clone https://github.com/libexpat/libexpat.git libexpat-master```  

ビルドを実行する  
```
C:¥Downloads> cd libexpat-master
C:¥Downloads¥libexpat-master> cd expat
C:¥Downloads¥libexpat-master¥expat> mkdir build
C:¥Downloads¥libexpat-master¥expat> cd build
C:¥Downloads¥libexpat-master¥expat¥build> cmake .. -G”NMake Makefiles” -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%libexpat
C:¥Downloads¥libexpat-master¥expat¥build> nmake
C:¥Downloads¥libexpat-master¥expat¥build> nmake test
C:¥Downloads¥libexpat-master¥expat¥build> nmake install
```

# LibGeoTiff

## �O�����
[tiff]: ./tiff.md 'Tiff�̃r���h' ���r���h�ς�

## �r���h�菇

makefile.vc ��ҏW������������  
```
# OSGEO4W = c:\OSGeo4W
OSGEO4W = $(OSS_LIB_DIR)

TIFF_INC = -I$(OSGEO4W)\include\tiff
TIFF_LIB_DLL = $(OSGEO4W)\lib\libtiff_i.lib
```

```
nmake -f makefile.vc
nmake -f makefile.vc install
```

```
xcopy /s /e *.h %OSS_LIB_DIR%\include\libgeotiff\  
xcopy /s /e libxtiff %OSS_LIB_DIR%\libgeotiff\libxtiff\
xcopy /s /e *.lib %OSS_LIB_DIR%\lib\
xcopy /s /e *.dll %OSS_LIB_DIR%\bin\
xcopy /s /e release\share %OSS_LIB_DIR%\data\
```


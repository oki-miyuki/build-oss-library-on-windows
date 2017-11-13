# LibXML2

コマンドを実行する
```
C:¥Downloads¥libxml2-x.x.x> cd win32
C:¥Downloads¥libxml2-x.x.x¥win32> cscript configure.js prefix=%OSS_LIB_DIR%\libxml2 iconv=no
C:¥Downloads¥libxml2-x.x.x¥win32> nmake -f makefile.msvc
C:¥Downloads¥libxml2-x.x.x¥win32> nmake -f makefile.msvc install
```

include/libxml/xmlversion.h  
をエディタで開き、ICONVを無効にする  
```
/**
 * LIBXML_ICONV_ENABLED:
 *
 * Whether iconv support is available
 */
#if 1
//#define LIBXML_ICONV_ENABLED
#endif
```

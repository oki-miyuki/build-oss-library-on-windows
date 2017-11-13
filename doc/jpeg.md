# Jpeg

コマンドを実行する  
```C:\Downloads\jpeg-xx> nmake -f makefile.vc setup-v10```  
これで jpeg.sIn, apps.sIn が生成される。  
static ライブラリの生成を dll用に書き換える  

makefile.vc を修正する
```
# You may want to adjust these compiler options:
#CFLAGS=$(cflags) $(cdebug) $(cvars) -I.
CFLAGS=$(cflags) $(cdebug) $(cvarsdll) -I.
# Generally, we recommend defining any configuration symbols in jconfig.h,
# NOT via -D switches here.

# Link-time options:
#LDFLAGS= $(ldebug) $(conlflags)
LDFLAGS= $(ldebug) $(dlllflags)

# To link any special libraries, add the necessary commands here.
#LDLIBS= $(conlibs)
LDLIBS= $(guilibsdll)

...
...
...

libjpeg.lib: $(LIBOBJECTS)
 $(RM) libjpeg.lib
 link -out:libjpeg.dll /MANIFEST /DLL  $(LIBOBJECTS)
 mt -manifest libjpeg.dll.manifest -outputresource:libjpeg.dll;2
#   lib -out:libjpeg.lib  $(LIBOBJECTS)
```

jmorecfg.h を修正する

```
//#define GLOBAL(type)  type
#define GLOBAL(type)    __declspec(dllexport) type
/* a reference to a GLOBAL function: */
//#define EXTERN(type)  extern type
#define EXTERN(type)    extern __declspec(dllexport) type
```  

ビルドを実行する  
```C:\Downloads\jpeg-xx> nmake -f makefile.vc nodebug=1

jpeg-xx 直下にビルドしたファイルが生成される

\*.h は $(OSS_LIB_DIR)\include\jpeg へコピー
```C:\Downloads\jpeg-xx> xcopy /s /e *.h %OSS_LIB_DIR%\include\jpeg\```  

\*.lib は $(OSS_LIB_DIR)\lib へコピー
```C:\Downloads\jpeg-xx> xcopy /s /e *.lib %OSS_LIB_DIR%\lib\```  

\*.dll は $(OSS_LIB_DIR)\bin へコピー
```C:\Downloads\jpeg-xx> xcopy /s /e *.dll %OSS_LIB_DIR%\bin\```


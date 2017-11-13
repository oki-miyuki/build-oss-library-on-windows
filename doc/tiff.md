# Tiff

コマンドを実行する  

```C:\Downloads\tiff-x.x.x> nmake -f makefile.vc```

tiff-x.x.x 直下にビルドしたファイルが生成される  

\*.h は $(OSS_LIB_DIR)\include\tiff へコピー  
```C:¥Downloads¥tiff-x.x.x> xcopy /s /e *.h %OSS_LIB_DIR%¥include¥tiff¥```  

\*.lib は $(OSS_LIB_DIR)\lib へコピー  
```C:¥Downloads¥tiff-x.x.x> xcopy /s /e *.lib %OSS_LIB_DIR%¥lib¥```  

\*.dll は $(OSS_LIB_DIR)\bin へコピー  
```C:¥Downloads¥tiff-x.x.x> xcopy /s /e *.dll %OSS_LIB_DIR%¥bin¥```


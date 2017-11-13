# OpenSSL

## ビルドに必要なもの
 - Perl
 - nasm

 nasm.exe は path を通しておきます。
 
## ビルド手順

コンフィグのパラメータは4種類。WIN32でのビルドで説明  
```$ perl Configure { VC-WIN32 | VC-WIN64A | VC-WIN64I | VC-CE }```  

コマンドを実行する  
```
C:¥Downloads¥openssl-x.x.x> perl Configure VC-WIN32 --prefix=%OSS_LIB_DIR%\openssl --openssldir=%OSS_LIB_DIR%\openssl\ssl
C:¥Downloads¥openssl-x.x.x> nmake
C:¥Downloads¥openssl-x.x.x> nmake test
C:¥Downloads¥openssl-x.x.x> nmake install
```

set OSS_LIB_SOURCE=D:\Downloads
set OSS_LIB_DIR=D:\Libs

mkdir %OSS_LIB_DIR%\include
mkdir %OSS_LIB_DIR%\lib
mkdir %OSS_LIB_DIR%\bin

for %%s in (zlib curl freetype jpeg libpng libexpat libkml) do call %%s\build.bat

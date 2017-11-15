set OSS_LIB_SOURCE=D:\Downloads
set OSS_LIB_DIR=D:\Libs

mkdir %OSS_LIB_DIR%\include
mkdir %OSS_LIB_DIR%\lib
mkdir %OSS_LIB_DIR%\bin
mkdir %OSS_LIB_DIR%\data

rem zlib <= libpng, tiff
rem jpeg <= tiff
rem tiff <= libgeotiff

for %%s in (zlib curl proj freetype jpeg libpng tiff tbb libexpat libkml) do call %%s\build.bat

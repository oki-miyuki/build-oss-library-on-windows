set OSS_LIB_SOURCE=D:\Downloads
set OSS_LIB_DIR=D:\Libs

mkdir %OSS_LIB_DIR%\include
mkdir %OSS_LIB_DIR%\lib
mkdir %OSS_LIB_DIR%\bin
mkdir %OSS_LIB_DIR%\data

rem zlib <= libpng, tiff
rem jpeg <= tiff
rem tiff <= libgeotiff

pushd %~dp0

for %%s in (zlib openssl curl proj freetype freeglut jpeg libpng tiff tbb libexpat libkml libgeotiff opencv openjpeg) do (
 call %%s\build.bat
 rem echo *** done %%s ***
 rem pause
)
popd

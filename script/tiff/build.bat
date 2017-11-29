@echo off
rem ---------------
rem BUILD Tiff
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\tiff-*) do @set TIFF_DIR=%%d

if "%TIFF_DIR%"=="" (
  echo TIFF is not found. skip...
  goto end
)

set ZLIB_LIBRARY=%OSS_LIB_DIR%\lib\zlib.lib
set JPEG_LIBRARY=%OSS_LIB_DIR%\lib\libjpeg.lib

if not exist %ZLIB_LIBRARY% (
  echo "Tiff: zlib is needed skip..."
  goto end
)

if not exist %JPEG_LIBRARY% (
  echo "Tiff: jpeg is needed skip..."
  goto end
)


pushd %TIFF_DIR%

rem nmake -f makefile.vc
rem del /S /Q buildtiff

mkdir buildtiff
cd buildtiff
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\tiff -DZLIB_INCLUDE_DIR=%OSS_LIB_DIR%\include -DZLIB_LIBRARY=%ZLIB_LIBRARY:\=/% -DJPEG_INCLUDE_DIR=%OSS_LIB_DIR%\include -DJPEG_LIB_LIBRARY=%JPEG_LIBRARY:\=/%
nmake 
nmake install

set TIFF_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat tiff
call ..\mkl_lib.bat tiff

:end

popd


rem ---------------
rem BUILD Tiff
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\tiff-*) do @set TIFF_DIR=%%d

if "%TIFF_DIR%"=="" (
  echo TIFF not found. skip...
  exit 0
)

pushd %TIFF_DIR%

set ZLIB_LIBRARY=%OSS_LIB_DIR%\lib\zlib.lib
set JPEG_LIB_LIBRARY=%OSS_LIB_DIR%\lib\jpeg.lib

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

popd


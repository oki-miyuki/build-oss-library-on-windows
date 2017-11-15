rem ---------------
rem BUILD proj
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\tiff-*) do @set TIFF_DIR=%%d

if %TIFF_DIR%=='' (
  echo TIFF not found. skip...
  exit 0
)

pushd %TIFF_DIR%

rem nmake -f makefile.vc
rem del /S /Q buildtiff

mkdir buildtiff
cd buildtiff
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\tiff -DZLIB_INCLUDE_DIR=%OSS_LIB_DIR%\include\zlib -DZLIB_LIBRARY=%OSS_LIB_DIR%\lib\zlib.lib -DJPEG_INCLUDE_DIR=%OSS_LIB_DIR%\include\jpeg -DJPEG_LIB_LIBRARY=%OSS_LIB_DIR%\lib\jpeg.lib -DGLUT_INCLUDE_DIR=%OSS_LIB_DIR%\include
nmake 
nmake install

set TIFF_DIR=

popd


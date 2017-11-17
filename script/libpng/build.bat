rem ---------------
rem BUILD LIBPNG
rem ----------------
rem  DEPENDS ZLIB
rem ---------------
if not exist %OSS_LIB_DIR%\Zlib (
  echo "You have to build zlib first"
  exit
)

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\libpng*) do @set LIBPNG_DIR=%%d

pushd %LIBPNG_DIR%

set ZLIB_LIBRARY=%OSS_LIB_DIR%\lib\zlib.lib


rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\libpng -DZLIB_INCLUDE_DIR=%OSS_LIB_DIR%\include -DZLIB_LIBRARY=%ZLIB_LIBRARY:\=/%
nmake
nmake install

set LIBPNG_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat libpng
call ..\mkl_lib.bat libpng

popd


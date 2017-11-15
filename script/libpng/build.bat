rem ---------------
rem BUILD LIBPNG
rem ----------------
rem  DEPENDS ZLIB
rem ---------------
if not exist %OSS_LIB_DIR%\Zlib (
  echo "You have to build zlib first"
  exit
)

for /d %%d in (%OSS_LIB_SOURCE%\libpng*) do @set LIBPNG_DIR=%%d

pushd %LIBPNG_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\libpng -DZLIB_INCLUDE_DIR=%OSS_LIB_DIR%\include\zlib -DZLIB_LIBRARY=%OSS_LIB_DIR%\lib\zlib.lib
nmake
nmake install

set LIBPNG_DIR=

popd


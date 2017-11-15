rem ---------------
rem BUILD ZLIB
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\zlib*) do @set ZLIB_DIR=%%d

pushd %ZLIB_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\zlib
nmake
nmake install


set ZLIB_DIR=

popd


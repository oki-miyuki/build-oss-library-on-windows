rem ---------------
rem BUILD LIBEXPAT
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\libexpat*) do @set LIBEXPAT_DIR=%%d

pushd %LIBEXPAT_DIR%

cd expat
del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\libexpat
nmake
nmake install

set LIBEXPAT_DIR=

popd

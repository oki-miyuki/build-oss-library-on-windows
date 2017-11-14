rem ---------------
rem BUILD CURL
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\curl*) do @set CURL_DIR=%%d

pushd %CURL_DIR%

del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\curl
nmake
nmake install


set CURL_DIR=

popd

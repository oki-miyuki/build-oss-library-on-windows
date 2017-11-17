rem ---------------
rem BUILD CURL
rem ---------------
pushd %~d0

for /d %%d in (%OSS_LIB_SOURCE%\curl*) do @set CURL_DIR=%%d

if "%CURL_DIR%"=="" (
  echo CURL is not found. skip...
  goto end
)

pushd %CURL_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\curl
nmake
nmake install

set CURL_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat curl
call ..\mkl_lib.bat curl

:end

popd

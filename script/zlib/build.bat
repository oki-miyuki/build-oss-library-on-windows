rem ---------------
rem BUILD ZLIB
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\zlib*) do @set ZLIB_DIR=%%d

if "%ZLIB_DIR%"=="" (
  echo ZLIB is not found. skip...
  goto end
)

pushd %ZLIB_DIR%

echo ======================================================
echo  BUILD ZLib
echo ======================================================

del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\zlib
nmake
nmake install


set ZLIB_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat zlib
call ..\mkl_lib.bat zlib

:end

popd


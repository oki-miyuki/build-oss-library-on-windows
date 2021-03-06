rem ---------------
rem BUILD LIBEXPAT
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\libexpat*) do @set LIBEXPAT_DIR=%%d

if "%LIBEXPAT_DIR%"=="" (
  echo LibExpat is not found. skip...
  goto end
)

pushd %LIBEXPAT_DIR%

echo ======================================================
echo  BUILD LibExpat
echo ======================================================

cd expat
del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\libexpat
nmake
nmake install

set LIBEXPAT_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat libexpat
call ..\mkl_lib.bat libexpat

:end

popd

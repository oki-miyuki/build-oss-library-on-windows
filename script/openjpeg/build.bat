rem ---------------
rem BUILD OpenJpeg
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\openjpeg-*) do @set OPENJPEG_DIR=%%d

if "%OPENJPEG_DIR%"=="" (
  echo OpenJpeg is not found. skip...
  goto end
)

pushd %OPENJPEG_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\openjpeg
nmake 
nmake install

set OPENJPEG_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat openjpeg
call ..\mkl_lib.bat openjpeg

:end

popd


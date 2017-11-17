rem ---------------
rem BUILD Xerecs-c
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\xerces-c*) do @set XERCES_C_DIR=%%d

if "%XERCES_C_DIR%"=="" (
  echo Xerces-c is not found. skip...
  goto end
)

pushd %XERCES_C_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\xerces-c
nmake 
nmake install

set XERCES_C_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat xerces-c
call ..\mkl_lib.bat xerces-c

:end

popd


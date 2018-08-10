rem ---------------
rem BUILD FREETYPE
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\freetype*) do @set FREETYPE_DIR=%%d

if "%FREETYPE_DIR%"=="" (
  echo Freetype is not found. skip...
  goto end
)

pushd %FREETYPE_DIR%

echo ======================================================
echo  BUILD Freetype
echo ======================================================

del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\freetype
nmake
nmake install

set FREETYPE_DIR=
popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat freetype
call ..\mkl_lib.bat freetype

:end

popd


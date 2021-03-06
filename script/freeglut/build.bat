rem ---------------
rem BUILD FreeGLUT
rem ---------------
pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\freeglut*) do @set GLUT_DIR=%%d

if "%GLUT_DIR%"=="" (
  echo FreeGLUT is not found. skip...
  goto end
)

pushd %GLUT_DIR%

echo ======================================================
echo  BUILD FreeGLUT
echo ======================================================

del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\freeglut
nmake
nmake install


set GLUT_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat freeglut
call ..\mkl_lib.bat freeglut

:end

popd
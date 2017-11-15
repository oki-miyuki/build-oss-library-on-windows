rem ---------------
rem BUILD CURL
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\freeglut*) do @set GLUT_DIR=%%d

pushd %GLUT_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\freeglut
nmake
nmake install


set GLUT_DIR=

popd


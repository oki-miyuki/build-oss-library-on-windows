rem ---------------
rem BUILD OpenCV
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\opencv-*) do @set OPENCV_DIR=%%d

if "%OPENCV_DIR%"=="" (
  echo OpenCV is not found. skip...
  goto end
)

pushd %OPENCV_DIR%

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\opencv
nmake 
nmake install

set OPENCV_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat opencv
call ..\mkl_lib.bat opencv\%MACHINE_TARGET%\vc%VCVER%

:end

popd


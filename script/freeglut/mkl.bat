pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\GL %OSS_LIB_DIR%\freeglut\include\GL
call ..\mkl_lib.bat freeglut
popd

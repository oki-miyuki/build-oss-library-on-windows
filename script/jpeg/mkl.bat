pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\jpeg %OSS_LIB_DIR%\jpeg\include
call ..\mkl_lib.bat jpeg
popd

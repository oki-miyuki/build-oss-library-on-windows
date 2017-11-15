pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\zlib %OSS_LIB_DIR%\zlib\include
call ..\mkl_lib.bat zlib
popd

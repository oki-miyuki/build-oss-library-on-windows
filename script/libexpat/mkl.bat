pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\libexpat %OSS_LIB_DIR%\libexpat\include
call ..\mkl_lib.bat libexpat
popd

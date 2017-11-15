mklink /D %OSS_LIB_DIR%\include\tbb %OSS_LIB_DIR%\tbb\include\tbb
mklink /D %OSS_LIB_DIR%\include\serial %OSS_LIB_DIR%\tbb\include\serial
call ..\mkl_lib.bat tbb


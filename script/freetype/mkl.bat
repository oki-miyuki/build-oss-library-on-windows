pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\freetype2 %OSS_LIB_DIR%\freetype\include\freetype2
call ..\mkl_lib.bat freetype
popd

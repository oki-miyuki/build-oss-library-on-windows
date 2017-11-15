pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\kml %OSS_LIB_DIR%\libkml\include\kml
call ..\mkl_lib.bat libkml
popd
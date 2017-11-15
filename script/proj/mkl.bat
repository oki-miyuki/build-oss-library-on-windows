pushd %~dp0
mklink /D %OSS_LIB_DIR%\include\proj %OSS_LIB_DIR%\proj\include
call ..\mkl_lib.bat proj
pushd %OSS_LIB_DIR%\proj\share
for %%d in (*) do mklink %OSS_LIB_DIR%\data\%%d %%d
popd
popd

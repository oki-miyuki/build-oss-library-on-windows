pushd %OSS_LIB_DIR%\%1\lib
for %%d in (*.lib) do mklink %OSS_LIB_DIR%\lib\%%d %%d
popd
pushd %OSS_LIB_DIR%\%1\bin
for %%d in (*.dll) do mklink %OSS_LIB_DIR%\bin\%%d %%d
popd

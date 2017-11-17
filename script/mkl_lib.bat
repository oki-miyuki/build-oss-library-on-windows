if exist %OSS_LIB_DIR%\%1\lib (
 pushd %OSS_LIB_DIR%\%1\lib
 for %%d in (*.lib) do mklink /H %OSS_LIB_DIR%\lib\%%d %%d
 popd
)
if exist %OSS_LIB_DIR%\%1\bin (
 pushd %OSS_LIB_DIR%\%1\bin
 for %%d in (*.dll) do mklink /H %OSS_LIB_DIR%\bin\%%d %%d
 popd
)



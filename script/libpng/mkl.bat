mklink /D %OSS_LIB_DIR%\include\libpng %OSS_LIB_DIR%\libpng\include
mklink %OSS_LIB_DIR%\bin\libpng16.dll %OSS_LIB_DIR%\libpng\bin\libpng16.dll
pushd %OSS_LIB_DIR%\libpng\lib
for %%d in (*.lib) do mklink %OSS_LIB_DIR%\lib\%%d %%d
popd


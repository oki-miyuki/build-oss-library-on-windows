mklink /D %OSS_LIB_DIR%\include\kml %OSS_LIB_DIR%\libkml\include\kml
pushd %OSS_LIB_DIR%\libkml\lib
for %%d in (*.lib) do mklink %OSS_LIB_DIR%\lib\%%d %%d
popd


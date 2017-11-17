@echo off
pushd %OSS_LIB_DIR%\%1\include

for %%d in (*.h) do mklink /H %OSS_LIB_DIR%\include\%%d %%d
for %%d in (*.hpp) do mklink /H %OSS_LIB_DIR%\include\%%d %%d
for %%d in (*.inc) do mklink /H %OSS_LIB_DIR%\include\%%d %%d
for %%d in (*.cmake) do mklink /H %OSS_LIB_DIR%\include\%%d %%d
for %%d in (*.def) do mklink /H %OSS_LIB_DIR%\include\%%d %%d

for /d %%i in (*) do (
  mklink /J /D %OSS_LIB_DIR%\include\%%i %%i
)

popd


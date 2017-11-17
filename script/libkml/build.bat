rem ---------------
rem BUILD LIBKML
rem ---------------
pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\libkml*) do @set LIBKML_DIR=%%d

if "%LIBKML_DIR%"=="" (
  echo LibKML is not found. skip...
  goto end
)


pushd %LIBKML_DIR%

msbuild /p:Configuration=Release msvc\libkml.sln

xcopy /s /e /y msvc\release\*.lib %OSS_LIB_DIR%\libkml\lib\
xcopy /s /e /y src\kml %OSS_LIB_DIR%\libkml\include\kml\

set LIBKML_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat libkml
call ..\mkl_lib.bat libkml

:end

popd


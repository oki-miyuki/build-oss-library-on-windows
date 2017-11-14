rem ---------------
rem BUILD LIBKML
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\libkml*) do @set LIBKML_DIR=%%d

pushd %LIBKML_DIR%

msbuild /p:Configuration=Release msvc\libkml.sln

xcopy /s /e /y msvc\release\*.lib %OSS_LIB_DIR%\libkml\lib\
xcopy /s /e /y src\kml %OSS_LIB_DIR%\libkml\include\kml\

set LIBKML_DIR=

popd


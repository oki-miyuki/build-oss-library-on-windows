@echo off
rem ---------------
rem BUILD LIBKML
rem ---------------
pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\libkml*) do @set LIBKML_DIR=%%d

if "%LIBKML_DIR%"=="" (
  echo LibKML is not found. skip...
  goto end
)


pushd %LIBKML_DIR%

echo ======================================================
echo  BUILD LibKML
echo ======================================================

rem -----------------
rem build uriparser
rem ------------------
for /f %%F in ('dir/b/s third_party\uriparser-*^|findstr/i /e ^^uriparser-[0-9.]*') do @set URIPARSER_ADD=%%F
devenv /upgrade %URIPARSER_ADD%\win32\Visual_Studio_2005\uriparser.sln
msbuild /p:Configuration=Release;PlatformToolset=%VCTOOL%  %URIPARSER_ADD%\win32\Visual_Studio_2005\uriparser.sln

xcopy /s /e /y %URIPARSER_ADD%\win32\*.lib %OSS_LIB_DIR%\libkml\lib\

rem -----------------
rem build minizip
rem -----------------
for /f %%F in ('dir/b/s third_party\zlib-*^|findstr/i /e ^^zlib-[0-9.]*') do @set ZLIB_ADD=%%F
devenv /upgrade %ZLIB_ADD%\contrib\minizip\minizip.sln
msbuild /p:Configuration=Release;PlatformToolset=%VCTOOL%  %ZLIB_ADD%\contrib\minizip\minizip.sln

xcopy /s /e /y %ZLIB_ADD%\contrib\minizip\Release\*.lib %OSS_LIB_DIR%\libkml\lib\

rem ------------------
rem build libkml
rem ------------------
devenv /upgrade msvc\libkml.sln
msbuild /p:Configuration=Release;PlatformToolset=%VCTOOL%  msvc\libkml.sln

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


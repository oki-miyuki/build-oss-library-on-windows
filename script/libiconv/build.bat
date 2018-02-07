rem ---------------
rem BUILD LIBICONV
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\libiconv-win-*) do @set LIBICONV_DIR=%%d

if "%LIBICONV_DIR%"=="" (
  echo "LibIconv(win-build) is not found. skip..."
  goto end
)

pushd %LIBICONV_DIR%

if not exist build-VS%VSVER% (
  echo "VS%VSVER% is out of support..."
  popd
  goto end
)
pushd build-VS%VSVER%

msbuild /p:Configuration=Release;PlatformToolset=%VCTOOL% libiconv.sln

xcopy /s /e /y ..\include %OSS_LIB_DIR%\libiconv\include\
xcopy /s /e /y release\*.lib %OSS_LIB_DIR%\libiconv\lib\
xcopy /s /e /y release\*.dll %OSS_LIB_DIR%\libiconv\bin\

set LIBICONV_DIR=

popd

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat libiconv
call ..\mkl_lib.bat libiconv

:end

popd


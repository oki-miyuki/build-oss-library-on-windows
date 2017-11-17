rem ---------------
rem BUILD TBB
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\tbb-*) do @set TBB_DIR=%%d

if "%TBB_DIR%"=="" (
  echo TBB is not found. skip...
  goto end
)

pushd %TBB_DIR%

msbuild /p:Configuration=Release;PlatformToolset=%VCTOOL% build\vs2013\makefile.sln


xcopy /s /e /y include %OSS_LIB_DIR%\tbb\include\
xcopy /s /e /y build\vs2013\win32\release\*.lib %OSS_LIB_DIR%\tbb\lib\
xcopy /s /e /y build\vs2013\win32\release\*.dll %OSS_LIB_DIR%\tbb\bin\

set TBB_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat tbb
call ..\mkl_lib.bat tbb

:end

popd


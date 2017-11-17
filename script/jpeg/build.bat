rem ---------------
rem BUILD JPEG
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\jpeg*) do @set JPEG_DIR=%%d

if "%JPEG_DIR%"=="" (
  echo jpeg is not found. skip...
  goto end
)

pushd %JPEG_DIR%

if not exist jconfig.h  nmake -f makefile.vc setup-v10
nmake -f makefile.vc nodebug=1

xcopy /s /e /y *.h %OSS_LIB_DIR%\jpeg\include\
xcopy /s /e /y *.lib %OSS_LIB_DIR%\jpeg\lib\


set JPEG_DIR=

popd


rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat jpeg
call ..\mkl_lib.bat jpeg

:end

popd

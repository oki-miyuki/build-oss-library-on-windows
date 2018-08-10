rem ---------------
rem BUILD JPEG
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\jpeg*) do @set JPEG_DIR=%%d

if "%JPEG_DIR%"=="" (
  echo jpeg is not found. skip...
  goto end
)

copy ..\win32.mak %JPEG_DIR%

pushd %JPEG_DIR%

echo ======================================================
echo  BUILD JPEG
echo ======================================================


rem --------------------------------------------
rem the name setup-v15 offen changed. 
rem   check makefile.vc (grep setup)
rem --------------------------------------------
if not exist jconfig.h  nmake -f makefile.vc setup-v15
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

rem ---------------
rem BUILD proj
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\proj-*) do @set PROJ_DIR=%%d

pushd %PROJ_DIR%

nmake -f makefile.vc INSTDIR=%OSS_LIB_DIR%\proj
nmake -f makefile.vc INSTDIR=%OSS_LIB_DIR%\proj install-all

set PROJ_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat proj
call ..\mkl_lib.bat proj
rem proj datum 
pushd %OSS_LIB_DIR%\proj\share
for %%d in (*) do mklink /H %OSS_LIB_DIR%\data\%%d %%d
popd

popd

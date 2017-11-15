rem ---------------
rem BUILD proj
rem ---------------

for /d %%d in (%OSS_LIB_SOURCE%\proj-*) do @set PROJ_DIR=%%d

pushd %PROJ_DIR%

nmake -f makefile.vc INSTDIR=%OSS_LIB_DIR%\proj
nmake -f makefile.vc INSTDIR=%OSS_LIB_DIR%\proj install-all

set PROJ_DIR=

popd


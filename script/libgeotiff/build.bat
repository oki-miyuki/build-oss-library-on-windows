rem ---------------
rem BUILD LibGeoTiff
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\libgeotiff-*) do @set LIBGEOTIFF_DIR=%%d

pushd %LIBGEOTIFF_DIR%

rem del /S /Q build
mkdir build
cd build

rem
rem cmake check_library tool process \ as escape character.
rem so replace \ to / later.
rem
set PROJ_LIBRARY=%OSS_LIB_DIR%\lib\proj.lib
set TIFF_LIBRARY=%OSS_LIB_DIR%\lib\tiff.lib

cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\libgeotiff -DPROJ4_INCLUDE_DIR=%OSS_LIB_DIR%\include -DPROJ4_LIBRARY=%PROJ_LIBRARY:\=/% -DTIFF_INCLUDE_DIR=%OSS_LIB_DIR%\include -DTIFF_LIBRARY=%TIFF_LIBRARY:\=/%
nmake
nmake install

set PROJ_LIBRARY=
set TIFF_LIBRARY=

set LIBGEOTIFF_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat libgeotiff
call ..\mkl_lib.bat libgeotiff

popd

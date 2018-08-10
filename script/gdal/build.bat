rem @echo off
rem ---------------
rem BUILD GDAL
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\gdal-*) do @set GDAL_SRC_DIR=%%d

if "%GDAL_SRC_DIR%"=="" (
  echo gdal is not found. skip...
  goto end
)

pushd %GDAL_SRC_DIR%

echo ======================================================
echo  BUILD GDAL
echo ======================================================

set JPEG_LIBRARY=%OSS_LIB_DIR%\lib\libjpeg.lib


rem for /f %%F in ('dir/b/s %OSS_LIB_DIR%\lib\libpng*.lib^|findstr/i ^^libpng[0-9]*\.lib') do @set PNG_LIBRARY=%%F
for /f %%F in ('dir/b/s %OSS_LIB_DIR%\lib\libpng*.lib^|findstr/i libpng[0-9]*\.lib') do @set PNG_LIBRARY=%%F
set JPEG_LIBRARY=%OSS_LIB_DIR%\lib\libjpeg.lib
set PROJ_LIBRARY=%OSS_LIB_DIR%\lib\proj.lib
set TIFF_LIBRARY=%OSS_LIB_DIR%\lib\tiff.lib
set GEOTIFF_LIBRARY=%OSS_LIB_DIR%\lib\geotiff_i.lib
set EXPAT_LIBRARY=%OSS_LIB_DIR%\lib\expat.lib
set KML_LIBRARY=%OSS_LIB_DIR%\lib\libkmlbase.lib

rem ----------------------------------
rem Init make options
rem ----------------------------------
set GDAL_OPT=GDAL_HOME=%OSS_LIB_DIR%\gdal

rem JPEG support
if exist %JPEG_LIBRARY% (
  set GDAL_OPT=%GDAL_OPT% JPEG_EXTERNAL_LIB=1 JPEGDIR=%OSS_LIB_DIR%\include JPEG_LIB=%JPEG_LIBRARY%
)

rem PNG support
if exist %PNG_LIBRARY% (
  set GDAL_OPT=%GDAL_OPT% PNG_EXTERNAL_LIB=1 PNGDIR=%OSS_LIB_DIR%\include PNG_LIB=%PNG_LIBRARY%
)

rem TIFF support
if exist %TIFF_LIBRARY% (
  set GDAL_OPT=%GDAL_OPT% TIFF_INC=%OSS_LIB_DIR%\include TIFFLIB=%TIFF_LIBRARY%
  set GDAL_OPT=%GDAL_OPT% TIFF_OPTS=-DBIGTIFF_SUPPORT
)

rem GeoTIFF support
if exist %GEOTIFF_LIBRARY% (
  set GDAL_OPT=%GDAL_OPT% GEOTIFF_INC="-I%OSS_LIB_DIR%\include -I%OSS_LIB_DIR%\include\libxtiff" GEOTIFF_LIB=%GEOTIFF_LIBRARY%
)

rem LibKML support
call :libkml


rem if exist %PROJ_LIBRARY% ()

nmake -f makefile.vc %GDAL_OPT%
nmake -f makefile.vc %GDAL_OPT% devinstall

set GDAL_SRC_DIR=

popd


rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat gdal
call ..\mkl_lib.bat gdal

goto :end

:libkml
set KML_ON=
rem KML support
if exist %EXPAT_LIBRARY% (
  set KML_ON=1
)

if exist %KML_LIBRARY% (
  set KML_ON=%KML_ON%1
)

for /d %%d in (%OSS_LIB_SOURCE%\libkml*) do @set LIBKML_DIR=%%d

if "%KML_ON%"=="11" (
 set GDAL_OPT=%GDAL_OPT% LIBKML_DIR=%LIBKML_DIR% LIBKML_INCLUDE="-I%OSS_LIB_DIR%\include -I%OSS_LIB_DIR%\Boost\include\boost-1_60" LIBKML_LIBS="%KML_LIBRARY% %OSS_LIB_DIR%\lib\libkmlconvenience.lib %OSS_LIB_DIR%\lib\libkmldom.lib %OSS_LIB_DIR%\lib\libkmlengine.lib %OSS_LIB_DIR%\lib\libkmlregionator.lib %OSS_LIB_DIR%\lib\libkmlxsd.lib %OSS_LIB_DIR%\lib\minizip_static.lib %EXPAT_LIBRARY% %OSS_LIB_DIR%\lib\uriparser.lib %OSS_LIB_DIR%\lib\zlib.lib"
)

echo ******
echo %GDAL_OPT%
echo ******
exit /b

:end

popd

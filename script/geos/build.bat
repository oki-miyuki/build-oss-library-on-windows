rem ---------------
rem BUILD GEOS
rem ---------------

pushd %~dp0

for /d %%d in (%OSS_LIB_SOURCE%\geos*) do @set GEOS_DIR=%%d

if "%GEOS_DIR%"=="" (
  echo GEOS is not found. skip...
  goto end
)

pushd %GEOS_DIR%

rem 
rem @see https://trac.osgeo.org/geos/ticket/753
rem Closed ticket is not solve issue.
rem >>>
set CURL_EXEC=
for /f "usebackq tokens=*" %%i in (`where curl`) do @set CURL_EXEC=%%i
if exist %OSS_LIB_DIR%\curl\bin\curl.exe (
  set CURL_EXEC=%OSS_LIB_DIR%\curl\bin\curl
)
if not exist cmake\modules\GenrateSourceGroups.cmake (
  call :dcm
)
if "%DOWNLOAD_FAIL%"=="YES" (
  goto end
)
rem <<<

rem del /S /Q build
mkdir build
cd build
cmake .. -G"NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%OSS_LIB_DIR%\geos
nmake
nmake install


set GEOS_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat geos
call ..\mkl_lib.bat geos

:end

popd

exit /b 0

:dcm
set DOWNLOAD_FAIL=
if "%CURL_EXEC%"=="" (
  echo curl is needed. skip...
  set DOWNLOAD_FAIL=YES
) else (
  %CURL_EXEC% -o cmake\modules\GenerateSourceGroups.cmake https://trac.osgeo.org/geos/export/4398/trunk/cmake/modules/GenerateSourceGroups.cmake
)
exit /b



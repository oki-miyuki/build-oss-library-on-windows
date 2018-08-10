rem ---------------
rem BUILD OpenSSL
rem ---------------

pushd %~dp0

call ..\inspect_vc.bat

for /d %%d in (%OSS_LIB_SOURCE%\openssl-*) do @set OPENSSL_DIR=%%d


if "%OPENSSL_DIR%"=="" (
  echo OpenSSL is not found. skip...
  goto end
)

pushd %OPENSSL_DIR%

echo ======================================================
echo  BUILD OpenSSL
echo ======================================================

if "%MACHINE_TARGET%"=="x86" (
 perl Configure VC-WIN32 --prefix=%OSS_LIB_DIR%\openssl --openssldir=%OSS_LIB_DIR%\openssl\ssl
) else if "%MACHINE_TARGET%"=="x64" (
 perl Configure VC-WIN64A --prefix=%OSS_LIB_DIR%\openssl --openssldir=%OSS_LIB_DIR%\openssl\ssl
) else (
 echo Unknown fix this part.
 pause
)

nmake clean
nmake
nmake test
nmake install

set OPENSSL_DIR=

popd

rem -------------
rem gathering
rem -------------
call ..\mkl_inc.bat openssl
call ..\mkl_lib.bat openssl

:end

popd

@echo off
cl >NUL 2> clres.txt 

rem
rem set Visual Studio C++ version
rem

echo Visual Studio Version is:

FINDSTR /R /C:"Version 13." clres.txt >NUL 2>&1 && (
  echo vs2003
  set VCVER=7
  set VCTOOL=v70
) || FINDSTR /R /C:"Version 14." clres.txt >NUL 2>&1 && (
  echo vs2005
  set VCVER=8
  set VCTOOL=v80
) || FINDSTR /R /C:"Version 15." clres.txt >NUL 2>&1 && (
  echo vs2008
  set VCVER=9
  set VCTOOL=v90
) || FINDSTR /R /C:"Version 16." clres.txt >NUL 2>&1 && (
  echo vs2010
  set VCVER=10
  set VCTOOL=v100
) || FINDSTR /R /C:"Version 17." clres.txt >NUL 2>&1 && (
  echo vs2012
  set VCVER=11
  set VCTOOL=v110
) || FINDSTR /R /C:"Version 18." clres.txt >NUL 2>&1 && (
  echo vs2013
  set VCVER=12
  set VCTOOL=v120
) || FINDSTR /R /C:"Version 19." clres.txt >NUL 2>&1 && (
  echo vs2015
  set VCVER=13
  set VCTOOL=v130
) || FINDSTR /R /C:"Version 20." clres.txt >NUL 2>&1 && (
  echo vs2017
  set VCVER=14
  set VCTOOL=v140
) || (
  echo unkonwn version
  set VCVER=
)


echo Machine Target:
FINDSTR /R /C:"80x86" clres.txt >NUL 2>&1 && (
  echo 80x86
  set MACHINE_TARGET=x86
) || FINDSTR /R /C:"x64" clres.txt >NUL 2>&1 && (
  echo x64
  set MACHINE_TARGET=x64
) || (
  echo unknown target
  set MACHINE_TARGET=
)

del /Q clres.txt

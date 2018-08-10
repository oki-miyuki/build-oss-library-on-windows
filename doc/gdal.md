# GDal

Gdal のインストール先を設定する
set GDAL_HOME=c:\gdal

nmake -f makefile.vc
nmake -f makefile.vc devinstall


## Optional Setting

nmake.opt の内容に沿って記述します。 
ここでは環境変数を設定する形を取っていますが、nmake.opt ファイルを編集し書き換えても良いです。

スクリプトをサポートする場合には 
[Swig](http://www.swig.org/)をインストールする

### Use Python support

Python ディレクトリを指定する

set PYDIR = "d:\python27"

### Use Java support

JDKをインストールしたディレクトリを指定する

set JAVA_HOME=d:\Java\jdk-9.0.1


### IConv

使用する場合は、 
LIBICONV_DIR = "C:\Program Files\GnuWin32" 
LIBICONV_INCLUDE = -I$(LIBICONV_DIR)\include 
LIBICONV_LIBRARY = $(LIBICONV_DIR)\lib\libiconv.lib 
LIBICONV_CFLAGS = -DICONV_CONST=const 
を設定する。本プロジェクトでは使用しない


### SQL Server

使用する場合は、
SQLNCLI_VERSION = 11
SQLNCLI_DIR = C:\Program Files (x86)\Microsoft SQL Server\$(SQLNCLI_VERSION)0\SDK
SQLNCLI_LIB = "$(SQLNCLI_DIR)\Lib\x86\sqlncli$(SQLNCLI_VERSION).lib"
SQLNCLI_INCLUDE = "-I$(SQLNCLI_DIR)\Include" -DSQLNCLI_VERSION=$(SQLNCLI_VERSION) -DMSSQL_BCP_SUPPORTED=1
を設定する。本プロジェクトでは使用しない

### Jpeg

使用する場合は
JPEG_EXTERNAL_LIB = 1
JPEGDIR = c:/projects/jpeg-6b
JPEG_LIB = $(JPEGDIR)/libjpeg.lib
を設定する。本プロジェクトでは、Jpeg をビルドしていれば、それを利用する。



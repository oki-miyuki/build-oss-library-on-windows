# GDal

Gdal �̃C���X�g�[�����ݒ肷��
set GDAL_HOME=c:\gdal

nmake -f makefile.vc
nmake -f makefile.vc devinstall


## Optional Setting

nmake.opt �̓��e�ɉ����ċL�q���܂��B 
�����ł͊��ϐ���ݒ肷��`������Ă��܂����Anmake.opt �t�@�C����ҏW�����������Ă��ǂ��ł��B

�X�N���v�g���T�|�[�g����ꍇ�ɂ� 
[Swig](http://www.swig.org/)���C���X�g�[������

### Use Python support

Python �f�B���N�g�����w�肷��

set PYDIR = "d:\python27"

### Use Java support

JDK���C���X�g�[�������f�B���N�g�����w�肷��

set JAVA_HOME=d:\Java\jdk-9.0.1


### IConv

�g�p����ꍇ�́A 
LIBICONV_DIR = "C:\Program Files\GnuWin32" 
LIBICONV_INCLUDE = -I$(LIBICONV_DIR)\include 
LIBICONV_LIBRARY = $(LIBICONV_DIR)\lib\libiconv.lib 
LIBICONV_CFLAGS = -DICONV_CONST=const 
��ݒ肷��B�{�v���W�F�N�g�ł͎g�p���Ȃ�


### SQL Server

�g�p����ꍇ�́A
SQLNCLI_VERSION = 11
SQLNCLI_DIR = C:\Program Files (x86)\Microsoft SQL Server\$(SQLNCLI_VERSION)0\SDK
SQLNCLI_LIB = "$(SQLNCLI_DIR)\Lib\x86\sqlncli$(SQLNCLI_VERSION).lib"
SQLNCLI_INCLUDE = "-I$(SQLNCLI_DIR)\Include" -DSQLNCLI_VERSION=$(SQLNCLI_VERSION) -DMSSQL_BCP_SUPPORTED=1
��ݒ肷��B�{�v���W�F�N�g�ł͎g�p���Ȃ�

### Jpeg

�g�p����ꍇ��
JPEG_EXTERNAL_LIB = 1
JPEGDIR = c:/projects/jpeg-6b
JPEG_LIB = $(JPEGDIR)/libjpeg.lib
��ݒ肷��B�{�v���W�F�N�g�ł́AJpeg ���r���h���Ă���΁A����𗘗p����B



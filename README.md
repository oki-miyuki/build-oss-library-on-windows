# build-oss-library-on-windows
## Concept

Summarize procedures for compiling C / C ++ based open source libraries with Visual Studio under Windows environment. 

note: Visual Stuido 2015 later: [vcpkg](https://github.com/Microsoft/vcpkg/tree/master/ports) is better solution.

## Common Environment
Set the following environment variables and build a library accordingly 

Directory to extract open source libraries archives 
OSS_LIB_SOURCE=c:¥Downloads  
Directory for build results.
OSS_LIB_DIR=c:¥Libs  

## Directory structure of this project
/doc  
 Manage the document describing the build method in [the library name].md format 
 
/script  
 (Build all libraries batch file.) 
 build.bat  
 
/script/[the library name]  
  (Build the library batch file.) 
  build.bat  
  
## Required
 - [Perl](https://www.activestate.com/activeperl)
 - [nasm](http://www.nasm.us/)
 - [Tcl](https://www.activestate.com/activetcl)
 - Visual C++
 
## How to build
 
 - Perl, nasm, tcl is required for building. In the build environment, you need to be able to execute these exes.
 - Extract the library source files, to OSS_LIB_SOURCE directory.
 - Edit OSS_LIB_SOURCE and OSS_LIB_DIR path on the /build.bat
 - Ope Visual Studio command prompt
 - run /script/build.bat 

## Directory structure of OSS_LIB_DIR
/bin  
  \*.dll 

/include  
 \*.h, \*.hpp, \*.inc, \*.def \*.cmake 

/lib  
 \*.lib

/data
  Projection parameter files (Proj)  

/[the library name]  
  the installed files of the library  
  

# build-oss-library-on-windows
## コンセプト
C,C++系のオープンソース・ライブラリをウィンドウズ環境下のVisual Studio でコンパイルする手順をまとめる。
## 共通環境
環境変数を設定し、これに則ってライブラリを構築する  
オープンソース・ライブラリを展開するディレクトリ  
OSS_LIB_SOURCE=c:¥Downloads  
オープンソース・ライブラリをコンパイルし、バイナリをインストールするディレクトリ  
OSS_LIB_DIR=c:¥Libs  

## このプロジェクトのディレクトリ構成
/doc  
 ビルド方法を記述したドキュメントを、ライブラリ名.md 形式で管理する  
 
/script  
 全てのライブラリをビルドするバッチファイル  
 build.bat  
 
/script/ライブラリ名  
  ライブラリをビルドするバッチファイル  
  build.bat  
  
## OSS_LIB_DIR の構成
/bin  
  \*.dll を置く  

/include  
ライブラリ名下に、それぞれの include ファイルを置く  

/lib  
lib ファイルを置く  

/data
  Projection パラメータ・ファイルを置く(Proj)  

/ライブラリ名  
  個々のライブラリでインストールされた構成を、ここに残す  
  

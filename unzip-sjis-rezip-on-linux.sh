#!/bin/sh -ue
winzip=zipped-on-win.zip
newzipSjis=zipped-on-linux-sjis.zip
newzipUtf8=zipped-on-linux-utf8.zip
workdir=tmp

# Windowで作った日本語(sjis)を含むzipファイルを
# 正しくUTF-8で展開する
mkdir "$workdir"
unzip -d "$workdir" -O sjis "$winzip"

# おまけ: Linuxでzipしなおす(utf8)
cd "$workdir"
zip -r "../$newzipUtf8" .
cd -

# convmvでUTF-8のファイル名を再帰的にsjisにする
# convmvは
#  sudo apt install convmv
#  sudo yum install convmv
# で。
convmv -r -f utf8 -t sjis "$workdir" --notest

# Linuxでzipしなおす(sjis)
# Powershell 7でExpand-Archiveすると化ける。
# Powershell 5だとsjisでもutf8でも化けない。
cd "$workdir"
zip -r "../$newzipSjis" .
cd -

# workdirを削除
rm -rf "$workdir"

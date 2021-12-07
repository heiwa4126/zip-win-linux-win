# zip-win-linux-win

WindowsでZIPしたファイルに日本語があると
展開したときに化けるので
対策のテスト。

`zipped-on-win.zip` は Windowsで作ったzipファイル。

これを `unzip-sjis-rezip-on-linux.sh` で

1. UTF8ファイル名で正しく展開する。
1. そのままUTF8ファイル名で `zipped-on-linux-utf8.zip` を作る。
1. UTF8ファイル名を再帰的にSJISに変換する
1. SJISファイル名で `zipped-on-linux-sjis.zip` を作る。

というサンプル。


# 参考

[Windows⇔Linux間での zip ファイルの文字化けを解決する(zip,unzip,7za) | SIOS Tech. Lab](https://tech-lab.sios.jp/archives/8843#Linux_Windows)


# メモ

```powershell
Expand-Archive -Path .\zipped-on-linux-sjis.zip -DestinationPath sjis
Expand-Archive -Path .\zipped-on-linux-utf8.zip -DestinationPath utf8
```

* PowerShell 5だとsjis版もutf8版も期待したとおりに展開される。
* PowerShell 7だとsjis版は化ける。
* Windows OS内蔵や7-zipだと両方ともOK。

UTF-8にしとくのが無難かな... Windows以外でもOKだし...

## Protocol Buffersとは
- Google謹製のデータの通信・永続化のためのシリアライズフォーマット
- データをファイル保存できたりネットワーク転送できる形式に変換しなければいけない。すなわちメモリ上に散在しているであろうデータを連続するメモリ領域に配置換えする必要があり、この操作のことをシリアライズ（データの直列化）という

## JSONと比べて
### メリット
- データサイズが小さい
- エンコード、デコードが速くて省メモリ

### デメリット
- エンコードされたデータが人間には読みにくい or 読めない
- 事前にスキーマを定義するファイル（.proto）を用意する必要があり一手間かかる

## RPCとは
- Remote Procedure Call
- ネットワークによって接続された他のコンピュータ上でプログラムを呼び出し、実行させるための手法のこと
- 
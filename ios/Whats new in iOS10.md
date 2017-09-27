## App Search Enhancements
Core Spotlight frameworkに機能追加がありました。
Core Spotlightでの検索クエリをアプリに引き継いだり、アプリ内でも、インデックス済みのデータを検索できるようになったみたいです。
[参考記事](https://www.captechconsulting.com/blogs/core-spotlight-enhancements-in-ios-10)

## User Notifications
- ローカル通知の配信タイミングを位置情報や時間などからスケジューリングできるようになった
- ローカル通知やPUSH通知をユーザが受け取った後でも内容を変更できるようになった
- ローカル通知やPUSH通知の見た目をよりリッチにする事ができるようになった
[コチラの記事が参考になりました](http://qiita.com/mishimay/items/9451b85982e2288ee4aa)

## Speech Recognition
iOS10から、音声認識の新しいAPIが`Speech Framework`として追加されました。音声を認識し、文字に直してくれます。
対応言語は58言語もあるようです。リアルタイム音声にも、録音済み音声にも対応しています。
[【iOS 10】Speechフレームワークで音声認識 - 対応言語リスト付き](http://d.hatena.ne.jp/shu223/20160615/1466036672)

## Widget Enhancements
iOS10から、ロック画面、ホーム画面の左側に`Today Widget`というものが出てきたのですが、
自分のアプリのウィジェットをそこに追加することができるようになりました。
`Today Extension`というものが追加されています。

## CallKit
`CallKit framework`というフレームワークが新たに追加されて、VoIPアプリに対して
- iPhoneの電話UIの提供
- ロック画面での着信画面の表示
- 連絡先の管理

ができるようになりました。よりiPhoneの電話アプリと近い体験を提供できます。

## Haptic Feedback

iPhone7とiPhone7Plusでは、ピッカー選択の時などに振動で伝える機能が備わっているのですが、そのような新たな物理的フィードバックを実装することができます。
`UIFeedbackGenerator`クラスと3つのそのサブクラスで実現します。

### UIImpactFeedbackGenerator
２つの物体が衝突した時などに、それを補完するようなしっかりした振動を与える。

### UINotificationFeedbackGenerator
何かの行動をした時に、それが完了したのか、失敗したのか、なんらかの警告が出たのかを示すような振動を与える

### UISelectionFeedbackGenerator
選択が変化している事を感じさせる振動を与える。ピッカーをスクロールしている間など

## SiriKit
サードパーティのアプリが、Siriに機能提供をできるようになりました。
例えば、「”アプリ名”から”だれだれさん”に”ありがとう”とメッセージを送って」とSiriに言うと、そのアプリからメッセージが送れるみたいなイメージです。
現在以下の機能がSiriを使って提供できます。
- 音声通話の開始
- ビデオ通話の開始
- 通話履歴の検索
- メッセージの送信
- メッセージの検索
- 写真の検索
- スライドショーの再生
- 他のユーザへの支払い
- 他のユーザへの支払い要求
- ワークアウトの開始
- ワークアウトの一時停止
- ワークアウト再開
- ワークアウト終了
- キャンセル
- 乗車予約
- 乗車の予約状況
- 車での音楽操作
- 車の設定変更
- 車の環境変更（温度など）
- レストラン予約情報の取得

[詳しくはコチラ](https://developer.apple.com/library/prerelease/content/documentation/Intents/Conceptual/SiriIntegrationGuide/SiriDomains.html#//apple_ref/doc/uid/TP40016875-CH9-SW2)

Intents Extensionというものが追加されているので、Extensionとして作成すれば良いです。

## Proactive Suggestions
NSUserActivityにアプリの情報を渡してあげることで、Mapアプリでのサジェスションに出たり、iMessageでの入力補完に登場してくれる。

## Integrating with the Messages App
Extensionを開発することによって、Messageアプリと連携できる。
「ステッカーパック」と、「Messageアプリで使えるカスタムインターフェイス」を作ることができる。
[リファレンス]((https://developer.apple.com/reference/messages)
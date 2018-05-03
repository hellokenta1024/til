- udemy
- http://qiita.com/advent-calendar/2016/react-native
- https://facebook.github.io/react/tutorial/tutorial.html
- http://qiita.com/advent-calendar/2014/reactjs
- http://mae.chab.in/archives/2943
- http://qiita.com/advent-calendar/2015/reactjs

## JSX

### JSXとは
- Javascript XML
- Javascripのコードの中でXML風の宣言的な記述を行うための仕様

### JSXをReact内で使うメリット
- HTMLと同様のやり方で要素のツリーをマークアップできる
- 意味のわかりやすいセマンティックな記述をできる
- アプリケーションの構造が可視化される
- Reactの内部表現が抽象化される
- マークアップとそれを生成するコードが一箇所にまとまる
- 最終的にJavascriptに変換される

## package.json
"enzyme": "^3.3.0",
"enzyme-adapter-react-16": "^1.1.1",
"fetch-jsonp": "^1.1.3",
"history": "^4.7.2",
"jest-fetch-mock": "^1.5.0",
"material-ui": "1.0.0-beta.30",
"prop-types": "^15.6.1",
"qs": "^6.5.1",
"react": "^16.3.2",
"react-dom": "^16.3.2",
"react-redux": "^5.0.7",
"react-router-dom": "^4.2.2",
"react-router-redux": "next",
"react-scripts": "1.1.4",
"react-test-renderer": "^16.3.2",
"redux": "^4.0.0",
"redux-logger": "^3.0.6",
"redux-mock-store": "^1.5.1",
"redux-thunk": "^2.2.0"

## Deploy
- Firebase Hosting

## サーバサイドレンダリング
### メリット
- 初期表示が早まる
### デメリット
- サーバへの負担が高まる
- アプリケーションが複雑になる
### 背景
- 以前は検索エンジンのクローラーがJavaScriptを実行できなかったから、SEOが重要なサービスでは必須だった。

### 流れ
- サーバにリクエストを送信
- サーバがリクエストを受信
- データベースや外部のAPIから必要なデータを取得
- データを元にReact Elementを構築し、HTMLに変換
- ブラウザで動作するJSに引き継ぐために上のデータをシリアライズ
- 上２つの埋め込んだ完全なHTMLを生成
- レスポンスとして送信
- ブラウザ：HTMLやCSSをパースしコンテンツを描画
- ブラウザ：JSにを実行

### Tips
- クライアントとサーバのどちらでも動作するコードをIsomorphic Javascriptと呼ぶ
- 広いJavaScriptの動作環境を意識して記述したこーどをUniversal JavaScriptという

# What happens when you call `setState`
- merging the object you passed into `setState` into the current state of the component.
- this will kick off a process called reconciliation
- 
## staticとclassの違いn
- staticはオーバーライドできない

## @discardableResult アノテーション
- 返り値のある関数の返り値を使用せずに関数を使用した場合に、警告がでるようになった。
- 返り値を使わない事を許可する場合は、@discardableResult アノテーションを付けるとでなくなる

# クラスとオブジェクトについて

## プログラム実行時のメモリの状態
iOSは実行するアプリに専用のメモリ領域を割り当てます。アプリは割り当てられたメモリを以下の4つの領域に分けて使用します。

### プログラム（実行コード）領域
コンパイル後のプログラム実行コードが置かれる領域
### 静的領域
グローバル変数が置かれる領域
### スタック領域
ローカル変数や、メソッドの引数、メソッドの戻り値が置かれる領域。関数やメソッドの単位で管理されている。
### ヒープ領域
クラスの定義や、オブジェクトが置かれる領域

## クラスの定義とメモリの関係
```swift
class HTTPRequest {
  let url: String
  init(url: String) {
    self.url = url
  }

  func startRequest() {
    // 処理
  }
}
```

上記のクラスの情報は以下のようにヒープに配置される
- クラスの情報
  - クラスの名前と親クラスの情報
- プロパティの情報
  - プロパティのサイズ
  - プロパティのリスト
- メソッドの情報
  - メソッドのリスト

## Objective-Cの動的型付け
[Objective-Cの動的型付け](http://s.news.mynavi.jp/column/objc/002/index.html)
[Objective-Cの動的メソッド呼び出しの実装詳細を調べてみました](http://qiita.com/kunichiko/items/a0b8ce64518fbf3eac0a)
- C++が構造体を拡張する形でクラスを採用したのに対して、Objective-Cでは、オブジェクトのためにSmalltalkに近い完全に別の文法を取り入れている
- Objective-Cは原理的に、id型のオブジェクトを実行時に判定する動的型付けの言語である

## Understanging Swift Performance
[解釈記事](http://wpdev.hatenablog.com/entry/2016/11/02/082027)
[WWDC動画](https://developer.apple.com/videos/play/wwdc2016/416/)

### メモリ確保
- Stackはシンプル。
  - ポインタ加算でメモリ確保、減算でメモリ破棄
- Heapは多機能
  - 「空き」を探しメモリ確保する
  - その領域に再挿入することでメモリ破棄
  - Heapは様々なスレッドからアクセスされるので「保護」する必要がある
  - このコストは決して小さくはない

### 参照カウンタ
- スレッドセーフのためオーバーヘッドがある

### メソッド呼び出し
- 静的メソッド
  - 直接該当メソッドの実装にジャンプする
  - インライン化など最適化が走る
- 動的メソッド
  - どの実装にジャンプするか、Lookupテーブルを参照しながら行う
  - 最適化などは走らない（走りづらい）
- classの場合、継承の都合でこの「ジャンプする実装を探す」のに時間がかかる
  - structは継承できないのでこの「探す」操作が不要
  - final class も継承できないので速い

??動的メソッドとかあったら、Swiftは静的言語っていうの、、？？静的型付け言語とはいうの、、？？

### どのようにして（型情報を持たない）構造体で多様性を実現しているか？
- Existential Container
  - プロトコルメソッド呼び出し時、構造体やクラスを一時的に「包む」ための特殊な構造体
- Value Witness Table（VWT）
  - 特定の型の、allocate,copy,destruct,deallocateへのメソッドの参照
  - 理解しきれてないですが、Swift-StructはC-Structと違い第一要素として「型情報へのポインタ」を持ってるような感じがします。
  - この型情報の指している先がVWT
- Protocol Witness Table
  - 特定の型の、あるプロトコルのメソッドの参照
  - 型をKeyに、プロトコルの実装メソッド参照をValueにもつDictみたいなもの。

これら３つが組み合わさって実現される

### Protocolのメリット
https://speakerdeck.com/ishkawa/protocol-extension
- クラスだと、オーバーライドの際、型安全に書くことができない
- プロトコルはstored propertyを持つことができない

## Storyboardable
```swift
extension NSObjectProtocol {
  static var className: String {
    return String(describing: self)
  }
}

protocol Storyboardable: NSObjectProtocol {

  static var storyboardName: String { get }
  static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {

  static var storyboardName: String {
    return className
  }

  static func instantiate() -> Self {

    return UIStoryboard(
      name: storyboardName,
      bundle: Bundle(for: self)
    ).instatntiateInitialViewController() as! Self
  }
}
```

## OSS
https://medium.mybridge.co/21-amazing-open-source-ios-apps-written-in-swift-5e835afee98e

## continue in forEach
can not use `continue` in `forEach` because `forEach` is not loop statement.

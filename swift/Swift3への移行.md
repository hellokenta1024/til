# Swift3対応をこれからする人が役立ちそうなこと！

どうも、iOSエンジニアの原健太([@kEn_chaN_1024](https://twitter.com/kEn_chaN_1024))です。

先日、[Anny MagazineのiOSアプリ](https://itunes.apple.com/us/app/dan-sheng-riya-ji-nian-rinogifutowo/id1056989588?l=ja&ls=1&mt=8)をSwift3対応しました！
これから対応する方々の参考になればと思い、まとめました！

## 実装期間
1人で、他のタスクなども並行して対応していましたが、2〜3週間かかりました。

## ライブラリのアップデート
使用しているライブラリをSwift3に対応したバージョンに上げる必要があります。
Swift3に対応していないライブラリも中にはありますので、ちゃんと確認してからSwift3対応に着手するのかを決めましょう。

Anny Magazineでは、ライブラリ管理をCarthageで行っているので、その時に大変だった事を書いていきます。

### Alamofire(https://github.com/Alamofire/Alamofire)
Alamofireは以前は3系を使っていましたが、4系を使うことになり、APIが少々変更になりました。
こちらはAPIの本数分修正しなければいけなかったので、ライブラリに依存したコードを散在させない設計は大事だなと思いました。
SwiftyJSONも使っているので、以下のようなコードになりました。

#### before
```
Alamofire.request(Router.readCoupons(Api.user.userId)).validate().response { (request, response, data, error) -> Void in		
    if let error = error {
      // error handling
    } else {
      // success handling
    }
}
```

#### after
```
Alamofire.request(Router.createLikedDashProduct(userId: Api.user.userId, productId: productId)).validate().responseJSON { response in

    switch response.result {

    case .success(let data):
        let json = JSON(data)
        // success handling

    case .failure(let error):
        // error handling
}
```

### SwiftValidator(https://github.com/jpotts18/SwiftValidator)

- before : `Validators.isEmail()(senderEmailAddress)`
- after : `EmailRule().validate(senderEmailAddress)`

### Realm
- before : `Realm().objects(Receiver).first`
- after : `Realm().objects(Receiver.self).first`

### Google Analytics
#### 値を返すメソッドには@discardableResultを明示しない限り、受け皿が必要になりました。

- before `gai?.tracker(withTrackingId: Configuration.gaTrackingId)`
- after `_ = gai?.tracker(withTrackingId: Configuration.gaTrackingId)`

#### NSMutableDictionaryを[AnyHashable: Any]にキャスト
トラッキングするには、`NSMutableDictionary`を`[AnyHashable: Any]`にキャストしなければいけませんが、直接ではいけないので、
NSMutableDictionary -> NSDictionary -> [AnyHashable: Any]
という順番でキャストしています、、、

```
let events = (builder.build() as NSDictionary) as? [AnyHashable : Any]
tracker?.send(events)
```

### Eureka(https://github.com/xmartlabs/Eureka)
- before: `$0.addRule(RuleRequired())`
- after: `$0.add(rule: RuleRequired())`

### carthage updateは--no-use-binariesのオプションを
ライブラリ管理にCarthageを用いている場合は、update後に
Module compiled with Swift 3.0 cannot be imported in Swift 3.0.2

のようなエラーが出る場合があります。これは、引っ張ってきたバイナリデータがSwift3.0でコンパイルされている事によるエラーなので、
--no-use-binariesのオプションを付けて、バイナリデータを引っ張ってこない事を明示しなければいけません。

また、その度に全てのライブラリをアップデートする必要はなく、以下のようにこのようなエラーが出たライブラリだけに対して`carthage update`することも出来ます。

```sh
carthage update --platform iOS --no-use-binaries SwiftyJSON
```

## Xcode Converter

Xcodeで、
Edit -> Convert -> To Current Swift Syntax
と選択すると、自動でSwift3への変換をある程度行ってくれます。
こちら、一回だけだと漏れている部分が多々ありますが、2 - 3回行うとほぼ正確にやってくれました。

### メソッドの定義の変更
上記の自動コンバートで、メソッドの第一引数のラベルが省略されてしまいました、、、
こんな感じです。
### before
- 呼ばれる側：`func add(num1: Int, num2: Int)`
- 呼ぶ側：`add(num1: 1, num2: 3)`

### after
- 呼ばれる側：`func add(_ num1: Int, num2: Int)`
- 呼ぶ側：`add(1, num2: 3)`

僕は、第一引数もラベルを省略しない書き方が好きだったので、一括変換などで、元に戻すのを少し頑張ったのですが、最終的には多すぎて心が折れました、、、
なので、今は全てのメソッドが第一引数のラベルが省略された形になっています、、、(泣)

## NSErrorをErrorに変更

NSErrorをErrorに変更すると、従来使えていた`userInfo`などが使えなくなりステータスコードなどが取得できなくなったので以下のような修正をしました。

以前は
```
if let statusCode = error.userInfo["StatusCode"] as? Int {
   if case .forbidden = error {                   
     if statusCode == 403 {
     }
   }
```

こんな感じのApiError作った

```
enum ApiError: Error {

    case unauthorized
    case forbidden
    case notFound
    case serverError
    case others

    init?(statusCode: Int?) {

        guard let statusCode = statusCode else { return nil }

        switch statusCode {
        case 401:
            self = .unauthorized

        case 403:
            self = .forbidden

        case 404:
            self = .notFound

        case 500...599:
            self = .serverError

        default:
            self = .others
        }
    }
}
```

## Fix All in scopeコマンドがある
ポチって押すと自動で直るワーニングあるじゃないですか？？
黄色い三角の中に丸があるやつ。
ファイル中のそのワーニングを一気に直す、`Fix All in Scope`っていうコマンドがあります。
XcodeのEditor -> Fix All in Scope（control+option+command+F）
で実行できます。

が、asのキャストとか無駄に入るので要注意です。

## selectorの書き方
以前はこんな感じでも成り立っていたんですが、ちゃんと引数書かなきゃいけなくなった

これが、

```
pushedButton(sender: AnyObject) { ... }
```
- before : `#selector(ViewController.pushedButton(_:))`
- after : `#selector(ViewController.pushedButton(sender:))`

## ちょこちょこClosureの引数の型が変わってる
`UIActivityViewController`とか、`CSSearchableIndex`とかのクロージャの引数の型がちょこちょこ変わったりしていて、Xcodeの自動Convertでは変わらなかったので，手動で変更する必要があります。

## ジェネリクスメソッド
以前はこのようなコードが動いていました。ジェネリクスメソッドに対して、定数初期化の時の型指定で型推論してくれていたんですが、してくれず、Errorをはくようになりました。
ジェネリクスで共通化していた部分をばらして、普通に堅い型として記述したんですが、そうするしか無かったのでしょうか、、？？

```
fileprivate func configureInformationCell<T: InformationCellType>(_ collectionView: UICollectionView, indexPath: IndexPath) -> T where T: UICollectionViewCell {
}

let cell: InformationListCollectionViewCell = configureInformationCell(collectionView: collectionView, indexPath: indexPath)
```

## 返り値を返すメソッドには受け皿が必要になった
こちらはGoogle Analyticsの時にも書いたのですが、`@discardableResult`を明記しない限り、返り値があるメソッドにはその受け皿が必要になりました。
```
self?.navigationController?.popViewController(animated: true)
_ = self?.navigationController?.popViewController(animated: true)
```

## if else endif
```
#if / #else / #endif の間に挟まれているコードはマイグレーションツールに無視されて、 Swift 2 のままです。なので、手動で直す必要があります。
```

## Travis CIでのビルドがこける
こちらはノウハウというか現状抱えている課題なのですが、Travis CIのBuildがコケるようになりました。
Build PhasesのCarthageのRun Scriptでタイムアウトしてしまいます。

## まとめ
正直めちゃくちゃストレスフルな根気のいる作業でした。
Apple、やってくれたな！！！！
Swift4からは互換性を持たすと言っていますが、本当でしょうか。
Swift3対応しているiOSエンジニアがいる組織では、ぜひその人を励ましてあげてほしいです。
そして、そんな苦しんでいるiOSエンジニアの手助けに少しでもなれば幸いです。

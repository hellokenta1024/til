
http://qiita.com/k5n/items/17f845a75cce6b737d1e
## Observable
- onNext
- onCompleted
- onError

## PublishSubject
- Observableでありつつ、イベントを発生させるためのための`onNext,onCompleted,onError`メソッドを提供している

## BehaviorSubject
- subscribeすると即座に最初に通知をするSubject
- 生成する時に初期値を設定できる

## Variables
- BehaviorSubjectをラップしている
- deallocateされた時に`onCompleted`が呼ばれる
- BehaviorSubject と違ってonError / onCompleted を明示的に発生させることはできないため、現在値取得で例外が発生することはありません。
- Variableとして公開しておけば、自前クラスでもbindすることができる

## DisposeBag
- ` disposed(by: )`

## イベントの合成
### merge
- ２つの同じ型のイベントストリームを１つにまとめることができる

### combineLatest
- 直近の最新値同士を組み合わせたイベントを作る

### sample
- ある Observable の値を発行するタイミングを、もう一方の Observable をトリガーして決める場合に使います。
- 例えば画面上にある部品が、押すと移動できるようになっているとします。移動中は position プロパティが位置を通知してくるけれど、指を離して位置が確定したときだけ教えてくれればいい。
### withLatestFrom
- あるObservableにもう一方のObservableの最新値を合成する

## Hot&Cold
- HotやColdはObservableの性質
- OperatorはObservable
- SubjectはHot
- ほとんどのOperatorはCold
- https://www.slideshare.net/yukitakahashi3139241/hot-cold

## Qiita記事
### RxCocoaが提供するDriverって何？
http://qiita.com/k5n/items/44ef2ab400f47fb66731

### オブザーバーパターンから始めるRxSwift入門
http://qiita.com/k5n/items/17f845a75cce6b737d1e

### RxSwift入門(2) 非同期処理してみる
http://qiita.com/k5n/items/98aaf84fc164f7a5502c

### RxSwiftの動作を深く理解する
http://qiita.com/k5n/items/643cc07e3973dd1fded4

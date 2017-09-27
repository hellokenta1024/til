## リアクティブプログラミング

- データフローとその伝播を中心としたプログラミング

### Reactive Extension
- 観測可能なシーケンス（Observable Sequences）を使うことで非同期でイベントベースのプログラムを合成するライブラリ
- オブザーバパターンをベースにしている
- イベントを発火（emit）するものをObservableと呼ぶ
- そのイベントを観測（subscribe）する主体をObserverという
- JSFiddle

#### Subscription
- subscribeメソッドの戻り値
- disposeを呼ぶことでイベントのemitが不必要になったことを伝える

#### Cold Observable
- Observableは一般に購読するまでイベントを排出しない
- 購読するObserver毎に独立したイベントを排出する

#### Hot Observable
- 作成されたタイミングでイベントを排出しはじめる

#### Subject
- Observableであり、かつObserverであるもの

#### Scheduler
- 適切なSchedulerを指定することで、操作を別スレッドで行うことができる

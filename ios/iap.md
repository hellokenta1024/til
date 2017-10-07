## In-App Purchaseを使ったアイテム課金プログラミング（アプリケーション開発の教科書）

### 販売できるアイテムの種類は5種類

#### Consumable

- 消費アイテム
- ユーザがアイテムを買うとなくなる。

#### Non-Consumable

- 非消費アイテム
- 一度購入したらずっと使えるアイテム
- 例えば広告解除や機能制限解除

#### Auto-Renewable Subscriptions

- 自動継続型
- 期間を決めて課金するアイテム

#### Free Subscriptions

- 無料購読

#### Non-Renewing Subscriptions

- 購読型

### アイテム購入の流れ

1. アプリ内課金が使えるかチェック
2. アイテム情報の取得と購入処理の開始
3. アイテム購入流の処理
4. レシートの確認とアイテムの付与
5. 購入処理の終了

### StoreKitフレームワークの概要

- アイテムの情報を取得するためのクラス群
- アイテムの購入処理を行うためのクラス群

StoreKitフレームワークで重要なのは次の2つのプロトコル

- SKProductsRequestDelegate
    - アイテムの情報の処理をするためのプロトコル
- SKPaymentTransactionObserver
    - アイテムの購入を処理するためのプロトコル
実際のプログラムではこの2つのプロトコルを`UIViewController`のサブクラスに実装することになります。

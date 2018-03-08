[reference](https://qiita.com/suziq99999/items/2e7037042b31a77b19c8#cap%E5%AE%9A%E7%90%86)

# ACID
## A (atomicity)
- guarantee that all operations in a transaction are executed or not
- トランザクションよりも小さい単位で操作を分解しちゃ駄目

## C (consistency)
- guarantee that there is no inconsistency of the data in DB
- 一貫性

## I (isolation)
- guarantee that all the operation in a transaction doesn't effect other transactions.
- 直列処理するしかないが、それをやってると性能でないので、世にあるRDBMSは手加減して実装している

## D (durability)
- guarantee that transaction results are permanent.
- システム障害に耐える
- ログから障害発生前に戻れる

# CAP
- C: consistency (一貫性、いつも最新のデータが読める)
- A: availability (可用性、必ずデータにアクセスできる = 単一障害点がない)
- P: partition-tolerance (ネットワークの分断への耐性。複数サーバにデータの複製がある)

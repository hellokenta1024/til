# CSRF (Cross-Site Request Forgeries)
- サイトに攻撃用のコードを仕込む事で、アクセスしてきたユーザに意図しない操作を行わせる攻撃
- view helpers of Rails generate token automatically.
## RailsでCSRF対策を行う場合、開発者が気をつける点
- HTTP GETによるリンクでデータ操作を行わない
- データ操作のリクエストはビューヘルパー経由で生成する
- レイアウトを自分で作成する場合は、csrf_meta_tagsメソッドの呼び出しを忘れない

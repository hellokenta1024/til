## Hamlとは
- HTML Abstraction Markup Languageの略
- HTMLのtemplate engine
- HTMLをすっきり美しく

## Hamlの基本
- !!!はDOCTYPEの生成
- %タグ名で開始タグと閉じタグを生成
- 空白でネスト
- %html{lang: "ja"}で属性が付けられる
- `/ コメント`でHTML的なコメント
- `-# コメント`でHTMLには記載されないコメント
- `%p hello`で1行に表示される
- `%li<`で子要素の前後の改行をとる
- `%li<>`で親要素の中の改行を取る
- `%div#main.myClass`でid:main, class:myClass
- `#main.myClass`と書くだけでも上と同じタグが生成される
- `:css`や`:javascript`でフィルター生成
- `:escaped`タグの実態を自動で出して、エスケープしてくれる
- `#{5 * 3}`でRubyの式評価
- `- x = 5`ただ実行したい場合はハイフン
- `%p=`直後にイコールでRubyの式評価
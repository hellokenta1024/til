## ページ全体の仕組み
### meta要素
- Webページ自信に関する様々な情報を示す
- HTML5ではutf-8推奨
```html
<meta charset="utf-8">
```
### link要素
- 主にCSSを読み込むために使われる
- CSSの中でCSSを読み込む場合には
```HTML
<link rel="stylesheet" href="style.css">
```
```css
@import "style.css";
```

## グローバル属性
- style属性のように、どの要素にも共通して指定できる属性

## CSS設計
- CSS Architecture(http://philipwalton.com/articles/css-architecture/)
- 日本語訳(http://article.enja.io/articles/css-architecture.html)

## ul, ol, liなんの略
- ul は Unordered List の略。順序のないリスト。
- ol は Ordered List の略。順序のあるリスト。
- li は List Item の略。li は ul や ol などのリストの子要素。

## CSSの強さ
- タグが強い
- important > tag > id > class

# joins
- generate INNER JOIN
## specify multiple symbols
- `Book.joins(:reviews, :authors)`
```sql
select books.*, reviews.*, authors.* from books
inner join reviews on reviews.book_id = books.id
inner join authors_books on authors_books.book_id = books.id
inner join authors on authors.id = authors_books.authors_id
```

## Joins across multiple models
- `joins(reviews: :user)`

## strings
- LEFT JOIN or RIGHT JOIN
- `joins('LEFT OUTER JOIN reviews on reviews.book_id = book.id')`

# left_outer_joins
- since Rails5

# includes
関連モデルをまとめて別SQLで読み込む

# find
command to search file or directory
`find {search directory} {option}`

ex) `find . -name "*.txt"`
## When you want to delete error log
- find / -name pgsql -type d  2>/dev/null

# grep
command to search strings
searches through a file or group of files for a string

`grep [ -[[AB] ]num ] [ -[EFGBchilnsvwx] ] [ -e pattern | -f file ] [ files... ]`

- `-E`: 正規表現を使う
- `-h`: 検索結果の前にファイル名をつけない
- `-B2`: 条件にマッチした行の前2行も出力する
- `-v`: 結果の反転
- 

## Options
- -i: ignore case
- -G: user reglar expresion

# xargs
`find . -name "*.txt" | xargs rm -rf`

# setopt
- setopt -s dotglob

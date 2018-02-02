# find
command to search file or directory
`find {search directory} {option}`

ex) `find . -name "*.txt"`

# grep
command to search strings
searches through a file or group of files for a string

`grep [ -[[AB] ]num ] [ -[EFGBchilnsvwx] ] [ -e pattern | -f file ] [ files... ]`

## Options
- -i: ignore case
- -G: user reglar expresion

# xargs
`find . -name "*.txt" | xargs rm -rf`

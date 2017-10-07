## bashでの正規表現とif

```sh
if [[ "test" =~ t.st ]]; then echo "match"; fi
match
if [[ "t#st" =~ t.st ]]; then echo "match"; fi
if [[ "abc.mp3" =~ ^[^.]\.mp3 ]]; then echo "match"; fi

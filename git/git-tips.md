## Git diff Document
https://git-scm.com/docs/git-diff

```sh
git diff [commit] -- filepath
```

## how to use git tag
- `git tag -a v1.0.0 -m` `"``comment``"` `commit_id`
- `git push origin v1.0.0`
## delete untracked files
- `git clean -f`でuntracked filesを削除できる

## delete indexed file
`git reset HEAD sample.txt`
でインデックスのファイルを取り消す

## show diff between HEAD and index

```sh
git diff --cached
```
で、HEADとインデックスの差分を表示

## delete branch
```sh
git br -d <branchname>
```
でブランチの削除

## When files in .gitignore isn't ignored
- `git rm -r --cached ***`
- `--cached`
  - Use this option to unstage and remove paths only from the index. Working tree files, whether modified or not, will be left alone.

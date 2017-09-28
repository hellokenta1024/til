## hub command
### Installation
`brew install hub`

### alias
If you want to use `git XXX` instead of `hub XXX`, write the follow to `.zshrc`

`function git() {hub "$@"}`

### Cheat sheet
```sh
# open Github page comparing current branch and base branch
hub compare

# open current repository Github page
hub browse

# create pull request
hub pull-request
```

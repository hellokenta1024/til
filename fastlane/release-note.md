## Release Notes
- https://docs.fastlane.tools/getting-started/ios/beta-deployment/#release-notes

### prompt
```rb
  # Variant 1: Ask for a one line input
  changelog = prompt("Changelog: ")

  # Variant 2: Ask for a multi-line input
  #   The user confirms their input by typing `END` and Enter
  changelog = prompt(
    text: "Changelog: ",
    multi_line_end_keyword: "END"
  )
```

### automatically based on git commits
```rb
changelog_from_git_commits
changelog_from_git_commits(
  between: ['7b092b3', 'HEAD'], # Optional, lets you specify a revision/tag range between which to collect commit info
  include_merges: true # Optional, lets you filter out merge commits
)
```

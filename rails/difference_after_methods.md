# Difference of after_* methods
- after_commit is called on create, update and destroy.
- after_create is only called when creating an object
- after_create is called before the save (or create) returns.
- if an exception is raised in `after_create`, the save will be rolled back
- `after_commit` is called after transaction was commited. so the save won't be rolled back
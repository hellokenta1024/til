# Flow Type
## Optional, Maybe type
```
props: {
  foo?: number // field can be absent, but if passed, must be a number
}
props: {
  foo: ?number // mandatory field, either number or null
}
props: {
  foo?: ?number // optional field, whose value, if ever passed, can be null 
}
props: {
  foo: number // mandatory number
}
```
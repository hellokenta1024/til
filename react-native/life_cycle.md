# Life cycle
http://www.reactnativeexpress.com/lifecycle_api

## Mounting Cycle
- `constructor()`
- `componentWillMount()`
- `render() -> React Element`
- `componentDidMount()`

## Updating cycle
- `componentWillReceiveProps(nextProps)`
- `shouldComponentUpdate(nextProps, nextState) -> boolean`
- `componentWillUpdate(nextProps, nextState)`
- `render()`
- `componentDidUpdate(prevProps, prevState)`

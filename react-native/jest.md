# Line Coverage
- Many coverage tools reports line coverage
- Line coverage simply measures whether a particular line of code was excuted

# Statement Coverage
- Statement coverage is a slightly more specific metric which differentiates when multiple code statements are included on a single line of code.

# Branch Coverage
- https://stackoverflow.com/questions/35034977/what-is-a-branch-in-code-coverage-for-javascript-unit-testing

# writing tests
- https://redux.js.org/recipes/writingtests

# know how
- https://qiita.com/Takepepe/items/00af6d6cd3318fbe2aab#reducers%E9%87%8D%E8%A6%81%E5%BA%A6a
- stateを変更してほしくないactionがdispatchされた時に変更されていないかどうかテストするとなお良い
- reducerのinitialStateをexportしておくとproductionコードのスキーマ変更をテストコード側でも共有することができていい

# importance
- Reducers: A
- Components: A
- ActionTypes: B
- ActionCreators: C

# test of reducers
- snapshot-diff
  - https://qiita.com/akameco/items/31e2078c38ff2fd60213
  - リグレッションテストが簡単に出来る
  - コード量が少なくて済む
  - snapshotDiffライブラリを使うとreducerによって変更されている箇所が明確になる
- initialStateをexportしておく

> I am not familiar with snapshot testing, but I’m curious about it. What is the advantage over normal testing?

- we can do regression test easily. 
For example, we usually write this kind of code.

```js
it('should increment', () => {
  expect(reducer(initialState, { type: 'inc' })).toMatchObject({ count: 1 })
})
```
But even if we change other state unexpectedly, this test is passing.
So we should regression test. snapshot testing can prevent unexpected change.


- code amount will decrease
I wrote following wrapper method. So each test code for reducer got so small.
```js
export const reducerSnapshotTester = (reducer, initialState, tests) => {
  for (const t of tests) {
    it('should handle ' + t.type, () => {
      expect(
        snapshotDiff(initialState, reducer(initialState, t), {
          expand: true,
          aAnnotation: 'Before',
          bAnnotation: 'After'
        })
      ).toMatchSnapshot()
    })
  }
}
```

**visit reducer's test**

```js
reducerSnapshotTester(reducer, initialState, [
    { type: VisitActions.POLL_VISIT_REQUEST },
    { type: VisitActions.POLL_VISIT_SUCCESS, visit: { id: 'foo' } },
    { type: VisitActions.POLL_VISIT_FAILURE, error: { message: 'foo' } }
  ])
```

**output**
```
// Jest Snapshot v1, https://goo.gl/fbAQLP

exports[`Visit Reducer should handle @@shopper/POLL_VISIT_FAILURE 1`] = `
"Snapshot Diff:
- Before
+ After

  Object {
-   \\"error\\": null,
-   \\"fetchingVisit\\": true,
+   \\"error\\": \\"foo\\",
+   \\"fetchingVisit\\": false,
    \\"fetchingVisits\\": true,
    \\"fullRecords\\": Object {},
    \\"lastUpdated\\": null,
    \\"partialRecords\\": Object {},
    \\"uuid\\": null,
  }"
`;

exports[`Visit Reducer should handle @@shopper/POLL_VISIT_REQUEST 1`] = `
"Snapshot Diff:
Compared values have no visual difference."
`;

exports[`Visit Reducer should handle @@shopper/POLL_VISIT_SUCCESS 1`] = `
"Snapshot Diff:
- Before
+ After

  Object {
    \\"error\\": null,
-   \\"fetchingVisit\\": true,
+   \\"fetchingVisit\\": false,
    \\"fetchingVisits\\": true,
-   \\"fullRecords\\": Object {},
+   \\"fullRecords\\": Object {
+     \\"foo\\": Object {
+       \\"id\\": \\"foo\\",
+     },
+   },
    \\"lastUpdated\\": null,
    \\"partialRecords\\": Object {},
-   \\"uuid\\": null,
+   \\"uuid\\": \\"foo\\",
  }"
`;
```
# What ot test in React component
- https://hashedin.com/blog/unit-test-a-react-component/
- Test what the component renders by itself and not child behavior
  - It’s important to test all the direct elements that the component renders, at times it might be nothing. Also, Ensure to test the elements rendered by the component that are not dependent on the props passed to the component. This is why we recommend shallow rendering.
- Test the behaviour of the component by modifying the props
  - Every component receives props, and the props are sometimes the deciding attributes on how the component would render or interact. Your test cases can pass different props and test the behaviour of the component.
- Test user interactions, thus testing component internal methods
  - Components are bound to have user interactions and these user interactions are either handled with the help of props or methods that are internal to the component. Testing these interactions and thereby the components private methods is essential.
- propsの変化
- user interactionによる

# How to test onPress of Touchable components
- https://medium.com/@indvinoth/react-native-how-to-test-onpress-event-using-jest-1cb19115863e
```js
const touchableOpacity = wrapper.find('TouchableOpacity')
    touchableOpacity
      .first()
      .props()
      .onPress()
```

# Know How
- propsの違いによる表示の差異をsnapshotDiffでテスト
- ユーザイン寺クションをテスト

# なんのためのテストか
- 品質保証
  - テストが通ることで品質が保証されること
  - レビュー時間の短縮

# Date.nowのmockをするとき
- その後のケアをしなければいけない
- 

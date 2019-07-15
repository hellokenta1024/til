# Reconciliation

- [reference](https://reactjs.org/docs/reconciliation.html)
- 元々2つのツリーを比較する事は、最新のアルゴリズムを使用してもO(n^3)かかる
- Reactでは2つの過程に基づいて、O(n)に近い計算量で実現
  - 異なる型の2つの要素は
  - Two elements of different types will produce different trees
  - The developer can hint at which child elements may be stable across different renders with a key prop
- Elements of Different Types
  - Whenever the root elements have different types, React will tear down the old tree and build the new tree from scratch.
  - old DOM nodes are destroyed. Component instances receive `componentWillUnmount()`
  - Any state associated with the old tree is lost.
```javascript
<div>
  <Counter />
</div>

<span>
  <Counter />
</span>
```

- DOM elements of the same type
  - only updates the changed attributes
  
```javascript
<div className="before" title="stuff" />
<div className="after" title="stuff" />
```
  - when updating `style`, React also knows to update only the properties that changed.

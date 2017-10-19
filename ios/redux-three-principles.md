## iOS architecture using Redux + Rx
- https://speakerdeck.com/susieyy/redux-plus-rxwohuo-yong-sitaiosapuriakitekutiya

### Redux Theree principles
- Single souce of truth
  - express the state of the entire application in one object tree
- State is read-only
  - create an `action` to make changes
- Mutations are written as pure functions
  - create a new state and return it without directly changing the state

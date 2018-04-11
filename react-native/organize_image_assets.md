# Organize image assets

- assets
  - images
    - like.png
    - smile.png
  - images.js
- components
  - button.js

```js
const images = {
	likeImage: require('./images/like.png'),
	smileImage: require('./images/smile.png'),
};


export default images;
```

```jsx
<Image source={Images.likeImage}>
```
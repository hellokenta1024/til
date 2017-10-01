## Props

Your own components can also use props.
This lets you make a single component that is used in many different places in your app, with slightly different properties in each place. Just refer to this.props in your render function. Here's an example:

```js
import React, { Component } from 'react';
import { AppRegistry, Text, View } from 'react-native';

class Greeting extends Component {
  render() {
    return (
      <Text>Hello {this.props.name}!</Text>
    );
  }
}

export default class LotsOfGreetings extends Component {
  render() {
    return (
     <View style={{alignItems: 'center'}}>
       <Greeting name='Rexxar' />
       <Greeting name='Jaina' />
       <Greeting name='Valeera' />
     </View>
    );
  }
}

// skip this line if using Create React Native App
AppRegistry.registerComponent('AwesomeProject', () => LotsOfGreetings);
```
Using name as a prop lets us customize the Greeting component, so we can reuse that component for each of our greetings. This example also uses the Greeting component in JSX, just like the built-in components. The power to do this is what makes React so cool - if you find yourself wishing that you had a different set of UI primitives to work with, you just invent new ones.

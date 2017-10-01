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

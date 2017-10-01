## what's node.js
- https://qiita.com/hshimo/items/1ecb7ed1b567aacbe559
- npm is tool to manage packages of node.js

## setup
```sh
brew install node
brew install watchman
npm install -g react-native-cli #old
npm install -g create-react-native-app #new
create-react-native-app AwesomeProject
cd AwesomeProject
react-native run-ios
yarn start
    # Starts the development server so you can open your app in the Expo
    # app on your phone.

  yarn run ios
    #(Mac only, requires Xcode)
    #Starts the development server and loads your app in an iOS simulator.

  yarn run android
    #(Requires Android build tools)
    #Starts the development server and loads your app on a connected Android
    #device or emulator.

  yarn test
    #Starts the test runner.

  yarn run eject
    #Removes this tool and copies build dependencies, configuration files
    #and scripts into the app directory. If you do this, you can’t go back!
```

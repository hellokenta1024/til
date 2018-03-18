# install package
- add package to `pubspec.yaml`
- `flutter packages get`
- `flutter clean`

# layout
## Sizing widgets
- Expanded widgets

# Image
## Image from url
-  `Image.network('https://example.com/image.png')`
## Working with cached images
- package `cached_network_image`
- `CachedNetworkImage(imageUrl: 'image url')`

## Adding a place holder
```
new CachedNetworkImage(
  placeholder: new CircularProgressIndicator(),
  imageUrl: 'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
);
```

# List
## Working with long lists
The standard ListView constructor works well for small lists. In order to work with lists that contain a large number of items, it’s best to use the ListView.builder constructor.

## Creating lists with different types of items
```dart
// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
```

# Network
## Fetch data from internet
- [mock JSON](https://jsonplaceholder.typicode.com/)
- `http` package provides the simplest way to fetch data from the internet.
```
Future<http.Response> fetchPost() {
  return http.get('https://jsonplaceholder.typicode.com/posts/1');
}
```
- https://flutter.io/cookbook/networking/fetch-data/
```
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
```

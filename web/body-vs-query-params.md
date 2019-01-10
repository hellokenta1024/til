- The length of the query string is severely limited (depending on what browser/server you are using) compared the the max size of a POST request
- 8000 characters might seem like a lot, but if you are sending lists of things with long parameter names you can soon run out.

## When to use the body:
- When the arguments don't have a flat key:value structure
- If the values are not human readable, such as serialized binary data
- When you have a very large number of arguments

## When to use the query string:
- When the arguments are such that you want to see them while debugging
- When you want to be able to call them manually while developing the code e.g. with curl
- When arguments are common across many web services
- When you're already sending a different content-type such as application/octet-stream
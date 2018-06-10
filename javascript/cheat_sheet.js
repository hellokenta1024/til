
// Array
var arr = [2, 4, 1, 5, 6, 7, 10];
arr.sort((a, b) => a - b);
console.log(arr);
var animals = ['ant', 'bison', 'camel', 'duck', 'elephant'];
console.log(animals.slice(2));
// expected output: Array ["camel", "duck", "elephant"]
console.log(animals.slice(2, 4));
// expected output: Array ["camel", "duck"]


// Map
let abc = new Map([["a", 1], ["b", 2]]);
console.log(abc.get("a"));
abc.set("c", 3);
console.log(abc);
for (var [key, value] of abc) {
  
  console.log("key, value", key, value);
}

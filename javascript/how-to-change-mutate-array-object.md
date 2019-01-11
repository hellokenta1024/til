https://medium.com/@fknussel/arrays-objects-and-mutations-6b23348b54aa

```js
const person = {
  name: 'John Doe',
  email: 'john@doe.com',
  age: 27,
  country: 'Australia',
  language: 'English',
  profession: 'Front End Developer'
};
const { profession, country, ...newPerson } = person;
console.log(newPerson);
```
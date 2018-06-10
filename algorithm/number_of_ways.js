function numberOfWays(amount, arr) {

  console.log("consider", amount, arr);
  if (amount < 0) {
    return 0;
  } else if (amount === 0) {
    console.log("count");
    return 1;
  } else if (arr.length === 0 ) {
    return 0;
  }
  
  
  
  let result = 0;
  let tmp = arr;
  tmp.forEach(value => {
    console.log("value", value);
    if (amount - value < 0) {
      const index = tmp.indexOf(value);
      
      result += numberOfWays(amount, tmp.slice(index + 1));
    } else {
      result += numberOfWays(amount - value, tmp.slice());
    }
  });
  
  return result;
}

console.log("Result", numberOfWays(2, [1, 2]));
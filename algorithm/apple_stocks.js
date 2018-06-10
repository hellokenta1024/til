function getMaxProfit(arr) {
  
  if (arr.length === 0) { return 0 }
  
  let result = 0;
  let buy;
  
  for (var value of arr) {
    
    if (buy === undefined) {
      
      buy = value;
      console.log("buy is initialized to:", buy);
      continue;
    }
    
    if (value < buy) {
      
      buy = value
      console.log("buy is updated to", buy);
    } else {
      result = Math.max(value - buy, result);
      console.log("result is updated", result);
    }
    
  }
  
  return result;
}

let stock = [10, 7, 5, 8, 11, 9];

console.log("Result is",getMaxProfit(stock));
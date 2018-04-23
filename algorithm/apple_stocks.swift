func getMaxProfit(from prices: [Int]) -> Int {
  guard prices.count >= 2 else { return 0 }
  
  var result = 0
  var buyValue = prices.first!
  
  for index in 1..<prices.count {
    
    let sellValue = prices[index]
    
    if sellValue < buyValue {
      
      buyValue = sellValue
    } else {
      
      let dealValue = sellValue - buyValue
      result = max(dealValue, result)
    }
  }
 
  return result
}

let prices = [10, 7, 5, 8, 4, 11, 9]
let prices2: [Int] = []
let prices3 = [10, 7]
print(getMaxProfit(from: prices3))
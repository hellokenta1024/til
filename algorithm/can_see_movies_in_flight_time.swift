
func canSeeTwoMovies(in flightLength: Int, from movieLengths: [Int]) -> Bool {
  
  var hash = [Int: Bool]()
  
  movieLengths.forEach {
    
    hash[$0] = true
  }
  
  for index in 0..<movieLengths.count {
    
    let leftLength = flightLength - movieLengths[index]
    
    if let _ = hash[leftLength] {
      
      return true
    }
  }
  
  return false
}

let arr = [2, 8, 5, 4]

print(canSeeTwoMovies(in: 10, from: arr))
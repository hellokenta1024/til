function canSee(flightLength, movies) {
  
  movies.sort((a, b) => a - b); // -> nlogn
  
  for (var value of movies) {
    
    if (movies.includes(flightLength - value)) {
      
      return true;
    }
  }
  // -> nlogn
  
  return false;
}

console.log(canSee(10, [2, 3, 5, 6]));
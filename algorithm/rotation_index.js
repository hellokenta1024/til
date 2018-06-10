var words = ["x", "y", "z", "a", "b", "c", "d"];

function rotationIndex(words) {
  
  let s = 0;
  let e = words.length - 1;
  
  while (e > s) {
    
    let checkIndex = s + Math.floor((e - s) / 2);
    
    if (words[checkIndex - 1] > words[checkIndex]) {
      return checkIndex;
    }
    
    if (words[s] > words[checkIndex]) {
      e = checkIndex;
    } else {
      s = checkIndex;
    }
  }
  
  return s;
}

console.log(rotationIndex(words));
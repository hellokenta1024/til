function include(value, arr) {
  
  if (arr.length === 0 ) { return false; }
  
  let startIndex = 0;
  let endIndex = arr.length - 1;
  
  while (startIndex <= endIndex) {
    
    const checkIndex = startIndex + Math.floor((endIndex - startIndex) / 2);
    
    console.log("start end  check", startIndex, endIndex, checkIndex);
    
    if (arr[checkIndex] === value) {
      return true;
    } else if (value < arr[checkIndex]) {
      endIndex = checkIndex - 1;
    } else {
      startIndex = checkIndex + 1;
    }
  }
  
  return false;
  
}

const arr = [0, 1, 2, 3, 4];

console.log(include(5, arr));
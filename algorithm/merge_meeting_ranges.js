
function mergeRanges(arr) {
  
  let result = [];
  let meetings = arr.sort((a, b) => a.startTime - b.startTime);
  
  for (let value of meetings) {
    
    if (result.length === 0) {
      result.push(value);
      continue;
    }
    
    const last = result.pop();
    if (last.endTime >= value.startTime) {
        
      const mergedMeeting = { startTime: last.startTime, endTime: Math.max(last.endTime, value.endTime) }
      result.push(mergedMeeting);
    } else {
      
      result.push(last);
      result.push(value);
    }
  }
  
  return result;
}

const meetings = [
  { startTime: 0,  endTime: 1 },
  { startTime: 3,  endTime: 5 },
  { startTime: 4,  endTime: 8 },
  { startTime: 10, endTime: 12 },
  { startTime: 9,  endTime: 10 },
];

console.log("result:",mergeRanges(meetings));
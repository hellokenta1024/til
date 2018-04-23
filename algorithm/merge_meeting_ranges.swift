struct Meeting {
  
  var startTime: Int
  var endTime: Int
}

let ms = [Meeting(startTime: 0, endTime: 1), 
          Meeting(startTime: 3, endTime: 5), 
          Meeting(startTime: 4, endTime: 8),
          Meeting(startTime: 10, endTime: 12),
          Meeting(startTime: 9, endTime: 10)]

func mergeRanges(from meetings: [Meeting]) -> [Meeting] {
  
  let tmp = meetings.sorted { $0.startTime < $1.startTime }
  
  guard let firstMTG = tmp.first else { return [] }
  
  var results = [firstMTG]
  
  for index in 1..<tmp.count {
    
    let currentMTG = tmp[index]
    let lastMTG = results.last!
    
    if currentMTG.startTime <= lastMTG.endTime {
      
      let newMeeting = mergeMTGs(a: currentMTG, b: lastMTG)
      results.removeLast()
      results.append(newMeeting)
    } else {
      
      results.append(currentMTG)
    }
  }
  
  return results
}

func mergeMTGs(a: Meeting, b: Meeting) -> Meeting {

  let startTime = min(a.startTime, b.startTime)
  let endTime = max(a.endTime, b.endTime)
  
  return Meeting(startTime: startTime, endTime: endTime)
}

print(mergeRanges(from: ms))
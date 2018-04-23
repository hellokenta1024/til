  struct Rectangle {

    // coordinates of bottom left corner
    let leftX: Int
    let bottomY: Int

    // dimensions
    let width: Int
    let height: Int
}

struct Line {
  
  let startPoint: Int
  let endPoint: Int
}

func getIntersectionOfTwoRectanguls(_ a: Rectangle, _ b: Rectangle) -> Rectangle? {
 
  
  guard let horizontalRange = getHorizontalRange(a, b), let verticalRange = getVerticalRange(a, b) else { return nil }
  
  let width = horizontalRange.endPoint - horizontalRange.startPoint
  let height = verticalRange.endPoint - verticalRange.startPoint
  let result = Rectangle(leftX: horizontalRange.startPoint, bottomY: verticalRange.startPoint, width: width, height: height)
  
  return result
}

func getHorizontalRange(_ a: Rectangle, _ b: Rectangle) -> Line? {
  
  let aLine = Line(startPoint: a.leftX, endPoint: a.leftX + a.width)
  let bLine = Line(startPoint: b.leftX, endPoint: b.leftX + b.width)
  
  let range = aLine.startPoint < bLine.startPoint ? getLinesRange(aLine, bLine) : getLinesRange(bLine, aLine)
  
  return range
}

func getVerticalRange(_ a: Rectangle, _ b: Rectangle) -> Line? {
  
  let aLine = Line(startPoint: a.bottomY, endPoint: a.bottomY + a.height)
  let bLine = Line(startPoint: b.bottomY, endPoint: b.bottomY + b.height)
  
  let range = aLine.startPoint < bLine.startPoint ? getLinesRange(aLine, bLine) : getLinesRange(bLine, aLine)
  
  return range
}

func getLinesRange(_ a: Line, _ b: Line) -> Line? {
  
  guard b.startPoint <= a.endPoint else { return nil }
  
  return Line(startPoint: b.startPoint, endPoint: min(a.endPoint, b.endPoint))
}

let left = Line(startPoint: 1, endPoint: 5)
let right = Line(startPoint: 3, endPoint: 6)
let a = Rectangle(leftX: 1, bottomY: 1, width: 6, height: 1)
let b = Rectangle(leftX: 5, bottomY: 2, width: 3, height: 6)

print(getIntersectionOfTwoRectanguls(a, b))
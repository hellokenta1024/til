func getProductsOfAllIntsExceptAtIndex(from arr: [Int]) -> [Int] {
    
    guard arr.count > 1 else { return arr }
    
    var arr1 = [1]
    var arr2 = [1]
    var result: [Int] = []
    for index in 0..<(arr.count - 1) {

        arr1.append(arr1.last! * arr[index])
        arr2.insert(arr2.first! * arr.reversed()[index], at: 0)
    }
    
    for index in 0..<arr.count{
        
        result.append(arr1[index] * arr2[index])
    }
    
    return result
}

let arr = [1, 7, 3, 4]

print(getProductsOfAllIntsExceptAtIndex(from: arr))
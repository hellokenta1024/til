class BinaryTreeNode {

    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: Int) {
        self.value = value
    }

    func insert(leftValue: Int) -> BinaryTreeNode {
        let left = BinaryTreeNode(leftValue)
        self.left = left
        return left
    }

    func insert(rightValue: Int) -> BinaryTreeNode {
        let right = BinaryTreeNode(rightValue)
        self.right = right
        return right
    }
}

func isBinarySearchTree(_ node: BinaryTreeNode) -> Bool {
  
  return isBinarySearchTree(node, upper: Int.max, lower: Int.min)
}

func isBinarySearchTree(_ node: BinaryTreeNode?, upper: Int, lower: Int) -> Bool {
  
  guard let node = node else { return true }
  
  if node.value <= lower || node.value >= upper {
    return false
  }
  

  return isBinarySearchTree(node.left, upper: node.value, lower: lower) && isBinarySearchTree(node.right, upper: upper, lower: node.value)
}

let root = BinaryTreeNode(8)
let n1 = root.insert(leftValue: 4)
let n2 = root.insert(rightValue: 15)
let n3 = n1.insert(leftValue: 3)
let _ = n3.insert(leftValue: 2)
let _ = n3.insert(rightValue: 7)
let _ = n1.insert(rightValue: 5)
let _ = n2.insert(rightValue: 17)
let n4 = n2.insert(leftValue: 12)
let _ = n4.insert(leftValue: 10)
let _ = n4.insert(rightValue: 13)

print(isBinarySearchTree(root))
class BinaryTree {
  
  constructor(value) {
  
    this.value = value;
    this.left = null;
    this.right = null;
  }
  
  insertLeft(value) {
    
    this.left = new BinaryTree(value);
    return this.left;
  }
  
  insertRight(value) {
    
    this.right = new BinaryTree(value);
    return this.right;
  }
}

function isSuperBalanced(root) {
  
  let min;
  let max;
  let checkNodes = [[root, 0]];
  
  while (checkNodes.length > 0) {
    console.log("checkNodes", checkNodes);
    let node = checkNodes.pop();
    console.log("node", node);
                    
    if (!node[0].left && !node[0].right) {
      min = min ? Math.min(min, node[1]) : node[1];
      max = max ? Math.max(max, node[1]) : node[1];
      
      if (max - min > 1) {
        return false;
      }
    } else {
      
      if (node[0].left) {
        checkNodes.push([node[0].left, node[1] + 1]);
      }
      
      if (node[0].right) {
        checkNodes.push([node[0].right, node[1] + 1]);
      }
    }
  }
  
  return true;
}

let root = new BinaryTree(0);
let n1 = root.insertLeft(1);
let n2 = root.insertRight(2);
let n3 = n1.insertLeft(3);
let n4 = n3.insertLeft(4);
let n5 = n2.insertRight(5);
let n6 = n5.insertRight(6);

console.log("Result", isSuperBalanced(root));
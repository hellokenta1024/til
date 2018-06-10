function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}

var a = new LinkedListNode('A');
var b = new LinkedListNode('B');
var c = new LinkedListNode('C');

a.next = b;
b.next = c;

let o = opposite(a);

printNode(o);

function opposite(root) {
  
  if (!root.next) { return root }
  
  let previousNode = null;
  let currentNode = root;
  let nextNode = currentNode.next;
  
  while (currentNode) {
    
    currentNode.next = previousNode;
    previousNode = currentNode;
    currentNode = nextNode;
    nextNode = nextNode ? nextNode.next : null;
  }
  
  return previousNode;
}

function printNode(node) {
  
  let currentNode = node;
  while (currentNode) {
    
    console.log(`${currentNode.value} -> `);
    currentNode = currentNode.next;
  }
}
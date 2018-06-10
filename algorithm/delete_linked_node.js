
function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}

var a = new LinkedListNode('A');
var b = new LinkedListNode('B');
var c = new LinkedListNode('C');

a.next = b;
b.next = c;

printNode(a);
deleteNode(b);
printNode(a);

function deleteNode(node) {
  
  const nextNode = node.next;
  
  node.value = nextNode.value;
  node.next = nextNode.next;
  
  nextNode.next = null;
  nextNode.value = null;
}

function printNode(node) {
  
  let currentNode = node;
  while (currentNode) {
    
    console.log(`${currentNode.value} -> `);
    currentNode = currentNode.next;
  }
}
=begin
You have a singly-linked list ↴ and want to check if it contains a cycle.

A cycle occurs when a node’s @next points back to a previous node in the list. The linked list is no longer linear with a beginning and end—instead, it cycles through a loop of nodes.

Write a method contains_cycle() that takes the first node in a singly-linked list and returns a boolean indicating whether the list contains a cycle.
=end

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

def contains_cycle(first_node)

  checked_nodes = [first_node]
  next_node = first_node.next

  while next_node != nil

    return true if checked_nodes.include?(next_node)

    checked_nodes.push(next_node)
    next_node = next_node.next
  end

  return false
end

first_node = LinkedListNode.new("hara")
node2 = LinkedListNode.new("kenta")
node3 = LinkedListNode.new("kenta")
node4 = LinkedListNode.new("kenta")

first_node.next = node2
node2.next = node3
node3.next = node4
node4.next = node2
puts contains_cycle(first_node)

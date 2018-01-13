=begin

Hooray! It's opposite day. Linked lists go the opposite way today.

Write a method for reversing a linked list.　Do it in-place.
Your method will have one input: the head of the list.
Your method should return the new head of the list.
Here's a sample linked list node class:

=end

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

def create_nodes()

  nodes_values = 1..3
  current_node = LinkedListNode.new("0")
  first_node = current_node
  nodes_values.each { |i|

    node = LinkedListNode.new("#{i}")
    current_node.next = node
    current_node = node
  }

  return first_node
end

def print_nodes(first_node)

  result = first_node.value + "->"
  current_node = first_node.next

  while current_node != nil

    result << current_node.value + "->"

    current_node = current_node.next
  end

  return result
end

def reverse_nodes(first_node)

  previous_node = nil
  current_node = first_node
  next_node = current_node.next

  while next_node != nil

    current_node.next = previous_node
    previous_node = current_node
    current_node = next_node
    next_node = next_node.next
  end

  current_node.next = previous_node

  return current_node
end

first_node = create_nodes
puts print_nodes(first_node)
reverse_node = reverse_nodes(first_node)
puts print_nodes(reverse_node)

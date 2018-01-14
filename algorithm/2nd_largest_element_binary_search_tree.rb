=begin

Write a method to find the 2nd largest element in a binary search tree.

=end

class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
end

def find_max_node(root)

  previous_node = nil
  current_node = root

  while current_node.right
    previous_node = current_node
    current_node = current_node.right
  end

  return [current_node, previous_node]
end

root = BinaryTreeNode.new(5)
root.insert_left(3)
root.insert_right(15)
root.right.insert_left(10)
root.right.left.insert_right(14)
root.right.left.insert_left(9)

def second_max_node(root)

  max_node, prev_node = find_max_node(root)

  if max_node.left
    return find_max_node(max_node.left)[0]
  else
    return prev_node
  end
end

puts second_max_node(root).value

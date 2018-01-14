=begin

Write a method to check that a binary tree ↴ is a valid binary search tree.

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

def is_binary_search_tree(root)

  nodes = [root]

  while !nodes.empty?

    node = nodes.pop

    if node.left

      return false if node.value <= node.left.value

      nodes.push(node.left)
    end

    if node.right

      return false if node.value >= node.right.value

      nodes.push(node.right)
    end
  end

  return true
end

root = BinaryTreeNode.new(5)
root.insert_left(3)
root.insert_right(8)
root.right.insert_left(7)
root.right.insert_right(9)
root.right.right.insert_right(10)

puts is_binary_search_tree(root)

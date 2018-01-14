=begin

Write a method to see if a binary tree ↴ is "superbalanced" (a new tree property we just made up).

A tree is "superbalanced" if the difference between the depths of any two leaf nodes ↴ is no greater than one.

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

def is_superbalanced(tree)

    nodes = [[tree, 0]]
    depths = []

    while !nodes.empty?

      node, depth = nodes.pop

      if node.left == nil && node.right == nil

        if !depths.include?(depth)

          depths.each { |d|
            if (d - depth).abs > 1
              return false
            end
          }

          depths.push(depth)
        end
      else

        if node.left
          nodes.push([node.left, depth + 1])
        end

        if node.right
          nodes.push([node.right, depth + 1])
        end
      end
    end

    return true
end

root = BinaryTreeNode.new(0)
root.insert_left(1)
root.insert_right(2)
root.right.insert_left(3)
root.right.insert_right(4)
#root.right.right.insert_right(5)

puts is_superbalanced(root)

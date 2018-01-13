=begin
Write a method to find the rectangular intersection of two given love rectangles.

As with the example above, love rectangles are always "straight" and never "diagonal." More rigorously: each side is parallel with either the x-axis or the y-axis.
=end

class Rectangle
  attr_accessor :left_x, :bottom_y, :width, :height

  def initialize(left_x, bottom_y, width, height)
    @left_x = left_x
    @bottom_y = bottom_y
    @width = width
    @height = height
  end
end

def intersection_rectangle(rec1, rec2)

  overlap_x = find_x_overlap(rec1, rec2)
  overlap_y = find_y_overlap(rec1, rec2)

  return "none" if overlap_x == nil || overlap_y == nil
  return overlap_x.merge(overlap_y)
end

def find_x_overlap(rec1, rec2)

  left_rec = rec1.left_x < rec2.left_x ? rec1 : rec2
  right_rec = left_rec == rec1 ? rec2 : rec1

  return nil if left_rec.left_x + left_rec.width < right_rec.left_x

  shorter_endpoint_x = [left_rec.left_x + left_rec.width, right_rec.left_x + right_rec.width].min

  return { left_x: right_rec.left_x, width: shorter_endpoint_x - right_rec.left_x }
end

def find_y_overlap(rec1, rec2)

  lower_rec = rec1.bottom_y < rec2.bottom_y ? rec1 : rec2
  upper_rec = lower_rec == rec1 ? rec2 : rec1

  return nil if lower_rec.bottom_y + lower_rec.height < upper_rec.bottom_y

  shorter_endpoint_y = [lower_rec.bottom_y + lower_rec.height, upper_rec.bottom_y + upper_rec.height].min

  return { bottom_y: upper_rec.bottom_y, height: shorter_endpoint_y - upper_rec.bottom_y }
end

def print_rectangle(rec)
  puts "left_x: #{rec.left_x}, bottom_y: #{rec.bottom_y}, height: #{rec.height}, height: #{rec.height}"
end

rec1 = Rectangle.new(1,1,6,3)
rec2 = Rectangle.new(5,2,3,6)
rec3 = Rectangle.new(2,5,1,1)
rec4 = Rectangle.new(7,1,1,1)

puts intersection_rectangle(rec1, rec2)
puts intersection_rectangle(rec1, rec3)
puts intersection_rectangle(rec1, rec4)

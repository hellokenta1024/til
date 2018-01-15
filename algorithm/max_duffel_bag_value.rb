=begin

Write a method max_duffel_bag_value() that takes an array of cake type arrays and a weight capacity, and returns the maximum monetary value the duffel bag can hold.

=end

cake_arrays = [[7, 160], [3, 90], [2, 15]]
capacity = 20

def max_duffel_bag_value(cake_arrays, capacity)

  cake_arrays.sort { |a, b| b[1] / b[0] <=> a[1] / a[0] }

  current_max = 0
  current_value = 0


end

puts "#{cake_arrays.sort { |a, b| b[1] / b[0] <=> a[1] / a[0] }}"

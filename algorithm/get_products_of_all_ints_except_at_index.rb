=begin
Write a method get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.
=end

def get_products_of_all_ints_except_at_index(array)

  result = []
  array.each_with_index { |value, index|

    num = 1
    array.each_with_index { |v, i|

      next if i == index

      num *= v
    }

    result.push(num)
  }

  return result
end

puts get_products_of_all_ints_except_at_index([1,2,3])

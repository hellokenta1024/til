=begin
Suppose we had an array ↴ of nn integers sorted in ascending order. How quickly could we check if a given integer is in the array?
=end

array = [0,1,2,3,4,6,8,9,10]

def find_integer(v, array)
  return false if array.first > v || array.last < v
  return true if array.first == v || array.last == v

  key = array.length / 2

  if array[key] == v
    return true
  elsif array[key] > v
    return find_integer(v, array.take(key))
  else
    return find_integer(v, array.drop(key))
  end
end

puts find_integer(9,  array)

=begin

Write a method fib() that a takes an integer nn and returns the nnth Fibonacci ↴ number.

=end

def fib(n)

  return 0 if n == 0
  return 1 if n == 1

  arr = [0,1]

  (2..n).each { |i|

    val = arr.last + arr[-2]
    arr.push(val)
  }

  return arr.last

end

puts fib(6)

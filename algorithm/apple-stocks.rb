=begin
Writing programming interview questions hasn't made me rich. Maybe trading Apple stocks will.

Suppose we could access yesterday's stock prices as an array, where:

The indices are the time in minutes past trade opening time, which was 9:30am local time.
The values are the price in dollars of Apple stock at that time.
So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.

Write an efficient method that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.
=end

stock_prices_yesterday = [10, 7, 5, 8, 11, 9, 15]

def get_max_profit(stock_prices_yesterday)

  check_length = stock_prices_yesterday.length - 2

  return 0 if check_length < 0
  max = 0
  (0..check_length).each { |i|

    ((i + 1)..stock_prices_yesterday.length - 1).each { |j|

      max = [stock_prices_yesterday[j] - stock_prices_yesterday[i], max].max
    }
  }

  return max
end

puts get_max_profit(stock_prices_yesterday)

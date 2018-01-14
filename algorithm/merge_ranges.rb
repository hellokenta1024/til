=begin
Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.

To do this, you’ll need to know when any team is having a meeting.
In HiCal, a meeting is stored as an array ↴ of integers [start_time, end_time].
These integers represent the number of 30-minute blocks past 9:00am.

Write a method merge_ranges() that takes an array of meeting time ranges and returns an array of condensed ranges.

For example, given:

  [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

your method would return:

  [[0, 1], [3, 8], [9, 12]]
=end

meetings = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10], [12,13], [16,20]]

def merge_ranges(array)

  array.sort_by! { |i| i[0] }
  result = []
  current = array[0]
  array.each_with_index { |v, i|

    next if i == 0

    if current[1] < v[0]
      result.push(current)
      current = v
    else
      current = [current[0], [current[1], v[1]].max]
    end
  }

  result.push(current)

  return result
end

puts "result: #{merge_ranges(meetings)}"

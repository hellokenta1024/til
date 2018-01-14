=begin
You've built an inflight entertainment system with on-demand movie streaming.

Users on longer flights like to start a second movie right when their first one ends, but they complain that the plane usually lands before they can see the ending. So you're building a feature for choosing two movies whose total runtimes will equal the exact flight length.

Write a method that takes an integer flight_length (in minutes) and an array of integers movie_lengths (in minutes) and returns a boolean indicating whether there are two numbers in movie_lengths whose sum equals flight_length.

When building your method:

Assume your users will watch exactly two movies
Don't make your users watch the same movie twice
Optimize for runtime over memory
=end

def can_watch_two_movies(flight_length, movie_lengths)

  movie_lengths.sort

  while movie_lengths.length != 1

    if movie_lengths.first + movie_lengths.last == flight_length
      return true
    elsif movie_lengths.first + movie_lengths.last > flight_length
      movie_lengths.delete(movie_lengths.last)
    else
      movie_lengths.delete(movie_lengths.first)
    end
  end

  return false
end

#arr = [3,4,5,6,7,8,9]
arr = [3,4]
puts can_watch_two_movies(7, arr)

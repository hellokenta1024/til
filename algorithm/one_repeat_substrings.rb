def subStringsLessKDist(inputString, num)
	# WRITE YOUR CODE HERE

  return [] if inputString.length < num

  index = 0
  results = []

  while index + num <= inputString.length

    w = inputString[index, num]

    if have_one_repeat?(w)
      results.push(w)
    end

    index += 1
  end

  return results.uniq
end

def have_one_repeat?(word)

  return word.chars.sort.join.squeeze.length == word.length - 1
end

input  = "awawawa"
puts subStringsLessKDist(input, 3)

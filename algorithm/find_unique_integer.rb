=begin
Your company delivers breakfast via autonomous quadcopter drones. And something mysterious has happened.

Each breakfast delivery is assigned a unique ID, a positive integer.
When one of the company's 100 drones takes off with a delivery, the delivery's ID is added to an array, delivery_id_confirmations.
When the drone comes back and lands, the ID is again added to the same array.

After breakfast this morning there were only 99 drones on the tarmac.
One of the drones never made it back from a delivery.
We suspect a secret agent from Amazon placed an order and stole one of our patented drones.
To track them down, we need to find their delivery ID.

Given the array of IDs, which contains many duplicate integers and one unique integer, find the unique integer.
=end

def find_unique_integer(array)

  occuered = {}

  array.each { |v|

    if occuered[v] == nil
      occuered[v] = 1
    else
      occuered[v] += 1
    end
  }

  occuered.each { |key, value|

    return key if value == 1
  }
end

arr = [0,2,3,4,5,6,0,2,3,5,6]

puts find_unique_integer(arr)

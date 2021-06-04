def my_min(array)
  counter = array.first
  (0...array.length).each do |idx_1|
    (idx_1...array.length).each do |idx_2|
      if array[idx_2] < counter
        counter = array[idx_2]
      end
    end
  end
  counter
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list) 

def my_min_2(array)
  array.sort!
  array.first
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list) 

def largest_contiguous_subsum(arr)
  sums = []

  (0...arr.length).each do |idx1|
    (idx1+1...arr.length).each do |idx2|
      sums << arr[idx1..idx2].sum
    end
  end

  sums.max
end

# list1 = [5, 3, -7]
# p largest_contiguous_subsum(list1) # => 8

# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

# list3 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list3) # => 8 (from [7, -6, 7])

def better_subsum(arr)
  largest_sum = arr.first
  current_sum = arr.first

  
  # return arr[0] if arr.length == 1
  
  # current_sum = better_subsum(arr[1..-1])+ arr[0]

  # if current_sum > largest_sum
  #   largest_sum = current_sum
  # end

  # largest_sum

  # i = 0
  # j = arr.length
  # while i < arr.length

  #   arr[i..j].sum
  #   j-=1
  #   i+=1
  # end
  
  (1...arr.length).each do |idx|
    if arr[idx] + current_sum > 0
      current_sum += arr[idx]
      largest_sum = current_sum if current_sum > largest_sum
    else
      current_sum = 0
    end
  end

  largest_sum
end

list1 = [5, 3, -7] 
p better_subsum(list1) # => 8

list2 = [2, 3, -6, 7, -6, 7]
p better_subsum(list2) # => 8 (from [7, -6, 7])

list3 = [2, 3, -6, 7, -6, 7]
p better_subsum(list3) # => 8 (from [7, -6, 7])
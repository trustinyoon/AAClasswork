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

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_2(list) 
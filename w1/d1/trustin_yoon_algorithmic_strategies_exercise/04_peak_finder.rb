# Write a method, peak_finder(arr), that accepts an arr of numbers as an arg.
# The method should return an arr containing all of "peaks" of the arr.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the arr is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    #select numbers in the arr
    arr.select do |current|
        #if arr[0], check if it is greater than right, same for arr[arr.length-1] is > left
        (arr.index(current) == 0 && arr[arr.index(current)] > arr[1]) || (arr.index(current) == arr.length - 1 && arr[arr.index(current)]> arr[arr.index(current) - 1]) || (arr[arr.index(current)] > arr[arr.index(current) - 1] && arr[arr.index(current)] > arr[arr.index(current) + 1])
        #if current num is greater than both left and right
    end
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]

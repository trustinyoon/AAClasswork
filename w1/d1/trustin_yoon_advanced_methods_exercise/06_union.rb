# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

def union(*arr)
    #have an output array
    output = []
    #in each array of the nested arr, shovel each element of array into output array
    arr.each do |array|
        array.each { |ele| output << ele}
    end

    return output
end

p union(["a", "b"], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(["x", "y"], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]

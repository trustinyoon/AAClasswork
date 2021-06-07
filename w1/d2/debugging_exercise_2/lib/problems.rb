# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
require "prime"

def largest_prime_factor(num) 
    prime_factors = []

    (2..num).each do |factor|
        prime_factors << factor if num % factor == 0 && factor.prime?
    end

    return prime_factors.max
end

def unique_chars?(str)
    str.each_char do |char| 
        str.slice!(str.index(char))
        return false if str.include?(char)
    end
    true
end

def dupe_indices(arr)
    hash = Hash.new { |k, v| k[v] = [] }

    arr.each_with_index do |ele, i|
        hash[ele] << i
    end

    hash.each { |k, v| hash.delete(k) if v.length == 1}
    hash
end

def ana_array(arr1, arr2) 
    return false if arr1.length != arr2.length

    arr1.each_with_index do |ele, i|
        return false if !arr1.include?(arr2[i]) || !arr2.include?(ele)
    end
    true
end
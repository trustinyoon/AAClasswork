require "byebug"

def partition(arr, num)
    less, greater = [], []

    arr.each do |ele|
        if ele < num
            less << ele
        else
            greater << ele
        end
    end

    partitioned = [less, greater]
end

def merge(hash_1, hash_2)
    merged = {}

    (hash_1.keys + hash_2.keys).each do |key|
        if hash_1.keys.include?(key) && hash_2.keys.include?(key)
            merged[key] = hash_2[key]
        elsif hash_1.keys.include?(key)
            merged[key] = hash_1[key]
        else
            merged[key] = hash_2[key]
        end
    end

    merged
end

def censor(str, arr)
    words = str.split(" ")
    vowels = "aeiou"
    words.map do |word|
        if arr.include?(word.downcase)
            word.each_char.with_index { |char, i| word[i] = "*" if vowels.include?(char.downcase) }
        else
            word
        end
    end

    words.join(" ")
end

def power_of_two?(num)
    (0..num).any? { |factor| 2 ** factor == num}
end
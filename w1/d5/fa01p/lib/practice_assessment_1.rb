# Define your methods here. 

def first_letter_vowel_count(str)
    vowels = "aeiou"
    sentence = str.split(" ")
    count = 0

    sentence.each do |word|
        count += 1 if vowels.include?(word[0].downcase)
    end

    count
end

def count_true(arr, prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el)}
    count
end

def procformation(arr, prc1, prc2, prc3)
    arr.map do |el|
        if prc1.call(el)
            prc2.call(el)
        else
            prc3.call(el)
        end
    end
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(str)
    vowels = "aeiou"
    sentence = str.split(" ")
    output = []
    sentence.each do |word|
        if vowels.include?(word[0].downcase) || vowels.include?(word[word.length-1].downcase)
            output << word
        else
            output << word.split("").reverse.join("")
        end
    end

    output.join(" ")
end

def hash_missing_keys(hash, *args)
    args.select { |key| !hash[key]}
end
# Define your methods here.
def my_map!(arr, &p)
    arr.each_with_index { |el, i| arr[i] = p.call(el) }
end

def two?(arr, &p)
    count = 0
    arr.each { |el| count += 1 if p.call(el) }
    count == 2 ? true : false
end

def nor_select(arr, p1, p2)
    arr.select { |el| !p1.call(el) && !p2.call(el) }
end

def array_of_hash_sum(arr)
    sum = 0
    arr.each { |hash| sum += hash.values.sum }
    sum
end

def slangify(str)
    vowels = "AEIOUaeiou"
    
    sentence = str.split(" ").map do |word|
        vowel_idx = []
        word.each_char.with_index do |letter, letter_i|
            if vowels.include?(letter)
                vowel_idx << letter_i 
                break
            end
        end
        if vowel_idx[0] == 0
            word[1..-1]
        elsif vowel_idx[0] == word.length - 1
            word[0...-1]
        elsif !vowel_idx[0]
            word
        else
            word[0...vowel_idx[0]] + word[vowel_idx[0]+1..-1]
        end
    end

    sentence.join(" ")
end

def char_counter(str, *args)
    if !args[0]
        single = Hash.new(0)
        str.each_char { |letter| single[letter] += 1}
        return single
    end

    hash = Hash.new(0)

    str.each_char do |letter|
        if args.include?(letter)
            hash[letter] += 1
        end
    end

    args.each do |key|
        if !hash.keys.include?(key)
            hash[key] = 0
        end
    end

    hash
end

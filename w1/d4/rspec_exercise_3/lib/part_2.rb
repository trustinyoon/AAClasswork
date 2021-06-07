def element_count(arr)
    hash = Hash.new(0)

    arr.each {|key| hash[key] += 1}

    hash
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        str[i] = hash[char] if hash.keys.include?(char)
    end

    str
end

def product_inject (arr)
    arr.inject(:*)
end
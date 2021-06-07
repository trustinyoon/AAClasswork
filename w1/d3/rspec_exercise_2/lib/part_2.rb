def palindrome?(str)
    str.each_char.with_index.none? { |letter, i| letter != str[str.length - 1 - i]}
end

def substrings(str)
    arr = []

    str.each_char.with_index do |ele, i|
        j = i
        while j < str.length
            arr << str[i..j]
            j += 1
        end
    end
    
    return arr
end

def palindrome_substrings(str)
    substrings(str).select { |substring| palindrome?(substring) && substring.length > 1}
end
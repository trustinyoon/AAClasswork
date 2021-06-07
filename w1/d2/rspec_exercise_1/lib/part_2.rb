def hipsterfy(word)
    vowels = "aeiou"
    reversed = word.reverse
    reversed.each_char.with_index do |char, i|
        if vowels.include?(char)
            reversed.slice!(i)
            return reversed.reverse
        end
    end

    return word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiouAEIOU"

    str.each_char do |char|
        hash[char.downcase] += 1 if vowels.include?(char)
    end

    hash
end

def caesar_cipher(str, n)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    output = []
    #map str so that every letter can be manipulated into the shifted letter in alpha
    str.split("").each do |char|
        if !alpha.include?(char)
            output << char
        else
            output << alpha[(alpha.index(char) + n) % 26]
        end
    end

    output.join("")
end
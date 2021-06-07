# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    vowels = "aeiou"
    #split str into array and then perform all? to see if all are included in vowels array
    word = str.split("")
        #if all? then return true
    return word.all? { |letter| vowels.include?(letter)}
end

p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false



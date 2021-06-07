require "byebug"

def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each { |el| hash[el] += 1 }
  hash.select { |k, v| v == 1}.keys
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each do |i|
    return false if arr[i] == arr[i+1]
  end
  true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  hash = Hash.new { |h,k| h[k] = [] }
  str.each_char.with_index { |char, i| hash[char] << i }
  hash
end

# p char_indices('mississippi')   == {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     == {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  # longest = {str[0] => 1}
  # iterate through str
  # streak = 1
  # while helper function of current el == next el is true, streak += 1 and i += 1
  # longest[el] = streak if streak > longest[el]
  longest = Hash.new(0)
  output = ""

  str.each_char.with_index do |el, i|
    streak = 1
    while str[i] == str[i+1]
      streak += 1
      i += 1
    end
    longest[el] = streak if streak > longest[el]
  end

  str.reverse.each_char do |char|
    output = char * longest[char] if (char * longest[char]).length > output.length
  end

  output
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
  factors = (2..num).select { |factor| num % factor == 0 && is_prime?(factor) }
  
  factors.each do |factor|
    factors.each do |factor2|
      return true if factor * factor2 == num
    end
  end
  false
end

def is_prime?(num)
  (2...num).each { |factor| return false if num % factor == 0 }
  true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
  # get length of the arr to get how many keys are in a sequence
  # iterate through str characters using while loop that skips every length number of indexes
  # transform indexed characters by their changes
  output = ""
  alpha = ("a".."z").to_a
  sequence_length = arr.length

  i = 0
  until output.length == str.length
    arr.each do |seq|
      idx = (alpha.index(str[i]) + seq) % 26
      output += alpha[idx]
      i += 1
      break if output.length == str.length
    end
  end

  output
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
#p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  vowels = "aeiou"
  vowel_order = ""
  counter = 0
  rotated = ""
  # iterate through string to get vowel order, make the index be the key and the vowel as the value
  # rotate values to the left 
  # map through hash to mutate the string with the new values at each index
  str.each_char { |char| vowel_order += char if vowels.include?(char) }
  (0...str.length).each do |i|
    if vowel_order.include?(str[i])
      rotated += vowel_order[counter - 1]
      counter += 1
    else
      rotated += str[i]
    end
  end

  rotated
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
  def select(&prc)
    prc ||= Proc.new { |char| return "" }
    output = ""
    self.each_char { |char| output += char if prc.call(char) }
    output
  end

  def map!(&prc)
    self.each_char.with_index { |char, i| self[i] = prc.call(char, i) }
  end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""
# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
  return 0 if b == 0
  if b < 0
    -(a + multiply(a, b.abs - 1))
  else
    a + multiply(a, b - 1)
  end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)

end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
def first_anagram?(str_1, str_2)
  combos = str_1.split("").permutation.to_a
  combos.join("").include?(str_2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# p first_anagram?("ben", "neb")    #=> true
# p first_anagram?("trustin", "nitsurt")    #=> true

def second_anagram?(str_1, str_2)
  arr = str_1.split("")
  arr.each do |char|
    current = str_2.index(char)
    if current
      str_2[current] = ""
    end
  end
  str_2.empty?
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# p first_anagram?("ben", "neb")    #=> true
# p first_anagram?("trustin", "nitsurt")    #=> true

def third_anagram?(str_1,str_2)
  str_1.sort == str_2.sort
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# p first_anagram?("ben", "neb")    #=> true
# p first_anagram?("trustin", "nitsurt")    #=> true

def fourth_anagram(str_1,str_2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str_1.each_char do |char|
    hash1[char]+=1
  end

  str_2.each_char do |char|
    hash2[char]+=1
  end

  hash1==hash2
end

# def fourth_anagram(str_1,str_2)
#   hash1 = Hash.new(0)

#   str_1.each_char do |char|
#     hash1[char]+=1
#   end

#   str_2.each_char do |char|
#     hash1[char]-=1
#   end

#   hash1.values.all? {|val| val == 0}
# end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true
# p first_anagram?("ben", "neb")    #=> true
# p first_anagram?("trustin", "nitsurt")    #=> true

def bad_two_sum?(arr, target_sum)
  perm = arr.permutation(2).to_a
  temp = []
  perm.each do |sub|
    if sub.sum == target_sum
      temp << sub
    end
  end
  !temp.empty?
end


# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
# p bad_two_sum?(arr, 7)
# p bad_two_sum?(arr, 3)

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  mid_idx = arr.length/2
  return true if mid_idx == target_sum
  return false if sorted.empty?

  left = sorted[0...mid_idx]
  right = sorted[mid_idx+1..-1]

  if !sorted[mid_idx].nil? && target_sum > sorted[mid_idx]
    okay_two_sum?(right, target_sum)
  else
    okay_two_sum?(left, target_sum)
  end

end

 arr = [0, 1, 5, 7]
 p okay_two_sum?(arr, 6) # => should be true
 p okay_two_sum?(arr, 10) # => should be false
 p okay_two_sum?(arr, 7)
 p okay_two_sum?(arr, 3)
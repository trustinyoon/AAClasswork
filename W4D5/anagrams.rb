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


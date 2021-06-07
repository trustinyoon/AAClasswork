require "byebug"

def strange_sums(arr)
    count = 0
    arr.each_with_index do |current, i|
        j = i + 1
        while j < arr.length
            count += 1 if current + arr[j] == 0
            j += 1
        end
    end

    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, num)
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            return true if i < j && ele1 * ele2 == num
        end
    end

    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    repeated = ""
    # iterate through str chars, if chars is in hash.keys, add to output chars * key.value
    str.each_char do |letter|
        if hash.keys.include?(letter)
            repeated += letter * hash[letter]
        else
            repeated += letter
        end
    end

    repeated
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2}) == 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) == 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2}) == 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2}) == 'faaaarm'

def perfect_square?(num)
    (0..num).any? { |factor| factor ** 2 == num }
end

# p perfect_square?(1)   == true
# p perfect_square?(4)   == true
# p perfect_square?(64)  == true
# p perfect_square?(100) == true
# p perfect_square?(169) == true
# p perfect_square?(2)   == false
# p perfect_square?(40)  == false
# p perfect_square?(32)  == false
# p perfect_square?(50)  == false

def anti_prime?(num)
    (1...num).none? { |before| factors(before).length > factors(num).length}
end

def factors(num)
    (1..num).select { |factor| num % factor == 0}
end

# p anti_prime?(24)   == true
# p anti_prime?(36)   == true
# p anti_prime?(48)   == true
# p anti_prime?(360)  == true
# p anti_prime?(1260) == true
# p anti_prime?(27)   == false
# p anti_prime?(5)    == false
# p anti_prime?(100)  == false
# p anti_prime?(136)  == false
# p anti_prime?(1024) == false

def matrix_addition(matrix_a, matrix_b)
    addition = Array.new(matrix_a.length) {Array.new(matrix_a[0].length)}

    matrix_a.each_with_index do |row, row_i|
        row.each_with_index do |col, col_i|
            addition[row_i][col_i] = matrix_a[row_i][col_i] + matrix_b[row_i][col_i]
        end
    end
    
    addition
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*num)
    common = []
    combined = Array.new(num.length)
    (0...num.length).each { |index| combined[index] = factors(num[index])}

    combined.inject(:&)
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
    hash = {1 => 1, 2 => 1, 3 => 2}

    (4..n).each do |key|
        hash[key] = [hash[key - 1], hash[key - 2], hash[key -3]].sum
    end

    hash[n]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matricies)
    addition = matricies[0]
    
    i = 1
    while i < matricies.length
        return nil if matricies[i].length != addition.length
        addition = matrix_addition(addition, matricies[i])
        
        i += 1
    end
    
    addition
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    arr.each_with_index do |row, row_i|
        row.each_with_index do |col, col_i|
            
        end
    end
end
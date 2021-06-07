def proper_factors(n)
    (1...n).select { |factor| n % factor == 0}
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    n == aliquot_sum(n)
end

def ideal_numbers(n)
    perfect_number_count = 0
    current = 0
    idea = []
    while perfect_number_count < n
        current += 1
        if perfect_number?(current)
            perfect_number_count += 1 
            idea << current
        end
    end

    idea
end
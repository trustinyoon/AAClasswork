def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |sub| sub.sum > 0}
end

def aba_translate(str)
    new = str.split("").map do |letter| 
        if "aeiou".include?(letter)
            letter + "b" + letter
        else
            letter
        end
    end
    new.join("")
end

def aba_array(arr)
    arr.map { |word| aba_translate(word)}
end
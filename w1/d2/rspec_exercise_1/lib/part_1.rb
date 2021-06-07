def average(num1, num2)
    return (num1 + num2)/2.0
end

def average_array(arr)
    return arr.sum/(arr.length*1.0)
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    output = []

    sentence.split(" ").each_with_index do |word, i|
        if i % 2 == 0
            output << word.upcase
        else
            output << word.downcase
        end
    end

    output.join(" ")
end
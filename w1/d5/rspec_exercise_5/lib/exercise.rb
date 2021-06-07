require "byebug"

def zip(*inputs)
    arr = Array.new(inputs[0].length) {Array.new}
    hash = Hash.new { |h,k| h[k] = [] }
    # iterate through the arrays in the inputs
    # iterate through the elements of each array with its index
    # make index the key and the element the value
    inputs.each do |array|
        array.each_with_index do |el, idx|
            hash[idx] << el
        end
    end

    hash.each do |idx, values|
        arr[idx] = values
    end

    arr
end

def prizz_proc(arr, p1, p2)
    # select arr els that only return true for either p1 or p2
    arr.select do |el|
        if (p1.call(el) && !p2.call(el)) || (!p1.call(el) && p2.call(el))
            el
        end
    end
end

def zany_zip(*arrays)
    # normalize all arrays by subbing in nil in for the elements
        # find the array with max length and iterate from 0 to max length
        # iterate through arrays, if an array doesn't have array[i], set equal to nil
    # call zip onto modified array

    max_length = 0
    arrays.each do |arr|
        max_length = arr.length if arr.length > max_length
    end

    (0...max_length).map do |i|
        arrays.map { |array| array[i] }
    end

    # output = []
    # arrays.each_with_index do |arr, i|
    #     length = arr.length
    #     while length < max_length
    #         output[i] << nil
    #         length += 1
    #     end
    # end

end

def maximum(arr, &p)
    return nil if !arr[0]
    # inject through arr, the accumulator will be changed to the current element if it is called upon by proc and is greater than acc
    max_idx = 0
    max_called = p.call(arr[0])

    arr.each_with_index do |el, i|
        if p.call(el) >= max_called
            max_called = p.call(el)
            max_idx = i
        end
    end

    arr[max_idx]
end

def my_group_by(arr, &p)
    # initialize hash with arrays as values
    # iterate through arr to transform each element into transformed value
        # hash[transformed value] << element
    hash = Hash.new { |h, k| h[k] = []}
    arr.each do |el|
        hash[p.call(el)] << el
    end

    hash
end

def max_tie_breaker(arr, prc, &blk)
    return nil if !arr[0]

    largest_val = blk.call(arr[0])
    largest_val_idx = 0
    arr.each_with_index do |el, idx|
        if blk.call(el) > largest_val
            largest_val = blk.call(el)
            largest_val_idx = idx
        elsif blk.call(el) == largest_val
            if prc.call(el) > prc.call(arr[largest_val_idx])
                largest_val = blk.call(el)
                largest_val_idx = idx
            end
        end
    end

    arr[largest_val_idx]
end

def silly_syllables(str)
    words = str.split(" ")
    vowels = "aeiou"
    # iterate through words using map
    # if at least two vowels, slice from first vowel to last vowel
        # else, original word
    words.map do |word|
        vowel_count = 0
        vowel_range = []
        
        word.each_char.with_index do |letter, letter_idx|
            if vowels.include?(letter.downcase)
                vowel_count += 1 
                vowel_range << letter_idx
            end
        end
        vowel_idx = [vowel_range[0], vowel_range[-1]]
        if vowel_count < 2
            word
        else
            word[vowel_idx[0]..vowel_idx[1]]
        end
    end

    # new.join(" ")
end

require "byebug"

def my_reject(arr, &prc)
    arr.select { |ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
    count = 0
    arr.each do |ele|
        count += 1 if prc.call(ele) 
    end
    if count == 1
        true
    else
        false
    end
end

def hash_select(hash, &prc)
    output = {}

    hash.each_with_index do |(k, v), i|
        output[k] = v if prc.call(k, v)
    end

    output
end

def xor_select(arr, p1, p2)
    arr.select { |ele| p1.call(ele) && !p2.call(ele) || !p1.call(ele) && p2.call(ele) }
end

def proc_count(v, arr)
    count = 0
    arr.each { |prc| count += 1 if prc.call(v)}
    count
end
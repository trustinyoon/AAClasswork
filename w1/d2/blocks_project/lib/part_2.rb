def all_words_capitalized?(array)
    array.all? { |word| word == word.capitalize}
end

def no_valid_url?(arr)
    valid = ['.com','.net','.io','.org']
    return true if arr.none? { |url| valid.include?(url[url.index(".")...url.length]) }
    false
end

def any_passing_students?(arr)
    arr.any? { |student| student[:grades].sum/student[:grades].length > 75}
end
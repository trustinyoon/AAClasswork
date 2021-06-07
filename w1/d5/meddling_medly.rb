def duos(str)
    count = 0
    (0...str.length-1).each do |idx|
        count += 1 if str[idx] == str[idx+1]
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(str, hash)
    sentence = str.split(" ")
    new = sentence.map do |word|
        if hash[word]
            hash[word]
        else
            word
        end
    end
    new.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &blk)
    new = {}
    hash.each do |k, v|
        key = blk.call(k)
        value = prc.call(v)
        new[key] = value
    end
    new
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    hash = Hash.new(0)
    str.each_char { |letter| hash[letter] += 1}
    hash.select { |k, v| v > 2}.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    (0...str.length-2).each do |idx|
        return true if str[idx] == str[idx+1] && str[idx] == str[idx+2]
    end
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    words = str.split(" ")
    words.each_with_index do |word, word_i|
        word.each_char.with_index do |letter, char_i|
            if hash[letter]
                words[word_i][char_i] = hash[letter]
            else
                words[word_i][char_i] = "?"
            end
        end
    end

    words.join(" ")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    new = ""
    str.each_char.with_index do |char, i|
        if i % 2 == 0
            new += (char * str[i+1].to_i)
        end
    end
    
    new
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    arr.select do |el|
        all = true
        prcs.each do |p|
            all = false if !p.call(el)
        end
        all
    end
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(str)
    # use map to iterate through str.split
    # if word.length < 3, keep word
    # if word starts with a vowel, add "yay" to the end of word
    # elsif: if first letter is capitalized, move all consonants prior to first vowel to the end of word + "ay" + capitalize the beginning
    vowels = "aeiou"
    sentence = str.split(" ")

    pig = sentence.map do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[0].downcase)
            word + "yay"
        else
            vowel_idx = []
            word.each_char.with_index { |letter, i| vowel_idx << i if vowels.include?(letter) }
            first_vowel_idx = vowel_idx[0]
            if word == word.capitalize
                word[first_vowel_idx..-1].capitalize + word[0...first_vowel_idx].downcase + "ay"
            else
                word[first_vowel_idx..-1] + word[0...first_vowel_idx] + "ay"
            end
        end
    end

    pig.join(" ")
end

# p convert_pig_latin('We like to eat bananas') == "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') == "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') == "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') == "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') == "Ouryay amilyfay ewflay to Ancefray"

def reverberate(str)
    # use map to iterate through sentence (str.split)
    # if word.length < 3, remain word
    # elsif word[-1] is a vowel, word*2
    # else, word + word[first_vowel_idx..-1]. if word[0] is capitalized, capitalize accordingly
    vowels = "aeiou"
    sentence = str.split(" ")
    rev = sentence.map do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[-1].downcase)
            if word == word.capitalize
                word + word.downcase
            else
                word*2
            end
        else
            vowel_idx = []
            word.each_char.with_index { |letter, i| vowel_idx << i if vowels.include?(letter) }
            last_vowel_idx = vowel_idx[-1]
            if word == word.capitalize
                word + word[last_vowel_idx..-1].downcase
            else
                word + word[last_vowel_idx..-1]
            end
        end
    end

    rev.join(" ")
end

# p reverberate('We like to go running fast') == "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') == "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') == "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') == "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    # iterate through arr with map
    # iterate through prcs with any?, if calling prc on el is true, then ele is in new array
    arr.select do |el|
        prcs.any? { |prc| prc.call(el) }
    end
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(str)
    sentence = str.split(" ")
    vowels = "aeiouAEIOU"

    new = sentence.each_with_index.map do |word, word_i|
        word if word.split("").none? { |letter| vowels.include?(letter) }
        vowel_idx = []
        word.each_char.with_index do |letter, letter_i|
            vowel_idx << letter_i if vowels.include?(letter)
        end
        if vowel_idx.length == 0
            word
        elsif word_i % 2 == 0
            word.slice!(vowel_idx[0])
            word
        else
            word.slice!(vowel_idx[-1])
            word
        end
    end

    new.join(" ")
end

# p alternating_vowel('panthers are great animals') == "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') == "rnning panthrs re epc"
# p alternating_vowel('code properly please') == "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') == "my forecst prdicts ran tday"

def silly_talk(str)
    vowels = "aeiouAEIOU"
    sentence = str.split(" ").map do |word|
        if vowels.include?(word[-1])
            word + word[-1]
        else
            # create new string to return to map
            # iterate through word's letters
                # if letter is a vowel, add vowel + b to new string
                # else add letter to new string
            new = ""
            word.each_char do |letter, letter_i|
                if vowels.include?(letter)
                    new += letter + "b" + letter
                else
                    new += letter
                end
            end
            word == word.capitalize ? new.capitalize : new
        end
    end

    sentence.join(" ")
end

# p silly_talk('Kids like cats and dogs') == "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') == "Stobop thabat scobooboteber"
# p silly_talk('They can code') == "Thebey caban codee"
# p silly_talk('He flew to Italy') == "Hee flebew too Ibitabaly"

def compress(str)
    compressed = ""
    # iterate through indexes of str
    # if current letter != next letter, just add that letter to compressed
    # if current letter = next letter, loop until current letter != word[i]
        # keep count of how many consecutive and add to compressed
    # set i = the index after the last consecutive letter
    i = 0
    while i < str.length
        if i == str.length - 1 || str[i] != str[i + 1]
            compressed += str[i]
            i += 1
        elsif str[i] == str[i+1]
            count = 1
            j = i + 1
            until str[i] != str[j]
                count += 1
                j += 1
            end
            compressed += str[i] + count.to_s
            i = j
        end
    end

    compressed
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
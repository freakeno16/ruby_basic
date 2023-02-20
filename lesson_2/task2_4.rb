abc_array = ["a", "e", "i", "o", "u", "y"]

abc_hash = {}

("a".."z").each_with_index { |vowel, i| abc_hash[vowel] = i if abc_array.include?(vowel) }
p abc_hash

abc_array = ["a", "e", "i", "o", "u", "y"]

abc_hash = {}

("a".."z").each_with_index { |bukva, i| abc_hash[bukva] = i if abc_array.include?(bukva) }
p abc_hash
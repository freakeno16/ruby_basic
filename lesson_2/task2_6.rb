hash = {}
value = 0
loop do 
  p "name: "
  name = gets.chomp
  
  p "Cost: "
  cost = gets.to_f
  
  p "How many: "
  count = gets.to_i
  
  hash[name.to_sym] = { cost: cost, count: count }
  each_cost = cost * count
  p each_cost
  value += each_cost
  puts 'print stop if u want to stop:'

  break if gets.chomp == "stop"
end

p hash

p "final cost: #{value}"

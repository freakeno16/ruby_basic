hash = {}
final_cost = 0

loop do 
  p "name: "
  name = gets.chomp
  
  p "Cost: "
  cost = gets.to_f
  
  p "How many: "
  count = gets.to_i

  each_cost = cost * count
  
  hash[name.to_sym] = { cost: cost, count: count, each_cost: each_cost }

  final_cost += each_cost
  p 'print stop if u want to stop:'
  break if gets.chomp == "stop"
end

p hash
p "final cost: #{final_cost}"

puts 'Name: '
name = gets.chomp
name.capitalize!
puts 'Height: '
height = gets.to_i
optimal = (height - 110) * 1.15
if optimal < 0
  puts "Your weight is optimal!"
else
  puts "#{name}, your optimal height is #{optimal}"
end

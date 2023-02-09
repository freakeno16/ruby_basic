a = gets.to_i
b = gets.to_i
c = gets.to_i
d = b**2 - 4*a*c

if d > 0 
  x1 = -b + Math.sqrt(d) / 2 * a
  x2 = -b + Math.sqrt(d) / 2 * a
  puts "d = #{d}, 2 roots: #{x1}, #{x2}"
elsif d == 0
  x = -b / 2 * a
  puts "d = #{d}, 1 root: #{x1}"
else
  puts "there\'s no roots"
end

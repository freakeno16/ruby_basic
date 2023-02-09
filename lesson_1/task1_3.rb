puts 'enter the first side of triangle: '
a = gets.to_i
puts 'enter the second one: '
b = gets.to_i
puts 'enter the third one: '
c = gets.to_i

  if a == b && a == c
    puts 'triangle is equilateral'
  end
  
  if a == b && a != c || a == c && a != b || b == c && b != a
    puts 'triangle is isosceles'
  end
  
  if a ** 2 == b ** 2 + c ** 2 
    gip = a ** 2
  elsif
    b ** 2 == a ** 2 + c ** 2
    gip = b ** 2
  elsif
    c ** 2 == a ** 2 + b ** 2
    gip = c ** 2
  end
  
  if
    gip == b ** 2 + c ** 2
    puts 'triangle is rectangular'
  elsif 
    gip == a ** 2 + c ** 2
    puts 'triangle is rectangular'
  elsif 
    gip == a ** 2 + b ** 2
    puts 'triangle is rectangular'
  end

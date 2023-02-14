# 0 1 1 2 3 5 8 13 21 ....

array = [0, 1]

loop do
  i = array[-1] + array[-2]
  
  break if i > 100

  array << i 
end

p array

puts 'vvedite 1 storonu: '
a = gets.to_i
puts 'vvedite 2 storonu: '
b = gets.to_i
puts 'vvedite 3 storonu: '
c = gets.to_i
    if a == b && a == c
        puts 'ravnostor'
    end
    if a == b && a != c || a == c && a != b || b == c && b != a
        puts 'ravnobedr'
    end
    if a**2 == b**2 + c**2 
        gip = a**2
    elsif
        b**2 == a**2 + c**2
        gip = b**2
    elsif
        c**2 == a**2 + b**2
        gip = c**2
    end
    if 
        gip == b**2 + c**2
        puts 'pryamoug'
    elsif gip == a**2 + c**2
        puts 'pryamoug'
    elsif gip == a**2 + b**2
        puts 'pryamoug'
    end

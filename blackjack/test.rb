# puts "#{p.name}, make your choice, you can:"
# puts "|Pass| |Take| |Open|"

"_________________________________________________________________________"

# d = $players[0] 
# p = $players[1]

# d_res = 21 - d.sum
# p_res = 21 - p.sum

# d_res = d_res.abs
# p_res = p_res.abs

# equal_card_num = d.hand.length == 3 && p.hand.length == 3

# if equal_card_num && d_res < p_res
# puts "#{d.name} wins!"
# elsif equal_card_num && p_res < d_res
# puts "#{p.name} wins!"
# elsif equal_card_num && p_res == d_res
# puts "Draw!"
# elsif d.sum > 21 && p.sum <= 21
# puts "#{p.name} wins!"
# elsif p.sum > 21 && d.sum <= 21
# puts "#{d.name} wins!"
# elsif p.sum == d.sum
# puts "Draw!"
# elsif p_res < d_res
# puts "#{p.name} wins!"
# elsif d_res < p_res
# puts "#{d.name} wins!"
# end

"_________________________________________________________________________"

# loop do
#   puts "#{p.name}, make your choice, you can:"
#   puts "|Pass| |Take| |Open|"
#   choice = gets.chomp.capitalize
  
#   case choice
#   when "Pass"
#     Host.dealer_choice($players[0])
#     puts "#{p.name}, make your choice, you can:"
#   when "Take"
#     Host.take_card(p)
#     Host.dealer_choice($players[0])
#     puts "#{p.name}, make your choice, you can:"
#   when "Open"
#     Host.open_cards($players[0], $players[1])
#   end
#   # break if Host.results || Host.open_cards(p, d)
#   break if Host.open_cards(p, d)
#   end
"_________________________________________________________________________"

    # puts "#{p.name}, make your choice, you can:"
    # puts "|Pass| |Take| |Open|"
    # choice = gets.chomp.capitalize
    # case choice
    # when "Pass"
    #   Host.dealer_choice($players[0])
    # when "Take"
    #   Host.take_card(p)
    #   Host.dealer_choice($players[0])
    # when "Open"
    #   Host.open_cards($players[0], $players[1])
    # end
    # Host.open_cards($players[0], $players[1]) if $players[0].hand.length == 3 && $players[1].hand.length == 3 

"_________________________________________________________________________"

# d = $players[0] 
    # p = $players[1]

    # d_res = 21 - d.sum
    # p_res = 21 - p.sum
    
    # d_res = d_res.abs
    # p_res = p_res.abs

    # equal_card_num = d.hand.length == 3 && p.hand.length == 3

    # if equal_card_num && d_res < p_res
    #   puts "#{d.name} wins!"
    # elsif equal_card_num && p_res < d_res
    #   puts "#{p.name} wins!"
    # elsif equal_card_num && p_res == d_res
    #   puts "Draw!"
    # elsif d.sum > 21 && p.sum <= 21
    #   puts "#{p.name} wins!"
    # elsif p.sum > 21 && d.sum <= 21
    #   puts "#{d.name} wins!"
    # elsif p.sum == d.sum
    #   puts "Draw!"
    # elsif p_res < d_res
    #   puts "#{p.name} wins!"
    # elsif d_res < p_res
    #   puts "#{d.name} wins!"
    # end
  
"_________________________________________________________________________"

    # class Host
    #   def self.place_a_bet(player, dealer)
    #     player.bank -= 10
    #     dealer.bank -= 10
    #   end
    
    #   def self.take_card(o)
    #     if o.hand.length == 2
    #       o.hand << c = $cards.sample(1)[0]
    #       o.sum += c.value
    #       puts "#{o.name}'s cards:"
    #       o.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
    #       puts "Total: #{o.sum}"
    #     else
    #       puts "You can only take one card!"
    #     end
    #   end
    
    #   def self.open_cards(p, d)
    #     puts "Here's #{p.name}'s cards:"
    #     p.hand.each { |c| puts "#{c.face}" + "#{c.suit}" }
    #     puts "Total: #{p.sum}"
    
    #     puts "Here's #{d.name}'s cards:"
    #     d.hand.each { |c| puts "#{c.face}" + "#{c.suit}" }
    #     puts "Total: #{d.sum}"
    #   end
    
    #   def self.dealer_choice(d)
    #     if d.sum < 17 && d.hand.length < 3
    #       puts "#{d.name} takes card......."
    #       Host.take_card(d)
    #       Host.player_choice($players[1])
    #     else
    #       puts "#{d.name} skips his turn"
    #       Host.player_choice($players[1])
    #     end
    #   end
    
    #   def self.results
    #   end
    # end

"_________________________________________________________________________"


    # def self.player_choice(p)
    #   # unless Host.results
    #     puts "#{p.name}, make your choice, you can:"
    #     puts "|Pass| |Take| |Open|"
    #     choice = gets.chomp.capitalize
    #     case choice
    #     when "Pass"
    #       Host.dealer_choice($players[0])
    #     when "Take"
    #       Host.take_card(p)
    #       Host.dealer_choice($players[0])
    #     when "Open"
    #       Host.open_cards($players[0], $players[1])
    #     end
    #     # Host.open_cards($players[0], $players[1]) if $players[0].hand.length == 3 && $players[1].hand.length == 3 
    #   end

    "_________________________________________________________________________"

    # if p.hand.length == 2 && d.hand.length == 2 && p.sum <= 21 && p.sum > d.sum
    #   puts "#{p.name} wins!"
    # elsif p.hand.length == 2 && d.hand.length == 2 && d.sum <= 21 && d.sum > p.sum
    #   puts "#{d.name} wins!"
    # end

    # if p.hand.length == 3 && d.hand.length == 2 && p.sum <= 21 && p.sum > d.sum
    #   puts "#{p.name} wins!"
    # elsif p.hand.length == 3 && d.hand.length == 2 && p.sum <= 21 && p.sum < d.sum
    #   puts "#{d.name} wins!"
    # end
    # puts "Draw!" if p.hand.length == 2 && d.hand.length == 2 && p.sum == d.sum

    "_________________________________________________________________________"


    # if p.hand.length == 2 && d.hand.length == 2 && p.sum <= 21 && d.sum > 21 || d.sum < p.sum
    #   puts "#{p.name} wins!"
    # elsif two_cards_test && d.sum <= 21 && p.sum > 21
    #   puts "#{d.name} wins!"
    # elsif p.hand.length == 3 && d.hand.length == 2 && p.sum <= 21 && d.sum > 21
    #   puts "#{p.name} wins!"
    # elsif p.hand.length == 2 && d.hand.length == 3 && p.sum <= 21 && d.sum > 21
    #   puts "#{p.name} wins!"
    # # elsif p.hand.length == 3 && d.hand.length == 2 && p.sum <= 21 && p.sum < d.sum
    # #   puts "#{d.name} wins!"
    # # end
    # # puts "Draw!" if p.hand.length == 2 && d.hand.length == 2 && p.sum == d.sum
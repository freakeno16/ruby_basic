require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'cards.rb'
require_relative 'host.rb'

$players = []

Card.generate_cards
# case 
# when p.hand.length == 3 && d.hand.length == 3
#   if p.sum <= 21 && d.sum > 21
#   puts "#{p.name} wins!"
#   elsif d.sum <= 21 && p.sum > 21
#   puts "#{d.name} wins!"
#   end
# end

# puts "BLACKJACK"

$players << d = Dealer.new
# puts "Dealer join the game!"

puts "Enter your name:"

player_name = gets.chomp
$players << p = Player.new(player_name)

# puts "#{p.name} join the game!"

puts "Here's #{p.name}'s cards:"
p.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
puts "Total: #{p.sum}"
puts "Dealer's cards are hidden:"
# puts "*"
# puts "*"
# puts "Total: **"
d.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
puts "Total: #{d.sum}"

# puts "The player and the dealer have placed a bet"

# Host.place_a_bet(p, d)
# puts "Player bank: #{p.bank}$"
# puts "Dealer bank: #{d.bank}$"

  Host.player_choice(p)
 
    # if p.sum <= 21 && d.sum > 21
    #   puts "#{p.name} wins!"
    # elsif d.sum <= 21 && p.sum > 21
    #   puts "#{d.name} wins!"
    # end
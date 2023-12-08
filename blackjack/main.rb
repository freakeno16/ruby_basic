require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'cards.rb'
require_relative 'host.rb'

Card.generate_cards

puts "BLACKJACK"

d = Dealer.new
puts "Dealer join the game!"

puts "Enter your name:"

# player_name = gets.chomp
p = Player.new("player_name")

puts "#{p.name} join the game!"

puts "Here's #{p.name}'s cards:"
Host.give_player_cards(p)
puts "#{d.name}'s cards are hidden:"
Host.give_dealer_cards(d)

puts "The player and the dealer have placed a bet"

Host.place_a_bet(p, d)
puts "Player bank: #{p.bank}$"
puts "Dealer bank: #{d.bank}$"
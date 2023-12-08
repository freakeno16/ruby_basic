class Host
  def self.give_player_cards(player)
    player.hand = $cards.sample(2)
    player.hand.select { |c| puts "#{c.face}" + "#{c.suit}" }
    player.sum = player.hand.first.value + player.hand.last.value
    # player.hand.each do |f| 
    #   if f.face == Card.faces[-1] && player.sum > 15
    #     @value = 1
    #   else
    #     @value = 11
    #   end
    # end
  end

  def self.give_dealer_cards(dealer)
    dealer.hand = $cards.sample(2)
    dealer.sum = dealer.hand.first.value + dealer.hand.last.value
    puts "*"
    puts "*"
  end

  def self.place_a_bet(player, dealer)
    player.bank -= 10
    dealer.bank -= 10
  end
end

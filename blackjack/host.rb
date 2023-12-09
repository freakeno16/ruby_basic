class Host
  def self.place_a_bet(player, dealer)
    player.bank -= 10
    dealer.bank -= 10
  end

  def self.take_card(o)
    if o.hand.length == 2
      o.hand << c = $cards.sample(1)[0]
      o.sum += c.value
      puts "#{o.name}'s cards:"
      o.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
      puts "Total: #{o.sum}"
    else
      puts "To take a card, you need to have 2 cards!"
    end
  end

  def self.open_cards(p, d)
    puts "Opening the players cards...."
    sleep(1)

    puts "Here's #{d.name}'s cards:"
    d.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
    puts "Total: #{d.sum}"

    puts "Here's #{p.name}'s cards:"
    p.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
    puts "Total: #{p.sum}"

    if $players[1].sum <= 21 && $players[0].sum > 21 || $players[0].sum < p.sum
      puts "#{$players[1].name} wins!"
    end

    puts "Draw!" if p.sum == d.sum

    # if $players[1].sum <= 21 && $players[0].sum > 21 || $players[0].sum < p.sum
    #   puts "#{$players[1].name} wins!"
    # end
  end

  def self.player_choice(p)
    three_cards_test = $players[0].hand.length == 3 && $players[1].hand.length == 3
    choice = gets.chomp.capitalize 
    case choice
    when "Pass"
      Host.dealer_choice($players[0])
    when "Take"
      Host.take_card(p)
      Host.dealer_choice($players[0])
    when "Open"
      Host.open_cards($players[0], $players[1])
    end
  end

  def self.dealer_choice(d)
    if d.sum < 17 && d.hand.length < 3
      puts "#{d.name} takes card"
      Host.take_card(d)
      Host.open_cards($players[0], $players[1])
    else
      puts "#{d.name} skips his turn"
      Host.player_choice($players[1])
    end
  end
end

class Host
  def self.place_a_bet(p, d)
    p.bank -= 10
    d.bank -= 10
  end

  def self.take_card(o)
    if o.hand.length == 2
      o.hand << card = $cards.sample(1)[0]
      o.sum += card.value
      if o.name == 'Dealer'
        puts "Dealer's cards are hidden:"
        puts '*'
        puts '*'
        puts '*'
        puts 'Total: **'
      else
        puts "#{o.name}'s cards:"
        o.hand.each { |card| puts "|#{card.face}" + "#{card.suit}|" }
        puts "Total: #{o.sum}"
      end
    else
      puts "You can't take more then 3 cards!"
    end
  end

  def self.open_cards(p, d)
    puts 'Opening the players cards....'
    sleep(1)

    puts "Here's #{d.name}'s cards:"
    d.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
    puts "Total: #{d.sum}"

    puts "Here's #{p.name}'s cards:"
    p.hand.each { |c| puts "|#{c.face}" + "#{c.suit}|" }
    puts "Total: #{p.sum}"

    p_rate = 21 - p.sum.abs
    d_rate = 21 - d.sum.abs

    if p.sum <= 21 && d.sum > 21
      puts "#{p.name} wins, #{d.name} has to many points!"
      p.bank += d.bank
      d.bank = 0
    elsif d.sum <= 21 && p.sum > 21
      puts "#{d.name} wins, #{p.name} has to many points!"
      d.bank += p.bank
      p.bank = 0
    elsif p_rate < d_rate
      puts "#{p.name} wins!"
      p.bank += d.bank
      d.bank = 0
    elsif d_rate < p_rate
      puts "#{d.name} wins!"
      d.bank += p.bank
      p.bank = 0
    end
    if p.sum == d.sum
      puts 'Draw!'
      d.bank = 100
      p.bank = 100
    end

    puts "#{p.name} bank: #{p.bank}$"
    puts "#{d.name} bank: #{d.bank}$"
    puts 'Wanna retry?'
  end

  def self.player_choice(p)
    choice = gets.chomp.capitalize
    case choice
    when 'Pass'
      Host.dealer_choice($players[0])
    when 'Take'
      Host.take_card(p)
      Host.dealer_choice($players[0])
    when 'Open'
      Host.open_cards($players[0], $players[1])
    end
  end

  def self.dealer_choice(d)
    if d.sum < 17 && d.hand.length < 3
      puts "#{d.name} takes card"
      Host.take_card(d)
      Host.open_cards($players[1], d) if $players[1].hand.length == 3 && d.hand.length == 3
    else
      puts "#{d.name} skips his turn"
    end
    Host.player_choice($players[1])
  end
end

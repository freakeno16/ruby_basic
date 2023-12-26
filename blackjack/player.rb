class Player
  attr_accessor :name, :hand, :bank, :sum

  def initialize(name)
    @name = name
    @hand = Card.cards.sample(2)
    @bank = 100
    @sum = hand.first.value + hand.last.value
  end

  def take_card
    if hand.length == 2
      hand << c = Card.cards.sample(1)[0]
      @sum = sum + c.value
    else
      puts 'You can only take one card!'
    end
  end

  def place_bet
    @bank -= 10
  end
end
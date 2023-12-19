class Player
  attr_reader :name, :bank
  attr_accessor :hand, :sum, :bank

  def initialize(name)
    @name = name.capitalize
    @hand = $cards.sample(2)
    @sum = hand.first.value + hand.last.value
    @bank = 100
  end
end

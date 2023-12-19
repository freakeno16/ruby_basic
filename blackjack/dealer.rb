class Dealer
  attr_reader :name
  attr_accessor :hand, :sum, :bank

  def initialize
    @name = 'Dealer'
    @hand = $cards.sample(2)
    @sum = hand.first.value + hand.last.value
    @bank = 100
  end
end

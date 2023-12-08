class Dealer
  attr_reader :name
  attr_accessor :hand, :sum, :bank

  def initialize
    @name = "Dealer"
    @hand = []
    @sum = 0
    @bank = 100
  end
end
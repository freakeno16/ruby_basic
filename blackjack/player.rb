class Player
  attr_reader :name, :bank
  attr_accessor :hand, :sum, :bank

  def initialize(name)
    @name = name.capitalize
    @hand = []
    @sum = 0
    @bank = 100
  end
end
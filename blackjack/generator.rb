require_relative 'cards.rb'

class Generator
  def self.generate_cards
    $cards << Card.new(2, "+")
    Card.new(3, "+")
    Card.new(4, "+")
    Card.new(5, "+")
    Card.new(6, "+")
    Card.new(7, "+")
    Card.new(8, "+")
    Card.new(9, "+")
    
    Card.new(2, "<3")
    Card.new(3, "<3")
    Card.new(4, "<3")
    Card.new(5, "<3")
    Card.new(6, "<3")
    Card.new(7, "<3")
    Card.new(8, "<3")
    Card.new(9, "<3")

    Card.new(2, "^")
    Card.new(3, "^")
    Card.new(4, "^")
    Card.new(5, "^")
    Card.new(6, "^")
    Card.new(7, "^")
    Card.new(8, "^")
    Card.new(9, "^")

    Card.new(2, "<>")
    Card.new(3, "<>")
    Card.new(4, "<>")
    Card.new(5, "<>")
    Card.new(6, "<>")
    Card.new(7, "<>")
    Card.new(8, "<>")
    Card.new(9, "<>")
  end
end

Generator.generate_cards


    
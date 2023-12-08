class Card
  attr_reader :face, :suit, :value

  $cards = []

  def self.faces
    @faces = [2, 3, 4, 5, 6, 7, 8, 9, :K, :Q, :J, :A]
  end

  def self.suits
    @suits = ["+", "<3", "^", "<>"]
  end

  def self.generate_cards
    $cards.push(
      
    Card.new(2, "+"),
    Card.new(3, "+"),
    Card.new(4, "+"),
    Card.new(5, "+"),
    Card.new(6, "+"),
    Card.new(7, "+"),
    Card.new(8, "+"),
    Card.new(9, "+"),
    
    Card.new(2, "<3"),
    Card.new(3, "<3"),
    Card.new(4, "<3"),
    Card.new(5, "<3"),
    Card.new(6, "<3"),
    Card.new(7, "<3"),
    Card.new(8, "<3"),
    Card.new(9, "<3"),

    Card.new(2, "^"),
    Card.new(3, "^"),
    Card.new(4, "^"),
    Card.new(5, "^"),
    Card.new(6, "^"),
    Card.new(7, "^"),
    Card.new(8, "^"),
    Card.new(9, "^"),

    Card.new(2, "<>"),
    Card.new(3, "<>"),
    Card.new(4, "<>"),
    Card.new(5, "<>"),
    Card.new(6, "<>"),
    Card.new(7, "<>"),
    Card.new(8, "<>"),
    Card.new(9, "<>"),

    Card.new(:K, "+"),
    Card.new(:K, "<3"),
    Card.new(:K, "^"),
    Card.new(:K, "<>"),

    Card.new(:Q, "+"),
    Card.new(:Q, "<3"),
    Card.new(:Q, "^"),
    Card.new(:Q, "<>"),

    Card.new(:J, "+"),
    Card.new(:J, "<3"),
    Card.new(:J, "^"),
    Card.new(:J, "<>"),

    Card.new(:A, "+"),
    Card.new(:A, "<3"),
    Card.new(:A, "^"),
    Card.new(:A, "<>"))

    $cards.shuffle!
  end

  def initialize(face, suit)
    @face = face
    @suit = suit
    valdate!
  end

  private

  def valdate!
    if face.class == Integer
      @value = face
    elsif face == Card.faces[-1]
      @value = 11
    else 
      @value = 10
    end

    raise "Face only can be #{ Card.faces.each { |f| print f } }" unless Card.faces.include?(face)
    raise "Suit only can be #{ Card.suits.each { |s| print s } }" unless Card.suits.include?(suit)
  end
end

# c1 = Card.new(2, "+")

  # def self.show
  #   $cards.each { |c| puts "#{c.face}" + "#{c.suit}" }
  # end

  # p Card.generate_cards



class Card
  attr_reader :rank, :suit, :symbol
  attr_accessor :face

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @face = false
    @symbol = { 1 => :A, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7,
                8 => 8, 9 => 9, 10 =>10, 11 => :J, 12 => :Q, 13 => :K }
  end

  def is_face?
    face
  end

  def invert
    self.face = !face
  end
end

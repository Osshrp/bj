class Card
  attr_reader :face

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @face = false
  end

  def is_face?
    face
  end

  def invert
    self.face = !face
  end
end

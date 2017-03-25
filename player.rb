class Player
  attr_accessor :cards, :points
  
  def initialize
    @cards = []
  end

  def take_cards(cards_array)
    cards_array.size == 2 ? self.cards = cards_array : self.cards << cards_array.first
    count_points
  end

  def count_points
    self.points = 0
    aces = []
    cards.map do |card|
      if card.rank > 10
        self.points += 10
      elsif card.rank == 1
        aces << 1
      else
        self.points += card.rank
      end
    end
    ace_points(aces).map{ |ace| self.points += ace } unless aces.size.zero?
    points
  end

  protected

  def ace_points(aces)
    if aces.size == 1 && (points + 11) <= 21
      return [11]
    else
      return aces
    end
  end
end

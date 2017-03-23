class Player
  def initialize
    @cards = []
    @points = 0
  end

  def take_cards(cards)
    cards.size == 2 ? @cards ||= cards : @cards << cards.first
  end

  def count_points
    @cards.map do |card|
      if card.rank > 10
        @points += 10
      elsif card.rank == 1
        aces += 1
      else
        @points += card.rank
      end
    end
    ace(aces) if aces > 0
  end

  def ace(aces)
    if aces == 1 && (@points + 11) <= 21
      return 11
    else
      return 1
    end
  end
end

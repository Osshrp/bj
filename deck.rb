require_relative 'card'

class Deck
  attr_reader :suits, :deck, :symbol

  def initialize
    @suits = [{ name: :spades, symbol: "\u2660" },
              { name: :hearts, symbol: "\u2665" },
              { name: :diamonds, symbol: "\u2666" },
              { name: :clubs, symbol: "\u2663"}]
    @symbol = { 1 => :A, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7,
                8 => 8, 9 => 9, 10 =>10, 11 => :J, 12 => :Q, 13 => :K }
    @deck = create_deck
  end

  def give_cards(amount)
    self.deck = create_deck if deck.size <= 6
    self.deck.pop(amount)
  end

  private

  attr_writer :deck

  def create_deck
    suits.flat_map do |suit|
      (1..13).map do |rank|
        Card.new(rank, suit)
      end
    end.shuffle
  end
end

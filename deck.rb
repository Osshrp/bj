require_relative 'card'

class Deck
  attr_reader :suits, :deck

  def initialize
    @suits = [{ name: :spades, symbol: "\u2660" },
              { name: :hearts, symbol: "\u2665" },
              { name: :diamonds, symbol: "\u2666" },
              { name: :clubs, symbol: "\u2663"}]
    @deck = create_deck
  end

  def give_cards(amount)
    @deck.pop(amount)
  end

  private

  def create_deck
    suits.flat_map do |suit|
      (1..13).map do |rank|
        Card.new(rank, suit)
      end
    end.shuffle
  end
end

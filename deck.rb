require_relative 'card.rb'

class Deck
  attr_reader :suits, :deck

  def initialize
    @suits = [:spades, :hearts, :diamonds, :clubs]
    @deck = create_deck
  end

  private

  def create_deck
    suits.flat_map do |suit|
      (1..13).map do |rank|
        Card.new(rank, suit)
      end
    end
  end
end

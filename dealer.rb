require_relative 'player'


class Dealer < Player
  attr_reader :type, :name

  def initialize
    @name = "Диллер"
    @type = :dealer
    super()
  end

  def turn(deck)
    if points < 17 || do_next_turn?
      take_cards(deck.give_cards(1))
      count_points
    end
  end

  def do_next_turn?
    hash = { 17 => :seventeen, 18 => :eighteen, 19 => :nineteen }
    send(hash[points])
  end

  def open_cards
    cards.map(&:invert)
  end

  private

  def seventeen
    rand(11) < 7 ? true : false
  end

  def eighteen
    rand(11) <= 5 ? true : false
  end

  def nineteen
    rand(11) < 3 ? true : false
  end
end

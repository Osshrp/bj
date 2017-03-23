require_relative 'player'


class Dealer < Player
  attr_reader :type

  def initialize
    @type = :dealer
    super
  end
end

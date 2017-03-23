require_relative 'deck'
require_relative 'user'
require_relative 'dealer'
require_relative 'bank'

class Game

  attr_reader :user, :dealer, :deck

  def initialize(username)
    deck = Deck.new
    bank = Bank.new
    user = User.new(username)
    dealer = Dealer.new
    give_up_cards user
    give_up_cards dealer
  end

  # def new_game
  # end

  def give_up_cards(player)
    player.take_cards(deck.give_cards(2))
    bank.make_bet(player.type)
  end

  def points_count
  end
end

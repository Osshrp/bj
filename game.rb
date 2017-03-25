require_relative 'deck'
require_relative 'user'
require_relative 'dealer'
require_relative 'bank'

class Game

  attr_reader :user, :dealer, :deck, :bank

  def initialize(username)
    @deck = Deck.new
    @bank = Bank.new
    @user = User.new(username)
    @dealer = Dealer.new
    start_game
  end

  def start_game
    give_up_cards(user)
    give_up_cards(dealer)
  end

  def give_up_cards(player)
    player.take_cards(deck.give_cards(2))
    bank.make_bet(player.type)
  end

  def winner_definition
    players = [dealer, user]
    players.map! { |player| player if (1..21).cover?(player.points) }
    players.compact!
    return nil if players.size.zero?
    return players.first if players.size == 1
    return nil if players.first.points == players.last.points
    if players.first.points > players.last.points
      players.first
    else
      players.last
    end
  end

  def count_bank(winner)
    bank.take_prise(winner.type)
  end
end

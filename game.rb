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
    @players = [ @user, @dealer ]
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
    happy_players = players.select { |player| (1..21).cover?(player.points) }
    return nil if happy_players.size.zero?
    return happy_players.first if happy_players.size == 1
    return nil if happy_players.first.points == happy_players.last.points
    if happy_players.first.points > happy_players.last.points
      happy_players.first
    else
      happy_players.last
    end
  end

  def count_bank(winner)
    bank.take_prise(winner.type)
  end

  def check_balance
    player_with_zero =  players.select { |player| bank.player_sum(player.type).zero? }
    if player_with_zero.first
      puts "У игрока #{player_with_zero.first.name} закончились деньги. Game over"
      exit
    end
  end

  private
  attr_accessor :players
end

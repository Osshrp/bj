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
    give_up_cards(@user)
    give_up_cards(@dealer)
  end

  def give_up_cards(player)
    player.take_cards(deck.give_cards(2))
    bank.make_bet(player.type)
  end

  def winner_definition
    puts "!!!!!!!!dealer.points == #{dealer.points}"
    puts "!!!!!!!!!user.points == #{user.points}"
    if dealer.points < 21 || user.points < 21
      if dealer.points > user.points
        return dealer
      else
        return user
      end
    end

    if dealer.points == 21
      return dealer
    elsif user.points == 21
      return user
    end

    if user.points > 21 && dealer.points < 21
      return dealer
    else
      return user
    end

    if user.points == dealer.points
      nill
    end
  end

  def count_bank(winner)
    bank.increase_bank(winner.type)
  end
end

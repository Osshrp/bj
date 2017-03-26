require_relative 'game'

class App

  def initialize
    @name = input_name
    game = Game.new(@name)
    @open_flag = false
    menu(game)
  end

  private

  attr_accessor :open_flag

  def input_name
    puts "Введите ваше имя"
    gets.chomp
  end

  def menu(game)
    menu_list = { 1 => :skip_turn, 2 => :more_card,
                  3 => :open, 4 => :next_raund, 0 => :exit_from_game }
    loop do
      system "clear"
      puts "Банк: #{game.bank.bank_sum}"
      dealer_output(game)
      user_output(game)
      puts "Выберите действие"
      puts "1: Себе"
      puts "2: Еще карту"
      puts "3: Открыть карты"
      puts "4: Следующий раунд"
      puts "0: Выход"
      if is_open? && game.winner_definition
        game.count_bank(winner(game))
        puts "Победитель :#{winner(game).name}!!!!"
        game.check_balance
      elsif is_open?
        puts "Ничья"
      end
      input = gets.chomp.to_i
      send(menu_list[input], game) if menu_list.key?(input)
    end
  end

  def dealer_output(game, open=false)
    puts "Диллер"
    game.dealer.cards.map do |card|
      if card.is_face?
        print game.deck.symbol[card.rank]
        print "#{card.suit[:symbol]} "
      else
        print " *"
      end
    end
    if is_open?
      print "Очки: #{game.dealer.points}"
    end
    puts " Сумма: #{game.bank.dealer_sum}"
  end

  def user_output(game)
    user = game.user
    puts user.name
    user.cards.map do |card|
      print game.deck.symbol[card.rank]
      print "#{card.suit[:symbol]} "
    end
    print "Очки: #{game.user.points}"
    puts " Сумма: #{game.bank.user_sum}"
  end

  def skip_turn(game)
    game.dealer.points == 21 ? winner(game) : game.dealer.turn(game.deck)
    open(game) if game.user.cards.size == 3 && game.dealer.cards.size == 3
  end

  def more_card(game)
    game.user.take_cards(game.deck.give_cards(1)) if game.user.cards.size == 2
    if game.user.cards.size == 3 && game.dealer.cards.size == 3
      open(game)
    else
      game.dealer.turn(game.deck)
    end
  end

  def open(game)
    game.dealer.open_cards
    self.open_flag = true
  end

  def next_raund(game)
    self.open_flag = false
    game.start_game
  end

  def exit_from_game(*)
    exit
  end

  def winner(game)
    winner = game.winner_definition
    if !winner
      "Ничья"
    else
      winner
    end
  end

  def is_open?
    open_flag
  end
end

app = App.new

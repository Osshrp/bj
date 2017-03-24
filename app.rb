require_relative 'game'

class App
  attr_accessor :open_flag

  def initialize
    @name = input_name
    game = Game.new(@name)
    @open_flag = false
    menu(game)
  end

  def input_name
    puts "Введите ваше имя"
    gets.chomp
  end

  def menu(game)
    menu_list = { 1 => :skip_turn, 2 => :more_card, 3 => :open }
    loop do
      system "clear"
      puts "Банк: #{game.bank.bank_sum}"
      dealer_output(game)
      user_output(game)
      puts "Выберите действие"
      puts "1: Себе"
      puts "2: Еще карту"
      puts "3: Открыть карты"
      if open_flag && !winner(game)
        game.count_bank(winner(game))
        puts "Победитель :#{winner(game).name}!!!!"
      else
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
        print card.symbol[card.rank]
        print "#{card.suit[:symbol]} "
      else
        print " *"
      end
    end
    if open_flag print "Очки: #{game.dealer.points}"
    puts " Сумма: #{game.bank.dealer_sum}"
  end

  def user_output(game)
    user = game.user
    puts user.name
    user.cards.map do |card|
      print card.symbol[card.rank]
      print "#{card.suit[:symbol]} "
    end
    print "Очки: #{game.user.points}"
    puts " Сумма: #{game.bank.user_sum}"
  end

  def skip_turn(game)
    game.dealer.turn(game.deck)
  end

  def more_card(game)
    game.user.take_cards(game.deck.give_cards(1))
  end

  def open(game)
    game.dealer.open_cards
    self.open_flag = true
    # winner(game)
  end

  def winner(game)
    winner = game.winner_definition
    if !winner
      "Ничья"
    else
      winner
    end
  end
end

app = App.new

require_relative 'game'

class App
  attr_reader :game

  def initialize
    @name = input_name
    @game = Game.new(@name)
    menu
  end

  def input_name
    puts "Введите ваше имя"
    gets.chomp
  end

  def menu
    menu_list = { 1 => :scip_turn, 2 => :more_card, 3 => :open }
    loop do
      puts "Дилер"
      game.dealer.cards.size.times { print " *" }
      puts ""
      user_output
      puts "Выберите действие"
      puts "1: Себе"
      puts "2: Еще"
      puts "3: Вскрываемся"
      input = gets.chomp.to_i
      send(menu_list[input]) if menu_list.key?(input)
    end
  end

  def user_output
    puts game.user.name
    # puts game.user.cards
    game.user.cards.map do |card|
      print card.rank
      print "#{card.suit[:symbol]} "
    end
    puts ""
  end

  def scip_turn
  end

  def more_card
  end

  def open
  end
end

app = App.new

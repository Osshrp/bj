require_relative 'game'

class App
  def initialize
    @name = input_name
    game = Game.new(@name)
    output
  end

  def input_name
    puts "Введите ваше имя"
    gets.chomp
  end

  def output
    puts game.dealer.cards
  end
end

app = App.new

require_relative 'player'

class User < Player
  def initialize(name)
    super
    @name = name
  end
end

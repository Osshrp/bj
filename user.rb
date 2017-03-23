require_relative 'player'

class User < Player
  attr_reader :name, :type

  def initialize(name)
    super()
    @name = name
    @type = :user
  end
end

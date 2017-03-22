class Bank
  attr_reader :user_sum, :dealer_sum

  def initialize
    @user_sum = @dealer_sum = 100
  end

  def increase_bank(type)
    type == :user ? @user_sum += 10 : @dealer_sum +=10
  end

  def decrease_bank(type)
    type == :user ? @user_sum -= 10 : @dealer_sum -=10
  end
end

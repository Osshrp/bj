class Bank
  attr_reader :user_sum, :dealer_sum

  def initialize
    @user_sum = @dealer_sum = 100
    @bank_sum = 0
  end

  def increase_bank(type)
    type == :user ? @user_sum += 10 : @dealer_sum +=10
  end

  def make_bet(type)
    if type == :user
      @user_sum -= 10
      @bank_sum += 10
    else
      @dealer_sum -=10
      @bank_sum += 10
    end
  end
end

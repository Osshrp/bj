class Bank

  attr_reader :user_sum, :dealer_sum, :bank_sum

  def initialize
    @user_sum = @dealer_sum = 100
    @bank_sum = 0
  end

  def increase_bank(type)
    type == :user ? self.user_sum += 10 : self.dealer_sum +=10
  end

  def make_bet(type)
    if type == :user
      self.user_sum -= 10
    else
      self.dealer_sum -= 10
    end
    self.bank_sum += 10
  end

  def take_prise(type)
    if type == :user
      self.user_sum += bank_sum
    else
      self.dealer_sum += bank_sum
    end
    self.bank_sum = 0
  end

  def player_sum(type)
    send("#{type}_sum")
  end

  private

  attr_writer :user_sum, :dealer_sum, :bank_sum
end

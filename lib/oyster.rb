class Oystercard
  # constant
  MAXIMUM_BALANCE = 90

  attr_reader :balance
  
  def initialize(balance = 0)
    @balance = balance
  end 

  def top_up(money)
    # fail is for user raise is for coders
    fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE
    @balance += money
  end 




end 


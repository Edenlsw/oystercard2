class Oystercard
  # constant
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance
  
  def initialize(balance = 0)
    @balance = balance
    @touched_in = false
  end 

  def top_up(money)
    # fail is for user raise is for coders
    fail "#{@balance} cannot exceed #{MAXIMUM_BALANCE}" if (money + @balance) > MAXIMUM_BALANCE
    @balance += money
  end 

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    if @touched_in == true
      return true 
    elsif @touched_in == false
      return false
    end

  end


  def touch_in
    raise "not enough money" if @balance < MINIMUM_BALANCE

    @touched_in = true
  end

  def touched_out
    @touched_in = false
  end


end 


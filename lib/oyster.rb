class Oystercard
  # constant
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  MINIMUM_CHARGE = 5

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
    deduct
    @touched_in = false
  end

  private
  def deduct
    @balance -= MINIMUM_CHARGE
  end


end 






=begin
def return_bike(bike)
  return raise("Capacity is full") unless not full?
  @bikes << bike
end

private
def full?
  return true unless @bikes.length < capacity
end
=end
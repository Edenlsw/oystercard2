require 'oyster'

describe Oystercard do
  it "can check the starting balance is 0" do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end 

  it "can top-up balance" do
    oystercard = Oystercard.new
    oystercard.balance
    expect(oystercard.top_up(5)).to eq(5)
  end 

  it "can issue error if balance is over maximum limit" do
    oystercard = Oystercard.new
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    oystercard.top_up(90)
    expect { oystercard.top_up (1) }.to raise_error "#{oystercard.balance} cannot exceed #{maximum_balance}"
  end 

  it "can deduct money" do
    oystercard = Oystercard.new
    oystercard.deduct(10)
    expect(oystercard.deduct(1)).to eq(-11)

  end

  it "checks if card is in journey" do 
    oystercard = Oystercard.new(10)
    oystercard.touch_in
    expect(oystercard.in_journey?).to eq(true) 
  end

  it "checks if touched in" do 
    oystercard = Oystercard.new(5)
    expect(oystercard.touch_in).to eq(true)
  end

  it "checks if card touched out" do 
    oystercard = Oystercard.new
    expect(oystercard.touched_out).to eq(false)
  end 

  it "checks if you have the minimum balance" do 
    oystercard = Oystercard.new
    expect { oystercard.touch_in }.to raise_error "not enough money"
  end

  # it 'charges for the journey' do
  #   oystercard = Oystercard.new
  #   expect {oystercard.touched_out}.to change{oystercard.balance}.by(-1)
  # end







  # it "checks if you have the minimum balance" do
  #   oystercard = Oystercard.new
  #   minimum_balance = Oystercard::MINIMUM_BALANCE
  #   oystercard.balance
  #   expect { oystercard.touch_in }.to raise_error "#{oystercard.balance} below #{minimum_balance}"
  # end 

end 
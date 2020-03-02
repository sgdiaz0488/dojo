# frozen_string_literal: true

# You can modify this class however you like to make it pass the test suite.

class ChangeMachine
  attr_reader :quarter, :dime, :nickel, :penny

  QUARTER = 25
  DIME = 10
  NICKEL = 5
  PENNY = 1

  def cost(cents)
    @cost = cents
  end

  def paid(cents)
    @paid = cents
  end

  def dispense_change
    amount = @paid - @cost
    if @paid == @cost || amount > 199 || @paid < @cost
      'non-dispensing change machine'
    else
      amount = amount > 100 ? amount - 100 : amount
      change(amount)
    end
  end

  def change(amount)
    remaining_amount = amount

    while remaining_amount != 0
      coin = get_highest_coin(remaining_amount.ceil(3))

      if coin == QUARTER
        quarter
      elsif coin == DIME
        dime
      elsif coin == NICKEL
        nickel
      elsif coin == PENNY
        penny
      end
      remaining_amount -= coin
    end
  end

  def get_highest_coin(amount)
    coin = 0
    [25, 10, 5, 1].each do |c|
      coin = c
      return coin if coin <= amount
    end
    coin
  end

  # You don't have to modify anything under this line

  def quarter
    puts 'Dispensed quarter'
  end

  def dime
    puts 'Dispensed dime'
  end

  def nickel
    puts 'Dispensed nickel'
  end

  def penny
    puts 'Dispensed penny'
  end
end

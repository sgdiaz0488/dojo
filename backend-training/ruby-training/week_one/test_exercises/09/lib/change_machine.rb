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
    if @paid == @cost || (@paid - @cost) > 99 || @paid < @cost
      'non-dispensing change machine'
    else
      change(@paid - @cost)
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
    available_coins = [25, 10, 5, 1]
    index = 0
    coin = available_coins[index]
    until amount >= coin
      index += 1
      coin = available_coins[index]
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

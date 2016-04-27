class ChangeMaker
  # Returns an array of the least amount of denominations required to get to 'amount'
  # **Assumption** Change can always be made - BONUS POINTS - raise an error if
  # change can not be made
  # Params:
  # +amount+:: The amount to make change for
  # +denominations+:: An array containing the denominations that can be used.
  #                   Defaults to standard US coin denominations
  def self.make_change(amount, denominations = [1, 5, 10, 25])

    while denominations.any? do
      denominations.sort!.reverse!
      change = calculate(amount, denominations)

      if change.any?
        optimal_change = change unless optimal_change && optimal_change.length < change.length
      end

      denominations.shift
    end

    raise ChangeError, 'Unable to make change' unless amount.to_i - sum_change(optimal_change) == 0

    optimal_change
  end

  private

  def self.sum_change(change)
    change.inject(0){ | sum, x |
      sum + x
    }.to_i
  end


  def self.calculate(amount, denominations)
    denominations.map { |denomination|
      count = amount / denomination
      amount %= denomination
      Array.new(count){ denomination }
    }.flatten
  end
end

class ChangeError < StandardError; end

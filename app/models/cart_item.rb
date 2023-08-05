# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  LOWER_LIMIT = 1
  UPPER_LIMIT = 20
  private_constant :LOWER_LIMIT, :UPPER_LIMIT

  def increase(quantity)
    return false if quantity <= 0

    total = self.quantity + quantity
    if total > UPPER_LIMIT
      self.quantity = UPPER_LIMIT
      save
      return false
    end

    self.quantity = total
    save
  end

  def decrease(quantity)
    return false if quantity <= 0

    total = self.quantity - quantity
    if total >= LOWER_LIMIT
      self.quantity = total
      save
    else
      destroy
    end
  end
end

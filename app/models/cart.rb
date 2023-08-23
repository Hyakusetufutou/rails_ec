# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :promotion_code, dependent: :restrict_with_exception

  delegate :reduced_rate, to: :promotion_code, prefix: true

  def add_item(product_id, quantity)
    item = cart_items.find_by(product_id: product_id) || cart_items.build(product_id: product_id)
    item.increase(quantity)
  end

  def total_item
    item_num = 0
    cart_items.each { |item| item_num += item.quantity } if cart_items.present?
    item_num
  end

  def total_price
    price = 0
    cart_items.each { |item| price += item.total_price } if cart_items.present?
    price
  end

  def less_than_reduced_rate?(reduced_rate)
    total_price < reduced_rate
  end

  def billing_amount
    reduced_rate = promotion_code&.reduced_rate
    if reduced_rate
      total_price - reduced_rate
    else
      total_price
    end
  end

  def permit_promotion_code?
    cart_items.present? && !promotion_code
  end
end

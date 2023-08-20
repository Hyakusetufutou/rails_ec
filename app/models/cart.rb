# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :promotion_code, optional: true

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

  def more_than_reduced_rate?(reduced_rate)
    total_price > reduced_rate
  end

  def billing_amount
    reduced_rate = PromotionCode.find_by(id: promotion_code_id)&.reduced_rate
    if reduced_rate
      total_price - reduced_rate
    else
      total_price
    end
  end
end

# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

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
end

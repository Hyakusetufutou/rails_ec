class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  LOWER_LIMIT = 1
  UPPER_LIMIT = 20

  def add_item(product_id, quantity)
    item = cart_items.find_by(product_id: product_id) || cart_items.build(product_id: product_id)
    item.increase(quantity)
  end

  def total_item
    item_num = 0
    if cart_items.present?
      cart_items.each { |item| item_num += item.quantity }
    end
    item_num
  end

end

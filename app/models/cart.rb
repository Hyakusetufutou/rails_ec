class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_item(product_id, quantity)
    item = cart_items.find_by(product_id: product_id) || cart_items.build(product_id: product_id)
    item.quantity += quantity.to_i
    # if item
    #   item.quantity += quantity
    # else 
    #   item.quantity = quantity
    # end
    item.save
  end
end

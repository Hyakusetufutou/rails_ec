class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

  validates :email, { presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }}
  validates :zip, { presence: true, format: { with: /\A\d{7}\z/ }}
  validates :cc_name, { presence: true, format: { with: /\A[A-Z]+[\s][A-Z]+\z/ }}
  validates :cc_number, { presence: true, format: { with: /\A\d{14,16}\z/ }}
  validates :cc_expiration, { presence: true, format: { with: /\A\d{2}[\/]\d{2}\z/ }}
  validates :cc_cvv, { presence: true, format: { with: /\A\d{3,4}\z/ }}
  validates :billing_amount, numericality: { only_integer: true }

  def register_order_details(cart_items)
    cart_items.each do |cart_item|
      order_detail = order_details.build(product_id: cart_item.product_id, quantity: cart_item.quantity, price: cart_item.total_price)
      return false unless order_detail.save
    end
  end

end

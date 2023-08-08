class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :price, numericality: { only_integer: true }
  validates :quantity, numericality: { only_integer: true }
end

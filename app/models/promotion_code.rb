class PromotionCode < ApplicationRecord
  has_one :cart
  has_one :order

  validates :code, { uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]{7}\z/ }}
  validates :reduced_rate, { numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 1000 }} 
  validates :status, { numericality: { only_integer: true }}

  enum :status, { unused: 0, used: 1 }
end

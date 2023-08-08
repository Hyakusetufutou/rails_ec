class Order < ApplicationRecord
  has_many :order_details, dependent: destroy

  validates :email, { presence: true, { presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }}}
  validates :zip, { presence: true, format: { with: /\A\d{7}\z/ }}
  validates :cc_name, { presence: true, format: { with: /\A[A-Z]+[ ][A-Z]+\z/ }}
  validates :cc_number, { presence: true, format: { with: /\A\d{14,16}\z/ }}
  validates :cc_expiration, { presence: true, format: { with: /\A\d{2}[/]\d{2}\z/ }}
  validates :cc_cvv, { presence: true, format: { with: /\A\d{3,4}\z/ }}
  validates :billing_amount, numericality: { only_integer: true }
end

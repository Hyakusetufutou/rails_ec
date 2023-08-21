# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validates :code, { uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]{7}\z/ } }
  validates :reduced_rate,
            { numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 1000 } }

end

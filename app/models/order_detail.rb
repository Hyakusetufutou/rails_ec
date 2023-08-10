# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :price, numericality: { only_integer: true }
  validates :quantity, numericality: { only_integer: true }

  delegate :firstname, to: :order, prefix: true
  delegate :name, to: :product, prefix: true
  delegate :id, to: :order, prefix: true
  delegate :created_at, to: :order, prefix: true
  delegate :price, to: :product, prefix: true
  delegate :image, to: :product, prefix: true
  delegate :description, to: :product, prefix: true
end

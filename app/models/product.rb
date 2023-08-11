# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :image, presence: true
  validate :image_type, if: :image_was_attached?

  enum :status, { active: 0, deleted: 1}

  private

  def image_type
    return if image.blob.content_type.in?(%('image/jpeg image/jpg image/png'))

    image.purge
    errors.add(:image, 'はjpeg,jpgまたはpng形式でアップロードしてください')
  end

  def image_was_attached?
    image.attached?
  end
end

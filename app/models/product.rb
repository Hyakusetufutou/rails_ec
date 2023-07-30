# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :image, presence: true
  validate :image_type, if: :image_was_attached?

  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpeg image/jpg image/png'))
      image.purge
      errors.add(:image, 'はjpeg,jpgまたはpng形式でアップロードしてください')
    end
  end

  def image_was_attached?
    self.image.attached?
  end
end

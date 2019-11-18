class Item < ApplicationRecord
  mount_uploader :image, ItemImageUploader

  validates :image, :title, :description, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many_attached :gallery_images

  validates :title, presence: true, length: { minimum: 10, maximum: 79 }
  validates :description, presence: true, length: { minimum: 50, maximum: 2000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

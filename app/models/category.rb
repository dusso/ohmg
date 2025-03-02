class Category < ApplicationRecord
  has_many :ads
  
  validates :name, presence: true, uniqueness: true
end

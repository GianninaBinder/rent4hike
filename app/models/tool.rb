class Tool < ApplicationRecord
  CATEGORIES = ["Tents", "Footwear", "Sleeping bags", "Accessoires", "Backpacks", "Clothing"]
  has_many_attached :photos
  belongs_to :user

  validates :category, inclusion: { in: CATEGORIES }
end

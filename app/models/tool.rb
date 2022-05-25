class Tool < ApplicationRecord
  CATEGORIES = ["Tents", "Footwear", "Sleeping bags", "Accessoires", "Backpacks", "Clothing"]
  has_one_attached :photo
  belongs_to :user

  validates :category, inclusion: { in: CATEGORIES }
end

class Tool < ApplicationRecord
  CATEGORIES = ["tents", "footwear", "sleeping bags", "accessoires", "backpacks", "clothing"]
  has_one_attached :photo
  belongs_to :user

  validates :category, inclusion: { in: CATEGORIES }
end

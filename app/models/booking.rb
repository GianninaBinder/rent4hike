class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  def price_total
    (end_date - start_date).to_i * tool.price

  end

end

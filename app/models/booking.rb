class Booking < ApplicationRecord
  belongs_to :monster
  belongs_to :user

  validates :end_date, comparison: { greater_than: :start_date }
end

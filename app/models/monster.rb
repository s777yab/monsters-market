class Monster < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :species, :ability, :price, :address, :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

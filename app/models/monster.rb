
class Monster < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, :species, :ability, :price, :address, :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_marketplace,
    against: [ :name, :species, :ability ],
    associated_against: {
      user: [:email]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end

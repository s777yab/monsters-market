class Review < ApplicationRecord
  belongs_to :monster
  belongs_to :user

  validates :comment, :rating, presence: true
  validates :comment, length: { in: 10..120 }
end

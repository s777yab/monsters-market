class Booking < ApplicationRecord
  belongs_to :monster
  belongs_to :user

  validates :end_date, comparison: { greater_than: :start_date }
  validate :user_cannot_book_their_monster

  private

  def user_cannot_book_their_monster
    errors.add(:base, "You cannot book your own monster.") if user_id == monster.user_id
  end
end

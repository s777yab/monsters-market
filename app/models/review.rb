class Review < ApplicationRecord
  belongs_to :monster
  belongs_to :user
end

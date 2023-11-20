class UsersController < ApplicationController
  def user
    @bookings = Booking.where(current_user.id == :user_id)
  end
end

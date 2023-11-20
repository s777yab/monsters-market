class UsersController < ApplicationController
  def user
    @bookings = Booking.find(Booking.find(current_user.id))
  end
end

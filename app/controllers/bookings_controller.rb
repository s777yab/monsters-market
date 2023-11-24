require 'date'
class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @monster = Monster.find(params[:monster_id])
    @review = Review.new
    @booking.active = true
    @monster.update(bookable: false)
    @booking.monster = @monster
    if @booking.save && @monster.user != current_user
      redirect_to user_path(current_user)
    else
      flash.alert = "Unable to book own monster."
      render "monsters/show", status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :active)
  end

end

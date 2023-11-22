class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @monster = Monster.find(params[:monster_id])
    @review = Review.new
    @booking.monster = @monster
    if @booking.save
      # Monster is not longer bookable
      redirect_to user_path(current_user)
    else
      render "monsters/show", status: :unprocessable_entity
    end
  end

  # change bookings to inactive if today date >= end_date

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.monster_id = params[:monster_id]
    if @booking.save
      redirect_to user_path(current_user)
    else
      render monster_path(params[:monster_id])
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

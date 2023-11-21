class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @monster = Monster.find(params[:monster_id])
    @review = Review.new
    @booking.monster = @monster
    if @booking.save
      redirect_to user_path(current_user)
    else
      render "monsters/show", status: :unprocessable_entity
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

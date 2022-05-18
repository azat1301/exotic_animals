class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking]).order(start_date: :desc)
  end

  def update
    # raise StandardError, 'NotAuthorized' unless @restaurant.user == current_user
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to owner_bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :animal, :status)
  end
end

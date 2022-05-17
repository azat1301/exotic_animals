class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(start_date: :desc)
  end

  def create
    @booking = Booking.new(booking_params)
    @animal = Animal.find(params[:animal_id])
    @booking.animal = @animal
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to root_path
    else
      render "animals/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :animal, :status)
  end
end

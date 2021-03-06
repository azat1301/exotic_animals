class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(start_date: :desc)
    @markers = @bookings.map do |booking|
      {
        lat: booking.animal.latitude,
        lng: booking.animal.longitude,
        info_window: render_to_string(partial: 'animals/info_window', locals: { animal: booking.animal })
      }
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @animal = Animal.find(params[:animal_id])
    @booking.animal = @animal
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created. Please wait until the owner confirms'
    else
      render "animals/show"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    # raise StandardError, 'NotAuthorized' unless @restaurant.user == current_user
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_url notice: "The booking was successfully deleted."
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user, :animal, :status)
  end
end

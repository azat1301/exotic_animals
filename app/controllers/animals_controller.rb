class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = policy_scope(Animal.where(user_id: current_user.id))
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @animals.geocoded.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        # info_window: render_to_string(partial: 'flats/info_window', locals: { flat: flat }),
        # custom_marker: render_to_string(partial: 'flats/marker', locals: { flat: flat }),
      }
    end
  end

  def show
    @animal = Animal.find(params[:id])
    authorize @animal
    @booking = Booking.new
    @markers =[
      {
        lat: @animal.latitude,
        lng: @animal.longitude,
        # info_window: render_to_string(partial: 'animals/info_window', locals: { flat: flat }),
        # custom_marker: render_to_string(partial: 'flats/marker', locals: { flat: flat }),
      }]
    end
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    authorize @animal

    if @animal.save
      redirect_to animal_path(@animal), notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :sex, :rarity_level, :age, :diet, :price, :location, :photo)
  end
end

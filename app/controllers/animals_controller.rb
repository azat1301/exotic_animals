class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @animals = policy_scope(Animal).search_by_species_and_location_and_name(params[:query])
    else
      @animals = policy_scope(Animal).order(created_at: :desc)
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    authorize @animal
    @markers = [
      {
        lat: @animal.latitude,
        lng: @animal.longitude,
        info_window: render_to_string(partial: 'animals/info_window', locals: { animal: @animal })
      }
    ]
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
      redirect_to animals_path, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :sex, :rarity_level, :age, :diet, :price, :location, :photo)
  end
end

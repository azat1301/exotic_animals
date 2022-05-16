class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params(:id))
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :sex, :rarity_level, :age, :diet, :price, :location, :user)
  end
end

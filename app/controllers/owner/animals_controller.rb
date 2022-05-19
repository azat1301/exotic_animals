class Owner::AnimalsController < ApplicationController

  def index
    if params[:query].present?
      @animals = policy_scope(Animal).search_by_species_and_rarity_level(params[:query])
    else
      @animals = policy_scope(Animal.where(user_id: current_user.id))
    end
  end
end

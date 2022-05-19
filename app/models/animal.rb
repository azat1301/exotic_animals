class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_species_and_rarity_level,
    against: [ :species, :rarity_level ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  enum sex: { Uknown: 0, Male: 1, Female: 2 }
  enum rarity_level: { Threatened: 0, Endangered: 1, "Extinct in the Wild" => 2 }
  enum diet: { Herbivore: 0, Omnivore: 1, Carnivore: 2, Pescivore: 3, Insectivore: 4, Popcornivore: 5 }
end

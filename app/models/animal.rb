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
end

class Booking < ApplicationRecord
  belongs_to :animal_id
  belongs_to :user_id
end

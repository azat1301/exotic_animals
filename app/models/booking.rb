class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  enum status: { pending: 0, confirmed: 1, denied: 2, complete: 3 }
end

class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc) # change to start_date
  end
end

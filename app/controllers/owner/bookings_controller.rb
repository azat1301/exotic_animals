class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking]).order(created_at: :desc) # change to start_date
  end
end

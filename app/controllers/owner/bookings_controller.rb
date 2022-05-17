class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking]).order(start_date: :desc)
  end
end

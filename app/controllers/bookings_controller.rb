class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(start_date: :desc)
  end
end

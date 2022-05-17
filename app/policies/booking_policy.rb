class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
    #   scope.all
      user.bookings
    end
  end
  def create?
    true
  end
  def destroy?
    true
  end
end

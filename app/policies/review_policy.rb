class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      animal.reviews
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  # def update?
  #   record.user == user || record.animal.user == user
  # end

  # def destroy?
  #   true
  # end
end

class AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    user_is_owner?
  end

  def show?
    true
  end

  private

  def user_is_owner?
    record.user == user # corresponds to animal.user == current_user
  end
end

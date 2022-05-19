class Owner::AnimalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      user.animals_as_owner
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end
end

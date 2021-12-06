class WalletInclusionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    @user == user
  end
  def destroy?
    true
  end
end

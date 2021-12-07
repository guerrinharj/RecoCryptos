class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def wallet?
    @user == user
  end

  def update?
    record.user == user
  end
end

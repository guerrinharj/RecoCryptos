class CryptoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def upvote?
    true
  end

  def downvote?
    true
  end
end

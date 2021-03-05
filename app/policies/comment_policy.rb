class CommentPolicy < ApplicationPolicy

  def update?
    @user.moderator?
  end

  def destroy?
    @user.moderator?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

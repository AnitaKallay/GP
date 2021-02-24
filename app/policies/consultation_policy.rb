class ConsultationPolicy < ApplicationPolicy

  def update?
    user == record.user || @user.admin? || @user.moderator?
  end

  def destroy?
    user == record.user || @user.admin? || @user.moderator?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

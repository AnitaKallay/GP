class ConsultationPolicy < ApplicationPolicy
  def initialize(user, record)
      @user = user
      @record = record
  end

  def update?
    user == @user.admin? || @user.moderator?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

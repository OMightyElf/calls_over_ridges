class UserPolicy < ApplicationPolicy
  def show?
    record == user || user.admin?
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    show?
  end

  def update?
    edit?
  end

  def destroy?
    update?
  end

  def save_receipt?
    update?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        User.all
      else
        user
      end
    end
  end
end

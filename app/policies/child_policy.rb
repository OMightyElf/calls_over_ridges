class ChildPolicy < ApplicationPolicy
  def show?
    user == record.user || user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        Child.all
      else
        user.children
      end
    end
  end
end

class ToolPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    return true
  end

  def new?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end

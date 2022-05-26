class BookingPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user == user
  end

  def create?
    true
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
      scope.where(user: user)
    end
  end
end

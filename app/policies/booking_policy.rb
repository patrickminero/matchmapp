class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def confirmation?
    return true
  end

  def dashboard?
    return true
  end

  def accepted?
    return true
  end

  def destroy?
    return true
  end
end

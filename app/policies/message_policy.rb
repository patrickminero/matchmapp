class MessagePolicy < ApplicationPolicy
  def create?
    !user.nil?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

class BarPolicy < ApplicationPolicy

  def color_vote?
    !user.nil?
  end
  
  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

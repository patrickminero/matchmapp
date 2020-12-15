class BarPolicy < ApplicationPolicy

  def color_vote?
    user.nil? ? false : true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

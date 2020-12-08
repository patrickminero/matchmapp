class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @match = Match.new
  end

  def show
  end

end

class MatchesController < ApplicationController
  def index
    if params[:query].present?
      @matches = Match.global_search(params[:query])
    else
      @matches = Match.all
    end
  end

end

class MatchesController < ApplicationController
  def index
    if params[:query].present?
      @matches = Match.global_search(params[:query])
    elsif params[:sports].present?
      @matches = Match.where(sports: params[:sports])
    else
      @matches = Match.all
    end
  end
end

class MatchesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:latitude].present? && params[:longitude].present?
      session[:latitude] = params[:latitude]
      session[:longitude] = params[:longitude]
    end

    if params[:location].present?
      results = Geocoder.search(params[:location])
      results.first.coordinates

      session[:latitude] = results.first.coordinates.first
      session[:longitude] = results.first.coordinates.last
    end

    if params[:query].present?
      @matches = Match.global_search(params[:query])
    elsif params[:sports].present?
      @matches = Match.where(sports: params[:sports])
    else
      @matches = Match.all
    end
  end
end

class BarsController < ApplicationController
  def index
    @bars = Bar.includes(:matches).where(matches: { id: params[:match_id]})
  end
end

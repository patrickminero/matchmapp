class BarsController < ApplicationController
  def index
    @bars = Bar.includes(:matches).where(matches: { id: params[:match_id] })
    session[:match_id] = params[:match_id]
    @match = Match.find(params[:match_id])
  end

  def show
    @bar = Bar.find(params[:id])
    @review = Review.new
    @marker = {
      lat: @bar.latitude,
      lng: @bar.longitude
    }
    @screening = Screening.find_by(match_id: session[:match_id], bar_id: params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)

    redirect_to bar_path(@bar)
  end

  private

  def bar_params
    params.require(:bar).permit(:status)
  end
end

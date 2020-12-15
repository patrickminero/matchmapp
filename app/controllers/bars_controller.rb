class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @bars = policy_scope(Bar).includes(:matches).where(matches: { id: params[:match_id] }).near([session[:latitude], session[:longitude]], 30)

    session[:match_id] = params[:match_id]
    @match = Match.find(params[:match_id])
    @markers = @bars.geocoded.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar })
      }
    end
  end

  def show
    @bar = Bar.find(params[:id])
    @review = Review.new
    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]
    @screening = Screening.find_by(match_id: session[:match_id], bar_id: params[:id])

    authorize @bar
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)

    redirect_to bar_path(@bar)
  end

  def color_vote
    @bar = Bar.find(params[:id])
    color = params[:color]
    @bar.color_vote(color)
    respond_to do |format|
      format.html { redirect_to bar_path(@bar) }
      format.json { render json: @bar }
     end
  end

  private

  def bar_params
    params.require(:bar).permit(:status)
  end
end

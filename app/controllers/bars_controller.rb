class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    @review = Review.new
    @marker = {
        lat: @bar.latitude,
        lng: @bar.longitude
      }
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

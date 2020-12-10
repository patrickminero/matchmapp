class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @bar = Bar.find(params[:bar_id])
    @match = Match.find(session[:match_id])
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @bar = Bar.find(params[:bar_id])
    @booking.bar = @bar
    @booking.user = current_user
    @booking.match = Match.find(session[:match_id])
    if @booking.save
      redirect_to confirmation_bar_booking_path(@bar.id, @booking.id)
    else
      render :new
    end
  end

  def confirmation
    @bar = Bar.find(params[:bar_id])
    @booking = Booking.find(params[:id])
    @match = Match.find(session[:match_id])
  end

  def dashboard
    @bookings = Booking.all.order(:created_at)
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    flash[:notice] = "You accepted the booking...!"
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :number_of_people)
  end
end

class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    @bookings = @profile.user.bookings
    authorize @profile
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    authorize @profile
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:favourite_sport, :favourite_team, :name, :description, :photo)
  end


end

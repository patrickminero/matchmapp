class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_profile

  def set_profile
    @profile = current_user&.profile
  end


end

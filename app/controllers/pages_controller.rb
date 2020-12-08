class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @matches = Match.all
    @match = Match.new
  end
end

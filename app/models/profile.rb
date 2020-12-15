class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, through: :user
  has_many :bars, through: :bookings

  def get_background
    begin
      response = HTTParty.get("https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=#{self.favourite_team}")
      response = JSON.parse response.body, symbolize_names: true
      response[:teams][0][:strTeamFanart1]
    rescue
      "https://i.imgur.com/TroN2YL.jpg"
    end

  end

  def photo_url
    if photo.attached?
      photo.key
    else
      "https://i.pinimg.com/474x/6f/64/60/6f6460212a397968497afbb9d81d6b3a.jpg"
    end
  end


end



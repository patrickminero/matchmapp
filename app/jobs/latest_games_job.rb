require 'httparty'

class LatestGamesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    response = HTTParty.get('https://www.thesportsdb.com/api/v1/json/1/all_leagues.php')
    puts response.body
  end
end

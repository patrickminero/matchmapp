require 'httparty'

class LatestGamesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    response = HTTParty.get('https://www.thesportsdb.com/api/v1/json/1/all_leagues.php')
    response = JSON.parse response.body, symbolize_names: true
    leagues = response[:leagues].select { |league| SPORT_CATEGORY.include?(league[:strSport]) }.map { |league| league[:idLeague] }
    leagues = leagues.first(1)
    leagues.each do |league|
      response = HTTParty.get("https://www.thesportsdb.com/api/v1/json/1/eventsnextleague.php?id=#{league}")
      response = JSON.parse response.body, symbolize_names: true
      matches = response[:events].map do |match|
        date = "#{match[:dateEvent]}T#{match[:strTime] == "00:00:00" ? '20:00:00' : match[:strTime]}"
        {unique_event_id: match[:idEvent], home_team: match[:strHomeTeam], away_team: match[:strAwayTeam], date: date.to_datetime, league: match[:strLeague], sports: match[:strSport] }
      end
      Match.create matches
    end
  end
end


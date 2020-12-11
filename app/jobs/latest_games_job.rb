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
        { unique_event_id: match[:idEvent],
          home_team: match[:strHomeTeam], 
          away_team: match[:strAwayTeam], 
          date: date.to_datetime, 
          league: match[:strLeague], 
          sports: match[:strSport],
          home_team_logo: get_team_logo(match[:strHomeTeam]),
          away_team_logo:  get_team_logo(match[:strAwayTeam]) }
      end
      Match.create matches
    end
  end

  def get_team_logo(team_name)
    response = HTTParty.get("https://www.thesportsdb.com/api/v1/json/1/searchteams.php?t=#{team_name}")
    response = JSON.parse response.body, symbolize_names: true
    response[:teams][0][:strTeamBadge]
  end
end

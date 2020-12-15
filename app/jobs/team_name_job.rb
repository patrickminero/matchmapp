require 'httparty'

class TeamNameJob < ApplicationJob
  queue_as :default

  def perform(*args)
    team_name = []
    response = HTTParty.get('https://www.thesportsdb.com/api/v1/json/1/all_leagues.php')
    response = JSON.parse response.body, symbolize_names: true
    leagues = response[:leagues].select { |league| SPORT_CATEGORY.include?(league[:strSport]) }.map { |league| league[:idLeague] }
    leagues = leagues.first(20)
    leagues.each do |league|
      response = HTTParty.get("https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=#{league}")
      response = JSON.parse response.body, symbolize_names: true
      teams = response[:teams].map do |team|
        team_name.push(team[:strTeam])
      end
      p team_name
    end
  end


end
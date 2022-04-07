# frozen_string_literal: true

class Standing < ApplicationRecord
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def api_request
    standing_data
  end

  def standing_data
    Standing.delete_all
    user = User.find(User.current.id)
    team_id = user.favorite.team_id
    favorite_team = Team.find(team_id)
    favorite_team_api_id = favorite_team.api_id
    favorite_league = favorite_team.league_id
    league = League.find(favorite_league)
    league_api_id = league.api_id

    competitor_team_id = user.competitor[0].team_id
    competitor_team = Team.find(competitor_team_id)
    competitor_team_api_id = competitor_team.api_id

    array = [favorite_team_api_id, competitor_team_api_id]

    teams = array.map { |number| URI("https://v3.football.api-sports.io/standings?league=#{league_api_id}&season=#{season_year}&team=#{number}") }
    teams.each do |n|
      http = Net::HTTP.new(n.host, n.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(n)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api = results['response'][0]['league']['standings'][0][0]
      standing = Standing.new
      team_id = api['team']['id']
      team = Team.find_by(api_id: team_id)
      standing.team_id = team.id
      standing.team_name = team.name
      standing.team_logo = team.logo
      standing.rank = api['rank']
      standing.points = api['points']
      standing.played = api['all']['played']
      standing.save
    end
  end

  def season_year
    current_year = Time.zone.now.year
    current_month = Time.zone.now.month
    current_month <= 7 ? current_year - 1 : current_year
  end
end

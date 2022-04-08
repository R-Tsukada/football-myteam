# frozen_string_literal: true

class Api::StandingsController < ApplicationController
  before_action :api_request
  before_action :authenticate_user!
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def index
    @standing = Standing.all
  end

  def show; end

  private

  def api_request
    standing_data(api_request_url)
  end

  def standing_data(url)
    Standing.delete_all

    url.each do |n|
      http = Net::HTTP.new(n.host, n.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(n)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api = results['response'][0]['league']['standings'][0][0]
      save_standing(api)
    end
  end

  def save_standing(api)
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

  def api_request_url
    team_numbers = [favorite_team_api_id, competitor_team_api_id]
    team_numbers.map { |number| URI("https://v3.football.api-sports.io/standings?league=#{league_api_id}&season=#{season_year}&team=#{number}") }
  end

  def competitor_team_api_id
    competitor_team_id = current_user.competitor[0].team_id
    competitor_team = Team.find(competitor_team_id)
    competitor_team.api_id
  end

  def league_api_id
    favorite_league = favorite_team.league_id
    league = League.find(favorite_league)
    league.api_id
  end

  delegate :api_id, to: :favorite_team, prefix: true

  def favorite_team
    user = current_user
    team_id = user.favorite.team_id
    Team.find(team_id)
  end

  def season_year
    current_year = Time.zone.now.year
    current_month = Time.zone.now.month
    current_month <= 7 ? current_year - 1 : current_year
  end
end

# frozen_string_literal: true

class Api::FavoriteTeamMatchesController < ApplicationController
  before_action :set_match
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def index
    user = current_user
    favorite_team = user.favorite.team_id
    current_team = Team.find(favorite_team).api_id
    @match = Match.all.order(:date).where(date: Time.zone.today.., team_matches_index: current_team).first(3)
  end

  private

  def set_match
    Match.delete_all
    api_request
  end

  def api_request
    api_request_url.each do |url|
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api = results
      save_match(api)
    end
  end

  def save_match(api)
    api['response'].each_index do |a|
      match = Match.new
      match.season = [api][0]['parameters']['season']
      match.team_matches_index = [api][0]['parameters']['team']
      match.date = [api][0]['response'][a]['fixture']['date'].scan(/\d\d\d\d-\d\d-\d\d/).join('')
      stadium = [api][0]['response'][a]['fixture']['venue']['name']
      match.home_and_away = stadium == favorite_team_stadium ? 'HOME' : 'AWAY'
      match.competition_name = [api][0]['response'][a]['league']['name']
      match.competition_logo = [api][0]['response'][a]['league']['logo']
      home_team_name = [api][0]['response'][a]['teams']['home']['name']
      away_team_name = [api][0]['response'][a]['teams']['away']['name']
      current_team = Team.find_by(api_id: match.team_matches_index)
      match.team_name = home_team_name == current_team.name ? away_team_name : home_team_name
      home_logo = [api][0]['response'][a]['teams']['home']['logo']
      away_logo = [api][0]['response'][a]['teams']['away']['logo']
      match.team_logo = home_logo == current_team.logo ? away_logo : home_logo
      match.home_score = [api][0]['response'][a]['score']['fulltime']['home']
      match.away_score = [api][0]['response'][a]['score']['fulltime']['away']
      match.save
    end
  end

  def api_request_url
    api_ids = competitor_teams.unshift(favorite_team_api_id)
    api_ids.map { |i| URI("https://v3.football.api-sports.io/fixtures?&season=#{season_year}&team=#{i}") }
  end

  def competitor_teams
    @user = current_user
    competitor_team_id = @user.competitor.map(&:team_id)
    competitor_team_id.map { |c| Team.find(c).api_id }
  end

  def favorite_team_api_id
    favorite_team_id = @user.favorite.team_id
    Team.find(favorite_team_id).api_id
  end

  def favorite_team_name
    id = @user.favorite.team_id
    team = Team.find(id)
    team.name
  end

  def favorite_team_stadium
    id = @user.favorite.id
    team = Team.find(id)
    team.stadium
  end

  def season_year
    current_year = Time.zone.now.year
    current_month = Time.zone.now.month
    current_month <= 7 ? current_year - 1 : current_year
  end
end

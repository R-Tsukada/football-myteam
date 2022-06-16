# frozen_string_literal: true

class API::MatchesController < ApplicationController
  before_action :set_match
  before_action :set_show_page, only: [:show]
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def index
    @match = Match.all.order(:date).first(9)
  end

  def show
    @match_show = Match.all.where(team_matches_index: @team_id).order(:date)
  end

  private

  def set_show_page
    @team_id = Team.find(params.require(:id))
  end

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
  rescue StandardError => e
    Rails.logger.debug e.full_message
  end

  def save_match(api)
    api['response'].each_index do |a|
      match = Match.new
      match.season = [api][0]['parameters']['season']
      current_team = Team.find_by(api_id: [api][0]['parameters']['team'])
      match.team_matches_index = current_team.id
      match.date = [api][0]['response'][a]['fixture']['date']
      stadium = [api][0]['response'][a]['fixture']['venue']['name']
      match.home_and_away = stadium == current_team.stadium ? 'HOME' : 'AWAY'
      match.competition_name = [api][0]['response'][a]['league']['name']
      match.competition_logo = [api][0]['response'][a]['league']['logo']
      match.home_team_name = [api][0]['response'][a]['teams']['home']['name']
      match.away_team_name = [api][0]['response'][a]['teams']['away']['name']
      match.team_name = match.home_team_name == current_team.name ? match.away_team_name : match.home_team_name
      match.home_logo = [api][0]['response'][a]['teams']['home']['logo']
      match.away_logo = [api][0]['response'][a]['teams']['away']['logo']
      match.team_logo = match.home_logo == current_team.logo ? match.away_logo : match.home_logo
      match.home_score = [api][0]['response'][a]['score']['fulltime']['home']
      match.away_score = [api][0]['response'][a]['score']['fulltime']['away']
      match.save
    end
  end

  # レビュー用に日付を調節
  def api_request_url
    api_id = competitor_teams.unshift(favorite_team_api_id)
    api_id.map { |i| URI("https://v3.football.api-sports.io/fixtures?&season=#{current_season}&team=#{i}&from=#{match_date}") }
  end

  def match_date
    '2022-02-30&to=2022-03-30'
  end

  def current_season
    '2021'
  end
  # ここまで

  def competitor_teams
    competitor_team_id = current_user.competitor.map(&:team_id)
    competitor_team_id.map { |c| Team.find(c).api_id }
  end

  def favorite_team_api_id
    favorite_team.api_id
  end

  def favorite_team_name
    favorite_team.name
  end

  def favorite_team
    id = current_user.favorite.team_id
    Team.find(id)
  end

  def season_year
    current_month <= 7 ? current_year - 1 : current_year
  end

  def current_year
    Time.zone.now.year
  end

  def current_month
    Time.zone.now.month
  end

  def current_day
    Time.zone.now.strftime('%Y-%m-%d')
  end

  def next_month
    Time.zone.now.next_month.strftime('%Y-%m-%d')
  end

  def prev_month
    Time.zone.now.prev_month.strftime('%Y-%m-%d')
  end
end

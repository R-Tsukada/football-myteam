# frozen_string_literal: true

class API::StandingsController < ApplicationController
  before_action :api_request
  before_action :authenticate_user!

  def index
    @standing = Standing.all
  end

  def show; end

  private

  def api_request
    StandingRequest.league(api_request_url)
  end

  def api_request_url
    team_numbers = competitor_team_api_id.unshift(favorite_team.api_id)
    team_numbers.map { |number| URI("https://v3.football.api-sports.io/standings?league=#{league_api_id(favorite_team)}&season=#{Year.season}&team=#{number}") }
  end

  def competitor_team_api_id
    SelectTeam.competitor(current_user)
  end

  def league_api_id(favorite_team)
    league = League.find(favorite_team.league_id)
    league.api_id
  end

  def favorite_team
    current_user.favorite.team
  end
end

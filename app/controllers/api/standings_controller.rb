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
    team_numbers = competitor_team_api_id.unshift(favorite_team_api_id)
    team_numbers.map { |number| URI("https://v3.football.api-sports.io/standings?league=#{league_api_id}&season=#{season_year}&team=#{number}") }
  end

  def competitor_team_api_id
    SelectTeam.competitor(current_user)
  end

  def league_api_id
    SelectTeam.league(favorite_team)
  end

  delegate :api_id, to: :favorite_team, prefix: true

  def favorite_team
    SelectTeam.favorite(current_user)
  end

  def season_year
    Year.season
  end
end

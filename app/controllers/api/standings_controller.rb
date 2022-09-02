# frozen_string_literal: true

class API::StandingsController < ApplicationController
  before_action :authenticate_user!
  before_action :api_request

  def index
    favorite_team = current_user.favorite.team.id
    competitor_teams = current_user.competitor.map(&:team_id)
    teams = competitor_teams.unshift(favorite_team)
    standing = Standing.where(team_id: teams)
    @standing = standing
  end

  def show; end

  def api_request
    set_standing if current_user.favorite.team.standing.blank?
  end

  private

  def set_standing
    StandingRequest.league(api_request_url)
  end

  def api_request_url
    team_numbers = competitor_team_api_id.unshift(favorite_team.api_id)
    team_numbers.map { |number| URI("https://v3.football.api-sports.io/standings?league=#{league_api_id(favorite_team)}&season=#{Year.season}&team=#{number}") }
  end

  def competitor_team_api_id
    SelectTeam.competitor_team_api_id(current_user)
  end

  def league_api_id(favorite_team)
    league = League.find(favorite_team.league_id)
    league.api_id
  end

  def favorite_team
    current_user.favorite.team
  end
end

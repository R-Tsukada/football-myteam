# frozen_string_literal: true

class API::UpdateStandingsController < ApplicationController
  before_action :api_request
  before_action :authenticate_user!

  def index
    @standing = Standing.where(team_id: selected_team_ids)
  end

  private

  def api_request
    Standing.all.where(team_id: selected_team_ids).delete_all
    AccessLog.all(api_request_url)
  end

  def api_request_url
    team_numbers = competitor_team_api_id.unshift(favorite_team.api_id)
    team_numbers.map { |number| URI("https://v3.football.api-sports.io/standings?league=#{league_api_id(favorite_team)}&season=#{Year.season}&team=#{number}") }
  end

  def selected_team_ids
    competitor_team_id.unshift(current_user.favorite.team.id)
  end

  def competitor_team_id
    SelectTeam.competitor_team_id(current_user)
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

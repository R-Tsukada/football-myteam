# frozen_string_literal: true

class API::StandingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @standing = Standing.where(team_id: selected_team_ids)
  end

  def show; end

  private

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

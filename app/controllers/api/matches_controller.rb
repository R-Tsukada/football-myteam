# frozen_string_literal: true

class API::MatchesController < ApplicationController
  before_action :set_team, only: [:show]

  def index
    matches = Match.all.order(:date).where(home_team_name: team_names).or(Match.where(away_team_name: team_names))
    @match = matches.select { |match| match.date >= Time.zone.today }
  end

  def show
    @match = Match.all.order(:date).where(home_team_name: set_team.name).or(Match.where(away_team_name: set_team.name))
  end

  private

  def team_names
    teams = selected_team_ids.map { |id| Team.find(id) }
    teams.map(&:name)
  end

  def set_team
    Team.find(params[:id])
  end

  def selected_team_ids
    competitor_team_id.unshift(current_user.favorite.team.id)
  end

  def competitor_team_api_id
    SelectTeam.competitor_team_api_id(current_user)
  end

  def competitor_team_id
    SelectTeam.competitor_team_id(current_user)
  end
end

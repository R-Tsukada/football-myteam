# frozen_string_literal: true

class API::MatchesController < ApplicationController
  before_action :set_show_page, only: [:show]

  def index
    matches = Match.all.order(:date).where(home_team_name: team_names).or(Match.where(away_team_name: team_names))
    @match = matches.select { |match| match.date >= Time.zone.today }
  end

  def show
    @match_show = Match.all.where(team_id: @team_id).order(:date)
  end

  private

  def team_names
    teams = selected_team_ids.map { |id| Team.find(id) }
    teams.map(&:name)
  end

  def set_show_page
    @team_id = Team.find(params[:id])
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

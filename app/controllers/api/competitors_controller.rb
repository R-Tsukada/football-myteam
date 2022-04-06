# frozen_string_literal: true

class Api::CompetitorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_competitor_team, only: %i[create]

  def index
    user = current_user
    id = user.favorite.team_id
    team = Team.find(id)
    league = team.league_id
    @competitor_teams = Team.where(league_id: league)
  end

  def create
    user = current_user
    user.competitor_team_follow(@competitor_teams)
  end

  private

  def set_competitor_team
    id = params.require(:competitor).permit(:id)
    @competitor_teams = Team.find_by(id)
  end
end

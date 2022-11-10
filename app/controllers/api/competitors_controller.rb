# frozen_string_literal: true

class API::CompetitorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competitor_team, only: %i[create]

  def index
    @competitor = current_user.competitor.map { |c| Team.find(c.team_id) }
  end

  def create
    user = current_user
    if user.competitor_team_following?(@competitor_teams)
      user.competitor_team_unfollow(@competitor_teams)
    else
      user.competitor_team_follow(@competitor_teams)
    end
  end

  private

  def set_competitor_team
    @competitor_teams = Team.find(params[:id])
  end
end

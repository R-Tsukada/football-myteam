# frozen_string_literal: true

class Api::CompetitorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_competitor_team, only: %i[create]

  def index
    user = current_user
    @competitor = user.competitor
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
    id = params.require(:competitor).permit(:id)
    @competitor_teams = Team.find_by(id)
  end
end

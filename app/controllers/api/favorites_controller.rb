# frozen_string_literal: true

class API::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_follow, only: %i[create]

  def index
    @favorite_team = current_user.favorite&.team || []
  end

  def create
    user = current_user
    if user.favorite_team_following?(@team)
      user.favorite_team_unfollow(@team)
    else
      user.favorite_team_follow(@team)
    end
  end

  private

  def set_follow
    @team = Team.find(params.require(:id))
  end
end

# frozen_string_literal: true

class API::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_follow, only: %i[create]

  def index
    user = current_user
    @favorite_team = user.favorite.present? ? user.favorite.team : []
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
    id = params.require(:favorite).permit(:id)
    @team = Team.find_by(id)
  end
end

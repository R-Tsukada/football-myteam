# frozen_string_literal: true

class Api::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_favorite_team, only: %i[index]
  before_action :set_follow, only: %i[create]

  def index
    user = current_user
    @favorite_team = user.favorite.present? ? @team : @not_team
  end

  def create
    user = current_user
    user.favorite_team_follow(@team)
  end

  private

  def set_favorite_team
    user = current_user
    if user.favorite.present?
      id = user.favorite.team_id
      @team = Team.find(id)
    else
      @not_team = []
    end
  end

  def set_follow
    id = params.require(:favorite).permit(:id)
    @team = Team.find_by(id)
  end
end

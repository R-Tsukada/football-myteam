# frozen_string_literal: true

class Api::FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!
  before_action :set_follow

  def index; end

  def create
    user = current_user
    user.favorite_team_follow(@team)
  end

  private

  def set_follow
    id = params.permit(:id)
    @team = Team.find_by(id)
  end
end

# frozen_string_literal: true

class Api::TeamFilterController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    id = user.favorite.team_id
    team = Team.find(id)
    league = team.league_id
    @filter = Team.where(league_id: league).where.not(id: team.id)
  end
end

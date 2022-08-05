# frozen_string_literal: true

class API::TeamFilterController < ApplicationController
  before_action :authenticate_user!

  def index
    team = current_user.favorite.team
    @filter = Team.where(league: team.league_id).where.not(id: team.id)
  end
end

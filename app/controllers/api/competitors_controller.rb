# frozen_string_literal: true

class Api::CompetitorsController < ApplicationController
  def index
    user = current_user
    id = user.favorite.team_id
    team = Team.find(id)
    league = team.league_id
    @team_id = team
    @competitor_teams = Team.where(league_id: league)
  end
end

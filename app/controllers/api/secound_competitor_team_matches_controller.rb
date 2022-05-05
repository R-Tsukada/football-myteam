# frozen_string_literal: true

class Api::SecoundCompetitorTeamMatchesController < ApplicationController
  def index
    user = current_user
    competitor_teams = user.competitor.map(&:team_id)
    if competitor_teams.length >= 2
      current_team = Team.find(competitor_teams[1]).api_id
      @secound_competitor_team_matches = Match.all.order(:date).where(date: Time.zone.today.., team_matches_index: current_team).first(3)
    else
      render json: { message: 'error' }, status: :unprocessable_entity
    end
  end
end

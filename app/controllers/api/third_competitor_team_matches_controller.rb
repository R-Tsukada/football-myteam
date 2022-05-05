# frozen_string_literal: true

class Api::ThirdCompetitorTeamMatchesController < ApplicationController
  def index
    user = current_user
    competitor_teams = user.competitor.map(&:team_id)
    if competitor_teams.length == 3
      current_team = Team.find(competitor_teams[2]).api_id
      @third_competitor_team_matches = Match.all.order(:date).where(date: Time.zone.today.., team_matches_index: current_team).first(3)
    else
      return render json: { message: 'error' }, status: :unprocessable_entity
    end
  end
end

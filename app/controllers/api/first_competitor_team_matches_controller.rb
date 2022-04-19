# frozen_string_literal: true

class Api::FirstCompetitorTeamMatchesController < ApplicationController
  def index
    user = current_user
    competitor_teams = user.competitor.map(&:team_id)
    current_team = Team.find(competitor_teams[0]).api_id
    @first_competitor_team_matches = Match.all.order(:date).where(date: Time.zone.today.., team_matches_index: current_team).first(3)
  end
end

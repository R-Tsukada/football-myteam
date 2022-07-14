# frozen_string_literal: true

class SelectTeam < ApplicationRecord
  def self.favorite(user)
    team_id = user.favorite.team_id
    Team.find(team_id)
  end

  def self.competitor(user)
    competitor_team_id = user.competitor.map(&:team_id)
    competitor_team_id.map { |c| Team.find(c).api_id }
  end

  def self.league(favorite_team)
    league = League.find(favorite_team.league_id)
    league.api_id
  end
end

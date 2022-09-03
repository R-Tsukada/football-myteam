# frozen_string_literal: true

class SelectTeam
  def self.competitor_team_api_id(user)
    competitor_team = competitor_team_id(user)
    competitor_team.map { |c| Team.find(c).api_id }
  end

  def self.competitor_team_id(user)
    user.competitor.map(&:team_id)
  end
end

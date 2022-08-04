# frozen_string_literal: true

class SelectTeam
  def self.competitor(user)
    competitor_team_id = user.competitor.map(&:team_id)
    competitor_team_id.map { |c| Team.find(c).api_id }
  end
end

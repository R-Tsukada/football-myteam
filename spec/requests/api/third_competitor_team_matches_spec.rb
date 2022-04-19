# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::ThirdCompetitorTeamMatches', type: :request do
  describe 'GET /api/third_competitor_team_matches/index' do
    it 'returns http success' do
      league = FactoryBot.create(:league)
      team1 = FactoryBot.create(:team, league: league)
      team2 = FactoryBot.create(:team, league: league)
      team3 = FactoryBot.create(:team, league: league)
      user = FactoryBot.build(:user)
      sign_in user
      user.competitor_team_follow(team1)
      user.competitor_team_follow(team2)
      user.competitor_team_follow(team3)
      get api_third_competitor_team_matches_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end
end

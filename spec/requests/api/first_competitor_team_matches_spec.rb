# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::FirstCompetitorTeamMatches', type: :request do
  describe 'GET /api/first_competitor_team_matches/index' do
    it 'returns http success' do
      league = FactoryBot.create(:league)
      team = FactoryBot.create(:team, league: league)
      user = FactoryBot.build(:user)
      sign_in user
      user.competitor_team_follow(team)
      get api_first_competitor_team_matches_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::Standings', type: :request do
  describe 'GET /api/standings/index' do
    it 'returns http success' do
      league = FactoryBot.create(:league)
      team1 = FactoryBot.create(:team, :arsenal, league:)
      team2 = FactoryBot.create(:team, :manchester_united, league:)
      user = FactoryBot.build(:user)
      sign_in user
      user.favorite_team_follow(team1)
      user.competitor_team_follow(team2)
      get api_standings_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end
end

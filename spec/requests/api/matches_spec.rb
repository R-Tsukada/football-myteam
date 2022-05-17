# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::Matches', type: :request do
  describe 'GET /api/matches/index' do
    it 'returns http success' do
      league = FactoryBot.create(:league)
      team = FactoryBot.create(:team, league: league)
      user = FactoryBot.build(:user)
      sign_in user
      user.favorite_team_follow(team)
      get api_matches_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end
end

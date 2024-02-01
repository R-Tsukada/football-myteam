# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::UpdateMatches', type: :request do
  describe 'GET /update_matches/index' do
    it 'returns http success' do
      league = FactoryBot.create(:league)
      team = FactoryBot.create(:team, league:)
      user = FactoryBot.build(:user)
      sign_in user
      user.favorite_team_follow(team)
      get api_matches_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end
end

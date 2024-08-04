# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::teams', type: :request do
  let!(:league) { FactoryBot.create(:league) }
  let!(:active_team) { FactoryBot.create(:team, active: true, league:) }
  let!(:inactive_team) { FactoryBot.create(:team, active: false, league:) }

  describe 'GET /api/teams/index' do
    it 'returns http success' do
      user = FactoryBot.build(:user)
      sign_in user
      get api_teams_path(format: :json)
      expect(response).to have_http_status(:success)
    end
    it 'returns only active teams' do
      get '/api/teams'
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(1)
      expect(json_response.first['id']).to eq(active_team.id)
    end
  end
end

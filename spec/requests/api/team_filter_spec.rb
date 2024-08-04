# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::TeamFilters', type: :request do
  let!(:league) { FactoryBot.create(:league) }
  let!(:active_team) { FactoryBot.create(:team, active: true, league:) }
  let!(:inactive_team) { FactoryBot.create(:team, active: false, league:) }
  let!(:user_follow_team) { FactoryBot.create(:team, active: true, league:) }
  let(:user) { FactoryBot.build(:user) }

  before do
    sign_in user
    user.favorite_team_follow(user_follow_team)
  end

  describe 'GET /api/team_filter' do
    it 'returns http success' do
      get api_team_filter_index_path(format: :json)
      expect(response).to have_http_status(:success)
    end
    it 'returns only active teams' do
      get '/api/team_filter'
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(1)
      expect(json_response.first['id']).to eq(active_team.id)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::teams', type: :request do
  describe 'GET /api/teams/index' do
    it 'returns http success' do
      user = FactoryBot.build(:user)
      sign_in user
      get api_teams_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end
end

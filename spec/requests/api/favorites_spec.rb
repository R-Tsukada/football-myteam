# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  describe 'GET /api/favorites' do
    it 'post http success' do
      league = FactoryBot.create(:league)
      team = FactoryBot.create(:team, league: league)
      user = FactoryBot.create(:user)
      sign_in user
      post api_favorites_path, params: { id: team.id }
      expect(response).to have_http_status(:success)
    end
  end
end

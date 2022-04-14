require 'rails_helper'

RSpec.describe "Api::TeamFilters", type: :request do
  describe "GET /api/team_filter" do
    it "returns http success" do
      league = FactoryBot.create(:league)
      team = FactoryBot.create(:team, league: league)
      user = FactoryBot.build(:user)
      sign_in user
      user.favorite_team_follow(team)
      get api_team_filter_index_path(format: :json)
      expect(response).to have_http_status(:success)
    end
  end

end

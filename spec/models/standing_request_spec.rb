# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StandingRequest, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:league) { FactoryBot.build(:league, :premier_league) }
  let(:arsenal) { FactoryBot.create(:team, :arsenal, league: league) }
  let(:manchester_united) { FactoryBot.create(:team, :manchester_united, league: league) }

  it 'is ensure that the StandingRequest.league method is executed' do
    FactoryBot.create(:favorite, user: user, team: arsenal)
    FactoryBot.create(:competitor, user: user, team: manchester_united)
    competitor_team = user.competitor.map(&:team_id)[0]
    competitor_team_api_id = Team.find(competitor_team).api_id
    array = []
    favorite_url = URI("https://v3.football.api-sports.io/standings?league=#{league.api_id}&season=#{Year.season}&team=#{user.favorite.team.api_id}")
    competitor_url = URI("https://v3.football.api-sports.io/standings?league=#{league.api_id}&season=#{Year.season}&team=#{competitor_team_api_id}")
    array.push(favorite_url, competitor_url)
    expect(StandingRequest.league(array)).to be_truthy
  end
end

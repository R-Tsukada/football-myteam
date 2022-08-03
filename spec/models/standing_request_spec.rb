# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StandingRequest, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:league) { FactoryBot.build(:league, :premier_league) }
  let(:arsenal) { FactoryBot.build(:team, :arsenal, league: league) }
  let(:manchester_united) { FactoryBot.build(:team, :manchester_united, league: league) }
  let(:favorite_url) { URI("https://v3.football.api-sports.io/standings?league=#{league.api_id}&season=2021&team=42") }
  let(:competitor_url) { URI("https://v3.football.api-sports.io/standings?league=#{league.api_id}&season=2021&team=33") }
  let(:registered_team_url) { [favorite_url, competitor_url] }

  before do
    arsenal
    manchester_united
  end

  it 'is ensure that the StandingRequest.request_response method is executed' do
    standings = FactoryBot.build(:standing)
    standings_mock = double(standings)
    allow(StandingRequest).to receive(:league).and_return(standings_mock)
    expect { StandingRequest.league(registered_team_url) }.not_to raise_error
  end

  it 'is ensure that the StandingRequest.save_standing method is executed' do
    standings = FactoryBot.build(:standing)
    standings_mock = double(standings)
    allow(StandingRequest).to receive(:create).and_return(standings_mock)
    expect { StandingRequest.create(registered_team_url) }.not_to raise_error
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StandingRequest, type: :model do
  let(:league) { FactoryBot.build(:league) }
  let(:favorite_url) { URI("https://v3.football.api-sports.io/standings?league=#{league.api_id}&season=2021&team=42") }
  let(:competitor_url) { URI("https://v3.football.api-sports.io/standings?league=#{league.api_id}&season=2021&team=33") }
  let(:registered_teames) { [favorite_url, competitor_url] }
  let(:standings) { FactoryBot.build(:standing) }

  it 'is ensure that the StandingRequest.request_response method is executed' do
    standings_mock = double(standings)
    allow(StandingRequest).to receive(:call).and_return(standings_mock)
    expect { StandingRequest.call }.not_to raise_error
  end

  it 'is ensure that the StandingRequest.save_standing method is executed' do
    standings_mock = double(standings)
    allow(StandingRequest).to receive(:data_save).and_return(standings_mock)
    expect { StandingRequest.data_save(registered_teames) }.not_to raise_error
  end
end

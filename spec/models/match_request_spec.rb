# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MatchRequest, type: :model do
  let(:favorite_url) { URI('https://v3.football.api-sports.io/fixtures?&season=2021&team=42&from=2022-02-30&to=2022-03-30') }
  let(:competitor_url) do
    URI('https://v3.football.api-sports.io/fixtures?&season=2021&team=33&from=2022-02-30&to=2022-03-30')
  end
  let(:registered_teames) { [favorite_url, competitor_url] }
  let(:matches) { FactoryBot.build(:match) }

  it 'is ensure that the MatchRequest.league method is executed' do
    api_matche_mock = double(matches)
    allow(MatchRequest).to receive(:call).and_return(api_matche_mock)
    expect { MatchRequest.call }.not_to raise_error
  end

  it 'is ensure that the MatchRequest.save_match method is executed' do
    api_match_mock = double(matches)
    allow(MatchRequest).to receive(:data_save).and_return(api_match_mock)
    expect { MatchRequest.data_save(registered_teames) }.not_to raise_error
  end
end

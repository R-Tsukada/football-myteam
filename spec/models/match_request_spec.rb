# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MatchRequest, type: :model do
  let(:matches) { FactoryBot.build(:match) }

  it 'is ensure that the MatchRequest.league method is executed' do
    api_matche_mock = double(matches)
    allow(MatchRequest.new).to receive(:call).and_return(api_matche_mock)
    expect { MatchRequest.new.call }.not_to raise_error
  end
end

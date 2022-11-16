# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StandingRequest, type: :model do
  let(:standings) { FactoryBot.build(:standing) }

  it 'is ensure that the StandingRequest.request_response method is executed' do
    standings_mock = double(standings)
    allow(StandingRequest.new).to receive(:call).and_return(standings_mock)
    expect { StandingRequest.new.call }.not_to raise_error
  end
end

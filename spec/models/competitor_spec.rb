# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Competitor, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:league) { FactoryBot.create(:league) }
  let(:team) { FactoryBot.build(:team, league: league) }

  it 'is valid with a user_id and team_id' do
    competitor = FactoryBot.build(:competitor, user: user, team: team)

    expect(competitor).to be_valid
  end

  it 'is valid without a user_id' do
    competitor = FactoryBot.build(:competitor, user: nil, team: team)

    competitor.valid?
    expect(competitor.errors[:user]).to include('must exist')
  end

  it 'is valid without a team' do
    competitor = FactoryBot.build(:competitor, user: user, team: nil)

    competitor.valid?
    expect(competitor.errors[:team]).to include('must exist')
  end
end

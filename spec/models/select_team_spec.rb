# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SelectTeam, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:league) { FactoryBot.build(:league, :premier_league) }
  let(:team) { FactoryBot.build(:team, :arsenal, league: league) }

  it 'is return the api_id of the following competitor team' do
    FactoryBot.create(:competitor, user: user, team: team)
    expect(SelectTeam.competitor(user)).to eq [42]
  end

  it 'is not return when not following competitor team' do
    expect(SelectTeam.competitor(user)).to eq []
  end
end

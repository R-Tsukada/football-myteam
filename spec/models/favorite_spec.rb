# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it 'is valid with a user_id and team_id' do
    user = FactoryBot.build(:user)
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, league: league)
    favorite = FactoryBot.build(:favorite, user: user, team: team)

    expect(favorite).to be_valid
  end

  it 'is valid without a user_id' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, league: league)
    favorite = FactoryBot.build(:favorite, user: nil, team: team)

    favorite.valid?
    expect(favorite.errors[:user]).to include('を入力してください')
  end

  it 'is valid without a team' do
    user = FactoryBot.build(:user)
    favorite = FactoryBot.build(:favorite, user: user, team: nil)

    favorite.valid?
    expect(favorite.errors[:team]).to include('を入力してください')
  end
end

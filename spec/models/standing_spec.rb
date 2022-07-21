# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Standing, type: :model do
  league = FactoryBot.build(:league, :premier_league)
  FactoryBot.build(:team, league: league)

  it 'is valid without a team_id' do
    standing = FactoryBot.build(:standing, :manchester_united, team_id: nil)
    standing.valid?
    expect(standing.errors[:team_id]).to include('を入力してください')
  end

  it 'is valid without a team_name' do
    standing = FactoryBot.build(:standing, :manchester_united, team_name: nil)
    standing.valid?
    expect(standing.errors[:team_name]).to include('を入力してください')
  end

  it 'is valid without a team_logo' do
    standing = FactoryBot.build(:standing, :manchester_united, team_logo: nil)
    standing.valid?
    expect(standing.errors[:team_logo]).to include('を入力してください')
  end

  it 'is valid without a rank' do
    standing = FactoryBot.build(:standing, :manchester_united, rank: nil)
    standing.valid?
    expect(standing.errors[:rank]).to include('を入力してください')
  end

  it 'is valid without a points' do
    standing = FactoryBot.build(:standing, :manchester_united, points: nil)
    standing.valid?
    expect(standing.errors[:points]).to include('を入力してください')
  end

  it 'is valid without a played' do
    standing = FactoryBot.build(:standing, :manchester_united, played: nil)
    standing.valid?
    expect(standing.errors[:played]).to include('を入力してください')
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'is valid with a name, logo, api_id and leaague_id and home_city' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, league: league)
    expect(team).to be_valid
  end

  it 'is valid without a name' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, name: nil, league: league)
    team.valid?
    expect(team.errors[:name]).to include("can't be blank")
  end

  it 'is valid with a duplicate name' do
    league = FactoryBot.build(:league)
    FactoryBot.create(:team, league: league)
    team = Team.new(
      name: 'Arsenal',
      logo: 'https://media.api-sports.io/football/venues/494.png'
    )
    team.valid?
    expect(team.errors[:name]).to include('has already been taken')
  end

  it 'is valid without a logo' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, logo: nil, league: league)
    team.valid?
    expect(team.errors[:logo]).to include("can't be blank")
  end

  it 'is valid with a duplicate logo' do
    league = FactoryBot.build(:league)
    FactoryBot.create(:team, league: league)
    team = Team.new(
      name: 'Manchester United',
      logo: 'https://media.api-sports.io/football/teams/42.png'
    )
    team.valid?
    expect(team.errors[:logo]).to include('has already been taken')
  end

  it 'is valid without a api_id' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, api_id: nil, league: league)
    team.valid?
    expect(team.errors[:api_id]).to include("can't be blank")
  end

  it 'is valid with a duplicate logo' do
    league = FactoryBot.build(:league)
    FactoryBot.create(:team, league: league)
    team = Team.new(
      name: 'Manchester United',
      logo: 'https://media.api-sports.io/football/teams/33.png',
      api_id: '42'
    )
    team.valid?
    expect(team.errors[:api_id]).to include('has already been taken')
  end

  it 'is valid without a home_city' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, home_city: nil, league: league)
    team.valid?
    expect(team.errors[:home_city]).to include("can't be blank")
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  before do
    @team = Team.create(
      id: 1,
      name: 'Arsenal',
      logo: 'https://media.api-sports.io/football/teams/42.png',
      api_id: '42',
      home_city: 'London',
      league_id: 1
    )
  end
  it 'is valid with a name, logo, api_id and leaague_id and home_city' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, :arsenal, league: league)
    expect(team).to be_valid
  end

  it 'is valid without a name' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, name: nil, league: league)
    team.valid?
    expect(team.errors[:name]).to include('を入力してください')
  end

  it 'is valid with a duplicate name' do
    league = FactoryBot.build(:league)
    FactoryBot.create(:team, :arsenal, league: league)
    team = Team.new(
      name: 'Arsenal',
      logo: 'https://media.api-sports.io/football/venues/494.png'
    )
    team.valid?
    expect(team.errors[:name]).to include('はすでに存在します')
  end

  it 'is valid without a logo' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, logo: nil, league: league)
    team.valid?
    expect(team.errors[:logo]).to include('を入力してください')
  end

  it 'is valid with a duplicate logo' do
    league = FactoryBot.build(:league)
    FactoryBot.create(:team, :arsenal, league: league)
    team = Team.new(
      name: 'Manchester United',
      logo: 'https://media.api-sports.io/football/teams/42.png'
    )
    team.valid?
    expect(team.errors[:logo]).to include('はすでに存在します')
  end

  it 'is valid without a api_id' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, api_id: nil, league: league)
    team.valid?
    expect(team.errors[:api_id]).to include('を入力してください')
  end

  it 'is valid with a duplicate api_id' do
    league = FactoryBot.build(:league)
    FactoryBot.create(:team, :arsenal, league: league)
    team = Team.new(
      name: 'Manchester United',
      logo: 'https://media.api-sports.io/football/teams/33.png',
      api_id: '42'
    )
    team.valid?
    expect(team.errors[:api_id]).to include('はすでに存在します')
  end

  it 'is valid without a home_city' do
    league = FactoryBot.build(:league)
    team = FactoryBot.build(:team, home_city: nil, league: league)
    team.valid?
    expect(team.errors[:home_city]).to include('を入力してください')
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:league) { FactoryBot.create(:league) }
  let(:team) do
    FactoryBot.build(:team,
                     id: 1,
                     name: 'Arsenal',
                     logo: 'https://media.api-sports.io/football/teams/42.png',
                     api_id: '42',
                     home_city: 'London',
                     active: true,
                     league:)
  end

  it 'is valid with a name, logo, api_id, league_id, and home_city' do
    expect(team).to be_valid
  end

  it 'is invalid without a name' do
    team.name = nil
    team.valid?
    expect(team.errors[:name]).to include('を入力してください')
  end

  it 'is invalid with a duplicate name' do
    FactoryBot.create(:team, name: 'Arsenal', league:)
    team.valid?
    expect(team.errors[:name]).to include('はすでに存在します')
  end

  it 'is invalid without a logo' do
    team.logo = nil
    team.valid?
    expect(team.errors[:logo]).to include('を入力してください')
  end

  it 'is invalid with a duplicate logo' do
    FactoryBot.create(:team, logo: 'https://media.api-sports.io/football/teams/42.png', league)
    team.valid?
    expect(team.errors[:logo]).to include('はすでに存在します')
  end

  it 'is invalid without an api_id' do
    team.api_id = nil
    team.valid?
    expect(team.errors[:api_id]).to include('を入力してください')
  end

  it 'is invalid with a duplicate api_id' do
    FactoryBot.create(:team, api_id: '42', league:)
    team.valid?
    expect(team.errors[:api_id]).to include('はすでに存在します')
  end

  it 'is invalid without a home_city' do
    team.home_city = nil
    team.valid?
    expect(team.errors[:home_city]).to include('を入力してください')
  end

  it 'is invalid without active status' do
    team.active = nil
    team.valid?
    expect(team.errors[:active]).to include('は一覧にありません')
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe League, type: :model do
  it 'is valid with a name, logo' do
    league = FactoryBot.create(:league)
    expect(league).to be_valid
  end

  it 'is valid without a name' do
    league = FactoryBot.build(:league, name: nil)
    league.valid?
    expect(league.errors[:name]).to include('を入力してください')
  end

  it 'is valid with a duplicate name' do
    FactoryBot.create(:league)
    league = League.new(
      name: 'Premier League',
      logo: 'https://media.api-sports.io/football/leagues/39.png'
    )
    league.valid?
    expect(league.errors[:name]).to include('はすでに存在します')
  end

  it 'is valid without a logo' do
    league = FactoryBot.build(:league, logo: nil)
    league.valid?
    expect(league.errors[:logo]).to include('を入力してください')
  end

  it 'is valid with a duplicate logo' do
    FactoryBot.create(:league)
    league = League.new(
      name: 'Bundes League',
      logo: 'https://media.api-sports.io/football/leagues/39.png'
    )
    league.valid?
    expect(league.errors[:logo]).to include('はすでに存在します')
  end
end

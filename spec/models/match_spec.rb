# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  it 'is valid' do
    match = FactoryBot.build(:match)
    expect(match).to be_valid
  end

  it 'is valid without a fixture_id' do
    match = FactoryBot.build(:match, fixture_id: nil)

    match.valid?
    expect(match.errors[:fixture_id]).to include('を入力してください')
  end

  it 'is valid without a date' do
    match = FactoryBot.build(:match, date: nil)

    match.valid?
    expect(match.errors[:date]).to include('を入力してください')
  end

  it 'is valid without a season' do
    match = FactoryBot.build(:match, season: nil)

    match.valid?
    expect(match.errors[:season]).to include('を入力してください')
  end

  it 'is valid without a competition_name' do
    match = FactoryBot.build(:match, competition_name: nil)

    match.valid?
    expect(match.errors[:competition_name]).to include('を入力してください')
  end

  it 'is valid without a competition_logo' do
    match = FactoryBot.build(:match, competition_logo: nil)

    match.valid?
    expect(match.errors[:competition_logo]).to include('を入力してください')
  end

  it 'is valid without a home_and_away' do
    match = FactoryBot.build(:match, home_and_away: nil)

    match.valid?
    expect(match.errors[:home_and_away]).to include('を入力してください')
  end
end

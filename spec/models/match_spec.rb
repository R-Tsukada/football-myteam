# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  it 'is valid' do
    match = FactoryBot.build(:match)
    expect(match).to be_valid
  end

  it 'is valid without a date' do
    match = FactoryBot.build(:match, date: nil)

    match.valid?
    expect(match.errors[:date]).to include("can't be blank")
  end

  it 'is valid without a team_matches_index' do
    match = FactoryBot.build(:match, team_matches_index: nil)

    match.valid?
    expect(match.errors[:team_matches_index]).to include("can't be blank")
  end

  it 'is valid without a season' do
    match = FactoryBot.build(:match, season: nil)

    match.valid?
    expect(match.errors[:season]).to include("can't be blank")
  end

  it 'is valid without a competition_name' do
    match = FactoryBot.build(:match, competition_name: nil)

    match.valid?
    expect(match.errors[:competition_name]).to include("can't be blank")
  end

  it 'is valid without a competition_logo' do
    match = FactoryBot.build(:match, competition_logo: nil)

    match.valid?
    expect(match.errors[:competition_logo]).to include("can't be blank")
  end

  it 'is valid without a team_name' do
    match = FactoryBot.build(:match, team_name: nil)

    match.valid?
    expect(match.errors[:team_name]).to include("can't be blank")
  end

  it 'is valid without a team_logo' do
    match = FactoryBot.build(:match, team_logo: nil)

    match.valid?
    expect(match.errors[:team_logo]).to include("can't be blank")
  end

  it 'is valid without a home_and_away' do
    match = FactoryBot.build(:match, home_and_away: nil)

    match.valid?
    expect(match.errors[:home_and_away]).to include("can't be blank")
  end
end

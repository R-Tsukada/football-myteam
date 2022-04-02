# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:league) { FactoryBot.create(:league) }
  let(:team) { FactoryBot.create(:team, league: league) }

  it 'is valid with a email, password' do
    # user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it 'is valid without a email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is valid with a duplicate email' do
    FactoryBot.create(:user)
    user = User.new(
      email: 'admin@example.com',
      password: '123456'
    )
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'is valid with a password' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is' do
    user = User.new(
      email: 'test@example.com',
      password: '1234'
    )
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end

  it 'is should favorite team follow a user' do
    expect(user.favorite_team_following?(team)).to_not be_truthy

    user.favorite_team_follow(team)
    expect(user.favorite_team_following?(team)).to be_truthy

    user.favorite_team_unfollow(team)
    expect(user.favorite_team_following?(team)).to_not be_truthy
  end
end

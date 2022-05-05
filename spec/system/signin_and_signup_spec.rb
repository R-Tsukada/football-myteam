# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'devise', type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    @league = FactoryBot.create(:league)
    @arsenal = Team.create(
      id: 1,
      name: 'Arsenal',
      logo: 'https://media.api-sports.io/football/teams/42.png',
      api_id: '42',
      home_city: 'London',
      league_id: @league.id
    )
    @manchester = Team.create(
      id: 2,
      name: 'Manchester United',
      logo: 'https://media.api-sports.io/football/teams/33.png',
      api_id: '33',
      home_city: 'Manchester',
      league_id: @league.id
    )
  end

  it 'user can login', js: true do
    FactoryBot.create(:favorite, user: @user, team: @arsenal)
    @user.competitor_team_follow(@manchester)

    visit root_path
    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end

  it 'email error when login.', js: true do
    visit root_path
    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: 'error@example.com'
    fill_in 'パスワード', with: @user.password
    click_button 'ログイン'

    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end

  it 'password error when login.', js: true do
    visit root_path
    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: 'xxxxxx'
    click_button 'ログイン'

    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end

  it 'user create new account', js: true do
    visit root_path
    first('.button').click_link 'アカウント作成'
    fill_in 'Eメール', with: 'abc@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'アカウント登録'

    expect(page).to have_content 'アカウント登録が完了しました'
    expect(page).to have_content @league.name
  end

  it 'password validation enabled during account creation', js: true do
    visit root_path
    first('.button').click_link 'アカウント作成'
    fill_in 'Eメール', with: 'abc@example.com'
    fill_in 'パスワード', with: '1234'
    fill_in 'パスワード（確認用）', with: '1234'
    click_button 'アカウント登録'

    expect(page).to have_content 'パスワードは6文字以上で入力してください'
  end
end

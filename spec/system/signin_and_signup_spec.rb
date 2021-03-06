# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'devise', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:league) { FactoryBot.create(:league) }
  let(:team1) { FactoryBot.create(:team, :arsenal, league: league) }
  let(:team2) { FactoryBot.create(:team, :manchester_united, league: league) }

  before do
    visit root_path
  end

  it 'user can login', js: true do
    FactoryBot.create(:favorite, user: user, team: team1)
    FactoryBot.create(:competitor, user: user, team: team2)

    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
  end

  it 'email error when login.', js: true do
    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: 'error@example.com'
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end

  it 'password error when login.', js: true do
    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: 'xxxxxx'
    click_button 'ログイン'

    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end

  it 'user create new account', js: true do
    first('.button').click_link 'アカウント作成'
    fill_in 'Eメール', with: 'fjord2022@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'アカウント登録'

    expect(page).to have_content 'アカウント登録が完了しました'
  end

  it 'password validation enabled during account creation', js: true do
    first('.button').click_link 'アカウント作成'
    fill_in 'Eメール', with: 'abc@example.com'
    fill_in 'パスワード', with: '1234'
    fill_in 'パスワード（確認用）', with: '1234'
    click_button 'アカウント登録'

    expect(page).to have_content 'パスワードは6文字以上で入力してください'
  end
end

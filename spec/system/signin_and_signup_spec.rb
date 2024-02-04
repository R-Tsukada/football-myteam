# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'devise', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:league) { FactoryBot.create(:league) }
  let(:team1) { FactoryBot.create(:team, :arsenal, league:) }
  let(:team2) { FactoryBot.create(:team, :manchester_united, league:) }

  before do
    visit root_path
  end

  it 'user can login', js: true do
    FactoryBot.create(:favorite, user:, team: team1)
    FactoryBot.create(:competitor, user:, team: team2)

    click_on 'Log in'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'Login'

    expect(page).to have_content 'ログインしました'
  end

  it 'email error when login.', js: true do
    click_on 'Log in'
    fill_in 'Eメール', with: 'error@example.com'
    fill_in 'パスワード', with: user.password
    click_button 'Login'

    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end

  it 'password error when login.', js: true do
    click_on 'Log in'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: 'xxxxxx'
    click_button 'Login'

    expect(page).to have_content 'Eメールまたはパスワードが違います。'
  end

  it 'user create new account', js: true do
    click_on 'Sign up'
    fill_in 'Eメール', with: 'fjord2022@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'Sign up'

    expect(page).to have_content 'アカウント登録が完了しました'
  end

  it 'password validation enabled during account creation', js: true do
    click_on 'Sign up'
    fill_in 'Eメール', with: 'abc@example.com'
    fill_in 'パスワード', with: '1234'
    fill_in 'パスワード（確認用）', with: '1234'
    click_button 'Sign up'

    expect(page).to have_content 'パスワードは6文字以上で入力してください'
  end

  it 'able to transition to login page' do
    click_on 'Sign up'
    expect(page).to have_content 'アカウントを作成'
    click_on 'すでにアカウントをお持ちの場合：ログイン'
    expect(page).to have_content 'ログイン'
  end

  it 'able to transition to sign up page' do
    click_on 'Log in'
    expect(page).to have_content 'ログイン'
    click_on 'アカウントを新しく作る場合はこちら'
    expect(page).to have_content 'アカウントを作成'
  end
end

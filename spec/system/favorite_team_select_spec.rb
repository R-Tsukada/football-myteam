# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '応援しているチームを登録する', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }

  before do
    premier_league = FactoryBot.create(:league, :premier_league)
    serie_a = FactoryBot.create(:league, :serie_a)

    FactoryBot.create(:team, :arsenal, league: premier_league)
    FactoryBot.create(:team, :manchester_united, league: premier_league)
    FactoryBot.create(:team, :lazio, league: serie_a)
    FactoryBot.create(:team, :sassuolo, league: serie_a)

    visit root_path
    first('.button').click_link 'アカウント作成'
    fill_in 'Eメール', with: 'fjord2022@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'アカウント登録'
  end

  it 'リーグをクリックするとそのリーグに所属しているチームが表示される', js: true do
    expect(page).to have_content 'Premier League'
    all('img')[1].click
    expect(page).to have_content 'Arsenal'
    expect(page).to have_content 'Manchester United'

    all('img')[2].click
    expect(page).to have_content 'Lazio'
    expect(page).to have_content 'Sassuolo'
  end

  it 'チームをクリックするとボタンが表示される', js: true do
    expect(page).to have_content 'Premier League'
    all('img')[1].click
    expect(page).to have_content 'Arsenal'
    all('img')[3].click
    expect(page).to have_content '応援しているチームを決定する'
  end
end

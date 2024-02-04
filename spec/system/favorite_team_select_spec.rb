# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'register selected a favorite team', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }

  before do
    premier_league = FactoryBot.create(:league, :premier_league)
    serie_a = FactoryBot.create(:league, :serie_a)

    FactoryBot.create(:team, :arsenal, league: premier_league)
    FactoryBot.create(:team, :manchester_united, league: premier_league)
    FactoryBot.create(:team, :lazio, league: serie_a)
    FactoryBot.create(:team, :sassuolo, league: serie_a)

    visit root_path
    all('.button')[1].click_link 'Sign up'
    fill_in 'Eメール', with: 'fjord2022@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'Sign up'
  end

  it 'Select one of the leagues shown. The teams belonging to the league you selected will then be displayed', js: true do
    expect(page).to have_content 'Premier League'
    sleep 2.0
    all('img')[1].click
    expect(page).to have_content 'Arsenal'
    expect(page).to have_content 'Manchester United'

    sleep 2.0
    all('img')[2].click
    expect(page).to have_content 'Lazio'
    expect(page).to have_content 'Sassuolo'
  end

  it 'select one of the teams shown and a button will appear', js: true do
    expect(page).to have_content 'Premier League'
    expect(page).to have_button '応援しているチームを決定する', disabled: true
    sleep 2.0
    all('img')[1].click
    expect(page).to have_content 'Arsenal'
    sleep 2.0
    all('img')[3].click
    expect(page).to have_button '応援しているチームを決定する', disabled: false
  end
end

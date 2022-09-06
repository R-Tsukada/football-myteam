# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'register selected competitor teams', type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    premier_league = FactoryBot.create(:league, :premier_league)
    serie_a = FactoryBot.create(:league, :serie_a)
    arsenal = FactoryBot.create(:team, :arsenal, league: premier_league)
    FactoryBot.create(:team, :manchester_united, league: premier_league)
    FactoryBot.create(:team, :lazio, league: serie_a)
    FactoryBot.create(:team, :sassuolo, league: serie_a)
    FactoryBot.create(:team, :tottenham, league: premier_league)
    FactoryBot.create(:favorite, user: @user, team: arsenal)
    sign_in(@user)
    visit '/competitors'
  end

  it 'select teams that were close to last seasons standings', js: true do
    expect(page).to have_content 'ライバルチームの選び方を選択してください'
    expect(page).to have_button 'チームの選択方法を決定する', disabled: true
    choose '昨シーズンの順位が近いチームを選ぶ'
    click_button 'チームの選択方法を決定する'
    expect(page).to have_button '選んだチームを登録する', disabled: true
    expect(page).to have_content 'Manchester United'
    expect(page).to_not have_content 'Tottenham'
    all('img')[1].click
    expect(page).to have_content '残り2チーム登録できます'
    expect(page).to have_content '選んだチームを登録する'
  end

  it 'select team that is close to home', js: true do
    expect(page).to have_button 'チームの選択方法を決定する', disabled: true
    choose '本拠地が近いチームを選ぶ'
    click_button 'チームの選択方法を決定する'
    expect(page).to have_button '選んだチームを登録する', disabled: true
    expect(page).to have_content 'Tottenham'
    expect(page).to_not have_content 'Manchester United'
    all('img')[1].click
    expect(page).to have_content '残り2チーム登録できます'
    expect(page).to have_content '選んだチームを登録する'
  end

  it 'select competitor teams by self', js: true do
    expect(page).to have_button 'チームの選択方法を決定する', disabled: true
    choose '自分でライバルチームを選ぶ'
    click_button 'チームの選択方法を決定する'
    expect(page).to have_button '選んだチームを登録する', disabled: true
    expect(page).to have_content 'Tottenham'
    expect(page).to have_content 'Manchester United'
    expect(page).to have_content '残り3チーム登録できます'
    sleep 2.0
    all('img')[1].click
    expect(page).to have_content '残り2チーム登録できます'
    expect(page).to have_content '選んだチームを登録する'
  end

  it 'not selected when button is disabled', js: true do
    expect(page).to have_button 'チームの選択方法を決定する', disabled: true
  end
end

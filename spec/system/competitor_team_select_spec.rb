# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ライバルチームを登録する', type: :system, js: true do
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

  it '昨シーズンの順位が近いチームを選ぶ', js: true do
    expect(page).to have_content 'ライバルチームの選び方を選択してください'
    choose '昨シーズンの順位が近いチームを選ぶ'
    click_button 'チームの選択方法を決定する'
    expect(page).to have_content 'Manchester United'
    expect(page).to_not have_content 'Tottenham'
    expect(page).to have_content '上記のチームを登録する'
  end

  it '昨シーズンの順位が近いチームを選ぶ', js: true do
    choose '本拠地が近いチームを選ぶ'
    click_button 'チームの選択方法を決定する'
    expect(page).to have_content 'Tottenham'
    expect(page).to_not have_content 'Manchester United'
    expect(page).to have_content '上記のチームを登録する'
  end

  it '自分でライバルチームを選ぶ', js: true do
    choose '自分でライバルチームを選ぶ'
    click_button 'チームの選択方法を決定する'
    expect(page).to have_content 'Tottenham'
    expect(page).to have_content 'Manchester United'
    expect(page).to have_content '残り3チーム登録できます'
    all('img')[0].click
    expect(page).to have_content '残り2チーム登録できます'
    expect(page).to have_content 'ライバルチームを決定する'
  end

  it 'チームの選択方法を選ばなかった時のメッセージを表示', js: true do
    click_button 'チームの選択方法を決定する'
    expect(page).to have_content 'ライバルチームの選択方法を一つ選んでください'
  end
end

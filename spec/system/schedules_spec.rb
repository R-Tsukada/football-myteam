# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '登録したチームのスケジュールを表示する', type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    premier_league = FactoryBot.create(:league, :premier_league)
    arsenal = FactoryBot.create(:team, :arsenal, league: premier_league)
    manchester_united = FactoryBot.create(:team, :manchester_united, league: premier_league)
    tottenham = FactoryBot.create(:team, :tottenham, league: premier_league)
    FactoryBot.create(:favorite, user: @user, team: arsenal)
    FactoryBot.create(:competitor, user: @user, team: manchester_united)
    FactoryBot.create(:competitor, user: @user, team: tottenham)
    FactoryBot.create(:standing, team: arsenal)
    sign_in(@user)
    visit root_path
  end

  it 'オフシーズン期間にschedulesへアクセスしたときはシーズン終了したことが表示される', js: true do
    expect(page).to have_content 'シーズンは終了しました'
    expect(page).to have_content 'シーズンの開幕予定'
    expect(page).to have_content 'プレミア'
    expect(page).to have_content 'ラリーガ'
    expect(page).to have_content 'ブンデス'
    expect(page).to have_content 'セリエA'
  end
end

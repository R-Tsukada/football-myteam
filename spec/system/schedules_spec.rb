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
    sign_in(@user)
    visit root_path
  end

  it '登録したチームのスケジュールと詳細を表示する', js: true do
    expect(page).to have_content 'リーグ戦情報'
    first('img', wait: 10).click
    expect(page).to have_content '試合予定'
    expect(page).to have_content '試合結果'
  end
end

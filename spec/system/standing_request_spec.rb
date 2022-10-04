# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'standing_request', type: :system, js: true do
  describe '#index' do
    before do
      user = FactoryBot.create(:user)
      premier_league = FactoryBot.create(:league, :premier_league)
      arsenal = FactoryBot.create(:team, :arsenal, league: premier_league)
      manchester_united = FactoryBot.create(:team, :manchester_united, league: premier_league)
      FactoryBot.create(:favorite, user: user, team: arsenal)
      FactoryBot.create(:competitor, user: user, team: manchester_united)
      sign_in(user)
    end
    it 'show standing table' do
      visit root_path
      expect(page).to have_content 'リーグ戦情報'
      sleep(3.0)
      expect(all('.box').count).to eq 2
    end
  end
end

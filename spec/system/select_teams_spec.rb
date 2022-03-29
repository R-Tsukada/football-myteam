# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SelectTeams', type: :system, js: true do
  it 'showing league list', js: true do
    user = FactoryBot.create(:user)
    league = FactoryBot.create(:league)

    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'

    sleep 5.0

    expect(page).to have_content league.name
  end

  it 'showing team list', js: true do
    user = FactoryBot.create(:user)
    league = FactoryBot.create(:league)
    team = FactoryBot.build(:team, league: league)

    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    sleep 5.0

    find('.logo_image').click

    sleep 15.0
    expect(page).to have_content team.name
  end
end

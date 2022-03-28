# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SelectTeams', type: :system, js: true do
  it 'showing league list', js: true do
    user = FactoryBot.create(:user)

    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'

    sleep 5.0

    expect(page).to have_content 'Premier League'
    expect(page).to have_content 'Serie A'
    expect(page).to have_content 'La Liga'
    expect(page).to have_content 'Bundesliga 1'
    expect(page).to_not have_content 'Manchester United'
  end
end

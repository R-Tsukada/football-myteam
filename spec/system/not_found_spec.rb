# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'NotFoundPage', type: :system, js: true do
  it 'display 404 page', js: true do
    user = FactoryBot.create(:user)

    visit root_path
    all('.button')[1].click_link 'ログイン'
    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    visit '/rails'
    expect(page).to have_content "404\nお探しのページが見つかりませんでした"
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'NotFoundPage', type: :system, js: true do
  it 'display 404 page', js: true do
    visit root_path

    all('.button')[1].click_link 'Sign up'
    fill_in 'Eメール', with: 'fjord2022@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'Sign up'

    visit '/rails'
    expect(page).to have_content "404\nお探しのページが見つかりませんでした"
  end
end

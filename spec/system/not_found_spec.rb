# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'NotFoundPage', type: :system, js: true do
  it 'display 404 page', js: true do
    visit root_path

    first('.button').click_link 'アカウント作成'
    fill_in 'Eメール', with: 'abc@example.com'
    fill_in 'パスワード', with: '123456'
    fill_in 'パスワード（確認用）', with: '123456'
    click_button 'アカウント登録'

    visit '/rails'
    expect(page).to have_content "404\nお探しのページが見つかりませんでした"
  end
end

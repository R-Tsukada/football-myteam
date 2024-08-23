# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :playwright
  end

  config.before(:each, :head, type: :system) do
    driven_by(:playwright, options: { headless: false })
  end

  Capybara.default_max_wait_time = 15
end

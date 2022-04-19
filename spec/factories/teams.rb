# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    sequence(:id) { |n| n }
    sequence(:name) { |n| n }
    sequence(:logo) { |n| "https://media.api-sports.io/football/teams/#{n}.png" }
    sequence(:api_id) { |n| n }
    home_city { 'London' }
  end
end

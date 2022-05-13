# frozen_string_literal: true

FactoryBot.define do
  factory :standing do
    sequence(:id) { |n| n }
    sequence(:team_name) { |n| n }
    sequence(:team_logo) { |n| "https://media.api-sports.io/football/teams/#{n}.png" }
    sequence(:rank) { |n| n }
    sequence(:points) { |n| n }
    sequence(:played) { |n| n }
  end
end

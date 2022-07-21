# frozen_string_literal: true

FactoryBot.define do
  factory :standing do
    sequence(:id) { |n| n }
    sequence(:team_name) { |n| n }
    sequence(:team_logo) { |n| "https://media.api-sports.io/football/teams/#{n}.png" }
    sequence(:rank) { |n| n }
    sequence(:points) { |n| n }
    sequence(:played) { |n| n }

    trait :manchester_united do
      id { 1 }
      team_id { 2 }
      team_name { 'Manchester United' }
      team_logo { 'https://media.api-sports.io/football/teams/33.png' }
      rank { 5 }
      points { 68 }
      played { 30 }
    end
  end
end

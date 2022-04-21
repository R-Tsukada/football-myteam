# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    sequence(:id) { |n| n }
    sequence(:name) { |n| n }
    sequence(:logo) { |n| "https://media.api-sports.io/football/teams/#{n}.png" }
    sequence(:api_id) { |n| n }
    home_city { 'London' }

    trait :arsenal do
      id { 1 }
      name { 'Arsenal' }
      logo { 'https://media.api-sports.io/football/teams/42.png' }
      api_id { 42 }
      home_city { 'London' }
    end

    trait :Manchester_United do
      id { 2 }
      name { 'Manchester United' }
      logo { 'https://media.api-sports.io/football/teams/33.png' }
      api_id { 33 }
      home_city { 'Manchester' }
    end
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    sequence(:id) { |n| n }
    sequence(:name) { |n| n }
    sequence(:logo) { |n| "https://media.api-sports.io/football/teams/#{n}.png" }
    sequence(:api_id) { |n| n }
    home_city { 'London' }
    active { true }
    association :league

    trait :arsenal do
      id { 1 }
      name { 'Arsenal' }
      logo { 'https://media.api-sports.io/football/teams/42.png' }
      api_id { 42 }
      home_city { 'London' }
      last_season_rank { 4 }
    end

    trait :manchester_united do
      id { 2 }
      name { 'Manchester United' }
      logo { 'https://media.api-sports.io/football/teams/33.png' }
      api_id { 33 }
      home_city { 'Manchester' }
      last_season_rank { 5 }
    end

    trait :lazio do
      id { 3 }
      name { 'Lazio' }
      logo { 'https://media.api-sports.io/football/teams/487.png' }
      api_id { 487 }
      home_city { 'Roma' }
    end

    trait :sassuolo do
      id { 4 }
      name { 'Sassuolo' }
      logo { 'https://media.api-sports.io/football/teams/488.png' }
      api_id { 488 }
      home_city { 'Reggio' }
    end

    trait :tottenham do
      id { 5 }
      name { 'Tottenham' }
      logo { 'https://media.api-sports.io/football/teams/47.png' }
      api_id { 47 }
      home_city { 'London' }
      last_season_rank { 10 }
    end
  end
end

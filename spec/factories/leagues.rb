# frozen_string_literal: true

FactoryBot.define do
  factory :league do
    id { 1 }
    name { 'Premier League' }
    logo { 'https://media.api-sports.io/football/leagues/39.png' }
    api_id { 39 }
  end

  trait :premier_league do
    id { 1 }
    name { 'Premier League' }
    logo { 'https://media.api-sports.io/football/leagues/39.png' }
    api_id { 39 }
  end

  trait :serie_a do
    id { 2 }
    name { 'Serie A' }
    logo { 'https://media.api-sports.io/football/leagues/135.png' }
    api_id { 135 }
  end
end

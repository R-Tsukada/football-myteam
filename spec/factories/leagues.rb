# frozen_string_literal: true

FactoryBot.define do
  factory :league do
    name { 'Premier League' }
    logo { 'https://media.api-sports.io/football/leagues/39.png' }
  end
end
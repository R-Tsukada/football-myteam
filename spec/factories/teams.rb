# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    id { 1 }
    name { 'Arsenal' }
    logo { 'https://media.api-sports.io/football/teams/42.png' }
    api_id { '42' }
    home_city { 'London' }
  end
end

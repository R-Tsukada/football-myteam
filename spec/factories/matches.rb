# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    id { 1 }
    date { 'Wed, 12 Jan 2022' }
    team_matches_index { 1 }
    season { 2021 }
    competition_name { 'UEFA Champions League' }
    competition_logo { 'https://media.api-sports.io/football/leagues/2.png' }
    team_name { 'Villarreal' }
    team_logo { 'https://media.api-sports.io/football/teams/533.png' }
    home_score { 1 }
    away_score { 1 }
    home_and_away { 'AWAY' }
    home_team_name { 'Villarreal' }
    away_team_name { 'Newcastle' }
    home_logo { 'https://media.api-sports.io/football/teams/533.png' }
    away_logo { 'https://media.api-sports.io/football/teams/34.png' }
  end
end

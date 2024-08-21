# frozen_string_literal: true

class Match < ApplicationRecord
  validates :season, presence: true
  validates :date, presence: true
  validates :competition_name, presence: true
  validates :competition_logo, presence: true
  validates :home_and_away, presence: true
  validates :home_team_name, presence: true
  validates :away_team_name, presence: true
  validates :home_logo, presence: true
  validates :away_logo, presence: true
end

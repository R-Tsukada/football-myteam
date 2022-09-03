# frozen_string_literal: true

class Match < ApplicationRecord
  validates :team_id, presence: true
  validates :season, presence: true
  validates :date, presence: true
  validates :competition_name, presence: true
  validates :competition_logo, presence: true
  validates :team_name, presence: true
  validates :team_logo, presence: true
  validates :home_and_away, presence: true
end

# frozen_string_literal: true

class Standing < ApplicationRecord
  validates :team_id, presence: true
  validates :team_name, presence: true
  validates :team_logo, presence: true
  validates :rank, presence: true
  validates :points, presence: true
  validates :played, presence: true

  belongs_to :team
end

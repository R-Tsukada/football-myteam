class Team < ApplicationRecord
  validates :api_id, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true
  validates :home_city, presence: true

  belongs_to :league
end

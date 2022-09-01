# frozen_string_literal: true

class Team < ApplicationRecord
  validates :api_id, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true
  validates :home_city, presence: true

  belongs_to :league
  has_one :favorite, dependent: :destroy
  has_many :competitor, dependent: :destroy
  has_one :standing, dependent: :destroy
  has_many :match, dependent: :destroy
end

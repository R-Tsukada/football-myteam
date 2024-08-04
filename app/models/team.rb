# frozen_string_literal: true

class Team < ApplicationRecord
  validates :api_id, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true
  validates :home_city, presence: true
  validates :active, inclusion: { in: [true, false] }

  belongs_to :league
  has_one :favorite, dependent: :destroy
  has_many :competitors, dependent: :destroy
  has_one :standing, dependent: :destroy
  has_many :matches, dependent: :destroy
end

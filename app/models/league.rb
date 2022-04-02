# frozen_string_literal: true

class League < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true

  has_many :teams, dependent: :destroy
end

# frozen_string_literal: true

class League < ApplicationRecord
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true

  has_many :teams, dependent: :destroy
end

# frozen_string_literal: true

class League < ApplicationRecord
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true

  has_many :teams, dependent: :destroy

  def api_request
    league = League.all
    league.blank? ? league_data : return
  end

  def league_data
    api_request_url.each do |n|
      http = Net::HTTP.new(n.host, n.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(n)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)

      results['response'].each_index do |result|
        league = League.new
        league.name = results['response'][result]['league']['name']
        league.logo = results['response'][result]['league']['logo']
        league.save
      end
    end
  end

  def api_request_url
    league_numbers = [39, 135, 140, 78]
    league_numbers.map { |number| URI("https://v3.football.api-sports.io/leagues?id=#{number}&season=#{season_year}") }
  end

  def season_year
    current_year = Time.zone.now.year
    current_month = Time.zone.now.month
    current_month <= 7 ? current_year - 1 : current_year
  end
end

# frozen_string_literal: true

class Team < ApplicationRecord
  validates :api_id, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true, uniqueness: true
  validates :home_city, presence: true

  belongs_to :league

  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def api_request
    team = Team.all
    team.blank? ? team_data : return
  end

  def team_data
    results = api_request_url.each do |n|
      http = Net::HTTP.new(n.host, n.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(n)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      save_team_column(results)
    end
  end

  def save_team_column(results)
    results['response'].each_index do |result|
      team = Team.new
      team.api_id = results['response'][result]['team']['id']
      team.name = results['response'][result]['team']['name']
      team.logo = results['response'][result]['team']['logo']
      team.home_city = results['response'][result]['venue']['city']
      league = results['parameters']['league']
      # team.league_id = case league
      #                  when '39'
      #                    37
      #                  when '78'
      #                    38
      #                  when '135'
      #                    39
      #                  when '140'
      #                    40
      #                  end
      id = {
        '39' => 37,
        '78' => 38,
        '135' => 39,
        '140' => 40
      }
      team.league_id = id[league]
      team.save
    end
  end

  def api_request_url
    league_numbers = [39, 135, 140, 78]
    league_numbers.map { |number| URI("https://v3.football.api-sports.io/teams?league=#{number}&season=#{season_year}") }
  end

  def season_year
    current_year = Time.zone.now.year
    current_month = Time.zone.now.month
    current_month <= 7 ? current_year - 1 : current_year
  end
end

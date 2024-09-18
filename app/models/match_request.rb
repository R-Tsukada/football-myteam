# frozen_string_literal: true

require 'net/http'
require 'openssl'
require 'json'

class MatchRequest
  def initialize
    @build_url = BuildUrl.new
  end

  def call
    @build_url.match.each do |url|
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api_request = results['response']
      api_request.each { |api| data_save(api) }
    end
  rescue StandardError => e
    Rails.logger.debug e.full_message
  end

  def data_save(api)
    match = Match.new
    match.fixture_id = api['fixture']['id']
    match.season = api['league']['season']
    match.date = api['fixture']['date']
    match.home_and_away = api['fixture']['venue']['name']
    match.competition_name = api['league']['name']
    match.competition_logo = api['league']['logo']
    match.home_team_name = api['teams']['home']['name']
    match.away_team_name = api['teams']['away']['name']
    match.home_logo = api['teams']['home']['logo']
    match.away_logo = api['teams']['away']['logo']
    match.home_score = api['goals']['home']
    match.away_score = api['goals']['away']
    match.save
  end
end

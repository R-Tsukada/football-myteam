# frozen_string_literal: true

class MatchRequest < ApplicationRecord
  def self.league(api_request_url)
    api_request_url.each do |url|
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api = results
      create(api)
    end
  rescue StandardError => e
    Rails.logger.debug e.full_message
  end

  def self.create(api)
    api['response'].each_index do |a|
      match = Match.new
      match.season = [api][0]['parameters']['season']
      current_team = Team.find_by(api_id: [api][0]['parameters']['team'])
      match.team_matches_index = current_team.id
      match.date = [api][0]['response'][a]['fixture']['date']
      stadium = [api][0]['response'][a]['fixture']['venue']['name']
      match.home_and_away = stadium == current_team.stadium ? 'HOME' : 'AWAY'
      match.competition_name = [api][0]['response'][a]['league']['name']
      match.competition_logo = [api][0]['response'][a]['league']['logo']
      match.home_team_name = [api][0]['response'][a]['teams']['home']['name']
      match.away_team_name = [api][0]['response'][a]['teams']['away']['name']
      match.team_name = match.home_team_name == current_team.name ? match.away_team_name : match.home_team_name
      match.home_logo = [api][0]['response'][a]['teams']['home']['logo']
      match.away_logo = [api][0]['response'][a]['teams']['away']['logo']
      match.team_logo = match.home_logo == current_team.logo ? match.away_logo : match.home_logo
      match.home_score = [api][0]['response'][a]['score']['fulltime']['home']
      match.away_score = [api][0]['response'][a]['score']['fulltime']['away']
      match.save
    end
  end
end

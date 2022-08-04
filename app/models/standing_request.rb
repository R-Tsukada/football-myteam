# frozen_string_literal: true

class StandingRequest < ApplicationRecord
  def self.league(url)
    url.each do |n|
      http = Net::HTTP.new(n.host, n.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(n)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api = results['response'][0]['league']['standings'][0][0]
      create(api)
    end
  rescue StandardError => e
    Rails.logger.debug e.full_message
  end

  def self.create(api)
    standing = Standing.new
    team_id = api['team']['id']
    team = Team.find_by(api_id: team_id)
    standing.team_id = team.id
    standing.team_name = team.name
    standing.team_logo = team.logo
    standing.rank = api['rank']
    standing.points = api['points']
    standing.played = api['all']['played']
    standing.save
  end
end

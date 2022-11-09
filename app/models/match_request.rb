# frozen_string_literal: true

class MatchRequest
  def self.league
    api_request_url.each do |url|
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request['x-rapidapi-host'] = ENV['HOST']
      request['x-rapidapi-key'] = ENV['KEY']

      response = http.request(request)
      results = JSON.parse(response.body)
      api_request = results['response']
      api_request.each { |api| create(api) }
    end
  rescue StandardError => e
    Rails.logger.debug e.full_message
  end

  def self.create(api)
    match = Match.new
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
    team = Team.find_by(api_id: api['teams']['home']['id'])
    match.team_id = team.id
    match.team_name = match.home_team_name
    match.team_logo = match.home_logo
    match.save
  end

  def self.api_request_url
    league_api_id = League.all.map(&:api_id)
    league_api_id.map do |league|
      URI("https://v3.football.api-sports.io/fixtures?&league=#{league}&season=#{Year.season}&from=#{Time.zone.now.prev_month.strftime('%Y-%m-%d')}&to=#{Time.zone.now.next_month.strftime('%Y-%m-%d')}")
    end
  end
end

# frozen_string_literal: true

class BuildUrl
  def standing
    league_api_id = League.all.map(&:api_id)
    league_api_id.map { |league| URI("https://v3.football.api-sports.io/standings?league=#{league}&season=#{Year.season}") }
  end

  def match
    league_api_id = League.all.map(&:api_id)
    league_api_id.map do |league|
      URI("https://v3.football.api-sports.io/fixtures?&league=#{league}&season=#{Year.season}&from=#{Time.zone.now.prev_month.strftime('%Y-%m-%d')}&to=#{Time.zone.now.since(3.months).strftime('%Y-%m-%d')}")
    end
  end
end

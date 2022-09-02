# frozen_string_literal: true

class API::UpdateMatchesController < ApplicationController
  before_action :api_request
  before_action :authenticate_user!

  def index
    favorite_team = current_user.favorite.team
    competitors = current_user.competitor.map(&:team_id)
    teams = competitors.unshift(favorite_team.id)
    match = Match.all.order(:date).where(date: Time.zone.today..).where(team_id: teams)
    @match = match
  end

  def batch_request
    api_request
  end

  private

  def api_request
    favorite_team = current_user.favorite.team
    competitors = current_user.competitor.map(&:team_id)
    teams = competitors.unshift(favorite_team.id)
    Match.all.where(team_id: teams).delete_all
    MatchRequest.league(api_request_url)
  end

  def api_request_url
    api_id = competitor_teams.unshift(current_user.favorite.team.api_id)
    api_id.map do |i|
      URI("https://v3.football.api-sports.io/fixtures?&season=#{Year.season}&team=#{i}&from=#{Time.zone.now.prev_month.strftime('%Y-%m-%d')}&to=#{Time.zone.now.next_month.strftime('%Y-%m-%d')}")
    end
  end

  def competitor_teams
    SelectTeam.competitor(current_user)
  end
end

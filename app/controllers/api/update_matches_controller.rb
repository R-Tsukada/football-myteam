# frozen_string_literal: true

class API::UpdateMatchesController < ApplicationController
  before_action :api_request
  before_action :authenticate_user!

  def index
    @match = Match.all.order(:date).where(date: Time.zone.today..).where(team_id: selected_team_ids)
  end

  private

  def api_request
    Match.all.where(team_id: selected_team_ids).delete_all
    MatchRequest.league(api_request_url)
  end

  def api_request_url
    api_id = competitor_team_api_id.unshift(current_user.favorite.team.api_id)
    api_id.map do |i|
      URI("https://v3.football.api-sports.io/fixtures?&season=#{Year.season}&team=#{i}&from=#{Time.zone.now.prev_month.strftime('%Y-%m-%d')}&to=#{Time.zone.now.next_month.strftime('%Y-%m-%d')}")
    end
  end

  def selected_team_ids
    competitor_team_id.unshift(current_user.favorite.team.id)
  end

  def competitor_team_id
    SelectTeam.competitor_team_id(current_user)
  end

  def competitor_team_api_id
    SelectTeam.competitor_team_api_id(current_user)
  end
end

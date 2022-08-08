# frozen_string_literal: true

class API::MatchesController < ApplicationController
  before_action :set_match
  before_action :set_show_page, only: [:show]

  def index
    @match = Match.all.order(:date).where(date: Time.zone.today..)
  end

  def show
    @match_show = Match.all.where(team_matches_index: @team_id).order(:date)
  end

  private

  def set_show_page
    @team_id = Team.find(params[:id])
  end

  def set_match
    Match.delete_all
    MatchRequest.league(api_request_url)
  end

  def api_request_url
    api_id = competitor_teams.unshift(current_user.favorite.team.api_id)
    api_id.map { |i| URI("https://v3.football.api-sports.io/fixtures?&season=#{Year.season}&team=#{i}&from=#{Time.zone.now.prev_month.strftime('%Y-%m-%d')}&to=#{Time.zone.now.next_month.strftime('%Y-%m-%d')}") }
  end

  def match_date
    '2022-02-30&to=2022-03-30'
  end

  def current_season
    '2021'
  end

  def competitor_teams
    SelectTeam.competitor(current_user)
  end
end

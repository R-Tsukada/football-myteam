# frozen_string_literal: true

class API::MatchesController < ApplicationController
  before_action :set_match
  before_action :set_show_page, only: [:show]

  def index
    @match = Match.all.order(:date).first(9)
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

  # レビュー用に日付を調節
  def api_request_url
    api_id = competitor_teams.unshift(favorite_team.api_id)
    api_id.map { |i| URI("https://v3.football.api-sports.io/fixtures?&season=#{current_season}&team=#{i}&from=#{match_date}") }
  end

  def match_date
    '2022-02-30&to=2022-03-30'
  end

  def current_season
    '2021'
  end
  # ここまで

  def competitor_teams
    SelectTeam.competitor(current_user)
  end

  def favorite_team
    current_user.favorite.team
  end
end

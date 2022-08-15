# frozen_string_literal: true

class API::MatchesController < ApplicationController
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
end

# frozen_string_literal: true

class LeaguesController < ApplicationController
  before_action :set_league

  def index
    @leagues = League.all
  end

  private

  def set_league
    league = League.new
    league.api_request
  end
end

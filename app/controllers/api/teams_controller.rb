class Api::TeamsController < ApplicationController
  before_action :set_team

  def index
    @teams = Team.all
  end

  def show
  end

  private

  def set_team
    team = Team.new
    team.api_request
  end
end

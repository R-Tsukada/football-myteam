class Api::StandingsController < ApplicationController
  before_action :set_standing
  before_action :authenticate_user!

  def index
    @standing = Standing.all
  end

  def show; end

  private

  def set_standing
    standing = Standing.new
    standing.api_request
  end
end

# frozen_string_literal: true

class API::StandingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @standing = Standing.all
  end

  def show; end
end

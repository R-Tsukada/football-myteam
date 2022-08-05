# frozen_string_literal: true

class API::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
end

# frozen_string_literal: true

class Api::TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
end

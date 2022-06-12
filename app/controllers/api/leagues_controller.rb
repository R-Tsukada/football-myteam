# frozen_string_literal: true

class API::LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end
end

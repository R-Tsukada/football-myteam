# frozen_string_literal: true

class Api::LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end
end

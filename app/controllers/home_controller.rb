# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to '/schedules' if current_user
  end

  def privacy_policy; end

  def terms_of_service; end
end

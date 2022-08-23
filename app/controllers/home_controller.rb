# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user && current_user.favorite.present?
      redirect_to '/schedules'
    elsif current_user
      redirect_to '/leagues'
    else
      root_path
    end
  end

  def privacy_policy; end

  def terms_of_service; end
end

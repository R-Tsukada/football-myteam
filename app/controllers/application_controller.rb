# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(_resource)
    '/schedules'
  end

  def after_sign_out_path_for(_resouce)
    root_path
  end
end

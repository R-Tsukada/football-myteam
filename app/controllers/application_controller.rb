# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate_user!
  before_action :set_current_user

  def set_current_user
    User.current = current_user
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resouce)
    new_user_session_path
  end
end

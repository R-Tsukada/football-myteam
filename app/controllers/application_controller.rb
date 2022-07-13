# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resouce)
    root_path
  end
end

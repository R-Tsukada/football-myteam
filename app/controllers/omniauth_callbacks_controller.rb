class OmniauthCallbacksController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :twitter

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user
    else
      sign_in_and_redirect leagues_path
    end
  end

  def failure
    redirect_to root_path
  end
end

class OmniauthCallbacksController < ApplicationController

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      sign_in_and_redirect new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end

class ApplicationController < ActionController::Base

  def ensure_sign_in
    if current_user.nil?
      redirect_to user_omniauth_authorize_path(:twitter)
      return false
    end
  end

end

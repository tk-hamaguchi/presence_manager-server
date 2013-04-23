class Users::OmniauthCallbacksController < ApplicationController
  def twitter
    auth = request.env['omniauth.auth']
    logger.debug auth.inspect
    @user = User.find_or_create_by_twitter(auth)
    sign_in @user
    redirect_to '/'
  end
end

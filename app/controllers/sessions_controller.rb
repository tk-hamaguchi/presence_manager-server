class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @user = User.find_by_provider_and_uid(auth[:provider]), auth[:uid]) || User.create_with_omniauth(auth)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
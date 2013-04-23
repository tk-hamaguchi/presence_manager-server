class Users::OmniauthCallbacksController < ApplicationController
  CLIENT_SCHEME = "com.dennou.pman"

  def twitter
    auth = request.env['omniauth.auth']
    logger.debug auth.inspect
    @user = User.find_or_create_by_twitter(auth)

    #アプリからのアクセスなら
    if request.env['HTTP_USER_AGENT'].include?('PmClient') then
      return redirect_to "#{CLIENT_SCHEME}://local/auth?token=#{@user.authentication_token}&user=#{URI.encode(@user.email)}";
    end

    sign_in @user
    redirect_to root_path
  end
  
  def failure
    flash[:notice] = "ログインに失敗しました"
    #アプリからのアクセスなら
    if request.env['HTTP_USER_AGENT'].include?('PmClient') then
      return redirect_to "#{CLIENT_SCHEME}://local/error"
    end
    redirect_to root_path
  end
end

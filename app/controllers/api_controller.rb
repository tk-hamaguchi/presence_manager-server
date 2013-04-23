class ApiController < ApplicationController
  before_filter :check_token
  
  def check_token
    user = User.find_by_authentication_token(params[:token])
    raise "unknown user" if user.nil?
    sign_in user
  rescue =>e
    render :status=>403, :json=>{:error=>"unknown user"}
    return false
  end
end

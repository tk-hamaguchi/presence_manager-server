class ApiController < ApplicationController
  before_filter :check_token
  
  def check_token
    token = params[:token] || request.headers['Authorization'].split(" ")[1]
    user = User.find_by_authentication_token(token)
    raise "unknown user" if user.nil?
    sign_in user
  rescue =>e
    logger.debug e.to_s
    render :status=>403, :json=>{:error=>"unknown user"}
    return false
  end
end

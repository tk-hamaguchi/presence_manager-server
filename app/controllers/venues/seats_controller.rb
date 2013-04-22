class Venues::SeatsController < VenuesController
  def index
    @venues = current_user.venues
  end
  def attend
    session[:tag] = NfcTag.find_by!(code:params[:code], sequence:params[:sequence])
    redirect_to new_user_session_path unless current_user
  end
end

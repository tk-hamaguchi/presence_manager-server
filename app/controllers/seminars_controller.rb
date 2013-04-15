class SeminarsController < PageController
  def index
    @seminars = Seminar.where('opened_at <= ? and closed_at >= ?', Time.now, Time.now)
  end

  def show
    @seminar = Seminar.find_by!(id: params[:id])
  end
  
  def attend
    unless @tag =  NfcTag.find_by!(code:params[:code], sequence:params[:sequence])
	    raise "Tag Not Find!!"
    end

    unless @seminar = @tag.seat.venue.seminars.where('opened_at <= ? and closed_at >= ?', Time.now, Time.now).first
	    raise "Unknown seminor"
    end
    session[:seminar_id] = @seminar.id
    return redirect_to new_user_session_path unless user_signed_in?
    @seminar.users << current_user
    @seminar.users.uniq!
    @seminar.save!
    session[:seminar_id] = nil
    redirect_to seminar_path(@seminar)
  end
end

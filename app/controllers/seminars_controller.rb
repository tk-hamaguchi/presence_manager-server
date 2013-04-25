class SeminarsController < PageController
  def index
    @seminars = Seminar.where('opened_at <= ? and closed_at >= ?', Time.now, Time.now)
  end

  def show
    @seminar = Seminar.find_by!(id: params[:id])
  end
  
  def attend
    @tag =  NfcTag.find(params[:t])
	raise "Tag Not Find!!" if @tag.nil?
	raise "signature mismatch" if @tag.sign != params[:s] 

    unless @seminar = @tag.seat.venue.seminars.where('opened_at <= ? and closed_at >= ?', Time.now, Time.now).first
	    raise "Unknown seminor"
    end
    session[:code]     = @tag.id
    session[:sequence] = @tag.sequense
    return redirect_to new_user_session_path unless user_signed_in?
    @seminar.users << current_user
    @seminar.users.uniq!
    @seminar.save!
    session[:code]     = nil
    session[:sequence] = nil
    redirect_to seminar_path(@seminar)
  end
end

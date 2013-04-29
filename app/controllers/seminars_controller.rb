class SeminarsController < PageController
  def index
    @seminars = Seminar.where('opened_at <= ? and closed_at > ?', Time.now, Time.now)
  end

  def show
    @seminar = Seminar.find_by!(id: params[:id])
  end
  
  def attend
    @tag =  NfcTag.find(params[:code])
    raise "Tag Not Find!!" if @tag.nil?
    raise "signature mismatch" if @tag.sign != params[:sign] 

    now = DateTime.current
    unless @seminar = @tag.seat.venue.seminars.where('opened_at <= ? and closed_at > ?', now, now).first
      raise "Unknown seminor"
    end
    session[:code]     = @tag.id
    session[:sequence] = @tag.sequence
    return redirect_to new_user_session_path unless user_signed_in?
    @seminar.users << current_user
    @seminar.users.uniq!
    @seminar.save!
    session[:code]     = nil
    session[:sequence] = nil
    redirect_to seminar_path(@seminar)
  end
end

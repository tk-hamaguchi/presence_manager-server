class SeminarsController < PageController
  before_filter :ensure_sign_in, :except=>[:attend]

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
  
  #params seminar
  def create
    seminar_param = params.require(:seminar).permit(:name, :opened_at, :closed_at, :description, :venue_id, :url)
    Seminar.transaction do
      @seminar = Seminar.new(seminar_param)
      @seminar.started_at = @seminar.started_at ||@seminar.opened_at
      @seminar.ended_at   = @seminar.ended_at   ||@seminar.closed_at
      @seminar.user = current_user
      raise "erro venue[forbidden]" if
                           current_user.venues.where("id=?", @seminar.venue_id).first.nil?

      raise "erro time [opend > close]" if @seminar.opened_at > @seminar.closed_at

      raise "error time[occupied]" unless
                           current_user.seminars.where("venue_id=? and (opened_at>=? and closed_at<?)",
                                        @seminar.venue_id, @seminar.opened_at, @seminar.closed_at).first.nil?
      @seminar.save!
    end
    redirect_to seminars_path
  rescue=>e
    flash[:alert] = e.to_s
    render :index
  end
end

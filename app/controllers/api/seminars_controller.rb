class Api::SeminarsController < ApiController

  #セミナー情報取得
  #params nfc_tag_id,sign
  def detail
    get_seminar
    return render :status=>404, :json=>{:error=>"no seminar"} if @seminar.nil?
    
    return render :json=>{
      :seminar=>{
        name: @seminar.name,
        started_at: @seminar.started_at,
        ended_at: @seminar.ended_at,
        description: @seminar.description,
        url: @seminar.url
      },
      :venue=>{
        name: @venue.name
      },
      :seat=>{
        name: @seat.name
      }
    }
    
  rescue=>e
    logger.debug e.to_s
    return render :status=>500, :json=>{:error=>"invalid tag"}
  end

  #出席処理
  #params nfc_tag,secret,sign
  def attend
    get_seminar
    return render :status=>404, :json=>{:error=>"no seminar"} if @seminar.nil?
    @seminar.users << current_user unless @seminar.users.include? current_user
    return render :status=>200, :nothing=>true
  end
  
  private
  def get_seminar
    @tag =  NfcTag.find(params[:code])
    raise "Tag Not Find!!" if @tag.nil?
    raise "signature mismatch" if @tag.sign != params[:sign]

    @seat = @tag.seat
    @venue = @tag.seat.venue
    now = DateTime.current
    #opened_at,closed_atを使うと例外が出る。原因不明 start,endで代替
    unless @seminar = @venue.seminars.where('opened_at <= ? and closed_at >= ?', now, now).first
      return nil
    end
  end
end

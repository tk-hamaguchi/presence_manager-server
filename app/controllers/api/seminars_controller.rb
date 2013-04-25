class Api::SeminarsController < ApplicationController

  #�Z�~�i�[���擾
  #params nfc_tag_id,sign
  def detail
    get_seminar
    return render :status=>404, :json=>{:error=>"no seminar"} if @seminar.nil?
    
    return render :json=>{
      :seminar=>{
        name: @seminar.name,
        started_at: @seminar.started_at,
        endted_at: @seminar.ended_at,
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

  #�o�ȏ���
  #params nfc_tag,secret,sign
  def attend
    
  end
  
  private
  def get_seminar
    @tag =  NfcTag.find(params[:nfc_tag])
	raise "Tag Not Find!!" if @tag.nil?
	raise "signature mismatch" if @tag.sign != params[:sign]
	
	@seat = @tag.seat
	@venue = @tag.seat.venue
	now = DateTime.current
	#opened_at,closed_at���g���Ɨ�O���o��B�����s�� start,end�ő��
    unless @seminar = @venue.seminars.where('opened_at <= ? and closed_at >= ?', now, now).first
      @seminar = Seminar.first
	  return nil
    end
  end
end

class Api::SeatsController < ApiController
  def index
    venue = current_user.venues.where(:id=>params[:venue]).first
    return render :status=>404, :json=>{:error=>"unknown venue"} if venue.nil?
    
    seats = venue.seats.includes(:nfc_tag).load
    render :json=>{
       :venue=>{:id=>venue.id},
       :nfc_tag=>seats.map{|p| {
         :code=>p.nfc_tag.id, :name=>p.name, :secret=>p.nfc_tag.sequence, :sign=>p.nfc_tag.sign}}}
  rescue=>e
    logger.debug e.to_s
    render :status=>500, :json=>{:error=>e.to_s}
  end
end

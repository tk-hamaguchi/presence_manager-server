class Api::SeatsController < ApiController
  def index
    venue = current_user.venues.where(:id=>params[:venue]).first
    raise "invalid venue_id" if venue.nil?
    
    seats = venue.seats.includes(:nfc_tag).load
    render :json=>{
       :venue=>{:id=>venue.id},
       :seat=>seats.map{|p| {:id=>p.id, :sequence=>p.nfc_tag.sequence}}}
  rescue=>e
    logger.debug e.to_s
    render :status=>500, :json=>{:error=>e.to_s}
  end
end

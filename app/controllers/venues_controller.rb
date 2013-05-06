class VenuesController < PageController
  before_filter :ensure_sign_in

  def index
    @venues = current_user.venues
  end
  
  #params :venue{name, description}, :seats_count
  def create
    venue_param = params.require(:venue).permit(:name,:description)
    @seats_count = params[:seats_count].to_i
    
    Venue.transaction do
      @venue = Venue.new(venue_param)
      @seats_count.times do |n|
        @venue.seats << Seat.new(:name=>"Seat:#{n+1}", :number=>n+1)
      end
      @venue.save!
      current_user.venues << @venue
    end
    redirect_to venues_path
  rescue=>e
    flash[:alert] = e.to_s
    render :new
  end

  def update
    venue_param = params.require(:venue).permit(:name,:description)
    @venue = Venue.find(params[:id])
    @venue.update_attributes(venue_param)
    redirect_to venues_path
  rescue=>e
    flash[:alert] = e.to_s
    render :edit
  end

end

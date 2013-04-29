class Api::VenuesController < ApiController
  def index
    venues = current_user.venues.all
    render :json=>{:venue=>
                    venues.map{|p|{:id=>p.id, :name=>p.name}}
                  }
  end
end

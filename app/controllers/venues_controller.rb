class VenuesController < PageController
  def index
    @venues = current_user.venues
  end
end

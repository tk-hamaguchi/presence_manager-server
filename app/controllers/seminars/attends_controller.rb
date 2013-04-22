class Seminars::AttendsController < SeminarsController
  before_filter :authenticate_user!
  def create
    @seminar = Seminar.find_by!(id: params[:seminar_id])
    @seminar.attends << current_user
    @seminar.save!
  end
end

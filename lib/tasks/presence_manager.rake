
namespace :presence_manager do

  namespace :load do
    desc "Load demo date"
    task demo_data: %w(db:drop db:create db:migrate) do
      require File.expand_path("../../../config/environment", __FILE__)
      require 'factory_girl_rails'
      user = FactoryGirl.create(:user, email:'testuser@localhost.localdomain',password:'testpass',authentication_token:'59f2e1951839ca4a3749f9dd9816f4bbdc9b06c0')
      FactoryGirl.create_list(:venue,10).each do |venue|
        FactoryGirl.create_list(:seat,30, venue:venue).each do |seat|
          FactoryGirl.create(:nfc_tag,seat: seat)
        end
        venue.users << user
	venue.save!
	FactoryGirl.create_list(:seminar, 10, venue:venue)
      end
    end
  end

end

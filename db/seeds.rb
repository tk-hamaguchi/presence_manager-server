# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "factory_girl"
FactoryGirl.find_definitions

if Rails.env == "development"
  User.delete_all
  Venue.delete_all
  Seat.delete_all
  NfcTag.delete_all
  
  venue = FactoryGirl.create :venue_with_seats, seats_count:10
  user = FactoryGirl.create :user
  user.venues << venue
end



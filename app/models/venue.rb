class Venue < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :seats
  has_many :seminars
end

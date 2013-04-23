class Seat < ActiveRecord::Base
  belongs_to :venue
  has_one :nfc_tag
end

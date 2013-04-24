class Seat < ActiveRecord::Base
  include OpenSSL

  belongs_to :venue
  has_one :nfc_tag
end

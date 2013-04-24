class Seat < ActiveRecord::Base
  include OpenSSL

  belongs_to :venue
  has_one :nfc_tag

  def sign
    sign = OpenSSL::HMAC.digest(
             Constants.nfc.sign_logic,
             Constants.nfc.secret,
             ("%08X" % self.id) )
    Base64.strict_encode64 sign
  end
end

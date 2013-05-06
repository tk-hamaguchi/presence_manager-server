class NfcTag < ActiveRecord::Base
  include URI
  belongs_to :seat

  def sign
    sign = OpenSSL::HMAC.digest(
             Constants.nfc.sign_logic,
             Constants.nfc.secret,
             ("%08X" % self.id) )
    Base64.strict_encode64 sign
  end

end

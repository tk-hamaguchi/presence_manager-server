FactoryGirl.define do

  factory :nfc_tag do
    sequence(:name) { |n| "NFC Tag #{n}" }
    sequence(:code) { |n| "MF%06d" % n }
    sequence(:sequence) { Digest::SHA1.hexdigest(code)[0..8] }
    seat
  end

end

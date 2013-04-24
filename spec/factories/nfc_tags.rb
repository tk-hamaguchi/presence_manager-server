FactoryGirl.define do

  factory :nfc_tag do
    sequence(:name) { |n| "NFC Tag #{n}" }
    sequence(:code) { |n| "%08d" % n }
    sequence(:sequence) { Digest::SHA1.hexdigest(code)[0...8] }
  end

end

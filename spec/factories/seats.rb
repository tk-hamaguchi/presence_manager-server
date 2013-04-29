FactoryGirl.define do

  factory :seat do
    sequence(:name) { |n| "Seat No.#{n}" }
    sequence(:x) { |n| n }
    sequence(:y) { |n| (n/10).to_i + 1 }
    nfc_tag
  end

end

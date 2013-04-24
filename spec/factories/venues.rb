FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "Room:#{n}" }
  end
end

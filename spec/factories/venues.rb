FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "Room:#{n}" }
    
    factory :venue_with_seats do
      ignore do
        seats_count 10
      end
    
      after(:create) do |venue, evaluator|
        FactoryGirl.create_list(:seat, evaluator.seats_count, :venue=>venue)
      end
    end
    
  end
end

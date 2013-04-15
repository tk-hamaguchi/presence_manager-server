FactoryGirl.define do
  factory :seminar do
    sequence(:name) { |n| "Seminor:#{n}" }
    started_at { 10.minutes.ago }
    ended_at { 3.hours.since }
    opened_at { 10.minutes.ago }
    closed_at { 5.hours.since }
    description { Faker::Lorem.paragraph }
    url { Faker::Internet.url }
    venue
  end
end

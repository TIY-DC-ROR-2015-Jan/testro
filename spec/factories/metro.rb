FactoryGirl.define do
  factory :metro do
    name "Metro 1"
    sequence(:code) { |n| "C#{n}" }
    latitude  { 90 * rand }
    longitude { 90 * rand }
  end
end

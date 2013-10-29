# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :huddle do
    skill_level "Casual"
    size_of_huddle 2
    creator 1
    location_id 1
    time_and_date DateTime.now.tomorrow
    occurrences nil
  end
end

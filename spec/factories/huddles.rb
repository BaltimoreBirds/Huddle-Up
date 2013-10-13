# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :huddle do
    skill_level "Casual"
    size_of_huddle 2
    creator 0
    time_and_date DateTime.tomorrow
  end
end

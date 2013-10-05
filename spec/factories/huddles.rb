# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :huddle do
    skill_level "Casual"
    size_of_huddle 2
    court "Martin Road Park"
    creator 0
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :huddle do
    num_of_ballers_currently 1
    skill_level "MyString"
    size_of_huddle 1
  end
end

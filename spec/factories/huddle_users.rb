# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :huddle_user, :class => 'HuddleUsers' do
    user_id 1
    huddle_id 1
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "swan_tree_hill"
    name "Michael Swanson"
    email "mikeswanson12@msn.com"
    location "Boston, MA"
    skill "fucking awesome"

  end
end

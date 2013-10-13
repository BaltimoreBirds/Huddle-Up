require 'spec_helper'

describe Huddle do
  it{should have_many :locations}

  it{should have_valid(:size_of_huddle).when(5, 10)}
  it{should_not have_valid(:size_of_huddle).when("potato", "eight", nil, 1, " ")}

  it{should have_valid(:skill_level).when("Advanced", "Any")}
  it{should_not have_valid(:skill_level).when(5, nil, " ", "potato")}

  it{should have_valid(:time_and_date).when(DateTime.now + 20.minutes)}
  it{should_not have_valid(:time_and_date).when(DateTime.now)}
  it{should_not have_valid(:time_and_date).when(nil, "potato")}

  it{should have_many(:users)}

  it' returns all members in the huddle' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username: 'Shrek', email: 'Shrek@aol.com')
    huddle_creator = FactoryGirl.create(:user, email: 'mikeswanson12@msn.com')
    huddle = FactoryGirl.create(:huddle, creator: huddle_creator.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: huddle_creator.id, huddle_id: huddle.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user2.id, huddle_id: huddle.id)
    huddle_member = User.where(id: huddle.huddle_users.first.user_id)

    expect(huddle.huddle_members).to_not be_nil
    expect(huddle.huddle_members).to be_an(Array)
    expect(huddle.huddle_members).to eq(['Jahsprout', 'Shrek'])

  end
end

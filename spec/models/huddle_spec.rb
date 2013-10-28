require 'spec_helper'

describe Huddle do
  it{should belong_to :location}

  it{should have_valid(:size_of_huddle).when(5, 10)}
  it{should_not have_valid(:size_of_huddle).when("potato", "eight", nil, 1, " ")}

  it{should have_valid(:skill_level).when("Advanced", "Any")}
  it{should_not have_valid(:skill_level).when(5, nil, " ", "potato")}

  it{should have_valid(:time_and_date).when(DateTime.now + 20.minutes)}
  it{should_not have_valid(:time_and_date).when(DateTime.now)}
  it{should_not have_valid(:time_and_date).when(nil, "potato")}

  it{should have_many(:users)}

  it'returns all pending huddles a user is in' do
    user = FactoryGirl.create(:user)
    huddle = FactoryGirl.create(:huddle)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user.id, huddle_id: huddle.id)

    expect(Huddle.current_users_huddle_finder(user)).to_not be_nil
    expect(Huddle.current_users_huddle_finder(user)).to be_an(Array)
    expect(Huddle.current_users_huddle_finder(user)).to eql([huddle])
  end

  it'returns all pending huddles for user2 as well' do
    user2 = FactoryGirl.create(:user)
    huddle1 = FactoryGirl.create(:huddle, time_and_date: DateTime.tomorrow-1.hour)
    huddle2 = FactoryGirl.create(:huddle, time_and_date: DateTime.tomorrow-30.minutes)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user2.id, huddle_id: huddle2.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user2.id, huddle_id: huddle1.id)

    expect(Huddle.current_users_huddle_finder(user2)).to_not be_nil
    expect(Huddle.current_users_huddle_finder(user2)).to be_an(Array)
    expect(Huddle.current_users_huddle_finder(user2)).to eql([huddle1,huddle2])
  end

  it'returns The Huddle is full if a huddle is full' do
    user2 = FactoryGirl.create(:user, email: 'johnjacobjingleheimerschmidt@aol.com')
    user = FactoryGirl.create(:user)
    huddle = FactoryGirl.create(:huddle, size_of_huddle: 4)
    huddle1 = FactoryGirl.create(:huddle, size_of_huddle: 2)
    huddle_user2 = FactoryGirl.create(:huddle_user, user_id: user2.id, huddle_id: huddle1.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user.id, huddle_id: huddle1.id)


    expect(huddle1.huddle_full?).to be_an(String)
    expect(huddle.huddle_full?).to eql(false)
    expect(huddle1.huddle_full?).to eql("This Huddle is full")
  end

  it 'returns only huddles that havent occured.' do
    huddle = FactoryGirl.create(:huddle)

    expect(display_pending_huddles
  end
end

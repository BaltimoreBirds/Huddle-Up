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

  it 'returns only huddles that havent occurred.' do
    huddle = FactoryGirl.create(:huddle, time_and_date: (DateTime.now + 20.minutes))
    huddles = Huddle.all

    expect(huddles.display_pending_huddles).to_not be_nil
    expect(huddles.display_pending_huddles).to be_an(Array)
    expect(huddles.display_pending_huddles).to eql([huddle])
  end

  it 'returns only huddles that havent occurred.' do
    huddle = FactoryGirl.create(:huddle, time_and_date: (DateTime.now + 20.minutes))
    huddles = Huddle.all

    Timecop.freeze(DateTime.now + 30.days) do
      expect(huddles.display_pending_huddles).to eql([])
    end
  end

  it 'returns huddles inside their first hour from start' do
    huddle = FactoryGirl.create(:huddle, time_and_date: (DateTime.now + 20.minutes))
    huddles = Huddle.all

    Timecop.freeze(huddle.time_and_date.to_datetime + 59.minutes) do
      expect(huddles.display_pending_huddles).to eql([huddle])
    end
  end

  it 'updates recurring huddles for indexing' do
    huddle2 = FactoryGirl.create(:huddle, occurrences: {})
    huddle = FactoryGirl.build(:huddle)
    huddle.recurring_rules = Rule.daily
    huddle.save!

    Timecop.freeze(huddle.time_and_date.to_datetime + 30.days) do
      updated_huddles = Huddle.all
      updated_huddles.update_recurring_huddles_index
      refreshed_huddle = Huddle.where(id: huddle.id).first
      expect(refreshed_huddle.time_and_date.to_datetime).to eql(huddle.schedule.next_occurrence.to_datetime)
      expect(Huddle.update_recurring_huddles_index).to_not be(nil)
    end
  end

  it' deletes expired huddles' do
    user = FactoryGirl.create(:user)
    huddle2 = FactoryGirl.create(:huddle, occurrences: {}, creator: user.id)
    huddle = FactoryGirl.build(:huddle,  creator: user.id)
    huddle.recurring_rules = Rule.daily
    huddle.save!
    huddleuser2 = FactoryGirl.create(:huddle_user, huddle_id: huddle2.id, user_id: user.id)
    huddleuser = FactoryGirl.create(:huddle_user, huddle_id: huddle.id, user_id: user.id)
    prev_huddle_count = Huddle.all.count
    prev_huddleuser_count = HuddleUser.all.count

    Timecop.freeze(huddle.time_and_date.to_datetime + 30.days) do
      updated_huddles = Huddle.all
      updated_huddles.update_recurring_huddles_index
      expect(Huddle.all.count).to eql(prev_huddle_count -1)
      expect(HuddleUser.all.count).to eql(prev_huddleuser_count -1)
      expect(huddle).to_not be_nil
    end
  end
end

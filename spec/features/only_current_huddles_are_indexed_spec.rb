require 'spec_helper'

feature'user sees only current huddles', %Q{
  As an Authenticated user
  I want to see current and reccurring Huddles
  So that I do not join expired huddles or miss out on recurring huddles

  Acceptance Criteria
  -*user sees only huddles that havent occured,
    or are within an hour of start time.
  -recurring huddles have their times reset
  -expired huddles that are not recurring are deleted,
    along with their HuddleUsers.

} do

  it'user sees only unexpired huddles'do
    court = FactoryGirl.create(:location)
    court1 = FactoryGirl.create(:location, court_name: 'River Hill High School')
    huddle = FactoryGirl.create(:huddle, location_id: court.id, occurrences: {})

    Timecop.freeze(DateTime.now + 30.days) do
      huddle1 = FactoryGirl.create(:huddle, location_id: court1.id, time_and_date: DateTime.tomorrow)
      visit root_path
      click_link 'Guest'

      expect(page).to_not have_content('Martin Road Park')
      expect(page).to have_content('River Hill High School')
    end
  end

  it'user sees recurring huddles with updated time' do
    court = FactoryGirl.create(:location)
    huddle = FactoryGirl.create(:huddle, location_id: court.id)
    court1 = FactoryGirl.create(:location, court_name: 'River Hill High School')
    huddle1 = FactoryGirl.build(:huddle, location_id: court1.id, time_and_date: DateTime.now + 2.days)
    huddle1.recurring_rules = Rule.daily
    huddle1.save!
    binding.pry

    Timecop.freeze(DateTime.now + 30.days) do
      visit root_path
      click_link 'Guest'

      expect(page).to_not have_content('Martin Road Park')
      expect(page).to have_content('River Hill High School')
      binding.pry
      refreshed_huddle = Huddle.where(id: huddle1.id).first
      expect(refreshed_huddle.time_and_date.to_datetime).to eql(huddle1.schedule.next_occurrence.to_datetime)
    end
  end

end

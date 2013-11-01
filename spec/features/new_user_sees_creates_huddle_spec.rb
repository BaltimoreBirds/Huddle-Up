require 'spec_helper'

Capybara.default_wait_time = 5

feature'user creates a new huddle', %Q{
  As an Authenticated user
  I want to create a new Huddle
  So that I may enjoy my hobby

  Acceptance Criteria
  -user sets hobby lobby(sports, board games, video games etc)
  -user sets desired number of people in huddle
  -user sets desired time and place
  -user sets desired skill level of group
  -user adds description for extra details(equipment, game variations, etc)
  -user submits huddle

} do

  let(:user){FactoryGirl.create(:user)}
  let(:court){FactoryGirl.create(:location)}
  let(:prev_count){Huddle.all.count}

  it 'authenticated user creates a new huddle from index page'do
    user
    court
    prev_count

    visit new_user_session_path

    sign_in_as(user)

    click_link 'Create a new Huddle!'

    expect(page).to have_content("Huddle Up!")
    expect(page).to have_content("Location not in the database?")
    find("input[placeholder='Desired size of the Huddle']").set "2"
    choose "Casual"
    select 'Martin Road Park', from: 'huddle_location_id'
    select '2014', from: 'huddle_time_and_date_1i'
    select 'October', from: 'huddle_time_and_date_2i'
    select '12', from: 'huddle_time_and_date_3i'
    select '03 AM', from: 'huddle_time_and_date_4i'
    select '30', from: 'huddle_time_and_date_5i'
    click_button'Create Huddle'

    expect(page).to have_content("Huddle Created")
    expect(Huddle.all.count).to eql(prev_count + 1)
    expect(page).to have_content(Huddle.first.location.court_name)
  end

  it 'authenticated user creates a new huddle and sees recurring option' do
    user
    court
    prev_count

    sign_in_as(user)

    click_link 'Create a new Huddle!'

    expect(page).to have_content("Huddle Up!")
    expect(page).to have_content("Location not in the database?")
    find("input[placeholder='Desired size of the Huddle']").set "2"
    choose "Casual"
    select 'Martin Road Park', from: 'huddle_location_id'
    select '2014', from: 'huddle_time_and_date_1i'
    select 'October', from: 'huddle_time_and_date_2i'
    select '12', from: 'huddle_time_and_date_3i'
    select '03 AM', from: 'huddle_time_and_date_4i'
    select '30', from: 'huddle_time_and_date_5i'
    select 'not recurring', from: 'huddle_recurring_rules'
    click_button'Create Huddle'

    expect(page).to have_content("Huddle Created")
    expect(Huddle.all.count).to eql(prev_count + 1)
    expect(Huddle.all.first.occurrences).to be_a(Hash)
    expect(page).to have_content(Huddle.first.location.court_name)
  end

  it 'huddle has a schedule' do
    user
    court
    prev_count
    huddle = FactoryGirl.create(:huddle, location_id: court.id)

    expect(Huddle.all.count).to eql(prev_count + 1)
    expect(huddle.occurrences).to be_a(Hash)
    expect(huddle.schedule.next_occurrence).to_not eql(nil)
  end

end

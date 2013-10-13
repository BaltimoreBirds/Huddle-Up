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

  it 'authenticated user creates a new huddle from index page'do


    user = FactoryGirl.create(:user)
    prev_count = Huddle.all.count
    visit new_user_session_path

    sign_in_as(user)

    click_link 'Create a new Huddle!'
    expect(page).to have_content("Huddle Up!")

    expect(page).to have_content("How many people are you looking to play with?")
    find("input[placeholder='Desired size of the Huddle']").set "2"
    choose "Casual"
    find("input[placeholder='Court name']").set "Columbia Gym"
    select '2014', from: 'huddle_time_and_date_1i'
    select 'October', from: 'huddle_time_and_date_2i'
    select '12', from: 'huddle_time_and_date_3i'
    select '03 AM', from: 'huddle_time_and_date_4i'
    select '30', from: 'huddle_time_and_date_5i'
    click_button'Create Huddle'



    expect(page).to have_content("Huddle Created")
    expect(Huddle.all.count).to eql(prev_count + 1)
    expect(page).to have_content(user.username)
  end
end

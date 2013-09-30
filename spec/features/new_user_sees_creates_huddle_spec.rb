require 'spec_helper'


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

    fill_in'Email', with: "Mikeswanson12@msn.com"
    fill_in'Password', with: "7777777j"
    click_button 'Sign in'

    click_link 'Create a new Huddle!'
    expect(page).to have_content("Huddle Up!")

    expect(page).to have_content("How many people are you looking to play with?")
    fill_in "Desired Size of the Huddle", with: '4'
    choose "Casual"
    fill_in 'Where do you want to play(court name)?', with: "Columbia Gym"
    click_button'Create Huddle'



    expect(page).to have_content("Huddle Created")
    expect(Huddle.all.count).to eql(prev_count + 1)
    expect(page).to have_content(Huddle.all)


  end
end

require'spec_helper'

feature'As a user', %Q{
  As a user
I want to join a huddle
So that my spot is reserved in the huddle.

} do

#   Acceptance Criteria:
# *User sees listed huddles
# *user can view the huddles details
# *User can join the huddle
# *the Users spot is reserved in the huddle
# *the the Huddle shows a new user in huddle
# *the number of people in currently in the huddle increases.

  scenario'signed in user joins a huddle' do
    huddle_creator = FactoryGirl.create(:user, email: 'mikeswanson12@msn.com')
    user = FactoryGirl.create(:user)
    huddle = FactoryGirl.create(:huddle)
    huddle.user_id
    sign_in_as(user)
    prev_count = huddle.num_of_ballers_currently

    expect(page).to have_content('Open Huddles!')
    click_link 'Explore This Huddle'

    expect(page).to have_content('Huddle Details')
    expect(page).to have_content(huddle.location)
    expect(page).to have_content(huddle.skill_level)

    click_button 'Join This Huddle!'
    expect(page).to have_content('Huddle Joined!')
    expect(huddle.num_of_ballers_currently).to eql(prev_count +1)
    expect(page).to have_content('Open Huddles!')
  end

end

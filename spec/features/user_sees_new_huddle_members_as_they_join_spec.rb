require'spec_helper'

feature'page updates huddle members asynchronously', %Q{
  As a user
I want to see when new huddlers join a huddle
So that I am aware of how fast a huddle fills



} do

  #   Acceptance Criteria:
  # *Current Huddle Members are listed on show page
  # *the page frequently updates to check for new members
  # *the page displays when a new member has joined.

  scenario'user views huddle sees huddle members on page' do
    location = FactoryGirl.create(:location)
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username: 'Shrek', email: 'Shrek@aol.com')
    huddle_creator = FactoryGirl.create(:user, email: 'mikeswanson12@msn.com')
    huddle = FactoryGirl.create(:huddle, creator: huddle_creator.id, location_id: location.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: huddle_creator.id, huddle_id: huddle.id)

    sign_in_as(user)

    prev_count = HuddleUser.where(huddle_id: huddle.id).count
    expect(page).to have_content('Huddling')
    click_link 'Explore this Huddle'

    expect(page).to have_content('Huddle Details')
    expect(page).to have_content(huddle.location.court_name)
    expect(page).to have_content(huddle.skill_level)
    expect(page).to have_content('Members in Huddle:')
    expect(page).to have_content('mikeswanson12@msn.com')
    huddle_user2 = FactoryGirl.create(:huddle_user, user_id: user2.id, huddle_id: huddle.id)
    expect(page).to have_content('mikeswanson12@msn.com')
    expect( HuddleUser.where(huddle_id: huddle.id).count).to eql(prev_count + 1)

  end

end

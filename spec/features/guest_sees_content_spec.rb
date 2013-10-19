require'spec_helper'

feature'user sees and interacts with content', %Q{
  As a guest
I want to be able to view huddles and content
So that I may be decide whether to register


} do

# Acceptance Criteria
# *Unregistered user sees guest button on home page
# *User is assigned random temporary guest attributes
# *User can view huddles/locations
# *if user tries to join huddle, user gets message, asking them to register,
#    which redirects to registration pageh5

  scenario'guest views content, tries to join huddle.' do
    location = FactoryGirl.create(:location, id: 1)
    huddle_creator = FactoryGirl.create(:user, email: 'mikeswanson12@msn.com')
    huddle = FactoryGirl.create(:huddle, creator: huddle_creator.id, location_id: 1)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: huddle_creator.id, huddle_id: huddle.id)
    prev_count = HuddleUser.where(huddle_id: huddle.id).count

    visit root_path
    find_button('Sign in')
    click_link 'Explore site as Guest'

    click_link('Explore this Huddle')
    expect(page).to have_content('Huddle Details')
    click_link('You must sign in to join')
    find_button('Sign in')
    expect(prev_count).to eql(prev_count)
  end

  scenario'guest views content, tries to create huddle.' do
    prev_count = HuddleUser.all.count

    visit root_path
    find_button('Sign in')
    click_link 'Explore site as Guest'

    click_link('Create a new Huddle!')
    click_button('Create Huddle')
    find_button('Sign in')
    expect(prev_count).to eql(prev_count)

  end


end

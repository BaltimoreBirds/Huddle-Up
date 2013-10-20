require'spec_helper'

feature'user leaves a huddles theyre in', %Q{
  As an Authenticated user
  I want to leave a Huddle
  So that I may be a quitter

  Acceptance Criteria
  -user is in a huddle
  -user leaves huddle
  -user is no longer a member of a huddle,
    and does no appear on the huddle details page.

} do


  it 'does not show leave huddle button if member is not signed in' do
    user = FactoryGirl.create(:user)
    location = FactoryGirl.create(:location)
    huddle = FactoryGirl.create(:huddle, creator: user.id, location_id: location.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user.id, huddle_id: huddle.id)


    visit root_path
    click_link 'Guest'

    first(:link, 'Explore this Huddle').click
    expect(page).to have_content('You must sign in to join')
  end

  it 'shows leave button if user is signed in' do
    user = FactoryGirl.create(:user)
    location = FactoryGirl.create(:location, id: 1)
    huddle = FactoryGirl.create(:huddle, creator: user.id, location_id: 1)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user.id, huddle_id: huddle.id)


    visit root_path
    sign_in_as(user)
    first(:link, 'Explore this Huddle').click
    find_button('Leave this Huddle?')
  end

  it 'user leaves huddle' do
    user1 = FactoryGirl.create(:user)
    location = FactoryGirl.create(:location)
    huddle = FactoryGirl.create(:huddle, creator: user1.id, location_id: location.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: user1.id, huddle_id: huddle.id)

    visit root_path
    sign_in_as(user1)

    prev_count = HuddleUser.where(huddle_id: huddle.id).count
    first(:link, 'Explore this Huddle').click
    find_button('Leave this Huddle?')
    click_button('Leave this Huddle?')
    expect( HuddleUser.where(huddle_id: huddle.id).count).to eql(prev_count -1)
  end
end

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
# *the number of people currently in the huddle increases.
# *The user can only join a huddle once, is rejected if he tries.

let(:user){FactoryGirl.create(:user)}
let(:huddle_creator){FactoryGirl.create(:user, email: 'mikeswanson12@msn.com')}
let(:huddle){FactoryGirl.create(:huddle, creator: huddle_creator.id)}

  scenario'signed in user joins a huddle' do
    huddle_user = FactoryGirl.create(:huddle_user, user_id: huddle_creator.id, huddle_id: huddle.id)

    sign_in_as(user)
    prev_count = HuddleUser.where(huddle_id: huddle.id).count
    expect(page).to have_content('Open Huddles')
    click_link 'Explore this Huddle'

    expect(page).to have_content('Huddle Details')
    expect(page).to have_content(huddle.court)
    expect(page).to have_content(huddle.skill_level)
    click_button 'Join This Huddle!'

    expect(page).to have_content('You\'ve joined this Huddle!')
    expect(HuddleUser.where(huddle_id: huddle.id).count).to eql(prev_count + 1)
  end

  scenario'registered user tries to join full huddle' do
    user2 = FactoryGirl.create(:user, email: 'johnjacob@aol.com')
    huddle_user = FactoryGirl.create(:huddle_user, user_id: huddle_creator.id, huddle_id: huddle.id)
    huddle_user2 = FactoryGirl.create(:huddle_user, user_id: user.id, huddle_id: huddle.id)

    sign_in_as(user2)
    prev_count = HuddleUser.where(huddle_id: huddle.id).count
    expect(page).to have_content('Open Huddles')
    expect(page).to have_content('This Huddle is full')
    click_link 'Explore this Huddle'

    expect(page).to have_content('Huddle Details')
    expect(page).to have_content(huddle.court)
    expect(page).to have_content(huddle.skill_level)
    expect(page).to have_content('This Huddle is full. Check out different Huddles?')
    click_link 'Check out different Huddles?'

    expect(page).to have_content('Open Huddles')
    expect(HuddleUser.where(huddle_id: huddle.id).count).to eql(prev_count)
    expect(HuddleUser.where(user_id: user2.id, huddle_id: huddle.id).count).to eql(0)
  end

  scenario'registered user tries to join a huddle he is already in' do
    huddle = FactoryGirl.create(:huddle, size_of_huddle: 3, creator: huddle_creator.id)
    huddle_user = FactoryGirl.create(:huddle_user, user_id: huddle_creator.id, huddle_id: huddle.id)
    huddle_user2 = FactoryGirl.create(:huddle_user, user_id: user.id, huddle_id: huddle.id)
    sign_in_as(user)
    prev_count = HuddleUser.where(huddle_id: huddle.id).count
    expect(page).to have_content('Open Huddles')
    click_link 'Explore this Huddle'

    expect(page).to have_content('Huddle Details')
    expect(page).to have_content(huddle.court)
    expect(page).to have_content(huddle.skill_level)
    click_button 'Join This Huddle!'

    expect(page).to have_content('You\'re already in this Huddle.')
    expect(HuddleUser.where(huddle_id: huddle.id).count).to eql(prev_count)
    expect(HuddleUser.where(user_id: user.id, huddle_id: huddle.id).count).to eql(1)
  end

end
